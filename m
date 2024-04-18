Return-Path: <linux-arm-msm+bounces-17827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 905988A9838
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 13:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D0F1282CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 11:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350C515E20D;
	Thu, 18 Apr 2024 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mjrGAeHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291615DBA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713438456; cv=none; b=naJK0RSbPyeigR3OMgiTMO+wbXCHkgIddt/7W0e33slEbpT1uQsfXqpYgv18DrrTBL+f2nT94d98EhDreJukSXKBtnUWZGk+vDx5pEX/GFHY3Fi7o8FsiqIj3uXg54ExfLNLoJmCH3gQ3flPaOyN30zS4fhdP564myGMliOvMkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713438456; c=relaxed/simple;
	bh=uVSRpt8F3GFhGujnI01U5SChDc2eJ2JPLMzVIQUMANQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emPRQo5XGBNxT/Tups9sGOp8mjWU+wFDI/fSjobVYuSQ83RKo2hvKsanZg1kPSxnF1UOl2HvQjvyA+PTr7RkaCaz0u3UBhib8ihCwnv3qrp7h3VSicsDDLPjDlPFgHjCcXkHea+L25bXPf1XPE3P/smxIwiKRR3XspIuazdklfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mjrGAeHy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518f8a69f82so867062e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713438453; x=1714043253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyO/GjotGUHlFltRGjYbztp9IACAS8Q+nLylpcG9+Rw=;
        b=mjrGAeHySRDtvBpntukQETGWe7ArFTV4Mc7D8bj2g1MTbd5whEtkLswF0qf2NoTCN8
         DzoGS9XeTu7SFZ2gcIj4lfO6WORu0cfD0iZzrAU1dT6RMv+2yGRkXeYkUrqzsrx/rJCW
         f3Do5/S8rfoWlmcBG6zif5GzjAyHxh0ZfWdzPzwodI8BAlV/oFBOOvMSgjFvj46T+Bgl
         tCM2SVztDCpV2ibYcLsJrYK/W8576pwZZbYMHCCv58vjeGjYk4gLGX+bosEHy7nMHSjA
         NZc6JXwb+3d7wkR+/pND8jNUdVr0k7I5EsR7R1mVrs8nMxDkqvd/Emjkbl/Q3hZLgOG/
         /EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713438453; x=1714043253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyO/GjotGUHlFltRGjYbztp9IACAS8Q+nLylpcG9+Rw=;
        b=P+DxNEbdV2O8aNnx+PrAiFIzsnOMO50MjW5crtOag2nszWiefmnt71pq6r4VJWOx6/
         gE97jzqiXnZ7KBKGWWoSKZWsxo/29PYAZuRdGn7jvsT0UTTTW1o7Y4cr1nfdrZVLHISC
         CqYz/qMVKIqA6OdcYeEMvBMtFsxhJxEoM+n7qf9OP24LHGCXgUZISqSPmL8/VQ4C2rpO
         M6cLWKURxZiGuTLwiKjUIFVxGdsBzPBVd1CgXgcd3kLBdGs4FhS7z0hMgtzZm6gQVbXu
         UmqK670/nIcEAvpDBZz1qUpovtx/1RACquvaUjujRqwscG1numC6UBjs3H3CGn4cW+tW
         nzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTa4o1klNmJNWKcTM5mYxZXLzYEf8Z1TaJoHtGXqSawDX65TAfYnkaGjpW1SxYn0cBKcNZtEC/TFTSw2mtMsUv+cCmDIKKINjVRBntjQ==
X-Gm-Message-State: AOJu0Yx7R+9vsvgbB0Mqabtx2Ic3qhh0u00x0jz55Sv31+5l7mbk9GK4
	Do6VOJYaFf99tMIDyL/zfQIKQklrNljynVZwkjnRExqjmrlHr8CgtuFtJxXptS0=
X-Google-Smtp-Source: AGHT+IEwPXTDTwrWeLYeoadFGaTFA9rHj1W+CNy99dyVg08+5SUOCAzomXSQbfzVVzpXPPNwtz7O1Q==
X-Received: by 2002:ac2:4853:0:b0:518:b4a3:dee1 with SMTP id 19-20020ac24853000000b00518b4a3dee1mr1574836lfy.66.1713438452661;
        Thu, 18 Apr 2024 04:07:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id t14-20020ac24c0e000000b00517374e92e9sm191076lfq.167.2024.04.18.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:07:32 -0700 (PDT)
Date: Thu, 18 Apr 2024 14:07:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <7ynodjzjuxwwqkjgns5jtnkckw52qyldfpsqpjh7645swva4xk@7wucftyjyyy3>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-3-c84f820b7e5b@linaro.org>
 <hi7vzqm5ebypzs6m6bw64ghgfwsdzuaxy65jpah37iw5ww7fku@n3c5sucic27i>
 <bfd6aa32-a28e-47a4-82c7-76c5dd99a44d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfd6aa32-a28e-47a4-82c7-76c5dd99a44d@linaro.org>

On Thu, Apr 18, 2024 at 11:51:16AM +0200, Konrad Dybcio wrote:
> On 18.04.2024 1:43 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 17, 2024 at 10:02:55PM +0200, Konrad Dybcio wrote:
> >> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >> abstracted through SMEM, instead of being directly available in a fuse.
> >>
> >> Add support for SMEM-based speed binning, which includes getting
> >> "feature code" and "product code" from said source and parsing them
> >> to form something that lets us match OPPs against.
> >>
> >> Due to the product code being ignored in the context of Adreno on
> >> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> 
> [...]
> 
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -6,6 +6,8 @@
> >>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> >>   */
> >>  
> >> +#include <linux/soc/qcom/socinfo.h>
> >> +
> > 
> > Stray leftover?
> 
> Looks like
> 
> [...]
> 
> >> +
> >> +#ifdef CONFIG_QCOM_SMEM
> > 
> > Please extract to a separate function and put the function under ifdef
> > (providing a stub otherwise). Having #ifndefs inside funciton body is
> > frowned upon.
> 
> Hm, this looked quite sparse and straightforward, but I can do that.
> 
> [...]
> 
> >> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> >> +#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
> >> +#define ADRENO_SKU_ID(fcode)	(SOCINFO_PC_UNKNOWN << 16 | fcode)
> > 
> > If we got rid of PCode matching, is there a need to actually use
> > SOCINFO_PC_UNKNOWN here? Or just 0 would be fine?
> 
> The IDs need to stay constant for mesa
> 
> I used the define here to:
> 
> a) define the SKU_ID structure so that it's clear what it's comprised of
> b) make it easy to add back Pcode in case it becomes useful with future SoCs
> c) avoid mistakes - PC_UNKNOWN happens to be zero, but that's a lucky
>    coincidence
> 
> We don't *match* based on PCODE, but still need to construct the ID properly
> 
> Another option would be to pass the real pcode and add some sort of
> "pcode_invalid" property that if found would ignore this part of the
> SKU_ID in mesa, but that sounds overly and unnecessarily complex.

It's fine, just add a comment please. Maybe we can rename PC_UNKNOWN to
PC_PRODUCTION?

> 
> Konrad
> 
> Konrad

-- 
With best wishes
Dmitry

