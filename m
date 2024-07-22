Return-Path: <linux-arm-msm+bounces-26731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34890938B57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585DF1C20FC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A789166302;
	Mon, 22 Jul 2024 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWa3bZdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B371DDC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637486; cv=none; b=civO5+ZFzPkbbn6B3yTpqPvDTWYMdH5SPK2DhCgLwWMY/cPj3+Xxs//f9SiB6QkOuuTUoSx75V827HaJJsgSeEgEtRDMaoNGW8w91lAoo3y66r2cfyZEzuo38gSwQQOfF750IqCsmqAcHENxqQyNMvYFK5W20njPpCDRTpxsblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637486; c=relaxed/simple;
	bh=tdtnsGdG9Ah2ucRzsVZYSjdWwb4VBHuucRGsMV8r2A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8tMRXhepRW/f9JuusH/PL8Z374rDO61fxav8ar0cVWiI5u1vdvk43VXl/H014WHFCjW+5KOtVYzOW6nys1e8JIld7YEY0yA98v8vGKKt+jfDUOghBCSCC9esgUsgZuRzAp/oXQsPh7xmwk8D8RwGPfVn4zifax88N3BLQo8qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWa3bZdj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea2f58448so5188279e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721637483; x=1722242283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=viy4DOUz6EqSyRMuAWetkHNM/Xn/IPNTPSMVXraeMWw=;
        b=VWa3bZdj4G9n05NMDoJ7Q43qQTuGEqy56c6uJCD3267JLaWWwOp4CGrOK+sYkO+IK1
         b46/joSpg5HrJF7USRuHf9f8o3UEZJ2aQQsW5VrI8ML1eBZKNRFyuzwq5uHYudcHuUWr
         fJY666zHMBwAfAaAJMzkPU5RdXmvI1xHgyBj+orQgHOJT7DT8P+gj5XKZBM2mom1P8A8
         pDNB/nFCxWAwXufrwEpAofpdYo+Da7ZP+6q5hNXmWfdRPahUKniQC7FAqQZcUFSYe71z
         BaXWb6sV+hvHWAQ5okVoWQabUwcjz22fsK9eg5HwSIz9+5ojE9R0TuEG5pc/Ds+3bL7T
         wdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721637483; x=1722242283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viy4DOUz6EqSyRMuAWetkHNM/Xn/IPNTPSMVXraeMWw=;
        b=iql7NJbyvuqPt/yUQh8Q4F3TY6O6/s7Dtvf0BAAqSG5JMCI7x/r7K4tkx8Tj1spCmf
         XJZnP/LZYfNyg+8BDkw/0lmIU0UpHxPpFX+oCD7ttTdMLhJX5oBhdRMWvAbVF9pvexS8
         M6XI7LfzXpP/bF7diUkLt+1hoUf7dINdXmrwCkXLnbmV+SfDwHn4xsUYmE5R3uWbr6xZ
         VaJZxYIJXSYKkFvWAI1ZprVta7NPuaVexpE0AxzJYWPyALQzJpwwtQ4jtywtK+TazWWb
         AMiRhaBeTA+sIpwUT4GCSwXaC8UZiDHzNWAYPIy5iIJlN5+HZ/SqHUMk6yHhHNkB8fJ1
         w6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWCw178wLAqBC3G3y/J6ukYpHkvCI2SEW2+1PCkmRxNnbu/WhDlipJKj7awxH0kvtLb1W9F5xqu+H00efq3UpXiFt4ydKqSJeaWJHE2GQ==
X-Gm-Message-State: AOJu0YylOGUZeUBymzW8uS3JsW+7VM6qwrsbc5P1eYwOSsoSL/x3F/NM
	knHhCACyVq1jrP1rUPV5TRg70MNh3/i6rN3e0PHjMEfth4dcDMQOL/0HwBlUnAs=
X-Google-Smtp-Source: AGHT+IHl5S1Hv4aljesKT/0/93+3BpBOkF4UsuQa+KfqWL4JswXAtrL2kqaP9qfUdy0xQslFEfeb4Q==
X-Received: by 2002:a05:6512:3e19:b0:52e:fc74:552c with SMTP id 2adb3069b0e04-52efc74586fmr3523465e87.33.1721637482657;
        Mon, 22 Jul 2024 01:38:02 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a59be83c69sm2395523a12.58.2024.07.22.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:38:02 -0700 (PDT)
Message-ID: <09c3a2c5-68d9-41c9-85e0-397b08715fa3@linaro.org>
Date: Mon, 22 Jul 2024 10:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-4-c4d486435b96@riseup.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722-qx1050-feature-expansion-v1-4-c4d486435b96@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 9:10 AM, Dang Huynh wrote:
> The Pro1X has a caps lock LED on the keyboard.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> index d91d31646b29..60c046fe8e52 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> @@ -8,6 +8,7 @@
>  #include "sm6115.dtsi"
>  #include "pm6125.dtsi"
>  #include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	model = "F(x)tec Pro1X (QX1050)";
> @@ -63,6 +64,16 @@ key-volume-up {
>  		};
>  	};
>  
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		capslock-led {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_CAPSLOCK;
> +			gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;

You may want to take a look at msm8998-fxtec-pro1.dts which has a
bit more properties describing it

Konrad


