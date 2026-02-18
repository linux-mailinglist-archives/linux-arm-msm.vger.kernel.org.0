Return-Path: <linux-arm-msm+bounces-93257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPrBMNiXlWk1SgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:43:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAB155966
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30F6E301092F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCA02FF64C;
	Wed, 18 Feb 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jl0ssTuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E52F3C26;
	Wed, 18 Feb 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411293; cv=none; b=dSbzF9SuO9Sw1HTPh7cIrKDFG2lVY2iIr6E50+XfbmtsM4cFnQkQeG5y8kUeiRZVFfdBR4FTs44SR3Xr3eCQpgi/5xgDddbc/6JbiE9dlLTUYqA+hviKX4gP6uOBxHnBBB7N9ON1M/5g+6Tg4u/G+zBv5dWopEoyxX0T7d9wZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411293; c=relaxed/simple;
	bh=2IipbrnC8gRJmyofTcNtL2KhCjB5y7fHAJB00hh96q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ed4TY1g50fDfZ4ZbK3MopdBLTfvPkhWaQhP3zurFCA/AohwJpLQk4IC3ZJ0nsB6ESMlcck3M+Dmo2wqixJB1+8SX37LUJDsZTPyuIAIzOeYPNTmp+xHS49S9VgnVzMiZSpdokiZrh7Z83Y8Ju0mOBHnVGU4YNfUJzE/Ssidk5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jl0ssTuM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CA6C19421;
	Wed, 18 Feb 2026 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771411293;
	bh=2IipbrnC8gRJmyofTcNtL2KhCjB5y7fHAJB00hh96q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jl0ssTuMc5uw/xUkfnpmzcshIOzt76e+5Mwm17ghvaE2r6jEg7Df8PV+7G4Vmfxi3
	 VBAzHPb75uoqYBlrM+4IxhRaIrhvPCchkdqQmh3Xy9S/728JjUOlR7eQ+rlG/vd5+2
	 5JUExHKR2LFhbYZuYOObTob91xuUbbpP1RBsWRIpzC/KjSIBdTxqwtA8n5entXjMD+
	 2FvEo7XHaG/MVAv2rxf5N3HVy2V0VkjOLR/BIDpaKsZz77NhvFY4HWEmqtPh5dUVDO
	 h3Q4dVHRYkHPt9Wq2M1DYZ/9jLa3nWWMsYn0CvjtgaMaUSR/ZsHQB9QCm5kNtvOla1
	 uKbUYoPSsoGBg==
From: Simon Horman <horms@kernel.org>
To: konradybcio@kernel.org
Cc: Simon Horman <horms@kernel.org>,
	pabeni@redhat.com,
	marijn.suijten@somainline.org,
	edumazet@google.com,
	elder@riscstar.com,
	andrew+netdev@lunn.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	elder@kernel.org,
	devicetree@vger.kernel.org,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [net-next,v3,3/3] net: ipa: Grab IMEM slice base/size from DTS
Date: Wed, 18 Feb 2026 10:39:19 +0000
Message-ID: <20260218103917.132153-3-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217-topic-ipa_imem-v3-3-d6d8ed1dfb67@oss.qualcomm.com>
References: <20260217-topic-ipa_imem-v3-3-d6d8ed1dfb67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-93257-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:url]
X-Rspamd-Queue-Id: E1BAB155966
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: ipa: Grab IMEM slice base/size from DTS

This commit reads the IMEM slice base address and size from a device
tree "sram" phandle, falling back to the existing struct fields when
the DT property is absent.

> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 835a3c9c1fd4..583aea625709 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c

[ ... ]

> @@ -656,7 +659,23 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>  	ipa->mem_addr = res->start;
>  	ipa->mem_size = resource_size(res);
>
> -	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
> +	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (ipa_slice_np) {
> +		ret = of_address_to_resource(ipa_slice_np, 0, res);

Here, res still points into the platform device's resource array from
the earlier platform_get_resource_byname() call.  Won't
of_address_to_resource() overwrite the platform device's "ipa-shared"
resource entry with the SRAM resource data?

The needed values (mem_addr, mem_size) were already copied out, but
this silently corrupts the platform device's resource table.  Would it
be better to use a local struct resource for this call?

Simon says: I think this is a false positive as I don't see how reusing res
here results in resource table corruption.

> +		of_node_put(ipa_slice_np);
> +		if (ret)
> +			return ret;
                        ^^^^^^^^^^

At this point ipa->mem_virt holds a valid memremap() pointer.  Does
this direct return leak the mapping?  Every other error path after the
memremap() in this function uses goto err_unmap, which calls
memunmap(ipa->mem_virt).  Should this be goto err_unmap instead?

Simon says: This seems to me to be an actual problem.

> +
> +		imem_base = res->start;
> +		imem_size = resource_size(res);

[ ... ]

> +	ret = ipa_imem_init(ipa, imem_base, imem_size);
>  	if (ret)
>  		goto err_unmap;

