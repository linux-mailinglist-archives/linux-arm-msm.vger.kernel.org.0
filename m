Return-Path: <linux-arm-msm+bounces-43566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F19FDD47
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 05:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B963A18827E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 04:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4D817C8B;
	Sun, 29 Dec 2024 04:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="McFD8Yeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D74EEBA
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 04:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735447368; cv=none; b=Yqat0d1aqCvh+aYiSqjdUCywg5EjT++juxEn2na5yVzavAnPu0woLO8s3VDLXZTrQq+IQly12TskoDwyGEz5+/6pHF1ZJU5LyM7HDQZ/+t/jFay8nI7xnGxVuXlPx4sG5q0CWXmTNDoH0B6PD/qQdIYgY51phTG6MuTftLTAmKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735447368; c=relaxed/simple;
	bh=1D9ku27J97UK+heKNy9Pi9J4naepyu//ORXghoBk4/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n76kNQTAKih+zzAGoruXhs+sIZ0FZRRyU/lA67K4wD5Tq5wB815fD3cqxMs2HK6P7Cd4qpoVjFv/0sqeps7pWBMVQDm2OrnP5f+TJyRRy2N52Daoiz6HOFqVUKDmSZd1d6F0uQ3A+4WFdwPB/ncWN4lBGc7GJWHjjwBDEDKHTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=McFD8Yeb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54024ecc33dso10505626e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 20:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735447364; x=1736052164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49KnvXyqtzHNP5zpXwkwN+VDBQ2sz7fI/cBjo8ecRUM=;
        b=McFD8Yebh60tIbzjTvUDMrhmf5iEENzUeL3cA7e3edwBf/Zd5xNNaOvpLEyppFXc2C
         o3axkL2gKLTp8q0khEH+5M8OjPk8j8YqyyrJ+kQhHotXdH+rRMbKoE4DkXoYJalmPJyz
         3uaqV9U5dC/qiGYUEDBwqwDrUpvgcVWGNfjtLLYO1V1mVHft4CNRAeCw/2s+pmT7r12Q
         52dLGFU+80fg9tZcqSMkvBYBAqBiYlXdIF2lPLppFw3hfvs9UBcOlejEEKMPChu3+acO
         LqN59GxugiUM/701QSCW1Draf1om8uW28kqe3H3NRlQei1+DXkUlo0DW40wxyEq/5YI3
         PoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735447364; x=1736052164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49KnvXyqtzHNP5zpXwkwN+VDBQ2sz7fI/cBjo8ecRUM=;
        b=R96ogWHbKFeVoSrDNyFlhVqwwNhHe1j1VdB324XWVRgu01XslH2OlV0Grtl5xZD1/y
         JHxFcKaAKkIe9Zqz65il3mzr25IvvxHFOb2vjz5TrefOqsTXJXw0Vny2ZJiayEXi9FT5
         GfOuDmfE4tbs8hDgPw4DN2Cb2xv+ZjPBOZZJ/demeK4Bf6lmKWPPKUSRHMdce5JUU8U/
         QCelo7vb5Q68k1yOvyyw+pUScLqRDrhf0ogwQiFm/j4I+lFh5QXMPEmtLheKgKts256v
         6RWYeIUC1fJR5R6FVdGs0wg3aV1BgPox9KfpzFjUCq+sNprnocls9OKLad7+fWky4gWA
         mB5A==
X-Forwarded-Encrypted: i=1; AJvYcCXbK1GvWjmeiqHW/Es0nTdyJEzL3lBR4xqoDbtRyF2yyaQoRdO3NPbTIc9o+klPqMeRAcpTGCBuTQDU1dXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwIt077XNsefttHEXtAOv/dMZBcumiM1Cn0iRVFh3fl2vKgcKV0
	mruC5c4RPlIu9g1Bn9NfVCKbHJGOD/0qyPfqmsOlEK7ZKbdCDVag2v9Zw9176zU=
X-Gm-Gg: ASbGnctWoeyQkVQDAi/pk1o4MbHDG7QfEVLAdMy/+8ENsiVo06MXYfuIknB87qmpqfY
	9d5TR66qZOT+ypLIgZECoFyqpI9mOxqTARL7NEQnbG+z6UVX0wZO0b/kqcfBj0AITe+mRzZVOhq
	I7NzhpsonGQrQ/e/VOHMh6cWp2kmpqa1OrqK6R/PUzhVuWoYAebsLZwrIPG7WU+2eBZxvkzjeey
	Tfu4dFtLFT7VroyT5kS3E4KbypfuARSjLXZmX72YUzUqNhOdB8szYem0rE+cHcuTBgO6Qg3NmIj
	hJ7ATD7sHOHrGGVh0YABd4uZtIy+KWulyO3y
X-Google-Smtp-Source: AGHT+IHofLwFYxWucuHyLIawAriYNYKQ/SrKehOlm3Ec2J5KACyiss5kzgeMpgISL832D3TRqtyLHg==
X-Received: by 2002:a05:6512:3e23:b0:53e:12dc:e805 with SMTP id 2adb3069b0e04-54229582252mr9675190e87.45.1735447364447;
        Sat, 28 Dec 2024 20:42:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301e0sm2834926e87.248.2024.12.28.20.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:42:43 -0800 (PST)
Date: Sun, 29 Dec 2024 06:42:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
Message-ID: <kz5qakmiy7n72p5yrrkgcjrmtvwl7knnkbzmh44g6cfunpjxad@3titlwwt32ux>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>

On Thu, Dec 26, 2024 at 05:40:48PM +0800, Yongxing Mou wrote:
> Add compatible string for the supported eDP PHY on QCS8300 platform.
> QCS8300 have the same eDP PHY with SA8775P.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Everything else is display, this one is PHY. Consider separating this
one to a separate series.

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 293fb6a9b1c330438bceba15226c91e392c840fb..eb97181cbb9579893b4ee26a39c3559ad87b2fba 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -16,13 +16,18 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sa8775p-edp-phy
> -      - qcom,sc7280-edp-phy
> -      - qcom,sc8180x-edp-phy
> -      - qcom,sc8280xp-dp-phy
> -      - qcom,sc8280xp-edp-phy
> -      - qcom,x1e80100-dp-phy
> +    oneOf:
> +      - enum:
> +          - qcom,sa8775p-edp-phy
> +          - qcom,sc7280-edp-phy
> +          - qcom,sc8180x-edp-phy
> +          - qcom,sc8280xp-dp-phy
> +          - qcom,sc8280xp-edp-phy
> +          - qcom,x1e80100-dp-phy
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-edp-phy
> +          - const: qcom,sa8775p-edp-phy
>  
>    reg:
>      items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

