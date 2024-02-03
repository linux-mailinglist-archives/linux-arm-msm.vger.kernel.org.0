Return-Path: <linux-arm-msm+bounces-9695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2371847FBE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 04:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE170281F35
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A2A79FE;
	Sat,  3 Feb 2024 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aQC5dk+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FAE10A1C
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706928970; cv=none; b=tlGJjg6WiCTzjYLjLbYvEfFf9ThtMrJABHhSjuRMfxaZvLxvtVSshLoBwMC6XgTFfhEyZFZ8kYE4e0wdfDK3Yk1QRJi3TvHHo51v+zX4PKfaWeZ0IA99Iy1uFxJFCZZN42TDmcupgjVshl+UEI1IqVW1VquJfCnqUarsxFgG8VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706928970; c=relaxed/simple;
	bh=xMELGiQyDwDf0RQ64HMKT7PzlIKOviP2KoVQtgNM1Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUUK76XHS+8sguyaLdXV5FrO/r4rUd/sm1yhNTkoWtM3D89m5ggJ0fUZWwZge2qOnerIotjo7+sYjxUAG+11Me7nN4ZMn8zPWmakLvSV4qo7I8IssUZV4N6xorfF8qV4nupBtEOvY9pW18SLRDYJUjg43BiQKy9Qjxss77fda4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aQC5dk+P; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-603fdc46852so28285757b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 18:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706928966; x=1707533766; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lD8inCL3n27QmNoGKrfX9I7qIbx7Ok8T+KP8sX1X1QQ=;
        b=aQC5dk+PnGsPJLv79niS9qCZr/hwOKYxASJKDBSNM68IcikUP7E5vdUc3dYBFN01QH
         xK4/Ivd52cd+F53AstEI0KPxRtl21GtBAOlmvIpe77kuotT0GPJ12aMdFUpwxUcNSrE5
         /h++D9/yvybrtRDTokS7rZYgLbS/Ca1b7mHIJzXDqGU+JylN/GvIO/FQpXbvednddS0y
         sYHj+Gxn8udKqr9DSrp03AVf2MIQK4+bUxh9CZKU7E36IVVrThyOVgf7B7T/oYqgIuFv
         EF/h3VclNFyubmssMzXTLscQDb2vANjcvoOGfMGN5eMz3GzWfkcn7eH53BfEI+xXqmhw
         mlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706928966; x=1707533766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD8inCL3n27QmNoGKrfX9I7qIbx7Ok8T+KP8sX1X1QQ=;
        b=Xbc3lIC+hkmenN3oyoSSm7xbEOMz5VEddomgUyu2mYVTn0/t/shn1RWnk1OdUoTKS2
         2Dfbxp6GcehqjBAxOOVxwffZZsEcjMUzhtq/ZcTFbTDayQrL8UwIwJ28ys1Vl3Ch0NJx
         bW2A1TTG0H/BQiFJBFaAy5gx0FWpwWHOKHgQHJryYY1gioKsmVlcvLs64YOjIpMZz/hJ
         yh6/O6bBBewU7t+BlehCLQbyTnfj9JGcaGCK29UWqzyaGZpRM2IEpEcuZB8GiaxcBl2l
         FyAb6yn025dnrTgwGzdJvin1rV40MDC+ALHgMMGmX5dVs55lFdbxwICv7ISlp4avoP0U
         Qwhw==
X-Gm-Message-State: AOJu0Yzadaj5bHO67MWZ2OYBboPZ7tyALOdSZSPhJMlR5XQ0So/uUC7t
	7MD0qpYTnRsrD5Wi3DAdGJ7zeLSz3AL92YhsGLrDzYT36TEaIlzqpFtbkmDSppgMDZ+4QbDCNrt
	ZFl63tIdlhz1vY7+W2AgwJwOQBmY5e7WuHVWF7w==
X-Google-Smtp-Source: AGHT+IHmlfW1+Y+uGaT2G3NHFhtiRRriUyg0EgG+M84bGJD/GcVW5/hm/XCO5OApuPCvWl03vUjaXZykG56jQolv2XU=
X-Received: by 2002:a81:ac20:0:b0:5f1:f638:2bd8 with SMTP id
 k32-20020a81ac20000000b005f1f6382bd8mr10182961ywh.31.1706928965823; Fri, 02
 Feb 2024 18:56:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202222338.1652333-1-robh@kernel.org>
In-Reply-To: <20240202222338.1652333-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 3 Feb 2024 03:55:54 +0100
Message-ID: <CAA8EJpooe=RsZSD_mRKH2S8NUxAEqVw_AcMyn68_AWwhovPFsg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing
 explicit "additionalProperties"
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 23:23, Rob Herring <robh@kernel.org> wrote:
>
> In order to check schemas for missing additionalProperties or
> unevaluatedProperties, cases allowing extra properties must be explicit.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Rob, if you need it for some rework, please feel free to pick it into
your tree, otherwise I'll pick it for msm-next in the next few days.


> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> index bd11119dc93d..24cece1e888b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> @@ -37,18 +37,21 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          const: qcom,sm8650-dpu
>
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          const: qcom,sm8650-dp
>
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          items:
> @@ -57,6 +60,7 @@ patternProperties:
>
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          const: qcom,sm8650-dsi-phy-4nm
> --
> 2.43.0
>


--
With best wishes
Dmitry

