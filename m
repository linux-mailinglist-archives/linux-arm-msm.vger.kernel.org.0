Return-Path: <linux-arm-msm+bounces-112886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ru/CGNG9K2qcEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:05:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A9677A09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:05:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=l6qvCOyc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112886-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112886-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8FA73047CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0698437DAD6;
	Fri, 12 Jun 2026 08:02:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972835AC24
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:02:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251334; cv=none; b=K0oF0QEBWFZfJZjmQS8TjKLHnumTsdfDgrhzcuWWJTCnn1aD52PO6O7i/6Z/TTgRp39uWL8H5l0m9iDnBUFEHD33P+qVx3N0s0ZoNb8j+znyccUJl0RPQGsHQpDzSvV8A60evpFA/5hcIPgWMKrl11q8FnxzNbjPtPce2GX19R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251334; c=relaxed/simple;
	bh=4cMssSzC9x3YznfsLASdUieBfszbi2Dc1q0Kfv/ciD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dG22ccvuY7xLy5rdJhqLd1y/6H5Z76IV1jcPvTfVtvvTs1hl7bZ7j7zQw1wLSSxhR8yVC6/Ci16KqRVSa/0zRohOhWDQO1gLb9Ch9TnAG/6vy0Un0yrvlousuWdO16eukhTaIIrUzKx4LvefjzrYlMuFnJCOb3Qw9JgojfiCXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6qvCOyc; arc=none smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68cf8643so94139e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251329; x=1781856129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=l6qvCOycLXNfotY4/FVwmVAUOJ4TrnIDsKqm3PcHmIFWpXsyb9VlUMTrOOeCEqLVi8
         +o9tPkdI7rRY3AwCfWqIgPXeUUy43hoCIaQk+yzImdilm2v5s56m5J6Cexo0xZmgUTdF
         tXvi0UpAlMomIxtKds4E5TKqxcr/53T5atx4EDzUHqHYK+IkJNE0MpK96X7JoJ5YG0Vg
         eugc3/b1oGfi6Qr0w5TBSDncUZD6zUu4tBBULE3dz6Fn1Zd7y1HHgVvACmdDqFWkEOKc
         6Wp4nmImnGkUtflfdPZLbFbUvkwDIqEOg11MhhdinIQd4jgtJ6ZiMusx9DJUUaZXdSEy
         bUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251329; x=1781856129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=qKQTUBDAFWz5MyvuqXjT7+icvnfcpTnRimXyuhAbEsmM+R44kpjO2vFRuZXdvJEqb8
         egkE6gcWlqFTnrfhlfF8IKbRKRkFYHDJ137hNphL1XWWI2mN/6WRhrG7t1TkYgE7bhWi
         h8Z6z9urKjcTDCb/ai9BSwZM+7YArbbBSe/OgUd0by4SRfC6fotS2YjpMPlTxrXhwf9g
         sqgA0UpYJZYd2TEXr9FSupWxM+ucnpNP6aDCIkqdEZl4V4uRUPjRoFRn25Q6i22MUJgP
         2jrLqn3GuJqFGWjTrVrt89QbJOlaJWiVmBFnRVO9c/NnDcZnw+/GxFXh4DRLdUKtw5V4
         WeiA==
X-Gm-Message-State: AOJu0YxtqV1ZonQc9Fm3agIa3/DZVQJyMb9HncXyOg6Caxqw+NSqyL2u
	+iSgxoRKZYKk1DSsrKV2idoICoHWJXcDpZokQPgO6jE5NNiU87CFnFnn99EpbVTqg+E=
X-Gm-Gg: Acq92OE6s5tZcvqeyZJr1eiEowmjsDhhC/acuc8YQ5ZieXIqm0O5OlRg4bVimQFRLPT
	aT1zJ8OOzWnGUZaQ5mnnq2S3SabYDhWAerFy3Y9M0/K6UZzXComnweP6xGglSyNejYZcT3vpaVY
	w6X5BjMdmhj4jgk7fW2uaTkxldC8cj2RUT3lEgGE5uQaxq3Tvfcn9WpTHaKZ25EqMIc/wcw7Gi9
	CjEnRLh8dBtCIN4VIp61++FjlL3OBNKHx8CEJajVdfcDYWFutVj6x24aeoockQ7jfuepRodBi9U
	+Hl1PJav7d16z71cWzmX3xrnldRhDmp+OZ16pClwqYXUORsanfI7rFs5buphXNGIyUs514BVFk4
	4BQLUh+rtx4m3YomTUGqHG/DSOlnLZc+huTOfdNUBEuGmHKcGBmllHS4CnZr2NygY/4xE2TVHEz
	34VU4v6qBQE7a40y1X+cqkegrGdX73+8/n2STLAOCKL7/iS2q0OI5/4P7CvE5m1xfjzPWMZP1bE
	GlfOEoiepM/8e5J
X-Received: by 2002:a05:6512:3e0a:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5ad2db2fa46mr249662e87.2.1781251328767;
        Fri, 12 Jun 2026 01:02:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e17014fsm324975e87.28.2026.06.12.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:02:07 -0700 (PDT)
Message-ID: <b3a6798f-a7ea-40c9-a9b6-3aaba57c8ce2@linaro.org>
Date: Fri, 12 Jun 2026 11:02:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
Content-Language: ru-RU
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
 <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112886-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[qualcomm.com:query timed out,linaro.org:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A8A9677A09

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>   				bias-pull-down;
>   			};
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

