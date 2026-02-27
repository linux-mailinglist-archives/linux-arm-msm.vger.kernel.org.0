Return-Path: <linux-arm-msm+bounces-94361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bwJnDHX5oGlXogQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 02:55:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA821B1A6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 02:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E968F303744E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4196626E6F9;
	Fri, 27 Feb 2026 01:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5cTQki+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D31D8E01;
	Fri, 27 Feb 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157298; cv=none; b=EqnHLg5wlXd6IRcbxg3ifojNA7G9jjdaz4B72ptdYAqIr5eAwSLI+eRO5ceEewHzXsAC3xvXrBWSEljsIFWbPCfjcaAF7zZaNFneEOf2JTlOxE6b1j0f8zXynRlEM7BGqmdXhaxtYWZLHnDcSM/vUFTiiTVjA9HZzVXQpkTqHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157298; c=relaxed/simple;
	bh=f9sfjqMofAlwbcUX4rR2RxDkSdmosaiAPVZln1mCbN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOk+wElbMGiF6MPtsCwtwDhOaLEYUQce6Ac80CdGxTkPU1/BB1lBtQr6lHb2NgpUNN1X5M+oiLvSwAVAH53iZArMjtqN5RogzW30ftg6mC+JAgjXIB8q0hp2bBW1MJdZqrugz2KLCBInPu1ftUA4ekcxZjbJM2PmaD5OWXugMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5cTQki+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA2BC116C6;
	Fri, 27 Feb 2026 01:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772157297;
	bh=f9sfjqMofAlwbcUX4rR2RxDkSdmosaiAPVZln1mCbN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U5cTQki+3UCI8UNOxlpwH/n3sl/pa5prG/IsPn6WXsHuIB+pwGZeYoq4g8AdekQFB
	 gbyH0UfbSXwb8s00RyNgIC4QU9yMvtzehZ9r1+qKKDT38hzCsqGjAWm1pU2y507e25
	 TzicJeZ8cOWrNbeYWO0PzYx1xd1NYug8LOaSQlyXjBGmvutJzQbx5WfKZ6i8Nk9/1E
	 3oKQi0c7ebXYqg10qozCPBLox5P3mVOFelRvOCBvFZgDIP9oo1va5Vw8EEQ6XujJ/F
	 L8I4+l3/YyCumIVReLde6VfgsK4+OjaVM0s9g/+RVQYsay1exdFWtFrxh+JxVa+e/c
	 ADL+FGJO3HH8w==
From: Jakub Kicinski <kuba@kernel.org>
To: konradybcio@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	elder@riscstar.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	konrad.dybcio@oss.qualcomm.com,
	krzk@kernel.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	edumazet@google.com,
	elder@kernel.org,
	andersson@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	davem@davemloft.net,
	marijn.suijten@somainline.org,
	horms@kernel.org
Subject: Re: [net-next,v5,3/3] net: ipa: Grab IMEM slice base/size from DTS
Date: Thu, 26 Feb 2026 17:54:49 -0800
Message-ID: <20260227015449.2484275-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224-topic-ipa_imem-v5-3-015bf09e123e@oss.qualcomm.com>
References: <20260224-topic-ipa_imem-v5-3-015bf09e123e@oss.qualcomm.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-94361-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FA821B1A6C
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: ipa: Grab IMEM slice base/size from DTS

This commit changes IPA driver initialization to retrieve IMEM slice
base and size from the device tree instead of hardcoded platform data,
with fallback to the old method for backwards compatibility.

> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 2fd03f0799b2..f3bdc64cef05 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -185,8 +185,13 @@ struct ipa_resource_data {
>  struct ipa_mem_data {
>  	u32 local_count;
>  	const struct ipa_mem *local;
> -	u32 imem_addr;
> -	u32 imem_size;
> +
> +	/* These values are now passed via DT, but to support
> +	 * older systems we must allow this to be specified here.
> +	 */
> +	u32 imem_addr; /* DEPRECATED */
> +	u32 imem_size; /* DEPRECATED */
> +
>  	u32 smem_size;
>  };
>
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 835a3c9c1fd4..5d3f68bd02d9 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -7,6 +7,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/iommu.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
>

[ ... ]

> @@ -656,7 +659,24 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>  	ipa->mem_addr = res->start;
>  	ipa->mem_size = resource_size(res);
>
> -	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
> +	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (ipa_slice_np) {
> +		ret = of_address_to_resource(ipa_slice_np, 0, res);
> +		of_node_put(ipa_slice_np);
> +		if (ret)
> +			goto err_unmap;
> +
> +		imem_base = res->start;
> +		imem_size = resource_size(res);
                     ^^^^

Does this code corrupt the platform device's resource array? The variable
'res' was obtained from platform_get_resource_byname() earlier in this
function, which returns a pointer directly into pdev->resource[]:

drivers/base/platform.c:platform_get_resource_byname()
    return platform_get_resource(dev, type, num);
        => return &dev->resource[i];

Passing this pointer to of_address_to_resource() causes
__of_address_to_resource() to memset the entire structure to zero and then
overwrite all fields:

drivers/of/address.c:__of_address_to_resource()
    memset(r, 0, sizeof(struct resource));
    ...
    r->flags = ...
    r->name = ...
    r->start = ...
    r->end = ...

This permanently corrupts the platform device's "ipa-shared" resource entry.
While ipa->mem_addr and ipa->mem_size were saved before the corruption, the
platform device's resource array is shared kernel infrastructure.

After this corruption:
- /proc/iomem and sysfs will report incorrect resource information
- If the driver is unbound and rebound, platform_get_resource_byname(pdev,
  IORESOURCE_MEM, "ipa-shared") will fail because the resource's name field
  was overwritten with the sram DT node's full_name, causing probe to fail
  with -ENODEV

Would it be better to use a separate local variable for the
of_address_to_resource() call?

struct resource sram_res;
...
ret = of_address_to_resource(ipa_slice_np, 0, &sram_res);
...
imem_base = sram_res.start;
imem_size = resource_size(&sram_res);

> +	} else {
> +		/* Backwards compatibility for DTs lacking
> +		 * an explicit reference
> +		 */
> +		imem_base = mem_data->imem_addr;
> +		imem_size = mem_data->imem_size;
> +	}
> +
> +	ret = ipa_imem_init(ipa, imem_base, imem_size);
>  	if (ret)
>  		goto err_unmap;
-- 
pw-bot: cr

