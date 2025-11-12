Return-Path: <linux-arm-msm+bounces-81334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEEDC50960
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23BCB3B118C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 05:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668732D46C8;
	Wed, 12 Nov 2025 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCwywDoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C2122FE11;
	Wed, 12 Nov 2025 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924429; cv=none; b=SU64DCsbvh4IWPKrb71oQh/TUk2yEj7coSVI9/pzsZJYYPq/tByLEoJwCn+UoXyhoj4l5JBK/hae66ghvN4KqLn2sOyUtnXnDgIIRYO3gvHomqCsWamk/dN/XyMUJ1HX7+4cBvxJt58TGvfoaWDkKNTugyOfiac5eWD7CbqfeXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924429; c=relaxed/simple;
	bh=3TTQUfuHCzqWdSVslu2bZ6+dIOPh70AgzV3J5Du/jkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VhTvVQtGetnoU3nZ1YufYtomuruwa2SpFJTH6prgbd8Bbtl2cnVRolJ2g4ZAwJDXE9SUrwUhn/j/sDfcUuL+KPbReBveMrONKBisgSQ7hgvuFNM4xAJio4tWPPLdiXEbYCprESOJozUMg8vr5bDYLbPw3ROCCc6OID9WKL1pwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCwywDoF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED8DC4CEF8;
	Wed, 12 Nov 2025 05:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762924428;
	bh=3TTQUfuHCzqWdSVslu2bZ6+dIOPh70AgzV3J5Du/jkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jCwywDoFfxbcKQNwuHBg8qvaMmE3sUbWfFGytGiFwUABqEVAKcCHZtGq3sswKEb5y
	 RoTDXQRaysQqBnJwudBWNKRkVxCck5gEIgQYHT1wWWE0E5jADzwFp7bjBXksgw97yU
	 iaj6vqK1i4DxJEl48p0K4wqff3wnUEMGVVpuOFb7yr5VNOhxOmOQ/PAIUCLtt7ef2R
	 iErSJbZ+5SnmxJeXuqjX+6HWl9k4pB52xbrW/sIAha7GdcW/mm+rLFYMFimHQQQWd+
	 T9ChD5AJuK8BYgCMqbtidxCMxP4aS0wH8XnR6oE5UQ67v8SopILVluqzhSKGyzC+Bq
	 06D1/VUxtR8ig==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20251027060601.33228-1-linmq006@gmail.com>
References: <20251027060601.33228-1-linmq006@gmail.com>
Subject: Re: [PATCH] slimbus: ngd: Fix reference count leak in
 qcom_slim_ngd_notify_slaves
Message-Id: <176292442599.64339.7709313480733902465.b4-ty@kernel.org>
Date: Wed, 12 Nov 2025 10:43:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


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
      commit: bcd8db9640bcad313f7fbf8433fcb5459cdd760a

Best regards,
-- 
~Vinod



