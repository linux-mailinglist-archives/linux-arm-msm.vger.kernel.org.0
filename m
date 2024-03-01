Return-Path: <linux-arm-msm+bounces-13124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB686ECFC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 00:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3DABB24614
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 23:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEF95F46D;
	Fri,  1 Mar 2024 23:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUiVvp9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B2B5EE8B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 23:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709336377; cv=none; b=EhOnx3doPYSY3TC9VNzxWM7E/7PfOlm7yllUQEDN/uDgo/kkOBAnXzYR2g0XE0XKNPx3EFdxtHLVN0sKAt2I1lxmDRSS5pX6TYHhroDKLKbvADNNmSJCPR5rquTUKpSqf6G+3Ba8//ZSVpQNIK1acEqvGwkKTTGA6srpTk0+1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709336377; c=relaxed/simple;
	bh=+3ZyH2gNlIIhNS8WA0Ai83YZJC3WVXzM7YGqvJwqanw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VooQ+OOD5+OvYwbm+2JHyB1tCphJZWJuuf8ARVKeKZ2kOhblWBmpDgyt4qzD8yjLM3uEwhBFeWKdWn7fnNNDqtYPmMoh5/7WoGp1OqGdhx4aVvM+aVb5hc8/wllKFG7VvA0k62i/MaZb9VmDWsxy9TOYr6eCLthY7TayBVdE4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUiVvp9b; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a26fa294e56so497244166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 15:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709336373; x=1709941173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZpbtAHaDLOh7hkUppnoKAJWYa12PIQsO1N/wH+8xTA=;
        b=ZUiVvp9bzhE5YMVnvfFTccMdUKpeUB8Y+wpi4nMw63MB9NvBnyYxWblhqOkPxakgbc
         dXoYIik0HUlmJbLUn0ET8DtXK121adrD14mpJJsh5RiOr04yPnIzBs0SHkqB8jTsOkCo
         N4FW33hRvhT52JeSEBKrKe9BJDN2/bZjG7B/GEnic8VHAMggNh60HZK0qs9Y9jwSlJwp
         2HtHRUogfCmdvyB4sel04DPHevjT3erHJ+jYuya7BWqrc+OeGX5Pb4pukIfrVCb8UZES
         0OEB8/IDnnTHacTA5u9H3u/HncPZssvILFSCPcmSzwm87Fe7Gh1o8XVq3kbXY2eNepZR
         NRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709336373; x=1709941173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZpbtAHaDLOh7hkUppnoKAJWYa12PIQsO1N/wH+8xTA=;
        b=X0AWaR+reDukfVDSEgIO+Kz6WE+SDBUc6HpeOYTu87wH0swCceUT7oMRD3mWKMOUMv
         SdCXDlq6wgmOXHc3pkDhncKNaRdvziMUQM9/DWlXy1Db1m1NHQrv8+VKw+eeEQOhYHJ4
         fPSSJbI/IXNL0BXPPEp+hGOismfpDHZk9LBqueLw0R9gqrEqmA34hf6mM+Bvr6Giguhc
         00oXJ+mssL5Py4m/tuE4yfFU43anDgCfloWO1RDM/d9UaUQkAmQKdSRG/0VzkEtqgI5N
         uVUGv/xNEl0SgE7PKTocDFV82rNkpMag7iFSf9aL/dGYSZutYCrEKk4r6x/Nq7PIe6V4
         Og4g==
X-Gm-Message-State: AOJu0YxJ/kaJ2gOyXwzJ++q9yVDcP5KvgGOt3fqAi/rzgayFSdx6be01
	FEwMfRDqa109i/ZxGzzGZo881i4oBTiA6xtlMC/Vtm0criXZ35DajDcSxb73ay8=
X-Google-Smtp-Source: AGHT+IFBlx5ZPPFAOiT2+m50QKRQT/6ZGBpwckrxNMAuWgE8JrZI96yfdL5F9xSnXxTxjfxhlj2gWQ==
X-Received: by 2002:a17:906:ca4a:b0:a3f:5c5c:33ac with SMTP id jx10-20020a170906ca4a00b00a3f5c5c33acmr2452296ejb.62.1709336373496;
        Fri, 01 Mar 2024 15:39:33 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709066d4d00b00a44256373afsm2122841ejt.200.2024.03.01.15.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 15:39:33 -0800 (PST)
Message-ID: <7ac26eb7-2442-4578-9fa8-e1bb59756e6e@linaro.org>
Date: Sat, 2 Mar 2024 00:39:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcm6490-idp: enable PMIC Volume and
 Power buttons
Content-Language: en-US
To: quic_huliu@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240301-gpio-keys-v3-1-ca664de8775c@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240301-gpio-keys-v3-1-ca664de8775c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1.03.2024 08:16, Hui Liu via B4 Relay wrote:
> From: Hui Liu <quic_huliu@quicinc.com>
> 
> The Volume Down & Power buttons are controlled by the PMIC via
> the PON hardware, and the Volume Up is connected to a PMIC gpio.
> 
> Enable the necessary hardware and setup the GPIO state for the
> Volume Up gpio key.
> 
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v3:
> - Update the commit more concise and explicit.
> - remove "power-source" property and update the numeric value to defined
> name for "qcom,drive-strength".
> - Link to v2: https://lore.kernel.org/r/20240223-gpio-keys-v2-1-19f48b3d8762@quicinc.com
> 
> Changes in v2:
> - Update the commit description.
> - Link to v1: https://lore.kernel.org/r/20240206-gpio-keys-v1-1-7683799daf8d@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 43 ++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index acf145d1d97c..cf8f6d48bfc2 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -9,7 +9,9 @@
>  #define PM7250B_SID 8
>  #define PM7250B_SID1 9
>  
> +#include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7280.dtsi"
>  #include "pm7250b.dtsi"
> @@ -39,6 +41,24 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		label = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_vol_up_default>;

These are backwards

> +
> +		key-volume-up {
> +			label = "volume_up";

"Volume Up"?

> +			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;


Documentation/devicetree/bindings/input/gpio-keys.yaml:
linux,input-type:
        default: 1  # EV_KEY

Konrad

