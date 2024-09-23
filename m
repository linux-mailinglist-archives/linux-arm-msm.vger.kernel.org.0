Return-Path: <linux-arm-msm+bounces-32203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A735997EAFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 13:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5196A1F21F80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B573E197A92;
	Mon, 23 Sep 2024 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBPbh6gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14038120D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727092068; cv=none; b=W6aBkXAeLQdQQdYrPEPh4Iuvz3rtnpFng9xzblaKWL+oA03glhC621ALM1xv7iRphG+tWD81cYeShP5JH6py6hywOMQDXiDz3bU3rNALqhDjym6I3Hjb/9bD1CJNRW8BOdL1KMZcrQcgVeL6vMqHSArE61XxMq/VHvaALlEQWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727092068; c=relaxed/simple;
	bh=3SbgIdRUjYzuNhjnvUZP+Nr40Ibrmk6328EEhkaeYtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NF24KtXum3FwASHymp/OGGFVEeJTq+rP4oD20EPodCMPDUkmiTopxfYVJfJT6Umhq4DQyToGtOldHybUU1Ueeh42Yay2vyM8Iiq9RzwhBtKAhLZfGWKYhE16VnRb5nRHha+orzPjq/ypp00TbJCGmqJJ1MdQIRMFOa0GqU32dbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBPbh6gO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365cc68efaso22945e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727092065; x=1727696865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0djd4G/7ZZ9d24oyrx0WPtUTMtYC0XKPiOilllFoMEI=;
        b=tBPbh6gOD3GaLZ7DyKBNFx1DpLo8rwv+dTlgCgNQUrCc2+UYpAGMxW9cvJr3Jb36AS
         qQejXXznQGAXuD9G7ILoZQ8Wiyrqa6C6j2wm36ZH/y365mPUhKfd8OFflokshGYV0UQU
         izDUgDGBcFO/3CI30m/dRFV5bOgZoPF1kcxVZER388hROIoz+CvpZZsmTgeRnVnHlKhx
         j5qL0RL+lM6fo/o2tsx0dnKcgfO1bk0wHyRxcfVL9RcVoV6mnJpTy3BZWtLoFZbCJwAd
         0BpsKz7AboD43uQyb0wz2H5fhRRhcOgtozCHwMULMOpXOW3ZX275S9VkTav4UWIxfcP+
         /bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727092065; x=1727696865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0djd4G/7ZZ9d24oyrx0WPtUTMtYC0XKPiOilllFoMEI=;
        b=sh66RoPaVOzFYM2vU4bohDUyJyQz0t/vAGhejnQ2eBxnBAHfYh4G+o6ECvrAtq07Wz
         U7xN7bUlXGjb5rRak1wsfabo2rb7wNKlb1wGVW+Bf2qSgBUHsDjbw3T6/kZeycGRhmT8
         TE/5gG064uH7lltPf4I3C2elM8D2IPAaxeURf9Gf1a16dpwUfoe175qOeuR7qZeSBFMB
         Fhts2xxBFjnvUXKWs/5AWcj7bBk+Z7NFdvlsQwq8RTtVAoGl3TTB5kVH4yk4rWxdEoJo
         32xYniy4WMgFdzX3TPqtT9hVj5i4bB1ALLPXlDItsB83DlO7nW2Lc/kGI/ALvQepjDgB
         za3w==
X-Forwarded-Encrypted: i=1; AJvYcCVKtkZGL4s9oXG378+yBTTbBCPjegnAe2jtLpw4oRs+eilzUAv1jmt6CfvHGyTAQ4bAkc79AVpOLGkq7iDN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj29XoxTbXInwFRmKoYFil8og5qQpscZwaCnVmFvhmhKLJeOiM
	y3zMG99qFHbaFLsKno3aTQ6LjEMFBTQC0MOrhWbG6BeRCgJ2FuY5/b9ja0Knm+vSDHbjf+epAv7
	dFNVjsA==
X-Google-Smtp-Source: AGHT+IGOWlf1E3MK25Ig9GpguOQfG2ei5zN70UwUJJU5oIGPcT/EQOZr978PoKbxaP0b1IeYvBKH9w==
X-Received: by 2002:a05:6512:10d0:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-536ad164335mr5499187e87.16.1727092065029;
        Mon, 23 Sep 2024 04:47:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704678asm3244982e87.5.2024.09.23.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 04:47:44 -0700 (PDT)
Date: Mon, 23 Sep 2024 14:47:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
	quic_parellan@quicinc.com, quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Message-ID: <vdzxghgr3uhj36mjqnphagf2mftpsnqg3mubjo7gfiexcrdb55@6i2s7s4a4qr4>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-6-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-6-quic_mukhopad@quicinc.com>

On Mon, Sep 23, 2024 at 05:01:50PM GMT, Soutrik Mukhopadhyay wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss, having different base offsets than the previous
> SoCs. The support for all 4 DPTX have been added here, and
> validation of MDSS0 DPTX0 and DPTX1 have been conducted.

I'd prefer if there was a word 'only' in the last phrase, but I can live
without it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: Fixed review comments from Konrad and Bjorn
> 	-Added all the necessary DPTX controllers for this platform.
> 
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
With best wishes
Dmitry

