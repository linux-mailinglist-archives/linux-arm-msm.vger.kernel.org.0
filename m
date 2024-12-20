Return-Path: <linux-arm-msm+bounces-43020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC49F9B45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 21:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BB4E16B900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 20:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3C19F43B;
	Fri, 20 Dec 2024 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcAHw7xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933D22259D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734728345; cv=none; b=BQ3vqaDWWlvFnoVCMBTmFTbSsHom7IfDfuBc9PEAempILTIprqTu0yy0UwuQ7+EvNowM7LYawZaaoqtKXyjOvXH2O5GUCS+eEO+mbbLig4a1o3TnG30Ck+UzsHCWXIzbl1j+njaUxDj02GCMzqBYmeMk4A20KDQDXGC2/IiLcOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734728345; c=relaxed/simple;
	bh=1lN8Gw4DvM9w9NYMIxUi/G1rojvijwzgdaIXg4dQPdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsLaA7Ltyuvte9EVNGiMdqdzKPsewDP4RMEZ+gXRHCWWh1KAZtTOK79OR8F4Ht9v5+TyBchewfchWSH7s0bjVB3KiJdXQIc72eV7jSzqTBL7hOr1odBzHWi737k7ruZ5nnttvMQQWhQSaYwDbdHXoK8wu5evznik9zqeOcwXS4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcAHw7xz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2397839e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734728341; x=1735333141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTXfmCPQpqaSsnBYjJTKGEssZ1+MNZ8axMaFGfX2txw=;
        b=wcAHw7xzw/Mvg2aDipLE8lIeUJ72ajOwSyQt03KwFZ79Nf6gAv1JjWr5XAvWuI68c/
         FXh515PCBATR6cFiqtN7MbnQymtaN6zL/LZQRgLBIoqDwiabqRqbeb2W5H/0QoLVrs1F
         T+MpxFQ3d/2sDMUVc874xTnVRDnLbTfvLFV2Z4M7PFdN9gMLe4V1x+Hp4yT6BQ8opI8T
         //6FcelWaNQjcIiWZZ7px16aFwsDU5FRTQkgsQ6fvfFkH1iDVEBWMooFS+C9YvORByrG
         4sn4isj6GnzyMxK3a5vN/9IfM5VLOJ3GMiQz+qiAIsO/wPHvsIiS8m/NtRdNw4FBBXqY
         1mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734728341; x=1735333141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTXfmCPQpqaSsnBYjJTKGEssZ1+MNZ8axMaFGfX2txw=;
        b=wOB6fxPuMK+IT9n7Xqjc+Ke6q8k70aZ7MblVjDfWTJYFVUOSid6zhrEYhfyqhpXM86
         V4C4np5Oby9/pPoGTfvE2JICQUbT0ETuzZqvi1F2NG/4TT6IWbknqSKc8ehPMCGG9QKS
         ZFDhXuP9PK9G3tAAbzH8qw0777AU1ozL1YaaJDpMESAnZZ5zlbGNQkuBW7vVlQdnjFoi
         8C3QXsDKscD8Zgzkych4exyLiPDtAQtB8TEu3RmOoQ04KI4niZLVTJm2Z1p+T8G6jlgG
         0/EEX+brf4oaltTyEZkEcGxPQQvmGToK9dgUh6+KzSM2s5L89VrNuXXY/nZ7B5DySYft
         NUrw==
X-Forwarded-Encrypted: i=1; AJvYcCWaBG5epfTody9XosbpFKdJ4sCWLDHbfDBSY/1krUGE2kIcLmn9RRhTgZI+U3lja2lYl8P9x6VXMhHgd1bE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1X+ex8Wo0XKljPBgZPZaNKAbQXVcqjHMBbeE58V+TmMduEhS/
	vZTYWpVN055l7TgS6X8XrPrhSQjMohYJlS3mTQlQ7e9gnMdvJ7/GD/d3ip0zHGk=
X-Gm-Gg: ASbGncuNiiceW9VlEl+aiidLM3RsgG16rAezG2W4MCqVgZzlHOAiLOdaZgOMRXwNxnI
	giZqEmt+LEPbDvqE3u8pGinQrkYhHAtMmI1hhXSNLq1nyoEq3Sx9yHD2F9Q9jCfZ7Usaz54h/Sd
	cfkGGOCZJsxipVnRrU66GZiqh6zEpv/R0H1kDK4dtQqefL6nXcnyLzIDT7NQ7Cxrw60dRGsZA/+
	pv7+N/6ouDcMwxdUm6e+BLEj59pDVY3o5VlI74gqnGJJbHMMmxk886dEWi+k8u5BE4T+vonI2oo
	WuV2SqNfAstWe4hvVMoRIm3kYLggx2qpW/2M
X-Google-Smtp-Source: AGHT+IF06lbDnsdPix2JuyrjcK+9hqCW/H2TA06DYnRKwBgBAUcigA0Qx8udGG+5W57u8WPQftM6JQ==
X-Received: by 2002:a05:6512:128f:b0:542:214c:533 with SMTP id 2adb3069b0e04-5422953c131mr1457338e87.30.1734728341318;
        Fri, 20 Dec 2024 12:59:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382fa84sm563119e87.233.2024.12.20.12.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 12:59:00 -0800 (PST)
Date: Fri, 20 Dec 2024 22:58:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
Message-ID: <jsuzytkpcs7xmsaaedypz6w5d4ia6rckxjqg2x7mp4sidxxtqk@t5ukbn3sv6oa>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
 <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>

On Fri, Dec 20, 2024 at 08:56:31PM +0100, Konrad Dybcio wrote:
> On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
> > From: Jie Zhang <quic_jiezh@quicinc.com>
> > 
> > Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> > A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> > of A615 GPU.
> > 
> > A612 has a new IP called Reduced Graphics Management Unit or RGMU
> > which is a small state machine which helps to toggle GX GDSC
> > (connected to CX rail) to implement IFPC feature. It doesn't support
> > any other features of a full fledged GMU like clock control, resource
> > voting to rpmh etc. So we need linux clock driver support like other
> > gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> > Since there is no benefit with enabling RGMU at the moment, RGMU is
> > entirely skipped in this patch.
> > 
> > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> 
> So we talked offline a bit, and the RGMU requires a piece of firmware.
> 
> We concluded it's best to describe that from the get-go, so that the
> user doesn't get surprised when a new kernel update brings new firmware
> requirements for previously-working hardware.

I'd say, please make sure that the RGMU firmware is also a part of the
linux-firmware from the beginning.

> 
> Please wait for the new revision.
> 
> Konrad

-- 
With best wishes
Dmitry

