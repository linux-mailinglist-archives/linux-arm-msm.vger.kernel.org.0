Return-Path: <linux-arm-msm+bounces-108488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJsZLSxNDGqWeAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:44:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7087E57DEA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AC8C30022D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D847E4ADDAE;
	Tue, 19 May 2026 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+gY1OE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276BF4A13A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190923; cv=none; b=jCjYA+hCYaKOYj2HwSoDeK/eX+ofBUBEJuRtzIpXljWGO+VXoQPIwLqXtREnj8J/DwPgwHHjRxAmBUhxmbexjwYZ6uzchqL+k90+G2BiRXZKyP5mXlkopjrUzapiTBS897SOg3SmZUV0emkhdoWQYtteoJGsVLSwt3SF1vIhciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190923; c=relaxed/simple;
	bh=iXaQej+aa3DbMyR4YHSetSZ0oLvnEXqSgtMh+UpQUEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qarGpmZGwgEoqXf/N6s+xW9enaxFH1HIgOOxE1wY2raJzA0G3kVyUljiuxGGD8gLJsI7vv/ips/e+zbDY2OAWTsaTMZtyEQ2FEFJEkX6EpxK2TG2QPhpXwqynIM5Knx8m79gj08vPevby5m2HHEH5w3RRN7VDEuGNkm57L/tyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+gY1OE9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso29224165e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779190920; x=1779795720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJoGNxpHwJXF2k7E+m5KPLxypZWZKLTX+aIvO0pTfwo=;
        b=K+gY1OE9DhU903zmTSNokRe4DZws4D7Lxrtt0xgT3FBjwBBgwwZKav+DOrRc65MbL3
         Cpw+pNbs6o/8ADeOcEUtEbiuuhml8q7GMQdIQ/xaOha7IDuxVCboBc6rpHPTFI4llNhA
         3SMUYFP/diYDwHcZDlhrVu4OadZFj/26l9HoBeXqpeNHBvXqOxls0NAehlgg8SkD8xs0
         8WpeZrJsnYn2/NGizUXsRccJvmgCJ8ks7wIoJqaTMp4t/5+tLaLTztYdYY7JWZ43UBIq
         2RRx8UQbQNJ+a8UPSxZpy4DSkxOHtc1MqleoXhuwHLXSKCNHwYreHJsRT638OCK78JAV
         0ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190920; x=1779795720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJoGNxpHwJXF2k7E+m5KPLxypZWZKLTX+aIvO0pTfwo=;
        b=fHbpI39f5lWuQ8ywLTfqMYk/bl5ISa7X2Ap9c7ZHxSUQfkefDl/YvlkPIqHVvV+bzA
         QgI/et2jeCzWovji8pNkCZTaMy4KxXyLKgzwAynaTb/t0p9Dlu4JiIY9wn5JGZIgj3F3
         rjLdykiAdT/Mx3R9LvSHzwUx2oghdT7Gu1ztDX8vaqRlPKb60LWCXPpB5FxRjXcM37EA
         b5pLHlGANDBkn3P4lX2ZtadVBsPVZyas+K8aVVAmWnnQyDF6veXYXajNiDaxHMdrvIto
         0vk7ShiYDP3aCKCd9XVe479S37GJOXtqFnKjOpBIpiPhrOKZRBURJ6/35AI8f63BwjPC
         fT1g==
X-Gm-Message-State: AOJu0Yy90V4AyzOTQBGWnv/jVTW0ZAKBkPwpFGIWZLMVFfcGG8ghs3rm
	ScUPTEHXllI64i5uyx9bcsXXAeoHxg6DUg36YBFiUnGwvVe2u90QApWhz0cllO20gnQ=
X-Gm-Gg: Acq92OGcMSHrQlX/DAmLgrNYnP/avH6tiddZeiXvpgNOa+Hq0QcRfusFGjVsBqaGjvu
	3ZFN9CM5RP3fPWdnPxuNWLS4aksttW+veu6rhOnYFHIZjpYVRV+P3d81u53lkvqnswuCeSiubtC
	bRLO/0rjQu08s48Q+KH/NPlnIj7QUx3EVBz82pF9omznmU2BcPY7/zP8wp0RuJccoYpeO+oTY/5
	kHZL1xK1klIEfenE6IfWfJ8sdrvWT9fz3u1kaFy6Dhozr/SHIoIzJNrAA4LnHETkNTHICUbgibv
	uPXeD2wniGtZbCOhuEY3DboHkCFd3owasx1yAXsnBu8HFm6xhpkCeHodG/WlUMj3yFcEZwrW4Sw
	dhOx9bJcxNu/fMSd+ZDb8U+6g1MT+4H8vqArpZPFVloCETVor0QW13w12dWVEtEMYaztMejVrCE
	r3PAR58WETrTTWsN16tagzLvCbPjiKVnRsJg==
X-Received: by 2002:a05:600c:848c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fe60e51c6mr296433775e9.7.1779190920505;
        Tue, 19 May 2026 04:42:00 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf8305dsm152745015e9.9.2026.05.19.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:42:00 -0700 (PDT)
Message-ID: <1485d619-35da-48e1-a108-60de1bd8b19b@linaro.org>
Date: Tue, 19 May 2026 12:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: tcpm: qcom: use connector to specify VBUS
 regulator.
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108488-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 7087E57DEA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:48, Dmitry Baryshkov wrote:
> The Qualcomm PMIC Type-C devices historically provided their own way of
> specifying the VBUS regulator, via the device's vdd-vbus-supply node.
> This is not ideal as the VBUS is supplied to the connector and not to
> the Type-C block in the PMIC. In theory hardware can use different
> regulators for VBUS, so specifying it in the PMIC DTSI is not correct.
> Deprecate this property in favour of the standard way of specifying it
> (via the connector's vbus-supply property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (6):
>        dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS
>        usb: typec: tcpm: qcom: prefer VBUS supply from the connector node
>        arm64: dts: qcom: pm4125: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pm8150b: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pmi632: move vdd-vbus-supply to connector nodes
> 
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml |  4 ++--
>   arch/arm64/boot/dts/qcom/pm4125.dtsi                       |  1 -
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi                      |  1 -
>   arch/arm64/boot/dts/qcom/pm8150b.dtsi                      |  1 -
>   arch/arm64/boot/dts/qcom/pmi632.dtsi                       |  1 -
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts          |  2 ++
>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  2 ++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts          |  2 ++
>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts                    |  2 ++
>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  2 ++
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c         | 12 +++++++++++-
>   14 files changed, 29 insertions(+), 7 deletions(-)
> ---
> base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
> change-id: 20260519-fix-tcpm-vbus-aabde21f339d
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 

It should be possible to use vbus from any source - and that vbus is 
indeed port not controller specific.

For the series

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

