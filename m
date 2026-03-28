Return-Path: <linux-arm-msm+bounces-100532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBiuHre8x2k9bgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:34:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AD634E2D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2311C3017027
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 11:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C82130E0C0;
	Sat, 28 Mar 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkRotSTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C7F40DFBC;
	Sat, 28 Mar 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774697651; cv=none; b=leCM4cZtgyMwe/UIO92Gbc1nA7QHoF/MRInQ2FhRxG5uR7fqGGxelj85mS6udP9f6g6l4CxdLc6YuDD9czIKlvR0s9D3MHXKKzNbRZPypEIoHTTT/sjLS7WoDfulYfiN1cbZmNvCxJ/uP7HteayKyL8WESDQti885UwYav/dhRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774697651; c=relaxed/simple;
	bh=4RtiieTGCXul9AmLpWHwSKuiiCPuVcKqkh6ApT6tyLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwzPh0Km5Nr8JP2HDD/XmQu/XP50aV1hayOxoN4pJ1Cp+MG+2v9XpvAQasLmzXi9DY+aQ/ucmUPQ8i7lwJ8K30ZkX1vQ+UwUG630+wJqjZNUPhZvRIXmJuJe4giA2LoqGke41YWzYFrZt63EA3WTvS5/f3mZXkGS3yKqfwLpqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkRotSTq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA2FC4CEF7;
	Sat, 28 Mar 2026 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774697650;
	bh=4RtiieTGCXul9AmLpWHwSKuiiCPuVcKqkh6ApT6tyLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TkRotSTq0UbYReiE4zwnWp8r3oBgfBJhHfAGg/bdy9wMT8W/jxx7n21I9CObYsj/Q
	 s5zyMRI0r0/aisSKk9yXX7T2DhGV+DOQUY1kRGw77tnCz4zCWt8RSQHvhZyd6qyo1a
	 tKqVfAwqf3aRJefI0nf6g3FRv8KyoaN0nILo0rj7sAK0Io4+KahVsJCyoBKFHfKefp
	 hLbGucgOGaNkNp79DNEm8z8M4h6ZR96jlzv+lj4CUJQKTerz1xjFa/EAcH9rHe7592
	 PRzm46/qPLAFfkFfdeMb5R9Q9Sl3JIX0dgX676FLzN+9IALH9SDSeC9F//ijSE6J6d
	 QOqVAq0PMvgbw==
Message-ID: <1c7946f6-4160-4427-9fb6-4d270f7e8fa8@kernel.org>
Date: Sat, 28 Mar 2026 11:34:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gdsc: Fix error path on registration of
 multiple pm subdomains
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100532-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0AD634E2D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 28/03/2026 01:26, Vladimir Zapolskiy wrote:
> Some pm subdomains may be left in added to a parent domain state, if
> gdsc_add_subdomain_list() function fails in the middle and bails from
> a GDSC power domain controller registration out.
> 
> Fixes: b489235b4dc0 ("clk: qcom: Support attaching GDSCs to multiple parents")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7deabf8400cf..95aa07120245 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -518,10 +518,20 @@ static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
>   
>   		ret = pm_genpd_add_subdomain(genpd, subdomain);
>   		if (ret)
> -			return ret;
> +			goto remove_added_subdomains;
>   	}
>   
>   	return 0;
> +
> +remove_added_subdomains:
> +	for (i--; i >= 0; i--) {
> +		struct device *dev = pd_list->pd_devs[i];
> +		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +
> +		pm_genpd_remove_subdomain(genpd, subdomain);
> +	}
> +
> +	return ret;
>   }
>   
>   static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

