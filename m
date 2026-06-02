Return-Path: <linux-arm-msm+bounces-110859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AcMjOLpVH2rQkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:14:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C187D6325DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:14:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=PdP6lT5g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110859-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110859-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F6AA3018325
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249B93AE185;
	Tue,  2 Jun 2026 22:14:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B684F4F1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:14:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438451; cv=none; b=qXMnJbmJdSx07BcD0GsMEKLqvqFjjiuB60C7I/LVM/hc1yybqbKf417OI7QAr8X6qd4A/F7bh7ZlcGYwqzZlru/P1OKWCmAVzEbvHBUym5shatDEqoNpQlOkXS3NwGFqjO2AWgLXscM7asAtCeYyuTCCemmZlYM6wJxSPZ+LJbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438451; c=relaxed/simple;
	bh=AKxmpzI5wH9I9UZcIsNESrl/eKnb5r5nsYZfUB/Ku6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggrFc0sp7yu3ll4vDR+MtgIaSET9q6msGO5wBoirBPaWbaKFTIcshLGpzwEo1mPSC7BHsAID34eN86jhs/FF25fdAq9p2EizYeEM6aCvBO6w6w7Hy2AKUys2AueAivLPsfWywPU1Hdfm8Lk6l+TVw9Q9/5+XY6VvBFSdebzizjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PdP6lT5g; arc=none smtp.client-ip=209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso4973931fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438446; x=1781043246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM8Sf7FodSx2cPHTZjl3hS8JtasGDXRm7zk3IkDqzNA=;
        b=PdP6lT5gQRaCxa8nFq6MNGbnkLgTWEUVs1r00UVs+3GZEKfMJApnm70w8+zS/jLL46
         JMcyRilNzznP1585zFu2ceGcuDp8e9tuMtlKSyzjNSGxxI1otZe3WnNTmL43lC14ZcSz
         2PQprabiM/VbE0QZt7FBqrRIOkEu8fzG4sQvvayFMousju1f5ykL1uGU2cqTipGMMQTK
         wUakWCJN0ruBvoGA5TyankIFph4xI+jfy6yNh8fsEH7bJ3gAxUXFrJRzzTQkwvgyKyJ+
         oDW+9QF7EpINtE3pBIOyxOm3kdSWqZ1KKbCqyLVlT/FYv42CzzKObtkBwTFngN0su6nl
         DDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438447; x=1781043247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uM8Sf7FodSx2cPHTZjl3hS8JtasGDXRm7zk3IkDqzNA=;
        b=N1Z7i256DaJBzNsu6DwlpLtYvVYu40jNath3Kg+JWjikru2O0UkjgMX5/QsyJ1v++X
         HTLg/OxoPVwniVyLkr0s+FcnpguSxGGKrLxJd+mf1N0fwztobeTm+fGj2i0abV5vjVi/
         tr+LdvHyEGWSXBp5bZ23fYE1V5I14d9lChsQR/aBZ1JnL6yVj2HwVSAtuxExxvPSWRD8
         TgFeoq9DQvpDe2jTrMd9Rxamx2CmQWImkyHUQOo5NoMw8rv4/nW0ZP4mcuBmt3kpos04
         Lccn0iQAxZzclqkCqvK/nedT80Uvr0uXLCA2gEhjEJD/UBaPxgf6521P1HMZCS4rhHY6
         56rw==
X-Gm-Message-State: AOJu0YyUY5l+BdCeL81eLwWssFy+MeO3sfDuT6lyGjCbc0T6/86laByk
	N0nNsVXxK5gzRZ0kMeOSFyFtSMKVelpvHqpeiPhErP7U0fBV62vMMEkg6z69GysJOQdiL6e7snB
	ycHt2mqA=
X-Gm-Gg: Acq92OGGNe1XaZRujKeUhL+RGHGqVxYRoJ7UqX7Cbee2JeZ1+TO0IJzb1upRvvH8sv1
	lQynJp92Svdl50BHPrHDT35C7fQNoI0zHqz47UhTj3C9UEQOUL+CKCkCqyohyGRo2d8R/GVjpCp
	5y+dCm+D74ZWHd2DTgfnZpbpaSLq+2l+LKvd7vZFSdGuDCVByF0hjoZHJX1oinwqgAiA3TMnHHc
	/+Z+SXP92DvswjqOXuhEu2VoNbu1FqxM3CRPoyt/0s/e5S1s76RQ5tQSRC0aUu6iyMc9npCZjoV
	PnE7DyNvVqy9qmfl7LOQPb0aLyFgFN9bawTKdTV0PLkgaNq8U1YjWj56JWUJn79HofbETmSeH3s
	GpVX4QtEZ6ZOh8IMmCwlUVjvU2/4GxvQJaD5Jk3ZNXO0pGRg77TjGUmvDPrsZm/Wgm/zjAjwlDy
	tb4LHt+K3s8TJlQz5doihoI4XXPqfIa0A2nvCfqX266Tr6YJQYd5s3lvZTedtKbPEmJ6RJtSyXv
	N6YDMeg2E8vxSe0
X-Received: by 2002:a05:6512:1316:b0:5aa:68ca:7aff with SMTP id 2adb3069b0e04-5aa7bf55528mr141785e87.6.1780438446511;
        Tue, 02 Jun 2026 15:14:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985a4esm209129e87.56.2026.06.02.15.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:14:05 -0700 (PDT)
Message-ID: <92ac522e-e8b3-4257-bd4a-24b9cea8b6da@linaro.org>
Date: Wed, 3 Jun 2026 01:14:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] media: qcom: camss: Add Kaanapali compatible
 camss driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
 <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110859-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hangxiang.ma@oss.qualcomm.com,m:bod@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:todortoo@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C187D6325DC

On 5/8/26 11:05, Hangxiang Ma wrote:
> Add support for Kaanapali in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9335636d7c4d..ffaeeb9d1797 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>   
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct resources_icc icc_res_kaanapali[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5102,6 +5116,13 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources kaanapali_resources = {
> +	.version = CAMSS_KAANAPALI,
> +	.pd_name = "top",
> +	.icc_res = icc_res_kaanapali,
> +	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -5316,6 +5337,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919..2820c687e066 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -93,6 +93,7 @@ enum camss_version {
>   	CAMSS_8550,
>   	CAMSS_8650,
>   	CAMSS_8775P,
> +	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

