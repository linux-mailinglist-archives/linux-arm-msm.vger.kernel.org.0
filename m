Return-Path: <linux-arm-msm+bounces-9750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F72848F47
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 17:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79FEF283BBF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 16:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C4422EE4;
	Sun,  4 Feb 2024 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IH3PLuu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F7224EF
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Feb 2024 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707064179; cv=none; b=Y6A7mLSWUvBeJoR8QaLuNU2VZj1jp5iC/+BN1n5OoeiLUS+oQbnSmwSI2Dx+iYMcYFlT5JjHaU3C4mjZNmjACfBhoG2g6J3tLrekoImI2+qwOUH/qs3r/aZFvwrzqEvL/2X2/jLMXB59YwfR+Nc7OIAatJJ68CBvagZhUX/fO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707064179; c=relaxed/simple;
	bh=HclOV+rrCZDwOVlAAJSRoojO0aSBe/fa1KdBQod+1Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sShabzXFWdv5GtaelzWn0cs1pf/DFi/fVMN0Hlq5GtIaP9ssx+RGVWDqAkVRLPj8duDRt0FhSGNOO/6q8aYRfP0Cold1Zhz7fw6o6dM5dDqdpe6ZjSp2eUFkR062wBISBEaery+hj1Y9QmJMQVi5MBPqO+a5rPDKlAvxafESoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IH3PLuu9; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-604545fee99so2675337b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Feb 2024 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707064177; x=1707668977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WLm7YiWrpLuC8lMxG3SB3hDe/1zoUfNMJZQo8qUZp+s=;
        b=IH3PLuu9+bSa1tO4Is+lBcPajOQtQsdLINEAFekq3AR/qcVyGpkZtA6dYQXLgcYHPa
         Y5A4WuCtI86FY812aOpG6IfWQ3xT6XWEtc8xMjpDkPOkQP07u1jsQ8WSMh39OuHJ38Kg
         nX6GVLm6ZRdpRmQt84jNVIDmm4kZawS1MyfMIiydX0AfDyCecBVDQutSGoR3J4jCBcvh
         4YEO+IXs6tIwvrsVJ8ULD9QC+eF/5v1FQ/OqOhBTGzIH84qlNblBGkJOY7FeycxyjW9N
         9t4dj/iP0w06pbzRTOWAqi0rnZZn4tbr/eBEIdOqguTVjQgJTKz8Xkj+aatftx8ADW4+
         O/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707064177; x=1707668977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLm7YiWrpLuC8lMxG3SB3hDe/1zoUfNMJZQo8qUZp+s=;
        b=LCioCbLAo5yrm8jWzO3ew64qNX67sV7BnvgZc8mtAQnUP59sQs4gyD9Bf1IiNpsKzo
         Cn51FKMy4PVP8UVG5vsLosFtBq4Re9fAlFjPEWK/3vdNsYCqhHLebY6LN+LbdZVLxDod
         GWOS7T3YDiZUG41GJjP5dQE7/SWwJ6NcCJZB95nyhZa0Cuj4rWeISvxFOm+gcrwq+Uze
         h6Jkp46OhSjYLOiyEEEgt/jUoyj+VlbrFwJk1dMhbpeiNRGIvT6R/rl+nPqvdDYuf/tk
         keUAbpVcyH2CmTy6Pk6szXTlifWRc4opnkmqs3RQk+5RLclnLbSC5Awzm+FH8aKYLuox
         ndRg==
X-Gm-Message-State: AOJu0Yx4BngrzIqz7QuxGkllYYj6qHIL2/kcH6a4yi7FTeChiCi+mS1t
	N19IrlzxbR98MIMs5p/utpnv/LvwN/fLL3df8c6I77Ydw4D0ac31+OrYCuBEgTdi1THF1fFfBo9
	b6sA0JBHhnNtroB1AIVT5o5FIEdEeAEvP1+nM/A==
X-Google-Smtp-Source: AGHT+IEdKmZwmDiJR3yzuB5XfjzAGu+fELDwSN691Nf/rx1nyhSnDyGaSWKglskcCeWmwA4QPXVUltXw5iD6qvaiMXQ=
X-Received: by 2002:a81:9197:0:b0:604:5cd0:a79c with SMTP id
 i145-20020a819197000000b006045cd0a79cmr583017ywg.16.1707064177328; Sun, 04
 Feb 2024 08:29:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119100621.11788-1-quic_tengfan@quicinc.com> <20240119100621.11788-2-quic_tengfan@quicinc.com>
In-Reply-To: <20240119100621.11788-2-quic_tengfan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 17:29:26 +0100
Message-ID: <CAA8EJprpMjK03rKPK6wgfVuDvBikYsKZjMc0Wusa1BxFOBnXhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: qcom: Document QCM8550, QCS8550
 SoC and board
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jan 2024 at 11:07, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
> Document QCM8550, QCS8550 SoC and the AIM300 AIoT board bindings.
> QCS8550 and QCM8550 processor combines powerful computing, extreme edge
> AI processing, Wi-Fi 7, and robust video and graphics for a wide range
> of use cases for the Internet of Things (IoT). QCS8550 is a QCS version
> for QCM8550. Modem RF only in QCM8550 but not in QCS8550.
> AIM300 Series is a highly optimized family of modules designed to
> support AIoT applications. The module is mounted onto Qualcomm AIoT
> carrier board to support verification, evaluation and development. It
> integrates QCS8550 SoC, UFS and PMIC chip etc.
> AIM stands for Artificial Intelligence Module. AIoT stands for AI IoT.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 1a5fb889a444..9cee874a8eae 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -49,8 +49,10 @@ description: |
>          msm8996
>          msm8998
>          qcs404
> +        qcs8550
>          qcm2290
>          qcm6490
> +        qcm8550

Drop

>          qdu1000
>          qrb2210
>          qrb4210
> @@ -93,6 +95,7 @@ description: |
>    The 'board' element must be one of the following strings:
>
>          adp
> +        aim300-aiot

We probably need to drop this list, it doesn't surve its purposes.

>          cdp
>          dragonboard
>          idp
> @@ -904,6 +907,14 @@ properties:
>            - const: qcom,qcs404-evb
>            - const: qcom,qcs404
>
> +      - items:
> +          - enum:
> +              - qcom,qcs8550-aim300-aiot
> +          - const: qcom,qcs8550-aim300
> +          - const: qcom,qcs8550
> +          - const: qcom,qcm8550

In the review comments for v3 you have been asked to add qcom,sm8550.
But not the qcom,qcm8550. I don't think that there is any need to
mention qcm8550 here.

> +          - const: qcom,sm8550
> +
>        - items:
>            - enum:
>                - qcom,sa8155p-adp
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

