Return-Path: <linux-arm-msm+bounces-21901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19F8FE4D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28EC328467E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EA4194C9E;
	Thu,  6 Jun 2024 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCzMSwo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342B1922CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671824; cv=none; b=IQAYF08teK/iB9VxaJ8M5OjAzLj/q/6eqalyCWjPgwEH//tsL4VKztskPkSIjrz/7ZbIgmkcQwwYlPM2CtYTaU07c9dmQULa7notX4jzc8UiY0dYVph4CLhkiRXnVgmqdnkvlWOJwZVmirUNrdjTXKmEmGv/e9rY4Ie57M0SPU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671824; c=relaxed/simple;
	bh=O6TzrTzuuPIyiVf2XUGIbRwwCuWNmcXtprbs1qF9JLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8n5OA65Wi5WZ0I5S+bGSewHsjvT06vAR2pZKKOnlZKfo/aCDDwlx9F405WX8XC/cg3REx9p2WPn27JzQJ26qeZsbdgEPS7tJzvABQRPBh5mI2Df1ud/cS6WHVYkswVTEm4RVoIXTg4QcpzuqMFfMMMYcFu07J79kruZG5sAYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCzMSwo+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57a677d3d79so3623663a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717671820; x=1718276620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=emgin1EcSYg/XiU2eX6KMlGDNnBu9STItuqAnBEEre8=;
        b=fCzMSwo+PdQgCsEsNlv/3YphFASKp5UrjuBQyyBWf+szVM9yTlvnV/n8BhAhkTK1Bu
         frMXI8T4ZMNltnZIUY9+P7gJaKPPSRN1Vs2V1AeS5MfMD1OJZ7jSJ60/aAiZaqyqay6T
         sd9MNAESzauPvv6ya7mbSedehlDjtSbsOVIyTD0wv8dJ1n1ZU/C/SAWSvRHDt0MaYytB
         TsFe0NXan9t+vfCmHp/1a4VdvIWfuYKy4ncWU7twSDa8WrGBkpnwDCj3IzzPcr3Qy90g
         CFQJtbnM5fEba7Tft3RzNcpVdMpqlf3w/PdjwBl3N3pKr1jlfuv4PuM1tGMO9vK08zqK
         GMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671820; x=1718276620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emgin1EcSYg/XiU2eX6KMlGDNnBu9STItuqAnBEEre8=;
        b=a9itmLgcj3ifSeqD69fX3NZwguq7zPwlp7dc1k28PirSLqH4OavsDXEJnUnxBzytLR
         YvQZ6HFbRu7cmXPVtpoEyTpmN+meR5DwaMdmXIXHr89gxCjoXxDiI2W4qSq/eMC/ZJ9S
         Wc9z6qSTEMGdxz1S8GJB0HjI1310Njhi36kF8vrhQlPAXurzs4lNvzdgydsGrgrSIi3w
         ssAYu9zGSKOC/b6q5GwdlvZoxDQa9dAo+vwzgrjd9AAGubetP+Bb75gUH8oevbGnpCbA
         qxrJJngH8ya+sRdAr3duriGc42aB3EJLD+DG7n2FFaylqGQN9mB1FvYqNdSAt5NH9wsM
         e4fA==
X-Gm-Message-State: AOJu0YxxTZc3Z7074FhXywvoM4FS7ciRlKJ9UZfTyQcKW0YvWuw6zrVm
	5r+WQFt0qRP9D/PZZFDT7R6oBxBx7YM/d3SOvrqG0na8fr/hOy17wQiMbiQz4zI=
X-Google-Smtp-Source: AGHT+IFjGxMJ/6Gzs3DR05v8iNmpQu7iscqwSy3nSZk0P8Y0h8/Ct7luKvYEceem9XDewEk/wl3KRQ==
X-Received: by 2002:a50:a418:0:b0:579:e690:8349 with SMTP id 4fb4d7f45d1cf-57aa55ae5f1mr2220154a12.15.1717671820001;
        Thu, 06 Jun 2024 04:03:40 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae25ecbbsm885464a12.96.2024.06.06.04.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 04:03:39 -0700 (PDT)
Message-ID: <8de9ef05-6caf-42fc-9547-58e9d340a31f@linaro.org>
Date: Thu, 6 Jun 2024 13:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 nodes
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 8:51 AM, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add tsens and thermal nodes for x1e80100 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1356 ++++++++++++++++++++++++++++++++
>  1 file changed, 1356 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5f90a0b3c016..2e34086b0ddd 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2505,6 +2505,66 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		tsens0: thermal-sensor@c271000 {
> +			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c271000 0 0x1000>, /* TM */
> +			      <0 0x0c222000 0 0x1000>; /* SROT */

Please drop the comments

[...]

> +
> +	thermal-zones {
> +		aoss0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

Remove polling-delay (irq driven), put something in polling-delay-passive
(250 sounds decent)

> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				thermal-engine-config {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				reset-mon-config {

Drop all reset-mon-* stuff

> +					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		cpu0-0-0-thermal {

This naming is a bit too much.. is that cluster:core:sensor?

If so, do the sensors have some sensible differentiator, like physical
placement that could be used instead of 0/1?

[...]

> +		cpuss0-0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens0 9>;
> +
> +			trips {
> +				thermal-engine-config {

Themal engine is also a downstream invention, replace this with a

trip-point0 {
	temperature = <110000>;
        hysteresis = <1000>;
        type = "critical";
}

110 is in line with all the other cpu nodes

> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				reset-mon-config {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		cpuss0-1-thermal {

cpuss-x.y also isn't very meaningful.. I'm assuming x is cluster and y
is some sensor within?

[...]

> +		gpuss-1-thermal {
> +			polling-delay-passive = <10>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens3 6>;
> +
> +			trips {
> +				thermal-engine-config {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				thermal-hal-config {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				reset-mon-config {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				gpu1_junction_config: junction-config {
> +					temperature = <95000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +			};

Please replace with something like:

https://lore.kernel.org/linux-arm-msm/20240510-topic-gpus_are_cool_now-v1-12-ababc269a438@linaro.org/

Konrad

