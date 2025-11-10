Return-Path: <linux-arm-msm+bounces-80929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DDC4534D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 647AE3B3451
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507D62EB87C;
	Mon, 10 Nov 2025 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/mVKrfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214DC2EB85B;
	Mon, 10 Nov 2025 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762759527; cv=none; b=Ki6RLJao92J8v/Z7WiJjwtuPyHOFAlQNpqacfPqf+g9nxUGhi4hdw9f/VhpfBi4lLUasjhZoM8qHBC/b2WKS0eZDjzVMh7VM2BW6cYyZvlO35dfbppDiZZN+9u5UMNT3fi8y8jHBlzUKbdZ2uBUD+r/KGYIbargj0GKnnQhaSfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762759527; c=relaxed/simple;
	bh=uDdjGxKNfLRpB85FSdm5jAnhrEmErMy7XD7dK16/knA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l3YVogkk/NtDnNnd2Hogw/8TdVrSLSKaGXgBOYMUPWZqB5donYu60jDylqnZZFJv+/JVUXZPxgG4OE+/37rKBKJ7YdVqGS3DMTNNewj7boZTDYSak+7Y479bhN/sdBDk2bTb6ebgpmPJg6gV+uy+Jp7ZqchEZHI4rHtlJUGSf/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/mVKrfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E706C19421;
	Mon, 10 Nov 2025 07:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762759526;
	bh=uDdjGxKNfLRpB85FSdm5jAnhrEmErMy7XD7dK16/knA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b/mVKrfyVoaIOPpaxlIIPG+DRkAHZV/pfSMBKMUdjeqdLkLn6uDVW0w6AJ1Vpl2G/
	 9ntI56dR069IiZMIjQ1wljoi6SIrpq3e2r6Byr62ZYsDM5Nv2pHW4giemMRBp8XQfs
	 julAFyDgzZZRYv2t15qoSnlk9tkjrqPWccKL9jQMEWPE4xlxnewSQIz2SsSBY61I+W
	 wh28n8C2/2W0B06bavNgTo2hQV/U1TAGcZO3HUtM9xuq2x44vcvDi5hHwFuSKS+Owk
	 XBSVI5TWP1woDilFhHNvs3qrz16LjA+LDfOwkRTvXEIOvrFMSS8apeb0QgCEafkQPE
	 MRr6eQi7N3nCA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20251027060601.33228-1-linmq006@gmail.com>
References: <20251027060601.33228-1-linmq006@gmail.com>
Subject: Re: [PATCH] slimbus: ngd: Fix reference count leak in
 qcom_slim_ngd_notify_slaves
Message-Id: <176275952201.16494.2036590483704839905.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 07:25:22 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 27 Oct 2025 14:06:01 +0800, Miaoqian Lin wrote:
> The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
> internally uses device_find_child() to obtain a device reference.
> According to the device_find_child() documentation,
> the caller must drop the reference with put_device() after use.
> 
> Found via static analysis and this is similar to commit 4e65bda8273c
> ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> 
> [...]

Applied, thanks!

[1/1] slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
      commit: 79d84af332094852614b15638f7ffe18f5f7966e

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


