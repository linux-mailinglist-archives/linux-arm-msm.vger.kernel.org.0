Return-Path: <linux-arm-msm+bounces-98761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAXLBGb6u2mzqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:30:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 647162CC034
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8FC730AB872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366C93D16EC;
	Thu, 19 Mar 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRXwXbt9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410C3CE4B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927004; cv=none; b=fXZIu7Xs5GndUFuTuMlnijw8HC/hTxTdxefA55cpFnOYMOo3w8CRcX4GHWuP6OlfDznAbBwqU199/RBVJNkQbf06Lkjv/XgNWkuJTmQzqmWWDOG+Is7NO9uAcSgEDnrYXeZjThMKwaewtq5HeHsHmwjkT6tzAOwn2EY5f6+NcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927004; c=relaxed/simple;
	bh=ncx0G9KktBPLHIhyw+YjWyFz4qKn+uPH0Uh5irzi8U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKTcJw2PC9SaiHyCFvrKL4MIjUjO1bfSq7v/ixf8NkOaU0UnsHwpxtBfaN8b85x+psPk+JM3KjBbwy69pqIEcR6u4wYBWsx+74kmYkSUfpPlYLUCayvmgDUb6YZO+HzXzzvRsQmmtIKA4aOzTevVpPtIn9/SNxk0NkXqIE5/2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRXwXbt9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be58eb01dso1158121fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773927001; x=1774531801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USMz5MsHqxDaHUDz4ZLBPX/cfdLXEt4o+4zZ81T5/Dw=;
        b=NRXwXbt9QXF5ymZXpjwF6QjFjXBg5V+2edCvEFLnDJuvph+Auc3lCt7ooCAnp5vh51
         eoOktc1KjbeViRHgF07peiAmnPlfTebqPra33mTef25ejzmKYfcywztFM6pzWv2yYsTc
         XiwDbJJPERadIsOEbkJ+Ml75izAH9Jq0pefI1T86uALVuMwSliul4IE5sf/xSBQMbOyj
         JeKUm1StzCruEk+he3s7MbkyIlAS+LFCwo5egSYeWcU9/GiFrtgxCyiOBV+TKMWoNN8z
         sZANz43vWVgawe1rzDIZ4QH7tq9TZsFgtIWcBVsYMSx6gBMq9blH5BhzgbOL8Yrcz5eo
         WULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773927001; x=1774531801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USMz5MsHqxDaHUDz4ZLBPX/cfdLXEt4o+4zZ81T5/Dw=;
        b=KBDdd7hHf38pnCFId/jEcDiAgus1tMICk/T5F02kyhggVgTV1hVndI5JVats8ARZcc
         NNAjr+ImeplaE9jhG2pJZPOyp9n8w4G32vO6uhhVVLseXWYy1wYHnItL5HbyXsGxfLfl
         oj61v7UQ1ftiTBd9oiIZcu4lCmiXLV+dnYIkFk04SAXPn/BQeiiHFqwtC9SRlxWXDeSX
         wJrEpJiTEyihPO9k7mImrkLTWb295JYVI4vX7Bc3ggeKTN0EBpZdTn3zu5zIdK8GHvcE
         lBhkaxb6oDRK3PwnIqYhvA68qJeDFVVqn2g0JAGU1akm8Ty0AITusAU+iJJpYQU0FNyG
         2Mng==
X-Forwarded-Encrypted: i=1; AJvYcCUS0AaEjqk3RGq39gRQOj/lHS0NQkQK9fpSxW/SjXvaiP8SVV5hx8eEYJFlC2h7qq7sV1Ac0EVdGcHwM0yT@vger.kernel.org
X-Gm-Message-State: AOJu0YxP89Hxskwb9VPWVjm5KpkJdizKSgkKw5FP9JiR2z6nkjEKdOcr
	5YTIemUyxgyFrIc8m3AecTcbrVmyPpUOq29LntDvr9hW2ambK4hY8IzXbektDH2Mrims/nrQ3M5
	JywRz
X-Gm-Gg: ATEYQzwjK1ff0sy+c1gzP10NuPdAGizNQtldverpo0woBDWkqH14aul8FQHQIjQTcE8
	Ith9N3K/U8BEEvJ6yzQH0Uead/5HkoBeTA5zh2FIu1yWGDaTmTFnBFMzQVsyhZqpHFEPcur5QyI
	NiZ21uZYHs7JcJLtZA4J5u17iKxOg9Ca7Vt5arBKpRhDIMEqlMzAyip5brlbqIjr6kNpXyMELxk
	5Eowbj/QrxJgpt63pxPQRKhR7mNNWph2oLI/ydhX0Qx9F1JnYNCnXHE+88ibsq1w04WdTL0JxYy
	gr2iqua6XyJ1T6UZE5J7PLWfoKGzWFtszHg/2Gpc3Xn0rCHR8z0upSyyODU8gTY9xF2gYx5t3nh
	SuzR0TwWm6jtuO+RzOFkqL0pxMl0kjG18bTuM60ZmMYUO6uKEkfzP0KGYr+NDt3v3ehfrlUFwWH
	+4Ln5P4coRTFaG6RPCzkal5sNbRNEuwPUPaDjhJH/T7UlcFUVE4WIWWq1arhrbjD/Ep+Aq8hwdI
	qRH1REZ5GvXJCEu
X-Received: by 2002:a05:651c:19a6:b0:38a:f5a6:9190 with SMTP id 38308e7fff4ca-38bd586daeemr13196791fa.4.1773927000489;
        Thu, 19 Mar 2026 06:30:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54ba2afsm12098711fa.28.2026.03.19.06.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:29:59 -0700 (PDT)
Message-ID: <2ad1a60e-43a8-4d89-a04c-b3e3c3afdc42@linaro.org>
Date: Thu, 19 Mar 2026 15:29:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
 <20260319-fp5-s5kjn1-v2-2-6840da94c574@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260319-fp5-s5kjn1-v2-2-6840da94c574@fairphone.com>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98761-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.10:email,0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,f100000:email,qualcomm.com:email,0.0.0.51:email]
X-Rspamd-Queue-Id: 647162CC034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca!

On 3/19/26 10:12, Luca Weiss wrote:
> Add and configure the necessary nodes to enable the front camera
> (Samsung S5KJN1), connected to CSIPHY 3.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 ++++
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 47 +++++++++++++++++++++-
>   2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 343da1b18095..6cbf6ba5fbc0 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5774,6 +5774,13 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 175>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio67";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci0_default: cci0-default-state {
>   				pins = "gpio69", "gpio70";
>   				function = "cci_i2c";
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index c9c24c36ba7e..aaba40478891 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -626,6 +627,24 @@ vreg_bob: bob {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c>;
> +	vdda-pll-supply = <&vreg_l6b>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@3 {
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;

Please remove this notorious and kind of senseless under the CAMSS context
'clock-lanes' property, unfortunately it gets copied over a lot...

> +				data-lanes = <0 1 2 3>;
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				remote-endpoint = <&camera_s5kjn1_ep>;
> +			};
> +		};
> +	};
> +};
> +
>   &cci0 {
>   	status = "okay";
>   };
> @@ -666,7 +685,33 @@ &cci1 {
>   };
>   
>   &cci1_i2c1 {
> -	/* S5KJN1SQ03 @ 10 */
> +	camera@10 {
> +		compatible = "samsung,s5kjn1";
> +		reg = <0x10>;
> +
> +		vddio-supply = <&vreg_l6p>;
> +		vddd-supply = <&vreg_l2p>;
> +		vdda-supply = <&vreg_l3p>;

The list of supplies could be beautified by applying the alphanumerical sorting.

> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk3_default>;
> +		pinctrl-names = "default";
> +
> +		orientation = <0>; /* Front facing */
> +		rotation = <270>;
> +
> +		port {
> +			camera_s5kjn1_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <700000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
>   
>   	eeprom@51 {
>   		compatible = "giantec,gt24p128f", "atmel,24c128";
> 

Nice to see that the sensor driver works for you!

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

