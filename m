Return-Path: <linux-arm-msm+bounces-91508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCL0FN66gGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:55:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1CCDB11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E7C8300A582
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A28374758;
	Mon,  2 Feb 2026 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGQuQJWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C6374725
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043982; cv=none; b=JeyIGwrItbntPRAfZARCXvh3F9e4Bu6xkwwTvnUXA0c9vycEGQRsNDKDFfnkZrt2kmH9lXo+J+B+JAJpgJx96Rbs22qLRTm/CAdS5LCz70iLBCRBFYv7sLQpIsUwBxvKzZ3sN5tJk6TgyWcHidTWlp0UMwAF1ffqUVZZ/7SbmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043982; c=relaxed/simple;
	bh=7mmYBSlGn9pr58Ada0yI1WrJmu1rxBzreSlmAkai3QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIFq7M7lZp+8Z+X20YA54TFzCZtJOboh4fXxKfgbfeuMHKlRDg3vFlMJz3qCk3mzpPtOT6RrmiVV5olXO5pyzbrbXSkDcegdQroeKsBr0P4sUKRSW08VLYcGLRYUJMAofQ5Bwq1Pe0W79kcSKzNxj4aZFoEqANMnyIMrMtTUpEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGQuQJWQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b886fc047d5so858879466b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770043978; x=1770648778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FAPn1s81bjTvSS2PqJP+fsJ0s7tNOWXLNO1ZsVsGR0=;
        b=UGQuQJWQlULnXqesHI3jej4arViV8N/KLUoQ98Xg7PHYTykMpJt4ki79D2fH5VAPEe
         I52ESEZs/0LUPi/UEdhslpm4C9WSSjIBSD/y/Rd0ZThHM5NRWybJRLQVxXRdLooXI8zs
         S6BSwWI2Rjc6HuhzD0LdA0PGrnjU9Y52kBkGLC7OhiXr3c3WQQMkC1y4IAYolHQg+iKZ
         0GGlhfxYthEmFnjT5Kjjy2VjDRQzZgoe+h6mNAnce+C/TifvJdvXwRU8Dp//WomyQk4X
         kha5u/N3hBpNin3uzVwWG0PqeGTvaKw0M4jP2n1zkFILVJs5MIkM2OtgXwcGfpt6PlX4
         psWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043978; x=1770648778;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FAPn1s81bjTvSS2PqJP+fsJ0s7tNOWXLNO1ZsVsGR0=;
        b=MvMnkPZVg6xIS1KnstTm5W/LYeP7evkd+PVGC9+2A9Us4eWCM82hAS5PNotv30Fbv9
         MOOJpoF0pV+qNudYUbcyemTGhZftsYKkYDGSknDTQMmPpY9zmPhanazYdEeCbiVeCutv
         LwAC/Uc3SM8rFDx3b+pGav651r91En2kJBXNuFVu/EJG4Ag7znMJVv2Cgae2uTOYehAq
         3F93NO+RVRewEYvxEB6LEt1o1nl38U4/BMBlIVsxlUQVXUv9ZkywL+JuBWTm82nZzVvF
         uKD/ctVCg8vP6RawmTPa9ODEnwibidyI+lrmQc2mmJBx8ZFoxmoPw9nY505p0erjMSWF
         hnMw==
X-Gm-Message-State: AOJu0YzSlKF9kW6VaYGPR0Nqgx1DxRm0p5ne2fBlBHvYRDEm73fykiMP
	PQ/DnSUqrww802J+qfkTIVHBp26KgkXWD2luLdUzO+ZAs8VrYQXsxD84NvZswpsEDcs=
X-Gm-Gg: AZuq6aKffcMZ3rHSWWNP5HuHNwcjpFr/utho0GYeFJj1kjXh7KNvhwJczQbcG8bExvs
	e0T/BqQYvpsSTBeCS3aYeKYbE3QExuo3A8SBohLtYzaap2gJLrHM00mufy2eEEquC+KKti8G971
	5p8hVxwkzgMRrDul/mv8HCOclOF4CKc4dD0x2USffoju5l1Ved8cbqsG6oLxGWXQ2hXK0pp1vp/
	yL2LWGrihNEDJA8LJTyOAWCwsXbHPlWJzn8ZGYmXGw4FwT/ziN/d/eN62Y6NPpXJYzFT/1lzFW0
	/ylvy9JOJRAq+okCt2tRpdeh4BHbWhEiRUw4wdVK2vNuINdZsjC9APlqNFTXwFfTK7alUtYQjNG
	DCmgv3DFplhtPFdSPk5jCAtNBWaWVmhmwfuBU8f7K6bo4RmT5sNwletx0ZuZaZhJ3J1v8QtcJBC
	kQoj1RsWknon6BCWTaSCOgsHpwyKg2YleswdRa5UzZg/UrMA284OeA
X-Received: by 2002:a17:907:e118:b0:b88:5182:b869 with SMTP id a640c23a62f3a-b8dff53e52dmr517742466b.23.1770043977666;
        Mon, 02 Feb 2026 06:52:57 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeff5629sm891897166b.27.2026.02.02.06.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:52:57 -0800 (PST)
Message-ID: <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
Date: Mon, 2 Feb 2026 14:52:54 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] of: factor out of_map_id() code
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91508-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 82C1CCDB11
X-Rspamd-Action: no action

On 26/01/2026 12:25, Vikash Garodia wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

This commit message is confusing and inaccurate.

First up, you're not factoring _out_ of_map_id() - factor out 
of_map_id() means to remove of_map_id() - you are refactoring of_map_id().

Your patch title should be something like "refactor of_map_id() to 
prepare for mapping of multiple IDs to a single device"

> Linux interprets multiple mappings for the same input ID as a set of
> equivalent choices to pick one. There exists usecases where these set
> must be maintained in parallel, ex: on ARM, a dynamically created child
> device(s) is referencing multiple input id's in parent iommu-map.
> 
> Factor out the code where multiple mappings needs to be maintained in
> parallel can be achieved through callback from this factored out code.

Which callback ? There is no ->function(pointer, here...); ?!

Just make some plain and straightforward statements about what you are 
doing and why. There's no need to resort to dissertation-speak.

> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/of/base.c | 47 ++++++++++++++++++++++++++++++++---------------
>   1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0825f3dc93f2472e9947af09acdde72031ab85bc..606bef4f90e7d13bae4f7b0c45acd1755ad89826 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2122,6 +2122,32 @@ static bool of_check_bad_map(const __be32 *map, int len)
>   	return true;
>   }
>   
> +static int of_map_id_fill_output(struct of_map_id_arg *arg,
> +				 struct device_node *phandle_node, u32 id_or_offset,
> +				 const __be32 *out_base, u32 cells,
> +				 bool bypass)
> +{
> +	if (bypass) {
> +		arg->map_args.args[0] = id_or_offset;
> +		return 0;
> +	}
> +
> +	if (arg->map_args.np)
> +		of_node_put(phandle_node);
> +	else
> +		arg->map_args.np = phandle_node;
> +
> +	if (arg->map_args.np != phandle_node)
> +		return -EAGAIN;
> +
> +	for (int i = 0; i < cells; i++)
> +		arg->map_args.args[i] = (id_or_offset + be32_to_cpu(out_base[i]));
> +
> +	arg->map_args.args_count = cells;
> +
> +	return 0;
> +}
> +
>   /**
>    * of_map_id - Translate an ID through a downstream mapping.
>    * @np: root complex device node.
> @@ -2162,8 +2188,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		if (arg->map_args.np)
>   			return -ENODEV;
>   		/* Otherwise, no map implies no translation */
> -		arg->map_args.args[0] = id;
> -		return 0;
> +		goto bypass_translation;
>   	}
>   
>   	if (map_bytes % sizeof(*map))
> @@ -2185,6 +2210,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		struct device_node *phandle_node;
>   		u32 id_base, phandle, id_len, id_off, cells = 0;
>   		const __be32 *out_base;
> +		int ret;
>   
>   		if (map_len - offset < 2)
>   			goto err_map_len;
> @@ -2238,19 +2264,10 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		if (masked_id < id_base || id_off >= id_len)
>   			continue;
>   
> -		if (arg->map_args.np)
> -			of_node_put(phandle_node);
> -		else
> -			arg->map_args.np = phandle_node;
> -
> -		if (arg->map_args.np != phandle_node)
> +		ret = of_map_id_fill_output(arg, phandle_node, id_off, out_base, cells, false);
> +		if (ret == -EAGAIN)
>   			continue;
>   
> -		for (int i = 0; i < cells; i++)
> -			arg->map_args.args[i] = (id_off + be32_to_cpu(out_base[i]));
> -
> -		arg->map_args.args_count = cells;
> -
>   		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>   			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>   			id_len, id, id_off + be32_to_cpup(out_base));
> @@ -2260,9 +2277,9 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>   		id, arg->map_args.np  ? arg->map_args.np : NULL);
>   
> +bypass_translation:
>   	/* Bypasses translation */
> -	arg->map_args.args[0] = id;
> -	return 0;
> +	return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
>   
>   err_map_len:
>   	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> 


