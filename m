Return-Path: <linux-arm-msm+bounces-33277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFAE992116
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2D2B1C20B18
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D6F18A6AE;
	Sun,  6 Oct 2024 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsX7bzCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202D189917
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246235; cv=none; b=BeQ+6goc4N0MPMcvCQhYcy4yOiUjMAtaK9bNc0nnNShlBUAWDKvd4wk0vnzE+ZCYtCygIUy/p17ZRfzMgWo4oIPV+MWy/YFdQc3PIyg4ahSB5NyngJ4+ZZ0fMrfoyq15zPAaQYmPU/oQDSzKTE9iic7a/ynVnTxhSW6vPrIc4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246235; c=relaxed/simple;
	bh=9/IyMAHv2eIUwA3++BDoFfJTjz9glj1kN3V5KZf62zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XelUkw6g1AozdwWHkrWvBIEEUCY8A4VuPQQWpoq4fF9nLdiU3ySQcxERVuSrMvWQyWSQw7LT892RbHc6XKToYa9vb0ff7p99JZamWENIbJePCD/ei8IwVEkyIRhKGJ0ghGoW4RaFEcrkhl4CjrfJuc/VupjLBfAWuIP5ot022fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsX7bzCN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so4549388e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246232; x=1728851032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjmOkhGoHww5SsWhWZcZeAeLgnv0SYVUTlVXfaGN1Ts=;
        b=bsX7bzCN2dWNd5KfRJ7ThQLPoD2tF5hVQnf4P0dEJujUw2RjfZv2E17gqnQkU8aajo
         N3AgsJGceXWv8Z5SDlr8lBKvtpPvg1ALtMkKVkMyYWiEu7jfVtxSvwD7p2Nbh8HWl+ar
         BK9SJZ9kPoPQwhhHVBziGi+JToeQOveUpeYRc/RVyK4YGpwXq/05aTDPi8rmB8AvILgr
         2y4Nj+vVQqmANkbAcIF0ZyzaaQmXekzmHU8l8dXTgW0P/KbbaS8aQifIf1ACeHyB3IGn
         x5HAaC2pqWFULwD0eN+PbQ9x5M3b3q4E12fWTkBggLaZYJVRyhd9AQBe2WxFHVBlPW80
         p+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246232; x=1728851032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjmOkhGoHww5SsWhWZcZeAeLgnv0SYVUTlVXfaGN1Ts=;
        b=rq3tB2RGWNwysQFyyEh85c9JHXyR8l/oaDV3PssM0Bjx0M/LSzRhgAote9Qq/HccYw
         Z2UM9qBLhsaQ5coEx9JkCc0RoecOlF0Ea2Np2750LBBjfjbvkJylFP2R2HachoQgpXDg
         YLRA+Hk8x+yMymP5RRmBdKJ7F5xG7R9WfkIQlDh8+q3lq8Krdh2KQGoWCID9ses69M68
         c+dI2j4CagghseOcvyoRKnGGc19iogXoaTDmwLzKiqi/lmsUrF0KOa8wTLbbuaBTYe3z
         VFX1KYit9BiCsatpvZLFIuNDyOaH+609H/nWXj6OKLZG0q7K86yEQiJnED+TU2abwjOl
         ofyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsWNi1YcOgYN9dMvjN4K52W7Xkwkxv2+DbnKR5yTQH56GWCh7oUdGsMFeDoZM/A30JrdrBcJ0ZxEQEumhM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvm08RoB7YYMGxQLMb1C3M61B8mcxl2XxNUrRaDpQV6xS0Xaa1
	24kl5GX3ut0zyZFd7DbIrT7KMvTio0D83gDbmMYemHPMoDRDP9ODFOtyVS0wOP4=
X-Google-Smtp-Source: AGHT+IE9Ou+NDUiMJlp5CAdop1NdXKTU8QhE3wA1kzmQkrSFmqoSvuA4HniJwQ6rP+n6zCcA1stj9w==
X-Received: by 2002:a05:6512:398b:b0:536:a695:9429 with SMTP id 2adb3069b0e04-539ab8625a4mr4460950e87.10.1728246231828;
        Sun, 06 Oct 2024 13:23:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d0c8sm602410e87.130.2024.10.06.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:23:51 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: gregkh@linuxfoundation.org, broonie@kernel.org, lgirdwood@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, stable@vger.kernel.org, 
	alsa-devel@alsa-project.org, chenyuan0y@gmail.com, zzjas98@gmail.com
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <r6bumoyhuu53kz57tqlcscitpyi67tb7422d2kffifzpqyphfz@agniiovymvdw>
References: <2024100358-crewmate-headwear-164e@gregkh>
 <20241003152739.9650-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003152739.9650-1-zichenxie0106@gmail.com>

On Thu, Oct 03, 2024 at 10:27:39AM GMT, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
> Add a NULL check for the returned pointer.
> 
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org

I think Fixes / Cc / Signed-off-by is more logical.

> ---
>  sound/soc/qcom/lpass-cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

This is version two of your patch (even though the patch contents didn't
change). Please tag your patches accordingly, provide a changelog and
don't send next iteration as a reply to the existing thread (it might
get lost or mishandled). Please send a proper v3 of your patch.

-- 
With best wishes
Dmitry

