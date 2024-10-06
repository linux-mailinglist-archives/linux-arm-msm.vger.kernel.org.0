Return-Path: <linux-arm-msm+bounces-33236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9C991FAA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 18:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76BEA1C20D83
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 16:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA07189BAE;
	Sun,  6 Oct 2024 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKmgojI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32D189B9C
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728233023; cv=none; b=GcGt5XJzd6/GZV6rPC0e+VhJMQgTiFbrOuNqIzmSM+GoLlC+AMq2T3UyH/eO0K09XkkryygIbIBwiewtBaQkP5h/1Qgol9TDEInlzW/9uxAROLbO/m2zuGF8BJUGK74udN7Dvw470RucCdPLM0WdrTTzGGjKBNcJC8tVb/KqAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728233023; c=relaxed/simple;
	bh=X2QicB5JKojBLxLuiGUnfmkH6CHqmqFhe0FMVJ7ec7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6LHBJxV8Tc7I8z3I+xzSMrCjgXbqRz70ku1dIx09LUIhyM34wDwzFef9eEHODcxE7EAG46eDTbKk5qCtrYthSiD6uLltXV8k+5wVYzHumhIgfQPjyoPRYdWKFVdSF63paE1N1gGwEuDggiedwl33GIBN8PQx0+MC+q26hQvdLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKmgojI0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539983beb19so4442211e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728233020; x=1728837820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kh9CwlS+b9fL9VrGPBN9hhS0uogpqTqVNmBCzDS2xGE=;
        b=tKmgojI0Od/BvA5zlvih9KQSJhO9V5T2VmTJM4WfvaJzl4sGmM7F/679QMjfuZ8pg2
         1MdyjWk2CtYYZCL+PU8keiB8tRwoFcO1eMj2e5ZlB3LYvG7U0DrkJ7PSOdtiTuhzvLAt
         0QOTJf4YUl78WqqGf8WsL3SU4p9dPa1tD8dxhpwZUU+SERBsKDEHBUU0jxoR0POcrpcl
         aWGjaw9lGk3otZt5GYnDGCuSH6HBMlEkIPnPKrVqaY7pisRP9rxl4hiI4g7yw4a/nzsZ
         m0hC6S0FxxTq+vskHTVjJVhOBYLANYDyrqVTv2GhfY7QC59v19WArdXwriU6Sk8Nh/KF
         J7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728233020; x=1728837820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh9CwlS+b9fL9VrGPBN9hhS0uogpqTqVNmBCzDS2xGE=;
        b=sr2BFMH6xcV0nBhvvi3A3zPlMW2SdVBBI42hlN22g4jzdyG32fSw31BPg6U2siur3f
         xXrEl8ALRyz32DZxMmkQrl9TZaVfG269EObyo/faOiBxkkZWQJltMlHl3kBrt3y72zl2
         Zi+gYs33oiOW/agb9A/piei07lblPMmWlx+GiOTDnjbbZ+iNhcyAjVkGQMtzr0gbWWSQ
         IArjZsW2mvzLLJBdOJSj/JYzlJtiv52DhFu/n1k2jO6KpxBezefSFfCrCk8/lL/LxFoc
         E3od/bNIEEtURuveBUzsyP8uH/1oAzKzHDMGcMrSnND5rMo1iy0Eh8CzdpSyF3zhGvxp
         kPrw==
X-Forwarded-Encrypted: i=1; AJvYcCWnIthJOrHGgjYw8RVaF0dgCsf2Mo5i7Aj3QcdifHwK8upQZQzfL5u8kysgv0N5RatMHBBXx+pjJClL3zLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNJzxtEjqNCzS0OD8xi0g5FIr2DMM6hSHIoXFXABSZHbZlZAe
	XLCp/q9AAoBcANME0GHU0erBdWDSGc+vlSmbIJEfK0fYypmiv9mAG4JeMwO8xIk=
X-Google-Smtp-Source: AGHT+IGKg7FQt+7HzFqdUiy4jPHItuGi1FK8LAhA4VTlyyoJYgn23VgEi2Q1FundwmZErQazke+jdg==
X-Received: by 2002:a05:6512:1245:b0:536:55cc:9641 with SMTP id 2adb3069b0e04-539ab86649fmr4626478e87.16.1728233020083;
        Sun, 06 Oct 2024 09:43:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d1e7sm557447e87.151.2024.10.06.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 09:43:38 -0700 (PDT)
Date: Sun, 6 Oct 2024 19:43:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konrad.dybcio@linaro.org, catalin.marinas@arm.com, 
	will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com, 
	geert+renesas@glider.be, neil.armstrong@linaro.org, arnd@arndb.de, 
	m.szyprowski@samsung.com, nfraprado@collabora.com, u-kumar1@ti.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH V5 7/7] arm64: defconfig: Build NSS Clock Controller
 driver for IPQ9574
Message-ID: <kfmn6pixbrhaagll56z3ug7bfqrp6f47rd4m6qo6bidu3dfcew@r26q6aabut54>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-8-quic_devipriy@quicinc.com>
 <rlqrgopsormclb7indayxgv54cnb3ukitfoed62rep3r6dn6qh@cllnbscbcidx>
 <134665ba-8516-4bca-9a56-9a5bbfa71705@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <134665ba-8516-4bca-9a56-9a5bbfa71705@quicinc.com>

On Fri, Oct 04, 2024 at 01:26:27PM GMT, Manikanta Mylavarapu wrote:
> 
> 
> On 6/26/2024 11:44 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 26, 2024 at 08:03:02PM GMT, Devi Priya wrote:
> >> NSSCC driver is needed to enable the ethernet interfaces and not
> >> necessary for the bootup of the SoC, hence build it as a module.
> > 
> > It is used on this-and-that device.
> > 
> 
> Hi Dmitry,
> 
> Sorry for the delayed response.
> 
> NSSCC driver is needed to enable the ethernet interfaces present
> in RDP433 based on IPQ9574. Since this is not necessary for bootup
> enabling it as a module.

Commit message, please.

> 
> Thanks & Regards,
> Manikanta.
> 
> >>
> >> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> >> ---
> >>  Changes in V5:
> >> 	- No change
> >>
> >>  arch/arm64/configs/defconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >> index dfaec2d4052c..40a5ea212518 100644
> >> --- a/arch/arm64/configs/defconfig
> >> +++ b/arch/arm64/configs/defconfig
> >> @@ -1300,6 +1300,7 @@ CONFIG_IPQ_GCC_5332=y
> >>  CONFIG_IPQ_GCC_6018=y
> >>  CONFIG_IPQ_GCC_8074=y
> >>  CONFIG_IPQ_GCC_9574=y
> >> +CONFIG_IPQ_NSSCC_9574=m
> >>  CONFIG_MSM_GCC_8916=y
> >>  CONFIG_MSM_MMCC_8994=m
> >>  CONFIG_MSM_GCC_8994=y
> >> -- 
> >> 2.34.1
> >>
> > 
> 

-- 
With best wishes
Dmitry

