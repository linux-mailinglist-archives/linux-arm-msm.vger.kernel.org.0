Return-Path: <linux-arm-msm+bounces-83852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25571C93D4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 13:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC4034E14AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4C530DEB7;
	Sat, 29 Nov 2025 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf6f89CZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F188309EEE
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764417724; cv=none; b=UqtePOvsj+65z0CGAdhtgdRkclP/8qm905HQAvUGRLYWSMeH3vm4h7xL43NPyQolmMMtYDmaMTV3kD8to9boi9ILQqxjxVzLCA6umZXdJmf4LIqgPT9h7cTFQ5JQ4Y0gMybYmYdZN551i+VKnQvG9nBZB2K59iiDxsVZKFpCVpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764417724; c=relaxed/simple;
	bh=f/ZKx4xEE+ikxTpdnWKx4Qk7IWYE1o1vNvtgrWjnAj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sabzJADbqDXRtPelGGJDpTWRxsyNjuxm7Ta+RKGuud+edvX8hGK1sDC0w492Y5xT0qE10gGVrm5bf+t5x+Mnb30glzDT00jSvIlWN6KZtnWiglZcOog0UREzbYrPAdkplvDl0HgAvL6PBLo7CBlApL8C3gvjuKonmCbfMuxSsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pf6f89CZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29555415c5fso32729145ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764417722; x=1765022522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsD4GyLLncOmVtKa5dBhxPSXtl6ikQq7by6Wqhavht0=;
        b=Pf6f89CZcQG2N2Eg4Jm5C5sLB+qMmx2XhIllcK5tLV3OLOvjBdVj90GJT2PUn+1Wyn
         1Whchl49SAvuJJlDEI+tFzp72pPCs3/aC+fWgsSJCixUSvle5ApQCbTNKlGO6m8u9eRZ
         h2aazz9NVOurhhsFd7RqcGMTMjoHth+VGdJhtIbGcZTg/z8+rIBwd6ATs/OEtGB9kdCN
         sFI9hcFa1yC/BErSSw85coFXXqYwsMDDhFl179IFSzfP4JBdyraowl4KoN7/jHdcsxZA
         EfWZBHN3cokQI9bvc5CzwyWUqgiOSNknpeTaD4R9hbOnz4n1LnCA1QAP1RtTCb+HDQPd
         VVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764417722; x=1765022522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsD4GyLLncOmVtKa5dBhxPSXtl6ikQq7by6Wqhavht0=;
        b=v87fr+EbtfJevQ08Q0UIcvp9IDqcwhcOXmfusaRlLfE7bRAUWR3GdZJissq6DIjrXQ
         cDBKbXuZef+mVn4BWLwnjSGA4ntkTZhY3Hc2NESi5q9kZBuWdLrFxZgn0BfTAg0bF9vx
         EjwY508LDCT1qozzY+dcNaHs4QGHEwd/U+c/2HxeVdqdN7tH35SDCOdeUXCdUMz7kwK2
         EZ8Ur/QatB03RUHbKzwbybRe57BUBaY1wb1W7g6nD/tz2ZOKUlH/8s+hMxNjTg7zsiCP
         htGCnbOBy9FCXqIhUPL9/FM5SaqYtUAL2UtHbj8V/mORrG7ODUB3EJbRPgFpx5YKSfbI
         neWg==
X-Forwarded-Encrypted: i=1; AJvYcCVxjRNhCWNEuWFeNmp7yJPyj7SkqBjHQW4NlWshdDGMlnS21FdqlCVL9B7sZEBuLsEHnP2CW85XoIrkEz/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yynf38P1UDYWsDXK7P1HWd+lZ8DvlBiMNHPK8j4gXBiOSHOppQc
	W07WWimiN2JnfgqqzHi9T00mjuaKqObtbfdO5+J/xGR8oC6OWA7Py6KzSGVTRA==
X-Gm-Gg: ASbGncs5/aHB8/bWNfvNtgEEHZrIu4ejUl37+1C7crmcCx6qK6klCAfjNY1ojZsSPYL
	D+6VkioStJMQxIIeD3wiAZdhgRKQAjzNi5Qz9TDMDY628htoyMgMBKGCQ/7ix61waztdAlV5u+c
	1SFo9xZnsdNfpzpQbsR8pWYLB0NylXD1WTp2My7HEMuzuL4azxvzGBr4+DS8py8YCplyQ6meYCj
	JSSykAcGo4LkSPkFAZY2cz/Dvz4YIv6ySzotrXcUhgjvDJm3YHwysaHp8thrpOUj72Nb2QX/8+7
	PC2/FQZeDmz+PsqgMFMKQe/nkXCaWw0/8PKGlbT96EnUx4aUW1CJdWx5tJZf1gRrFtIWSf/lC2A
	fwB4tqxParOVTjs8iGZmleNUNLiDKjwPXFhiRy0I2CkeNfKH/8FuRFmimp53RNGlgUArRdwyxRu
	gqDfqwTENlVaepdwseWSuvF/wg7qDrzACGuDI=
X-Google-Smtp-Source: AGHT+IHSlQ7cZrU+1en4NRNy4L4r76JBNdxkTzQn2LuRQmFRsunNk6RY0Y/Rs69eAMice9A5/GTP7w==
X-Received: by 2002:a17:902:cccd:b0:295:4d50:aaab with SMTP id d9443c01a7336-29b6c404f5amr362281365ad.20.1764417722391;
        Sat, 29 Nov 2025 04:02:02 -0800 (PST)
Received: from [192.168.31.239] ([167.103.54.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be508b06606sm7062192a12.18.2025.11.29.04.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 04:02:01 -0800 (PST)
Message-ID: <7dbd8d7a-73ef-4285-aaf3-f767081b0766@gmail.com>
Date: Sat, 29 Nov 2025 17:32:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251118130814.3554333-1-tessolveupstream@gmail.com>
 <20251118130814.3554333-3-tessolveupstream@gmail.com>
 <w6tcgrn7dio3vmygcyhkofg6ie773dppxnk7f3v2kr6rqdufwz@klpqzkojfitk>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <w6tcgrn7dio3vmygcyhkofg6ie773dppxnk7f3v2kr6rqdufwz@klpqzkojfitk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18-11-2025 21:00, Bjorn Andersson wrote:
> On Tue, Nov 18, 2025 at 06:38:14PM +0530, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
>>
>> To avoid duplication, use an include file, talos-evk-cb.dtsi, which
>> defines the interfaces and peripherals common to both display
>> variants. Two additional DTs (e.g. talos-evk and talos-evk-lvds)
>> can describe the selected display configuration.
>>
>> The initial device tree includes support for:
>> - CPU and memory
>> - UART
>> - GPIOs
>> - Regulators
>> - PMIC
>> - Early console
>> - AT24MAC602 EEPROM
>> - MCP2515 SPI to CAN
>> - ADV7535 DSI-to-HDMI bridge
>> - DisplayPort interface
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 447 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  94 ++++
>>  4 files changed, 598 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5b52f9e4e5f3..282d744acd73 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -305,6 +305,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
> 
> I might have missed where you replied to any of my questions. But I
> still believe this file represents the Talos EVK - that is, the "Talos
> SOM" + the "Talos EVK Carrier board".
> 

Yes. This file represents "Talos SOM" + the "Talos EVK Carrier board".
>> new file mode 100644
>> index 000000000000..81d15ee4f366
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include "talos-evk-som.dtsi"
> 
> Here this file stops being just a definition of the "carrier board",
> it's now the whole EVK.
> 
> As such, this file should be called "talos-evk".
> 
> We now have two options:
> 
> 1) talos-som.dtsi + talos-evk.dts + talos-evk-lvds-auo,g133han01.dtso
> 
>    We describe the SOM, we describe the "standard configuration" of the
>    EVK, and we have an overlay example that disabled the HDMI portions
>    and adds LVDS and the specific panel.
> 
> 
> 2) talos-som.dtsi + talos-evk.dtsi + talos-evk-hdmi.dts +
>    talos-evk-lvds.dts + talos-evk-lvds-auo,g133han01.dtso
> 
>    We avoid describing HDMI, just to remove it again in the overlay.
> 
> 
> #2 would scale better if we have a lot of these boards, but unless we
> expect a lot of different boards/combinations I don't think there's much
> value in it.
> 
> 
> Please let me know if my assumptions are wrong, but for now I think #1
> is the correct choice.
> 
> In either case, you should include the LVDS support in this same patch
> series, so that we have all the parts that we're discussing in front of
> us.
> 

Will proceed with option #1 by creating three files, i.e., 
talos-som.dtsi + talos-evk.dts + talos-evk-lvds-auo,g133han01.dtso
The file "talos-evk-lvds-auo,g133han01.dtso" include the overlay to 
disable HDMI and adds the LVDS-related on top of the base EVK 
DTS file.
>> +
>> +/ {
>> +	model = "Qualcomm QCS615 IQ 615 EVK";
>> +	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
>> +	chassis-type = "embedded";
>> +
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> [..]
>> +&mdss_dp0_out {
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> +	remote-endpoint = <&dp0_connector_in>;
> 
> Don't we need/want a data-lanes property here as well?
>

Not required. Data-lane property is already defined in "talos.dtsi". >> +};
>> +
> 
> The rest of the patch looks good to me.
> 
> Regards,
> Bjorn


