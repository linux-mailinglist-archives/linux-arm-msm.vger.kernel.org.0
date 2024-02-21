Return-Path: <linux-arm-msm+bounces-11959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F209085CC71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 01:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3AD1C22843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA4863D1;
	Wed, 21 Feb 2024 00:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tP9dvjRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BBA63DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473615; cv=none; b=nU1/xmO4REJ7yx6Rl+pRTnPXgQrpRrAdIVuPjicENSfufSEmqwaJW9vL3QiUzj0SLQjxCG5bivWcCKoJGFoZxK0tLcmEEpEoi+1kPUrADzOBom2AHqRmMpdvCJ6MdUe9jXiPb3x8gopkCduybLsXLRrbAbs5beH3yhv3GF4H2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473615; c=relaxed/simple;
	bh=Fh6caMkYe61uViFBZBzQ+HmyTX9a3RMrY1jv2LVI8fY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG7iGloSPgwP469METy5ARuj7ypAn8/f28/cpD9AYh+T/SAc57165tK0/LguiRWTguyV7AMcKByuaL6NhMrIj3ZQaRspxM4WOUrvlKmHF/WxcMivE08LKn7PoHIIV5yBuV14tg4Zd/FNx7OJ1F2CA8mrfB0aTQrP1FzVjS/T+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tP9dvjRG; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso6147619276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 16:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473612; x=1709078412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjgCdWgm+jeXxffe5jtC5stBeOHgFK5VxNzXHMdiy4I=;
        b=tP9dvjRGa8D6qs/SBg4RvMSKOdgvrpLLfo3Q74xGDrm3KQIgaQ+uSlVQ0bAny+QljH
         zpToF5iU8qw1HDFHlVwXP+KZetuRRpQOF+MbgDElhCwlTdbgp0Zem9mndnM/TylMSFCW
         tzK1tFTaBRQFPUqnxXDpa+fJPrj/ihiccNFWbherIULl2CoErYcQUKmjQxSqve+RBzd6
         rHDFXZqODdL3vKelIULv4AGuXw3UweKcHm+9EphdcHhuwN4TksywQL1ZV/ANU/6G30vm
         1YQ4P4vBNGVC2Uq+UjQICCG0tlSqn6GkUqiYy8coHh0/xUGcj5fj3DjplFTIUn73YS6J
         WEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473612; x=1709078412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjgCdWgm+jeXxffe5jtC5stBeOHgFK5VxNzXHMdiy4I=;
        b=vqdYppB1a0pFWmtqryroa23HMb3I1VNVUnxN5E0p0Jss8P40bkC3fhaP16wcZRuWdi
         ACTjf+VOra3wDLTISi2L6Qb6kUsDiYr0xL1FKHwm5vU+RnYbwORMMZr5mceqqSpd2sDr
         /fv1L7kuPsrhDJWD3F92HvBBNohsfh2aszHeklgVPNcDyBoQm/fqbgLB+hszx4b/ah0P
         1A9RHE2p0u1WPWscJX1EMjZNXNuuiygq6iPzuxEY0PDDAAoCWX4+w1nPu5BVdqpWeKm1
         7mtogCsVIpT/aoDdjO8aQsDoe1WKnJ5gXcSyO8owwhAbvSRcqloxaC+TDYAZeBD2yDVI
         0pkw==
X-Gm-Message-State: AOJu0YwUiBBy2vv+125FFogpwcuxivrJpQJrTlk89JquxUAUk/iPOoJg
	I8xK+T1ZBHiZr3ZQeQC3ssOkbI+DSnjMq4CqzK9wjYzLzIfjV6MnSlC6SetULRMTIc/XYsus6zK
	vBiXTrnWuDg1alLolP1hJ8UpHlFoiBRb30BdMew==
X-Google-Smtp-Source: AGHT+IFYIxE/aIvzE3GVJaNksSgvpT2WTR632ieNOZSCViGD7deZhNv2LdnXfeWFaTMnwmuqPu8xH4C3cbN/hawz0Ck=
X-Received: by 2002:a25:8404:0:b0:dbe:4f15:b5cf with SMTP id
 u4-20020a258404000000b00dbe4f15b5cfmr16284159ybk.15.1708473611915; Tue, 20
 Feb 2024 16:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org> <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 02:00:00 +0200
Message-ID: <CAA8EJpps9EPCgwBF8d8DbVzSZQ5tbEnj3RyGcJ=ua0eigDWQzQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 01:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The PM4125 PMIC has the same Type-C register block as the PMI632.
> Likewise it doesn't support USB Power Delivery. Define the compatible
> for the TypeC block found on PM4125, using PMI632 as a compatible.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Making a fool of me, for v2 there was:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6c0c6b337693..5527a4bc9388 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -14,9 +14,15 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pmi632-typec
> -      - qcom,pm8150b-typec
> +    oneOf:
> +      - enum:
> +          - qcom,pmi632-typec
> +          - qcom,pm8150b-typec
> +      - items:
> +          - enum:
> +              - qcom,pm4125-typec
> +          - const: qcom,pmi632-typec
> +
>
>    connector:
>      type: object
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

