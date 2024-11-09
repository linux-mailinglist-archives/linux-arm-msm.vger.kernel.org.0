Return-Path: <linux-arm-msm+bounces-37376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B7C9C28C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 01:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8441C216AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 00:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5048BFF;
	Sat,  9 Nov 2024 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkZBKvvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E634437
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Nov 2024 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731111580; cv=none; b=bhJ0mOJ9d6yCYPbB9USRsLJTbf7iU4NkNmE+5ge0dGkesmRjob5onEv1yiPn944KyjN3h0iOFsUE66us8hsBWsOHRUlg2b48rs+7za0ZKmlbRKyCKHyEOzHPAQlEzV4o2LfMunHCPMknmrCxMJZwNdifZOgKozOl5LYLYqyconE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731111580; c=relaxed/simple;
	bh=L6j9s89naB7opnvnY4tHu4vgTBs+UfFjAA+WV7TeqVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtA9NcPvSztBsvE3B/si2MIP0NLBeSG4i8Xxp2i3yNc5vvwGiDOiNhywSuvh1MKp8vxUTsuFDfUVVRl+XInidBPbiORvLhuyXiVFvchCmzr8JcfCpRIGzpT3a25JNWSNBSk382NKl7c3BG2+Z1spzVqjPxydix40iSbYg30t7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkZBKvvP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e8607c2aso3286437e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 16:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731111576; x=1731716376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXpnPSSpQgottu2Fv5+e3o4as2xRNwzcJf3h5d26SFI=;
        b=nkZBKvvPjeYlHhjRFuigoDFZ9FHhWVfLXAYo8M8akoHWMCk+13Quuea19ZDRUrDyWl
         ldtDECzfHbxaYx2Sv3wmz39RG4N3rPXgSY5/pRrbXBWMCL7DnCFJZmndpWCngxVimd/7
         Pn1LEG0HYAGsFr+PVqXeamONqctyaoOU0oS+6vlwpofuNiv5o4g/Tu1Qr5+ss7KZnJpx
         ITeRDsKv6EmrEHluV89EGIuf7O+xJ5jGCzQaOvHEHAQMqxjCN0i4zH1uyPdI949Nkmyb
         UrbyoBJ2fsvcaZKz539LwW8Yrg8RndF/h6PV+TXUiwNE+NpdwcV7F/FDXBUtGBdEwk9f
         H1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111576; x=1731716376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXpnPSSpQgottu2Fv5+e3o4as2xRNwzcJf3h5d26SFI=;
        b=KEnxy2debRcaqAJ+7EP9wiKBw4uPgyk7AIxJ2d9T10wtGJEGKuqSXWcRD84UjwR1L5
         9Y7n9d27M2Pw2wQWHuvvRYKQ4Sy36IKB2U+olDIS0jgMFE6f6OnKyoI0Em7K2LfEWIHf
         jcbEaGjgdrAzUNOK0zlt1kd4DH2HKMXTSWzJEGX9VjISChflNh5/qm2wmfAKYU5weblU
         xkos/ncghyk7KEDZ9NNWczxYs3SZJRnb8ti/gLEtF5MNY/aP6LpWzDBI3krzjoGRzzx5
         DRMcb6e2XutKNbQ3GeBN1QLx3wdUAa0lpHJQlTZLB1ov0tdaQEff4uAuEr9Y1DL3VDKS
         hifQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV4vDU3OBV5P9e+5shesopcUrCh9ayCWirIRa7ztxJep3d9IzMTcdFumZ1gGj0aE+7U0oyFKqgYk/WfsAv@vger.kernel.org
X-Gm-Message-State: AOJu0YzlyEeF4WSqLvKPXCgnOl7S3qUMHcaHypchSFudmTv+6OF4P84b
	LfXce6S9R290aTwop4Md9czVtaO2DsWTr/5rrKl41LBY4NN6W73eO90BYgCLP0c=
X-Google-Smtp-Source: AGHT+IGy8JaWW53o7Nak3hWvpUBVz+q/19zh6rKz4u2hY6tZfCVQUBkESW5jVf0+ApmCehnOdBwEyA==
X-Received: by 2002:a05:6512:238c:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-53d862e4fc4mr2643346e87.42.1731111576019;
        Fri, 08 Nov 2024 16:19:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826af0c6sm785132e87.277.2024.11.08.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 16:19:34 -0800 (PST)
Date: Sat, 9 Nov 2024 02:19:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH v3 07/14] pinctrl: qcom: Add MSM8917 tlmm pinctrl driver
Message-ID: <ohznx4dt63gid324qqsmbb7iuqcpi5xxhftwmh5mfo2w26myrw@q4bfwrgw4mns>
References: <20241107-msm8917-v3-0-6ddc5acd978b@mainlining.org>
 <20241107-msm8917-v3-7-6ddc5acd978b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107-msm8917-v3-7-6ddc5acd978b@mainlining.org>

On Thu, Nov 07, 2024 at 06:02:48PM +0100, Barnab�s Cz�m�n wrote:
> From: Otto Pfl�ger <otto.pflueger@abscue.de>
> 
> It is based on MSM8916 driver with the pinctrl definitions from
> Qualcomm's downstream MSM8917 driver.
> 
> Signed-off-by: Otto Pfl�ger <otto.pflueger@abscue.de>
> Signed-off-by: Barnab�s Cz�m�n <barnabas.czeman@mainlining.org>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    6 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8917.c | 1620 ++++++++++++++++++++++++++++++++
>  3 files changed, 1627 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

