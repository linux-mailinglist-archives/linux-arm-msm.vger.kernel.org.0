Return-Path: <linux-arm-msm+bounces-92789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBuGKs8nj2kvKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:31:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3A13666B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 325CA300CC20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1885359F8A;
	Fri, 13 Feb 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aztyqmkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F51350A13
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989511; cv=none; b=f5MRGbQ4OTTToPoaI1JlDLf+QkmMgPw/oZp0cTFE1vYJs36HML5GudMyu5kppRKQ/IRWaylNeYX7XM5SLzEq3thZmMVmaaUJGZ6D6TT9aoxPnipg9KIvm9BEX/sQ2JQoPTJQpw5wExV+/rsBIVlbJ4+2eTfQkz/C87yXWX3/d+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989511; c=relaxed/simple;
	bh=9611KZFZ/L1Ph1AhhjwuaMFyxx/hs7k2tOHyJPaZPuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTsU2sYtfcwjQJZha6nNAtvPUd4jRpbFQHsqrVxCg6wYiPxZYUhV1zoH21moYWqMYRLc+HK6pRFNU9JlqIZecffVvwHfA/sDLWWhwubseINNpulyQUNt1Q9bZF3HCdN4+Idqgv6qVRy1OBBfVwJ/QpkTD2BowK8p01K2OBds+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aztyqmkJ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e5f5b336bso41136e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770989508; x=1771594308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muJHKh3a4POX2qeaRW8JB2A7m86DLBucT7+9bUtzEHc=;
        b=aztyqmkJG6DaVlUHaoAwBO75bQcfAk7DZ/fMF6cxFgiHMIr0TubMHNMx8AvxUE2/16
         JPd4HlMMFcpSxHEG34frqjglS1mG2I/xpj2fwOMMq0kqTrM/HVw0P4Gk0E6RrxorI1MD
         HDdMMRl9wI/kicZTb2KAg4uaDU062Hh+X+DdLJug3PDJOFNJvpMHTAN6unpDaYYyNjbj
         aICEjBhaxZ2B76Swyn9wAm7uX9nJt1Rt+LojMYCrccQk3+cJpBQXHgxoEJEmu9QNYA3v
         sQiSkYdwvzLspdXor7oQx34I4cnZbTYHtjVn9Eb6faHCtlyrRKATf+y/4aYLSn8bI7pP
         gMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770989508; x=1771594308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muJHKh3a4POX2qeaRW8JB2A7m86DLBucT7+9bUtzEHc=;
        b=Fw8HOOY7PY8uON6kdkInCg80BTGpk6/ySoECtYYP2FzUzVfyjS0fr0AfkL6+B3w6yX
         k+xx/GssGQdo/J3FyyWJNdmCz2gVyW/QTxxrSowOhxWbgnRclK4m+V4ypE3NyninFjTw
         WyYTzqtwYQzKS/lMhqt6Z+xT0u3LxFk+fZRDJlP02FmHjETYT8ZWGG6d/tg97GyeBt49
         8IrHCgh04w+CQBIBQBkC3EHolsjJjMt2aItE5ydrVnFJ33r+4H7sQUTRRYncLBRj7gf1
         D2iNB7SOzNsWVoLhaQQo8Lpf+M+Rix0Vxbn8LuzhRsDgkNC9EIaxSNN5Z+vZnit28KeZ
         o2mg==
X-Forwarded-Encrypted: i=1; AJvYcCU/RcG9iMjBMSnPvbKXY33UZ/vzp2pX0+axaAmMPLaJhJhdrk9XG6Wk+nKbbFxP+s6nDfjFHCp06Hmx1mkz@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1KltZBRu+/dxXMGkspewgrYBrRns+eNx8yG5nLoscH3Wo3mV
	AxsCUi/ZUloxcDc6Tyjrz+HuOIEqy2/koyQ+4mWmJaJaQvqP4xdKu3eifyfSP5J/m0U=
X-Gm-Gg: AZuq6aI14fa7XnPd5LoZbLAiFQOlkOgXGNo2m34yJDHGh/N3Vg+mXmpTggjdr59kHmD
	3pKa4jSh9EGkFDIvVOwKKWE2N88WFUG6lNi8IkL5+4urOk2WSJ6HLJBnU6KMgJYgFhtxHkTfrR0
	HL+B00FDFEdmmAaI0X+pS3ipejKmw19tYDiBJ6ZDrDTj8yJLzqTUAAH7AdJSBzhrdx1UmfATcjh
	xz2HvBgGDTtxUqqwQ6oDKyctAVtJQoE9WkhglrGCWlG3wP4XoBXJMWxtBXAdZmNAB+7nlPgOUwT
	ZR4O747KAWOErR6bWSZX9fAjrfUHZcRNHPmCKm8vIIHu+iCenrruojGqQyEjK3x1P295aHibG9V
	J1yJGdEsl5mfLl/xqLI+mGjgeZFN2WepTv9JZIUDepAjADd/yPIjeNAIr1IdZSlX/c4VJx1ZdEw
	zGMn8Ea7F9Z8GMkU0Xym5MysetTBdic1fN1DqoIekSnfV5705yw2xHiw9r/AemIRGe2EhSekLim
	VS6/g==
X-Received: by 2002:a05:6512:4045:10b0:59e:63b8:62a9 with SMTP id 2adb3069b0e04-59ef3a4f1a2mr308614e87.8.1770989508188;
        Fri, 13 Feb 2026 05:31:48 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568d95sm1557193e87.30.2026.02.13.05.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 05:31:47 -0800 (PST)
Message-ID: <7f31e787-a2a0-4518-8cc7-c012e22859c8@linaro.org>
Date: Fri, 13 Feb 2026 15:31:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, loic.poulain@oss.qualcomm.com, rfoss@kernel.org,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org
Cc: quic_svankada@quicinc.com, quic_vikramsa@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
 <20260213132058.521474-5-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260213132058.521474-5-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MSBL_EBL_FAIL(0.00)[konrad.dybcio@oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email,quicinc.com:email]
X-Rspamd-Queue-Id: 4FE3A13666B
X-Rspamd-Action: no action

On 2/13/26 15:20, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco-evk.dts | 63 +++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..bfd727c745c6 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -77,6 +77,48 @@ platform {
>   			};
>   		};
>   	};
> +
> +	vreg_cam0_2p8: vreg-cam0-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam0_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		startup-delay-us = <10000>;
> +
> +		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		startup-delay-us = <10000>;
> +
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam2_2p8: vreg-cam2-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam2_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		startup-delay-us = <10000>;
> +
> +		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
>   &apps_rsc {
> @@ -564,6 +606,27 @@ perst-pins {
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

