Return-Path: <linux-arm-msm+bounces-112885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZT6qGEq9K2pZEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:03:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E66779A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=q9HtuOYg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F90430072AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAA736405A;
	Fri, 12 Jun 2026 08:01:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D035674D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251290; cv=none; b=Ylz+Bpf5IqQNBoY1d6eAXMe9pJC2G8xTQHm4oCAdrvZAUePlhTBHvcgx3an8L1BsO013Qn69snCzoJBvrivruudBU2gp944BJqxxwVMA/ZeuyAwbLk9U6nG9RjNyWoTkpPnDqGoKLSrGFCZIwBeOCxg7f3BfUjmCKhsSt3vJNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251290; c=relaxed/simple;
	bh=SQEbNHWiJIM6sDDgeR5ssNziH59tYfVqTFW3jiKDt3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMz/Pk/TJDz5sNwDzK4CEQ88X4c409RVNkF7zzqwHBzZe6Pb1x6wIXkfSEbzj0KlJ4HrYIEmtQVxaeh8QbcblPxGSWtNw84HBWf6iydAWulgWJXll2DisQHsG1xNsXLihotCIF3YjX2Uy9Zne/l4wfY62jhYq21BguLYigPWuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9HtuOYg; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa60c7be57so61194e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251287; x=1781856087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=q9HtuOYgQM43t4zBZXlB21FVE25oyLcRD1F4uQwL3u0to14xdP6RFZoN/bKLCZznhr
         lnHFlfG83UPLK3E1KlWYK4jUvyyxT0+NqYE9tKjREXcVB2zsFa0BXSdlv0oSRjACUk6g
         qxHQigTrx8B3fMMyNlZC6uIeV1wONBNeR3q9loMdWYgjFQeGtWrw25eniWJfDvAKHh3i
         IRPRUcG9NWzm/as51YN4xcLjW9PA/c9SzHyLmQG/NrJU6cLUHGelyGIeimf8rqo2mNL+
         eN4Pe9vz22XVt0dcNkAK1flXyb6NwqzCbTQWUotjEVj3CTTj5vfKqjA9rmJ+QrPt1LKV
         Cc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251287; x=1781856087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=SAVHv6Nnldyp8f4NFeTF1RPvAC8tzwwaLSEGTONoXK27ASmAPcplT1Pu83jGfTU5j5
         Iol7Ft4EW4iZFQtnz3qjs+fhvPjg04Kl9Gm4WujegRh8m0Q6n5yZJwJcmgC7u0AiQqND
         AhJUB7B4STHGjnK9FqrWO1M8yR2xdU2V0nleZapPSHgZSFv3fcDqEE+BNZ9So4NcSjMD
         imvKSbVNRcq4o6vn/Ey35TBiPRI4TbqMcwbSFGghQ4XLX+13tSVwuqYZGUMLYdNgSkIj
         kro3+/yr2VCD4du4hsOC+jQL4EVdDxnMGCgbG6HnWAvQgvQYXEue4J0RBmKm4iGoBPTn
         Ywew==
X-Gm-Message-State: AOJu0YyM/yIp+vlxqY2O8RrRQWOkmw2klWMaxuTkPRnb62dR/rerg6oc
	T4MiSG2ekN4I0+FowtDDQPV4oqkx3N3J+1GenexUW3GsYwUKeXCIKm+6puAMYqTKrjQ=
X-Gm-Gg: Acq92OFLkypRVOGuywbMBf+AD7WBfGIt3eFVY433brv1Ff8DuxZRcYwR0XzQsj5ycmY
	N1HP39vso2MQALSOaA4JWgsxUccerG+GyFBE44xgJyNeHe8UJU0ffODvudcpB+AKrxytggWFVGZ
	mHm/N7O9+UurwEiiXOHfYmJRgvkZ7rxrgzPEbs7XASFw10VC8UOOol1pZBje3J87bpRgi8xThoM
	JJbpxK9fGv7tygyYxaDJtpBGPhGKjTiBe8HfiwsMD3u7mRFRmoN2TdtxZnypBXOeytT3Am/uSgA
	5QGC+gyc6gzGS9bhnGzUXCW5cQWi+b8b9fypojWLKkb48YCvMwha/CicO7aBSMsX6K0ZEqo8NOm
	P9AFEuemac3OTbgAUDkvJhHs7E4tG5Pbi1JyGaNm+iWDCtxKXS8qotSrDRtduo9DgpXC2/KKftl
	vfH9F6YRaMWu9uSVuHoFf57nMSlHd3cSjDIcyI+Hcy67Deb0JTouOV3c+KBqdPsUQswiIdta+oZ
	Ovnig==
X-Received: by 2002:ac2:4c55:0:b0:5aa:61ed:482c with SMTP id 2adb3069b0e04-5ad2db73743mr194365e87.6.1781251286462;
        Fri, 12 Jun 2026 01:01:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b7a3fsm319389e87.82.2026.06.12.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:01:25 -0700 (PDT)
Message-ID: <d4d75a39-3575-4bc7-9fa3-a6521619daca@linaro.org>
Date: Fri, 12 Jun 2026 11:01:24 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112885-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out,linaro.org:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[linaro.org:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D1E66779A1

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index b93ce4a92a998ea5d9d4268d2fd46030fafc4084..fed71131491ebf6e261bfcd14b5d4a2624837878 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
>   			gpio-ranges = <&tlmm 0 0 165>;
>   			wakeup-parent = <&mpm>;
>   
> +			cci_i2c0_default: cci-i2c0-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c0_sleep: cci-i2c0-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci_i2c1_default: cci-i2c1-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c1_sleep: cci-i2c1-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> @@ -701,6 +733,44 @@ port@1 {
>   					reg = <1>;
>   				};
>   			};
> +
> +		};
> +
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x05c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "ahb",
> +				      "cci";
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
> +			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>   		};
>   
>   		qupv3_0: geniqup@4ac0000 {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

