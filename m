Return-Path: <linux-arm-msm+bounces-101531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K04HjtSzmmjmgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:25:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0620388462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93A1A30E5D15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FED3D5226;
	Thu,  2 Apr 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nx+uhBkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1873CF046
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128634; cv=none; b=kQTvaeSFTzWNDrHvGASs61aow8Wze4ta05Yg6MDceYL1Kfn35Jy36X64W7jy9TuEHrC1qVq7mztvfYCrJEv5F9LHMP/F4XmCaCUtD44uZfDltUUPkeB/zSoLr6el9pVQZGHWsNZKVZWXYTaeIdUdx8xbR+sjm3ov7tWk6SRxqOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128634; c=relaxed/simple;
	bh=ZTxCNY3HZlQxWzT/XhybbngDtPXeM9/mHZE+xe6f8uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO22o3f2l25qY2HNZx7e5qwUSUo4O0JpS3zr2m+ukZVuWIh4O0trZ9A2tp2yGcn6QbbLWXguLEsYGNDqlmZxNXsSuWIwrqlg5GC1ccVO5GW3/SBpffmnmaRR78xnbaMpsS9tK61t4J2GaJYfLdeDK/EROR9JITxRRsBebgjqBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nx+uhBkZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38cbfb1322aso447331fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775128626; x=1775733426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CTLIiuy4GwEXuXqqFRnPUythaJJJv+IJU5B35u3XdE=;
        b=Nx+uhBkZdOtyYft2LbXPdI9r1V9PPg3MUbkuVjvMcYgfwgk/m88qHa7tr+LobkYGXW
         br3QTQD/bn/1XxBJDibpS7ToCRAbaqgxmZIiVz/hdp93W1iGMrFc5WPUnAmVkUvPznVp
         ZXqMjTImnRlJh78gm348mvqD2s8IvNMJKWRy4SuCBaJlnhPMR9ZQyTtov+I+uRWPe/AS
         rtCbCIM69oDOK4TZQkZCeF2VPVJA60BZrN+1JR4I0rrBv1uiakQyQO0RQx5plaI6cgZr
         zEbNd0vBf5dq//AeCrt82PWnWXTm4DHWLANE1VUsI+VZ7RED1CKWGWviM/T+1xg0uXEJ
         xtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775128626; x=1775733426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CTLIiuy4GwEXuXqqFRnPUythaJJJv+IJU5B35u3XdE=;
        b=dS525s3VXfpEvN/QZf46LigRp1HyseZ8aYHAuRCMFQQ7yvBElv/+SgBG4NrcziF7Ay
         zZe3IgJQn8Mvs2H9+ffEgTnk6FZcAD3MQ6fXUPj/RHkbcY3ROYUHjMNXpruiS3qEQpOB
         HxvlzUrIYqVK/19YUNwGWwlNtXnD/oZmwwubhLLqBm011EvnrzKxfZX+34xriOcWm/og
         a9cM0zXqWEp/Zd9gxgKFuFaEnBJ7RB8X73rW5XcnvhAqH+5w+uB8T6BgN+jwxnu5s26q
         LM+mn+dq9VzQYZlbn4epsdtqXJAPAwwjneF/vYXbjcu802wE6s9L1EktgnLfZizko5kz
         XMYw==
X-Gm-Message-State: AOJu0YyBW5LR/moko8JEfgt49lr2czdCbp3yw2uQP5lWTggakByaR+dR
	BpWdknPmt3MLbgE3NyGbTr+46TokjC5Duo5B8KcAtIufwcoUJBVp41RwoJBKNTrAUyKo1Ht7tjL
	B93Ma
X-Gm-Gg: ATEYQzzJPtnGDospfmpnKrPa4mgZ4jPSPJPn9HPK4wJU9VXUaYIAnwknlQYtZHedLgZ
	0KK/bjl3TO0TOLdpiMmqIzKimNl/3efpavoIle3ilWAlwrcR0Prvtjk1qndIFAzNkz7av4xsrDh
	4xFbxnuEkYoitu49v9y7ZqSph/Yo3v7djJr4rLQuoFlOGPox3sUXjZaZ5XK5GqXEkOPvkVDXn+W
	qm7XJZrYhTrTAfkIPQWRMD34aD7TdtEiy66gqpjAyEX01DHhHb/EUHCQzcVmATec4cXIuKNdgsK
	cY/j5jItdY7CGSV0Z59n52TdznLQMgTNbBwDp3vNo8CZUa8jHeR0FbB90mR1dn2KjRZs4Y8Mgj7
	97YOFZ07R7AHx9ALKtayoExib41YBM82Jw/Oo8ZEqJbzbKZ9dE/w2uSv4MN+hnPCHQUKzXYPphQ
	dnxMpFNxJLpps0cKoaqq+QizqZy+lBnalTE/r622+hV7v+JQ4/KxiLAh763Ug+RrBr2pEJn4jkM
	2k2wg==
X-Received: by 2002:a05:6512:39d3:b0:5a2:b53b:a457 with SMTP id 2adb3069b0e04-5a2c1f27b2cmr1333288e87.3.1775128626156;
        Thu, 02 Apr 2026 04:17:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc8417sm617709e87.41.2026.04.02.04.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 04:17:05 -0700 (PDT)
Message-ID: <c099bf8f-7a29-4138-85a3-e2669807aca5@linaro.org>
Date: Thu, 2 Apr 2026 14:16:58 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
 <20260402-axolotl-misc-p1-v3-1-8934e9db6831@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260402-axolotl-misc-p1-v3-1-8934e9db6831@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com];
	TAGGED_FROM(0.00)[bounces-101531-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:email,qualcomm.com:email]
X-Rspamd-Queue-Id: E0620388462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 12:54, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 740eb22550724..b05f04a621e5b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,24 @@ &qupv3_id_1 {
>   	status = "okay";
>   };
>   
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;

If card detection is broken and disabled, then likely card detection
GPIO can be omitted, no?

> +	pinctrl-names = "default";
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	bus-width = <4>;
> +	/*
> +	 * Card detection is broken, but because the battery must be removed
> +	 * to insert the card, we use this rather than the broken-cd property
> +	 * which would just waste CPU cycles polling.
> +	 */
> +	non-removable;
> +
> +	status = "okay";
> +};
> +
>   &slpi_pas {
>   	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
>   
> @@ -609,6 +627,32 @@ &slpi_pas {
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <81 4>;
>   
> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			drive-strength = <10>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins = "sdc2_data";
> +			drive-strength = <10>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdc2_card_det_n: sd-card-det-n-state {
> +		pins = "gpio126";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	sde_dsi_active: sde-dsi-active-state {
>   		pins = "gpio6", "gpio11";
>   		function = "gpio";
> 

-- 
Best wishes,
Vladimir

