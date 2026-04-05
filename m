Return-Path: <linux-arm-msm+bounces-101826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BDnN1qn0WnDMAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:05:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0139CE95
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3EA6300BC9F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 00:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F224D2745E;
	Sun,  5 Apr 2026 00:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSc9op4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E28DF59
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 00:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775347538; cv=none; b=Ku+gr9KKkIMYfN/MqYwIZitcxAf2OspRZBIKjYTiDsRjgdJsuLkTW/L4FLNwM1Wl1+djRXGXr4j9dcgooIOGKuPWKD62GvcC3LFOlIm5sL4IvxVRKbr4xKjzHtp+bv1cJOqXddAaWuZk1YKrBXRUrr8jQ5xMecPfVUAlgZbxno4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775347538; c=relaxed/simple;
	bh=eD839NDE5H9CmiRueWDchOB7qjzUfCxB7uRTtrbIfqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AenuDmSguVzoM10xF6/GeWg1QSkD/DLYoVwclVUrtxIoJJTQ202MunkLFzWMQp5pJczY56oSzw/PkgeLltK12w4DEb/SlfOoEY6f+5QqRTgbyNaBvP+qh5fUFwiWNCXOVlCi4admls+o+p62BZZbVuif1EKCs19nDkvlXVg42Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSc9op4s; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso2588770f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 17:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775347535; x=1775952335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6niN5rHkfj9+STb1B7vVxgC82p/xl+UfQX44Fsubjc=;
        b=KSc9op4syQgcWg5K/WIYliDjKhLBUE1VZfpebjg67BwohCmo8TlFKJ5/o5lnfRg/+9
         MPSfKq707P4/9mVGWAclfd8T523hI9L/E1TzdSFo8ECHak34kXwylZr0kArCWKwoP4Gi
         DDtzXja/n9GRKjg80QGf2G9pZi1BzYzqg0FTUTsMvwBoJWWGFqgvsIK6wB1TfvXWSQAn
         zFRw8XUoDR1zjZATC+piFhooZ+jdCg72Hi1Fn/F1KSaF1MyXT/Dh/o8fPs1bN3Fze9IB
         10DO5cXzBPnLEI9bOFJ6WS0B+KNwUSGKlfXLD3G9D7OgXYm4cf9TDR9C0TfUdzllJz8M
         p5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775347535; x=1775952335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6niN5rHkfj9+STb1B7vVxgC82p/xl+UfQX44Fsubjc=;
        b=GFfVmQBQA3J0BEf9QPf2dKY+lMvtXGDRJGKJXDkcH1cUg0UvJ2xyh/RpdOGonr+kry
         VoPg1WhaLsmHEFQrsKeU5VZm91nQI9JjgmIBTLWXyq1C4jYoGgip4jtZCjbvt8TtCsKG
         W4MWJMNlbm/9CxGEgmBdfehUKftPU/odncc2vliORQZr3hIYX3orOGL6E4kfpymSFq0y
         Q2vIEb1Kk/HZr4smkxGaHr4SPbjzfuBnvq30/C1HU3yc+OehyCL8OKXAyXH2/mSCoR/U
         +brsO26m3pOkgUf9C7ajpVcPpdcatDDg4ubdogkd5e4ksyYchthgWF/Z+rhFY8pqGjsL
         XKDg==
X-Gm-Message-State: AOJu0Yxx5yoLfHDjWwLA95wCZZojRHr+LHJOQ2zLARRULjpCUTn+yrF5
	TShQn5O6qCQFX89hDMCjb2xpvqoVcqf5xdU0r61V0U/OElnwPipE1uwrG6+taqX6J8k=
X-Gm-Gg: AeBDiesVUHKi1minJIIsLdUiILkj9K2tV1L6RiychC3/d/hxMAOheEinzAYGvRupfnQ
	kvMJS0/r7aVeFBPOoTlYkScfsMriFozjytNaVlpRHHjHNYbcA5qYKVSQkgQLk+02WqI7Q32Y4CF
	y1dFb8Lxwr0NILOyRt2Swwlw1Y9QiScPj34qRm5GAReOS6O/KaOjm6uyMfVq7DCHarekMMsrDuX
	tE2ZKK8pPB27Xj45aTkJGEuJiLm/XbsF/WSowW45N7SBA+Ih8w4YV3V45G/uJBRWpjng/0xjiRL
	AX/4fRf/nstuH+/0sB+nsMOxWwOO1g8P/HSsJfJV9yMFZcEBTlKBZYcWvcqhtqNTTfoVDktVAsS
	1KFrGsdTlt2bz46J55aif51uM3AWpckFoXqCwx2QnpCGvJEOR8ar3cApY/XZ7wf98+WFy/oxty6
	mooOeZOicDy9Oc4T6kP8mcBo8y9IB77hVcXCM=
X-Received: by 2002:a05:6000:2c0c:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43d2927ffe4mr11556544f8f.6.1775347535109;
        Sat, 04 Apr 2026 17:05:35 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d27a8sm28693271f8f.17.2026.04.04.17.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:05:34 -0700 (PDT)
Message-ID: <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org>
Date: Sun, 5 Apr 2026 01:05:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101826-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bewilderbeest.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3b:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 45A0139CE95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
> codename 'tributo'). It may be partially or fully compatible with EC
> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>   .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++++++++++++++
>   MAINTAINERS                                        |  5 ++
>   2 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc7511890fbef08c6c717c0aa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml

I believe the part name of this embedded controller is the "mec5200" so 
instead of calling it dell,xps13-9345-ec suggest "dell,mec5200"

> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dell XPS 13 9345 Embedded Controller
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal
> +  and power management. It is communicating with SoC over multiple i2c busses.
> +  Among other things, it handles fan speed control, thermal shutdown, peripheral
> +  power supply including trackpad, touch-row, display. For these functions, it
> +  requires frequently updated thermal readings from onboard thermistors.
> +
> +properties:
> +  compatible:
> +    const: dell,xps13-9345-ec

Ditto the compat - name it after the IC not the laptop its a "mec5200" 
or "mec5200-ec" - I suspect the -ec postfix is a tautology the ec bit in 
"mec" probably captures.

> +
> +  reg:
> +    const: 0x3b
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  io-channels:
> +    description:
> +      ADC channels connected to the 7 onboard thermistors on PMK8550.
> +      EC requires frequent thermal readings of these channels to perform
> +      automated fan speed control.
> +    items:
> +      - description: ADC channel for sys_therm0
> +      - description: ADC channel for sys_therm1
> +      - description: ADC channel for sys_therm2
> +      - description: ADC channel for sys_therm3
> +      - description: ADC channel for sys_therm4
> +      - description: ADC channel for sys_therm5
> +      - description: ADC channel for sys_therm6
> +
> +  io-channel-names:
> +    items:
> +      - const: sys_therm0
> +      - const: sys_therm1
> +      - const: sys_therm2
> +      - const: sys_therm3
> +      - const: sys_therm4
> +      - const: sys_therm5
> +      - const: sys_therm6


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - io-channels
> +  - io-channel-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        embedded-controller@3b {
> +            compatible = "dell,xps13-9345-ec";
> +            reg = <0x3b>;
> +            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +            io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> +            io-channel-names = "sys_therm0",
> +                               "sys_therm1",
> +                               "sys_therm2",
> +                               "sys_therm3",
> +                               "sys_therm4",
> +                               "sys_therm5",
> +                               "sys_therm6";
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b319a1b08d3425f4d712 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7236,6 +7236,11 @@ S:	Maintained
>   F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
>   F:	drivers/platform/x86/dell/dell-wmi-sysman/
>   
> +DELL XPS EMBEDDED CONTROLLER DRIVER
> +M:	Aleksandrs Vinarskis <alex@vinarskis.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> +
>   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>   M:	Zev Weiss <zev@bewilderbeest.net>
>   L:	linux-hwmon@vger.kernel.org
> 


