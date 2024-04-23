Return-Path: <linux-arm-msm+bounces-18302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E328A8AE7A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 15:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBB4288331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6F8131BBD;
	Tue, 23 Apr 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgYB3Kad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C188745E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877874; cv=none; b=Sz2TfRqJyzS8D0VX4RooBqdaM8g48FIpBkCd1hxfrCJS6J9DcjLaACBWfgoDXX+LY8/v210LcsGKj3TChI+pxHkYc4EcvmQbGLf9nTe+4iG61lcNbRbWOpGaCcFwWsFy7b2/YuYbkjZZlQUSXUmhVx/JxEM/tE4ELhQ8+ovHlhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877874; c=relaxed/simple;
	bh=EKiFUNWp2CVL7UdhgyBqmC8Xr2ctOjFiU0OMBH/KQs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJJswWYkBVK9R9uqBY/Nnro7BX9eJZ9sgqCV2blA/AHUleqFJ+O+IDq3oMR5dV4pBM/fy2jLoBdEob+Vy9EDIGGsuL4AXwZ0Z2TCrGzNOjmPMsJNF682uYa+9CucfsJtZKufh/HDZJrBrDJ6kq3AiRUBk/1jXECQT7HXE0rnu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgYB3Kad; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso85322371fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713877871; x=1714482671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljVofaMz5XK05sXcsxWO2zq54dDkOVWRiaigypPdLmw=;
        b=TgYB3Kade/ZeRX24pgwtEgyFUiYPjqgVxorw6P9BaCZ4/m8ZoTCb8mQLzrG7cY5KcC
         4AjDcN2I/IjPIir+AOPjP4bLAlmyHrAdpcZlmBY/hTn1+csCKFD+KiIIQLEyPS2Eomcv
         8qgvA8yH3AVX+dEZUImgxgwW58S0V3JCMNHYDXhJo9/GjVdd250fVt7Z6aOTHpWUyuLZ
         8cvgk2zsrCIO39iPSVgOuaHPfMOg1sH9Wh8hiz4jCPRGro3APlKflCiH1DQBeKLEE6zf
         yzThZMy4QQdYOT5nDxEGPKcpiQ+Qk8uVFk6VGTWaxBV/AtRUFCBt5G5V2oeQzw/fhQmX
         MXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877871; x=1714482671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljVofaMz5XK05sXcsxWO2zq54dDkOVWRiaigypPdLmw=;
        b=QYasBkrX/TfkVJEkjOHGGFVmbZY5qtv9ko90oSw1IOcG5cIb3JVVDzynSBaB2Dv44f
         smc15fTkh/wssTzIyUPBRCkhs3SCujL9l3X77SSmNYgQHmqnOYECBdR7HG/s96Ea4b9y
         eECyeGiZE0js2y1N5+IW3zb7MNTCm+Etxis+NPOc0Hs3r4DVX2mn6+Qwhn9fRJSZx7dB
         ZBBlfl58X/fX8SmnZqZ5JEUyWwdkWjRcE/D0DEFEAcTPA87Gmt6jQe8HRdw8hxobPDbh
         hFjhVv5y+mZsBRzwgh0r/gGPf4nY0xCMMn/Pp1AuWZyGEzZC9cWouGMphCvFZ4kGt7HH
         hvRg==
X-Forwarded-Encrypted: i=1; AJvYcCXe6Ya0IoRGlXROyzmK5gsfTVYhE7xSBb0mmik7vV+8zbPiTNzrbb+B4Jr/rzfvvPnpFHN+l2BD01Q15vj6w3XS0GLEOqrSGkCdRcI4Kw==
X-Gm-Message-State: AOJu0Yzkh7V2wvk6cJcmbO9w41aCPKrQiTDO+Qz1RyxnaXBcvNiQaAGe
	IpUK3Qr0hd95q5FmAjZiFYZdSaYaJOHU+7XNiULEabzllENTjWNhOjI9pOK+kzs=
X-Google-Smtp-Source: AGHT+IH6+a300iDdirczkNG89v3OWEFzlKL6UcHimIG4AYRQ19LBvrY3ZDkgjW/buxJ28WPKLxuKTg==
X-Received: by 2002:a2e:9995:0:b0:2da:46ca:25ad with SMTP id w21-20020a2e9995000000b002da46ca25admr8218339lji.44.1713877871520;
        Tue, 23 Apr 2024 06:11:11 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r28-20020a2e8e3c000000b002d28db9ce7bsm1741252ljk.20.2024.04.23.06.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:11:10 -0700 (PDT)
Message-ID: <3054961d-251e-4e70-b907-4949cfacca96@linaro.org>
Date: Tue, 23 Apr 2024 15:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
 <20240329-fp4-tcpm-v2-3-d7f8cd165355@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240329-fp4-tcpm-v2-3-d7f8cd165355@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/24 13:26, Luca Weiss wrote:
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
> 
> For now USB Power Delivery properties are skipped / disabled, so that
> the (presumably) bootloader-configured charger doesn't get messed with
> and we can charge the phone with at least some amount of power.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

nits:

> +	usb-role-switch;

this is a common property of the dwc3 host


[...]

>   	vdda-phy-supply = <&vreg_l22a>;
>   	vdda-pll-supply = <&vreg_l16a>;
> +	orientation-switch;

and this is a common property of the QMPPHY

Could you move them to the node definition?

Konrad

