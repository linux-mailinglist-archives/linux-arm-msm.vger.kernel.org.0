Return-Path: <linux-arm-msm+bounces-101058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOuBLCzMy2luLwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:29:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE936A43D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F3B930255F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73230199EAD;
	Tue, 31 Mar 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpOsP9m8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2493E3D93
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963754; cv=none; b=IFnIYqjDEzld2itPYL5e/rKyTVPVZNYxL/crVsFjSAR2kAXYS/VSfrKGwhgERoGjSgQTm5MEMN1BpIYLuAl6YKSBX/NdL/CWCekwrqAD/mpyqEw7zBNFLAZHY6s0NMyIKgxPw8JVehrKCqEljE0TzHruzuKQnR6IXjcasGZOrSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963754; c=relaxed/simple;
	bh=sjgHIlOjJIUqOmCKtxBoJhAEO+KEsYQgiP0C/Ip9OJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wmn7u242mbqd6xmpheb94YF11Ny1TdaaNacDkm0vYJiGaKZaefzfChAec25L6Rt3Cj5YF55Dajhp/+QxtGhpWHQUNHJYHo1+blV7mhiX6OoQTjqIU6wRYmNUK1YVqz540haMTFrlbUv0kWgEfELKAdn9W8OFokQTNGP7LY1Kw/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WpOsP9m8; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2bf521011so53332e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963750; x=1775568550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbFdFY1ryYFC+hM/WPwZzfOvMcgDCJMGIGsqBBOf6+I=;
        b=WpOsP9m8wsDKoZi0UvIdqw6AYOYuUQA8SBcB1QugxeJspgjXZUg1iMaV4/GBqDwmNK
         xAMWy/kNfIiSY9d2DakMpdMwsxCtWZx74P+dopMXiZ3v3jbGPvzzGXjZ5aVnWdCN9MU9
         QwDRtTRPbFu3D7yeSqZpHgvXYDr6yfN/JvHpQH8mhMwviEvyW1l64lTrOCcMXjUUG9tw
         /m9y5EfJavMvbfUqONkju9QAcaUMEbVoWp8xWyB2xjwVNOsajX/zCD09k2BAJXcW2ZbB
         n0xXNuk9oaFZeM4AQwUuy6lNHm+iFzlaalrfIoM8FG54ewahC9KjwzXb2F1Kk9J8GyVV
         6qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963750; x=1775568550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbFdFY1ryYFC+hM/WPwZzfOvMcgDCJMGIGsqBBOf6+I=;
        b=Srq2QL8Oy6xtuRpM9PwAttHPm+7uS6eMdeqnLkQVMuLkmLcu10V4kDnqoMZNvkcDPk
         m0tbdrWSsDsdroSK+URg1D2IIu1LYAWd2X61ewi2OsAiH3BEmNmlmJ9ju7Vjd10ehkHG
         lDsubOvC3zug8Iu8I2VknrXbjhxdtccm8HLsSJF/UF91TEBM6NP0Q8z8fHUcspYbr1ML
         fV1S+/vQ6rOogx+2xdoLMRSwcTvdwB1KaOR+tzCkEe64kQ8shqK/JJfWpIK/RIgVFQXb
         xroCzh6oYcURVDxLHhUP8A25p0Vn8IT2j7wCbhApJyC+F87+x9BxhcsDEv1taxrwkDKB
         B92w==
X-Forwarded-Encrypted: i=1; AJvYcCX8yIU3VIUOWFgpSW3sdDhbb0STzBY4xfWf6xhX7TbiovmIwGuv11U49aXwmNufg0E/rOjOhMlJvEdtfnbD@vger.kernel.org
X-Gm-Message-State: AOJu0YzIYFBvVeYk1ufTKO0ZObyAXKCAdBqspfe+LPORI3I4AGIAlaCv
	XAnKndsYEXEZdliJPjpBLrfyb48xDzPTXq5xrX3txwnDqJOqPxaH/rqNU+htbZmCJ2s=
X-Gm-Gg: ATEYQzxoBWmuGWnr4XLfV1Z1ln9Lu58RjnKcuG9a/Z/dJnyfAdOBAMYZXzmgPiujdPn
	IfA1akvhhvQ/H9PlMYWo+WtHBfgfY6S0s2AL6udidEyjCortIWb68K7aYz3+wJwi+CWcJ67fJq4
	5kACQS07eyoUSD7KyWgLmJKCac5k1KWeW4Soj1k/C+fnCOXkCRebK1mUuGB/4P7+e515WIzA8la
	kohkbhPEE2cgr/QUlEcOh19rqZX0vvJMyTQ6Om5yvboSh0iZFSlCgzqShz57Z7CoNHDaSANv06+
	YguumzHdLlpF+tUpb3JWAPiQF6umZpNnoSmQbpeotdQ9AQ44Fd48upli4sTwO3TiAOBXELPm1WD
	1QXRpjX91lkgk1smkdf6uEALLJ6dnuGaz6YQd+Bt8rwB1n5IV4/8ogDa/8LTBRM3hqdW90CaPMT
	yEadUwKjk7ErMbnhCiQC/5m5dG5Qa6FTjcd/ZvIyxh+Rtsrnh+fL+h7KUv19wv1mimTTNFm/qvf
	j9EfQ==
X-Received: by 2002:a05:6512:39d6:b0:5a2:a52a:c69e with SMTP id 2adb3069b0e04-5a2ab913ef4mr2989896e87.4.1774963750387;
        Tue, 31 Mar 2026 06:29:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f040sm2447874e87.75.2026.03.31.06.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:29:09 -0700 (PDT)
Message-ID: <55d61750-07de-458d-8668-09f84a35220e@linaro.org>
Date: Tue, 31 Mar 2026 16:29:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.sr.ht,vger.kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-101058-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,0.0.0.0:email,acb3000:email]
X-Rspamd-Queue-Id: 4CBE936A43D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/26 10:54, Luca Weiss wrote:
> Add a node for the CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
>   1 file changed, 233 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 9f9b9f9af0da..9ff9508c5ce6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -2161,6 +2161,239 @@ cci1_i2c0: i2c-bus@0 {
>   			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
>   		};
>   
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sm6350-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc1000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0ac65000 0x0 0x1000>,
> +			      <0x0 0x0ac66000 0x0 0x1000>,
> +			      <0x0 0x0ac67000 0x0 0x1000>,
> +			      <0x0 0x0ac68000 0x0 0x1000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acbd000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0ac18000 0x0 0x3000>,
> +			      <0x0 0x0ac00000 0x0 0x6000>,
> +			      <0x0 0x0ac10000 0x0 0x8000>,
> +			      <0x0 0x0ac6f000 0x0 0x8000>,
> +			      <0x0 0x0ac42000 0x0 0x4600>,
> +			      <0x0 0x01fc0000 0x0 0x40000>,

I notice that this memory range is very distant, can somebody with
the access to the specs confirm that it is a part of CAMSS IP?

> +			      <0x0 0x0ac48000 0x0 0x1000>,
> +			      <0x0 0x0ac40000 0x0 0x1000>,
> +			      <0x0 0x0ac87000 0x0 0xa000>,
> +			      <0x0 0x0ac52000 0x0 0x4000>,
> +			      <0x0 0x0ac4e000 0x0 0x4000>,
> +			      <0x0 0x0ac6b000 0x0 0xa00>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite",
> +				    "a5_csr",
> +				    "a5_qgic",
> +				    "a5_sierra",
> +				    "bps",
> +				    "camnoc",
> +				    "core_top_csr_tcsr",

Looking at the memory map I have a feeling that this "core_top_csr_tcsr"
is not a natural part of CAMSS IPs, it should be clarified by someone
else.

> +				    "cpas_cdm",
> +				    "cpas_top",
> +				    "ipe",
> +				    "jpeg_dma",
> +				    "jpeg_enc",
> +				    "lrme";
> +

The .dtsi change strictly follows the dt bindings description, won't
repeat previously given concerns here, so

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

