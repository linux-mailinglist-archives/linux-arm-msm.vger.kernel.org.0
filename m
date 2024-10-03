Return-Path: <linux-arm-msm+bounces-32991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500C98E98C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50AF1C212BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 05:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3776E38384;
	Thu,  3 Oct 2024 05:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cNTZkpj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F25634;
	Thu,  3 Oct 2024 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727934862; cv=none; b=qK5YTVufA0KBW8r/B90eNjBDGiXcSsBpiWESE5MOkl+7Nn+4gy3vlNQK4tQrmt/p+6hoTWfF7SKCrhNCyqdek5RSG6Urep5sQa6MaLmKVRrbriCtGHErNzOigdVD4Ng0vdEwakmBCcbDY+cysQLvOS6T5Soy3Pq7balVZ6M2bBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727934862; c=relaxed/simple;
	bh=ULDx9MnTQFEQueJG7rMq8r5HkqESyvZYSyaLNLHVDrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBkAuSAftVnpkaX4L06CJNu07hoTgyEWePpbszo9YYGUKZtnLDJowaMJ5i4UlwGNGKXzdjhLSLF+6gILPgaWTzKEurYTxIvZRiZ4I6V+68GqMJ3cdWz/gYyUqmkJNlpN9jBmQ/ForYV2U84pVvpHNJycYAXOix2q0ZwSnITmTPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cNTZkpj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED539C4CEC7;
	Thu,  3 Oct 2024 05:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727934861;
	bh=ULDx9MnTQFEQueJG7rMq8r5HkqESyvZYSyaLNLHVDrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNTZkpj0XudqaYA3YD3CmJxHLdAiyLCj4ifT7NLBSxTX6yeqp0fK/T+LSbYp1imLD
	 Stl+9jttR66vaRoP1rmUP+1M5UJqugPsfMzKBLKo1OnihklffW1VH33xfkqs2ct2pb
	 8cnc5S9AB03XXScJxOCNhwIrqVnV9xDodpYCUnks=
Date: Thu, 3 Oct 2024 07:54:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, zzjas98@gmail.com,
	chenyuan0y@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <2024100358-crewmate-headwear-164e@gregkh>
References: <20241002161233.9172-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002161233.9172-1-zichenxie0106@gmail.com>

On Wed, Oct 02, 2024 at 11:12:33AM -0500, Gax-c wrote:
> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
> Add a NULL check for the returned pointer.
> 
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org

Your "From:" line does not match your signed-off-by :(

