Return-Path: <linux-arm-msm+bounces-39330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D59DA96F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8858E2818E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1191FCFC6;
	Wed, 27 Nov 2024 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vwz7eWmT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AEB1FCF79
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715768; cv=none; b=vFa87g+ZKox67y+urY1U6B84n6jXMnWsyzbW170yzi6XqfzuteRK72riR9zbOPA3lpmKbNbsG1Bb/4u+jzy+TjxqDnEVEmmaMKmluCL8+oFUme495oQxPi1HvKISXBWcw+unV00VzTx1Vdg/CZq8H/mwnVnY+bN1ss5/86YPsC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715768; c=relaxed/simple;
	bh=BYDt98Mk4otP8/MrNN33+zH9HWkLUpNHlvafTCVNX9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6NjeZQvJI0J86A+SubxBJHhZJ6vNd7l6G7YONXU+4d5cFqhxZbFMBilP9tU8mpUKKozXFL8QziDlq/EuQuexEn5NkK5w0URYexERDEReKZVpFNMMdUMyiouVsGLb4i3EVZZ5PHBpX+mdKZFYVjovCeIgnUuZZ5eILNiFaIkn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vwz7eWmT; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df31ca44eso297371e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715765; x=1733320565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=867OxvdZ+RR+pbVHkiA0WW9IzYzXbM7LHcyZ0FySfzQ=;
        b=Vwz7eWmTbNRxltRXvgXzVUwxuDRAZ233exx2o9ZHWS/xqwYgktZrJ3fbrl518rbRoy
         Ty1fFCVM3+xSBlfkDzFOEYjSpyl4u4bVkbRMj0OPmLEYjaQf8DzTPSYDggMUk2cz/SoX
         qQ157ke6LEf2oqQBmOkuJieWSrQxrYzTnYRFqP3vdptC6WVCgQxSKVCiP8f9WY2Yz4/i
         9bzNLyQa6CoW5IBn4Q+E6kJv85mlGj5YkMSiSlm1E2b1J9USNpZT46V6L7z4gvGI65tY
         SZsNqXz0/A+kP3rh+IYS4/XfZLINsROiGxgSMbLgDz7cj6xWCC3H+ofrRLp2l25DKoFh
         d7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715765; x=1733320565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=867OxvdZ+RR+pbVHkiA0WW9IzYzXbM7LHcyZ0FySfzQ=;
        b=dw/ugu/F83O5KO3Ht0QAEhI+N/sxaWxHU1PRS4swMTIGoFADg0UjMhtevSu6i2eb3E
         ONfB6Azcxs1R6+sqBJiAF4P99DP3IwrhXs7ujZYAzb+UOk2Z+jRodu2WX9InGtt0QOa8
         aPd30xpIg/bEUj+Emq15SFLjZEWUilGcSnP2h+28yMDEHGiKnb+Ae692fB0bmB/qoO6G
         99kvPfEZLVHUZW4fgRNFNzMjYe/bxf+b0zx+sY6dRaKRIVSFzQDL1l1IiW+YptRAWIWo
         j1F5IkDxQpYf/fyQgB1MqkRWMWOeBiSOWYjPDYOoDO5/hAOELsKf3aA+8iPND8C7vqce
         c/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUXT4U3lM6UzfBPjd71VK45OheiL23wBcy5BPixEWo4rmG4rI300+P7hPWof6YwQMTaS7treykGY3HMM5O2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuhnxu3u40SaTsgtm41gnjn8nLJ3X0R+SBiE4AHvR1UXm2O1kC
	PBAKnDlz1Vph2ws1TzIGfhviAqED0PUTLHH4eJiz2Coi51cxLt5xkOVCUgh0zhI=
X-Gm-Gg: ASbGncvGm+wpfc7A/V0KuULlDf1hno8VNARUn5KyjiJSFz4BQaneQujq2XExl0rU4Dn
	tEeEOFwPZkKCpbOfFEONls2MNN6wI6UMcZYHLjdmCnAa6MR5IXqv2+KBn+LZsvMu7VIsOMe/gGb
	P7X3XLLVn+g7jCSKMJENbW/zc+3HskoWa1BkCA/Zw9OUD+7V3ADBj8FOUv9X+o2tSFnTZPXVrdC
	HJIx0ZSa2pDfTg8Z+/O2Wi1F3mNljLkApRokfjPCXmufizUYwU+bsj5S/8S7rGmo93HeXgvbj43
	RkhbKSIGGlE0wlhe3gU1SeeenFEOHA==
X-Google-Smtp-Source: AGHT+IFWOWbW0Kkqtz0JT9z7g4F2xU64RN/HauN+JR3aCNqtQMBX11GpWayOTW870X4Odd9+w2h+9w==
X-Received: by 2002:a05:6512:33c8:b0:53d:e70d:f3bc with SMTP id 2adb3069b0e04-53df00d1bb2mr1722513e87.18.1732715764697;
        Wed, 27 Nov 2024 05:56:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ddd7c7a72sm1623628e87.32.2024.11.27.05.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:56:03 -0800 (PST)
Date: Wed, 27 Nov 2024 15:56:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Message-ID: <bzuzxddbxtlzeps7zfx33ghrfm7pbz64mynnnv6t4pznppxjyn@zhjpqwsliinu>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>

On Wed, Nov 27, 2024 at 03:05:02PM +0800, Yongxing Mou wrote:
> Document the DPU for Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> index 01cf79bd754b491349c52c5aef49ba06e835d0bf..631181df2bcf2752679be4de0dee74e15e2c66c2 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> @@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  properties:
>    compatible:
>      enum:
> +      - qcom,qcs8300-dpu

The DPU is the same as the one on SA8775P. Drop it completely.

>        - qcom,sa8775p-dpu
>        - qcom,sm8650-dpu
>        - qcom,x1e80100-dpu
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

