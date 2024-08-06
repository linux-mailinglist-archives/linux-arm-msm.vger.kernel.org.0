Return-Path: <linux-arm-msm+bounces-28040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C37949BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 01:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D401F22828
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A81C172BDE;
	Tue,  6 Aug 2024 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JMFqieiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625D16F824
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985499; cv=none; b=fE8poLbkj1J6Di9YT4RgdjucHhcPb1hQCiaavRROzLVS77AU8Kdfg6srwSMEUlfcYb6D5pQZkb8ILkEdyYUInGBCUldjTcH0iehSwwG/rZh2WPGG6XCC0syplPiG0nJWiyacoL+Dv18U7szT22ak4YKQzp/aYA7os7/3X78El+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985499; c=relaxed/simple;
	bh=eCHRZfbVih8dU7pR6xWQRl/juLSmaH8RtChWF+l8FCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fr1QTKXkguRZpT7S2DxGSp4p3PK91xgEZ7ssBKZMKrzWc5Y+1VL/Ay8e/CsAcmFhXqr6VD8fQ0rNEzA8CWvDk8l+EMGddxQuIps3kxL1fPGqY3LNBOMDBcVmNbayxhTjsjAOvVAXx2lKWQczhXOV7sVdZNihLebj1JflubAWJW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JMFqieiy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so7912635e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985496; x=1723590296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVTzUvpo2J//Q7IWbA8OuCEthqk1HNLB6DJMBCparG0=;
        b=JMFqieiyZFZzLwuzGVnC6yuLWbsRouzjw87bCX2G4cDkTMiWOdm/HQ0VshXxe424sO
         EPkTuV7lkzRi0QzH0xFe69BcQJDRJSXKjjXPt4kS2oWCT3mz4DX4MyriF9KxLFxra87G
         3Syhbpxb3RYkLPBh8hew3BBtS6ho8ex/b5UKrQaf4WjdMtUxAe0Pn2p1qdqUoA6rssvt
         7FZGHcpcHQ8UavxwYSywuMNhp3T6t9ICg0uOQT52EV+06ZdBSoY+/oqtzL0AQz6vrRwS
         WGHnvIxAJn/TsLbajf4J+DvgOZgIEml+gAfSm9WXXGxxmHAgISzyXVUcuUhHNTKPRhmp
         AAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985496; x=1723590296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVTzUvpo2J//Q7IWbA8OuCEthqk1HNLB6DJMBCparG0=;
        b=ZLG5F4bS8wEBEKOO2LyiIupPikpw6kiQWoFlFlVSTjRh4OyBvnQ5P3BK/nP3+/hb4o
         HRDxD+qssSm6fMwm2R1zNBCbJEG0XyJ/OMI0/SEq2dEusKA13Qnlr74ZT5EuJaTcFSdv
         pSHuoznY1q/gP7oYi/OnZdbvfq+rzuopMt+kshivJ7wsl2U+3tmgm6jt4iBOuDDNeCGO
         bFGJAoZ3c/d1ZvZIMIK4sVDYsPngtwJxvHa1MTqEv0jRs9YDbRdramoAMMo7/7LWFgeI
         XHSCJjsDOrpzbxEuvJU8rI1Wy0kc4bF/FtQWZfU2W5op9Y7+eDzFU1QBVvoHTVOfHhLn
         IHIg==
X-Forwarded-Encrypted: i=1; AJvYcCVB9k5xGPJpu9igaXNKJRnNq74iSVS/DMpTThh7+WKoBo1MZULD/frO9RAFW0PIZ5uUNPL8CLcWD6qmxKl22SFZd1WnMTgNiKVC2Fts8A==
X-Gm-Message-State: AOJu0YwzZfd4tmAx2OksBS8heu70rTrXj59tfaBiFgAP12rVX3WQGIke
	TI/EFLjZiMSOOqnu9iUU+EJLnHI9uYcSFF3jB2NaNwAxTt+4qmBuzMp+Mz0K+Kg=
X-Google-Smtp-Source: AGHT+IG9YNHqbFX5l53AQ9wQth8ckoaQl2Thoi3GWV3148tXmmgL0gEm989pTRxvAg0gBDDK8748SQ==
X-Received: by 2002:a05:600c:1ca9:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-428e6b037f1mr120214305e9.15.1722985495634;
        Tue, 06 Aug 2024 16:04:55 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059801sm14212373f8f.83.2024.08.06.16.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:04:55 -0700 (PDT)
Message-ID: <e27f0610-820c-4a65-a119-a5bb4fd5cef0@linaro.org>
Date: Wed, 7 Aug 2024 00:04:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-11-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

> +
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +

You're adding camcc here too which is inconsistent with the commit log.

Personally I'm a fan, perhaps the only fan, of very granular patches and 
I'd break this up - at a minimum into

1. Adding CAMCC
2. Adding CCI and CAMSS

---
bod


