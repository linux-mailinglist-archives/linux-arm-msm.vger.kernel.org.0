Return-Path: <linux-arm-msm+bounces-38446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF919D3897
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 188341F23D4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B816215853B;
	Wed, 20 Nov 2024 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gj3kZyzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBC7187859
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732099465; cv=none; b=pqUc6yvt473I3+nI0XhEZQdW/YOo+/egfT6tXoubqs8X1tOAvytBY971PrjDF7/k3+u5skbgRfudtZ/5y7vIVXamZvQ+2fX3GtA3Le6xjNvyY2HuDQY7RV7s/qD/woNRpJlCni+aB0TlRJYzNKsn/lZ+G3NWKjhnMUSJ06LuHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732099465; c=relaxed/simple;
	bh=PSIEIjCkwowMwP6F7pDyJxkqxSzIMP8yegjUBuV121M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9P+fCd3apNyRJ0m5d3XwEMRMgharL7QnhjSOmeNJcgWAJxLvEjFtQp8Yhu3pDYtzh/AaAK6EhuEikL6Jpi53/+5Yul4CcttvPLPlul0U1bkNVcyasZrvAiRZD0sG25VHn0oUxXAKk2Mcj1q3vhg16/BzOmpzVydEF32PimnPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gj3kZyzU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a097aa3daso3927905e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732099462; x=1732704262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFaQOAwXecsZliPvhtGOW3UP08yIdA2VUxO/uHYIpGw=;
        b=Gj3kZyzUvdISMeJznKEZzABPkwPtVvzpwABXWl2QGjhivcNkBYFiTVpDHqCegbA7KS
         9QEDQ993eLbm6GYOqYD39xjB7bkEB/9h3peK1KHwFJqm2jvWYJoFeFtBj7NzWy/F/WVd
         GsmOB6KktOuADd87oft6mbMNotL9jSFxwuRvTaEjR02guj8Fw2ByfVH+XnULtjxGysaw
         YLlxtXtX4nhxM7/s/435v/gGrGVQMENWGCiocz2WqyMixpNFCBGajK+sX707K/LSax4y
         rirMHxwGgbzPa1NiDWFFIsAih4pWwLfaytRPIF7PCb0I9Jqgv6QyWh8vfUzuq0ypvCYE
         toUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099462; x=1732704262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFaQOAwXecsZliPvhtGOW3UP08yIdA2VUxO/uHYIpGw=;
        b=Vpc1cbz5nzKXwMfNvIGb1oOknSwG00mm674YQNShHj/MoMtLxoQJAanrVv7m+qyT1E
         2QKg4hKGhjDf5ADqJEdRgQJ+Vfvu9Lq+rE6WioTv+PWNdtQBkl2NcAJ7Y5Qo3UQq+JSO
         L2PYl+dRiPKjQpXGg9p+gh46vSHbM1Mok5GB2KtpTOkv1HUNwZ8q20D371NWZ2ETrqM/
         RNi/+H78fTe/rFAouJl6sFqnZQte8hg7Du14Iakk9gUr2mZK3+9nBuwOqLzZxD0eye5l
         RvMEoVjP+8iWl88eudxdyLftI0RukknAkfAYMbJoyyQh06BMXGpj62fJBiqVTGomUxM7
         ey/A==
X-Forwarded-Encrypted: i=1; AJvYcCXP3OSJK++nap630FQoBxjx4xenNk//4oV82jMMBFbJEKU3dtxMMsLSqazWY6ThIPtacMVxtYvyCb8zJGYI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9R7XaMufjU/f/7p34UwE3BqXm4/pqskzqJgGWMdznp4xvP5aV
	uOpe7CY8u04iJxS1g/nfw9EKy3vBCe9/yxQrPlzNUgX0lWo8rUMsS90ozTXFgFg=
X-Google-Smtp-Source: AGHT+IHk2JJ5HGmR+YoqQPmq7AYyvFw1Gvq+fbJdIJLuypkzijPRXqlaQ7jAEGqpbVN1Hm4GPboeXA==
X-Received: by 2002:a05:6512:1c7:b0:52e:987f:cfc6 with SMTP id 2adb3069b0e04-53dc136f9aamr844707e87.51.1732099462301;
        Wed, 20 Nov 2024 02:44:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3fc552sm591462e87.64.2024.11.20.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:44:21 -0800 (PST)
Date: Wed, 20 Nov 2024 12:44:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_mohamull@quicinc.com
Subject: Re: [PATCH v2 2/4] dt-bindings: bluetooth: Add qca6698 compatible
 string
Message-ID: <smwxrjvdvyxw6tknucl6fb5jpjau2q4jcyjxpunbtt5ep6xsr4@ztuyfkrwgxoo>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-3-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120095428.1122935-3-quic_chejiang@quicinc.com>

On Wed, Nov 20, 2024 at 05:54:26PM +0800, Cheng Jiang wrote:
> Add QCA6698 qcom,qca6698-bt compatible strings.

Why? Is it the same chip as WCN6855 or a different chip? Is it
completely compatible?

> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> index 9019fe7bcdc6..527f947289af 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,qca2066-bt
>        - qcom,qca6174-bt
> +      - qcom,qca6698-bt
>        - qcom,qca9377-bt
>        - qcom,wcn3988-bt
>        - qcom,wcn3990-bt
> @@ -175,6 +176,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qca6698-bt
>                - qcom,wcn6855-bt
>      then:
>        required:
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

