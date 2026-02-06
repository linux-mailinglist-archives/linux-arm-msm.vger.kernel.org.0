Return-Path: <linux-arm-msm+bounces-92065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBK/KZUUhmk1JgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:19:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C331002A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A5183055D64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 16:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5A33016FA;
	Fri,  6 Feb 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+/mUjRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4252D322F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394517; cv=none; b=BLYv+raWyMf+4RL54RuSPrCzAW+vOFAeWMDYP0UW8MIVbxI0/GqR3+U2TRYWUg+3MW6doIzrL8VcHvJ+//miEHVX22Vh+LB6gpb30ATq+hUe6oUqVx0IR2SA67p8tdDGtqbZ6S0ahlrCqzI+p6hqlECTxAvYLuP9WJRNiJMuL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394517; c=relaxed/simple;
	bh=PgHh9sO6g1i1ICu0i5WHmFr2GjxMXiWnxdDbOdqYd2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duh+dmABKnWDJHCnJcDpUaz71JMsEvZnkNjC7JWN4T0hqFGI9MXt6ztxcH53dsCRuAsu04dHmKG0/lhd+dzMGUAM2He8Dc9M5SRx7JkvmyWziwK96KYoHab6BPmsm8enu2jn04oG5mNGsbqF9zgvw9lR1GxUXGnnGQ40em5e95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+/mUjRz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59de45b5580so237095e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770394515; x=1770999315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7YltPymBDZDAXQzrrunk/e6Y1HtLsHo+KDRbCcly/E=;
        b=y+/mUjRzihDm2JixE9p6rIb3fSOUWLS8I9ZP1yfw4volOB7qr/iIg9DcfjpoqVrOOY
         l493LZzuOq30hGV4lZOTWgXvcSpaDjJq3yKBxzUwu86qPouYsVX1x+CbLaYeAnJ/fvT1
         n7IbLT7s6zSuRFCcScHtVOsMXsVu83M0H6vgNqmloSVPN1UpptdM+A3mLN1z3pv8LvMT
         7j8rjkw9ECOuHjZaM1FofiNDVgf2iYNs8+pxbs1/9tw3GT6o2b9VKgnKYZChOzbYF97b
         Pgg3glu5WIT8xCepjlfJPom5TXcldwixBbcWs2YWa6axr8H6EYd4nkTilWBSep+ph0NZ
         eDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394515; x=1770999315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7YltPymBDZDAXQzrrunk/e6Y1HtLsHo+KDRbCcly/E=;
        b=YZioez55+SmJmLfOG2zbivnCTc4K22r9Gzexj/DZp1/SSVeyUuyVU5i+mcgEbPYR/K
         QBL5YIKfDXq1h1GgrzmPcN92CoK/gs3gJp/Y0JBozzv6LA/cOAxDzW9buI3mQ8IfUSun
         Zeuzm5xaakjODf9idIcp4YDDpbjHe7Y9pCDlWJSw06QLR94eyq5OmkRhqWI5d11gEmVX
         wGqrPeecvQI9uVeRXFWIYcXK0Pvn+J8x0hxp3M1MLk8tr8QqW47Jlob76M3vG/WyDBFA
         wHkqJB0mhv+/8r6Pgxbt358Pr8efixiafYDDadaZ60dCyf8wl3o7U8OV+tlGod5CEdIt
         WVcw==
X-Forwarded-Encrypted: i=1; AJvYcCWDznarUP2qrotorLJKGSVJgpwMoTRJfFDaZbOk5xnQt+6M9JLagSUJWf6ZmMYteQpMPXmwpuNNOptgwfIz@vger.kernel.org
X-Gm-Message-State: AOJu0Yynry0iEK/MPTkDb3F5vnhTHaBL6nmYzsiDn1ZWRrA4pDgQWVM1
	niu+VxRAen3MR/2sPrcF9vXzXjJqWF98XwU32B9HAgs0/hac0H3wacimZWB/PX/0Wtk=
X-Gm-Gg: AZuq6aJLxX1qWRIKGxlOYyP6A9A0Sco7sF1eKdthOrYzaW3jvLrV0VrLaC0/Hz2QjEq
	t2sTbNtImuVdxb+8zHiu2O8hUJNrK8g+Em3WwWQfH6eq9LYjnjKEOkX/aHcNmI0vkPGN4BBLi5I
	qOMlo9mg5/DSYg1aJV+j2PJqBAqiT0y5FF018eGPjL07pYYXEZuaeb0o+Lk7RObPu/F2Qzh48Rg
	YpXyWUns6gAyE7b76rduH9fim0GWYb2S+gOVmZEAb/k8hOYYBqi11oHq8oHvQzGU6ZiAcYcSOch
	1f+zMt5f7YIgssv/2jHADFMSIO0k1p8o7J8ECFWXZwxziduYyEN9aJ5Pi6T+RcEOGBWps1s8VB+
	urPFpRLvalbEphoFbuz3Dl8LCw8ATUF9LCQ2NYtVNGZi0pvJfipsJ2/6zpSEk6JJNO6y8ainjrB
	gEE4p0TNWPVTWE+d5vehL+8Q5g3W5e1ouXd++XWnG6/udrDAet5wd6q9nTnxbK0UAV/A==
X-Received: by 2002:a05:6512:24d7:10b0:59e:3e87:1a with SMTP id 2adb3069b0e04-59e4518da53mr385299e87.7.1770394515297;
        Fri, 06 Feb 2026 08:15:15 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf713fsm698812e87.1.2026.02.06.08.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:15:14 -0800 (PST)
Message-ID: <9de74828-85bf-408c-8f64-2a8694f71563@linaro.org>
Date: Fri, 6 Feb 2026 18:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, loic.poulain@oss.qualcomm.com, rfoss@kernel.org,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org
Cc: quic_svankada@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
 <20260121183142.1867199-5-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260121183142.1867199-5-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92065-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6C331002A8
X-Rspamd-Action: no action

On 1/21/26 20:31, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco-evk.dts | 51 +++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..65c1b49c6dfb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -77,6 +77,36 @@ platform {
>   			};
>   		};
>   	};
> +
> +	vreg_cam0_2p8: vreg-cam0-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam0_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam2_2p8: vreg-cam2-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam2_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
> +		pinctrl-names = "default";

Since voltage level is known for all three regulators, why not to add

     regulator-min-microvolt = <2800000>;
     regulator-max-microvolt = <2800000>;

properties?

> +	}
>   };
>   
>   &apps_rsc {
> @@ -564,6 +594,27 @@ perst-pins {
>   		};
>   	};
>   
> +	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +		pins = "gpio73";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +		pins = "gpio74";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +		pins = "gpio75";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	qup_i2c15_default: qup-i2c15-state {
>   		pins = "gpio91", "gpio92";
>   		function = "qup1_se7";

-- 
Best wishes,
Vladimir

