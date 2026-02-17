Return-Path: <linux-arm-msm+bounces-93210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKexAT2tlGl7GQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:02:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99A14EDB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 597223016EFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149AE36EA9A;
	Tue, 17 Feb 2026 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="RkthDQWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49E37473B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771351285; cv=none; b=FbzRHVdBscuJw/YnfAmC6rhTG2RyQgXtxgUoMFEnuN87BxdEEw+vXVr5xjVElIl0uVLNcuGxx9DpoUqBQwy7rrct3X9XszARRlLiwMOGQji9AJ3UFUBzyUmxd0MC0e+l1yG8lqvCxX8eMY0nRV0YRowTa3DkZ9tcLTc3TByjFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771351285; c=relaxed/simple;
	bh=AgxCltSAUyLZ7G0AL2eHcAOSn9EOXkwsec6tR9ZUbak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjEKRu5PGtDYPhv26y1ddX+8wXWQuMQiSwNW6JXUwPdy7z8ujA5bLr4/8Dotl9pGR6h2fRfNj232XfCJQTOwS72/CIOgfhGupznPADbeAusaGlVniKMV961Mevb8kZpu+u77p1XRRpzR8UilRUrI7r1H2WJyeN6SMXAaSaRxV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=RkthDQWf; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso4100927a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1771351282; x=1771956082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ass9Ei6G1Od2zlBkoO6VGTXnMmfUoJe2npzv8hOuU5g=;
        b=RkthDQWfii3frYqXz5IkCImXHhmxvirLfkaDY5HnbdvqbW8FoYjxGH9lPRrOMLuVny
         rglgfWdE1QZm7iRJwfYwtNN4XbhYf8TjSmRJBzEPW0jtfv8i8AUE85qntOa6cjupjPZp
         +3GRdRkPbZMJZS9J+/uSNaof2hB11p8OJTjng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771351282; x=1771956082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ass9Ei6G1Od2zlBkoO6VGTXnMmfUoJe2npzv8hOuU5g=;
        b=bJv96NSY5M27/MLL/vyTAzcTLdwhTtAYAruV07cWKq3J/aIGOqGgMvYYrWXmTMk63v
         X2FuLBHkVWNdVo+suIjK5r2bY78pu0bPDomd0VNJsWyAcgrYZQXTnaR5d9uLt5ERzzxC
         9KBI3LfbUrcv7X/mTabu67xv1fpwCQKLyTWC7xWdlnsURjWhFBxPx4d2GZz8WmJvXBS9
         Fkgc6JiGVuXfVYMLRuYd8tq9DIhEQ5OFNyTnvkmcu3uVzTDFRmzHCoQVQW+SlH0qlwtJ
         RhVeiptY1vdlXCwwGNu9vGjfGQR9DmuCR8fZ9ZKvegiMk8TGD/a5E4os2kDgfj5JskGt
         sdcg==
X-Forwarded-Encrypted: i=1; AJvYcCVIs3jMVRQLODvxucSAPVi05VVDxJhmp3v3T9dK27Hfjrqru8TVHa3FuB1I1iOuXInOwWpuwtwNfW5bbAtj@vger.kernel.org
X-Gm-Message-State: AOJu0YxmorFUKdx0DBiZtFj57/ZY0zdjCH0gHHm3OWyxaTiXw9EfoY0D
	oczmjUGqRT3jkZAJVLQaH1wrBozk5MVUM8I1EGVimlvop+EwRK5iFG8A2RqqEYp6LQ==
X-Gm-Gg: AZuq6aJggvD0vEjU3ayJZFn8S48QYD/9maVLa8jYohIfhYSpVMmGojoN+jtiIeQU25t
	gna3VqX6AjcjkhCtn3h/gpcNrGqDr8VOpAVTuNT4jTPEkcQP60JK3AQxiIPysTK1x/qOcEHdPSf
	rLrU3W1YhMz+9Hkmg5Sp99X8dsCRCDsnID2IeViprL7EmQ7ir1ig07o4x4dgCnAWarIMN4Qfi17
	Bg1rLVeBWYZc7+N9sm2EfUQc4J6ifWNTgxZgneZ1Yx1W4UqvBYklvriFRBc/tTAYlqJySOcoshW
	qxC9Hj42FGvwLi2oI5X4p1BwUWnMkj7VaaAIScp8ZAhGcKBtcu1vQBd8+EWIgdH4jxFwnmrd2d7
	IfmOfC2MY/SrDbZA5AOgr2/j0qQpbMxhXe7AtpaCMcJsfz1+1POzapzMMieez/TrTol0cq8ftiT
	DxMCKEffYu2v3bmIEGMfrulMG4NroRgpPyKbMlo7nqcsL+VjcymyU7ZfT18Q==
X-Received: by 2002:a05:6830:211b:b0:7cf:ced8:b5cf with SMTP id 46e09a7af769-7d4c4adf2b1mr7433098a34.26.1771351282029;
        Tue, 17 Feb 2026 10:01:22 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d4a771bcebsm16698857a34.25.2026.02.17.10.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 10:01:21 -0800 (PST)
Message-ID: <11b783ff-56ae-4980-907f-b5e0f11896f4@ieee.org>
Date: Tue, 17 Feb 2026 12:01:19 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: ipa: Grab IMEM slice base/size from
 DTS
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Alex Elder <elder@riscstar.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Simon Horman <horms@kernel.org>
References: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-topic-ipa_imem-v3-3-d6d8ed1dfb67@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260217-topic-ipa_imem-v3-3-d6d8ed1dfb67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93210-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E99A14EDB0
X-Rspamd-Action: no action

On 2/17/26 7:30 AM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I know I already provided Reviewed-by, but I have two
minor comments.  (You can keep my tag even if you don't
incorporate what I suggest below.)

> ---
>   drivers/net/ipa/ipa_data.h |  4 ++++
>   drivers/net/ipa/ipa_mem.c  | 21 ++++++++++++++++++++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 2fd03f0799b2..5fe164981083 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -185,8 +185,12 @@ struct ipa_resource_data {
>   struct ipa_mem_data {
>   	u32 local_count;
>   	const struct ipa_mem *local;
> +
> +	/* DEPRECATED (now passed via DT) fallback data,
> +	 * varies per chip and not per IPA version */
>   	u32 imem_addr;
>   	u32 imem_size;

Both the address and size are deprecated, and although you add
white space, I feel like you could be more explicit about saying
both are deprecated.  For example, maybe more like this?

     /* These values are now passed via DT, but to support
      * older systems we must allow this to be specified here.
      */
     u32 imem_addr;	/* DEPRECATED */
     u32 imem_size;	/* DEPRECATED */

> +
>   	u32 smem_size;
>   };
>   
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 835a3c9c1fd4..583aea625709 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -7,6 +7,7 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/io.h>
>   #include <linux/iommu.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/types.h>
>   
> @@ -617,7 +618,9 @@ static void ipa_smem_exit(struct ipa *ipa)
>   int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>   		 const struct ipa_mem_data *mem_data)
>   {
> +	struct device_node *ipa_slice_np;
>   	struct device *dev = &pdev->dev;
> +	u32 imem_base, imem_size;
>   	struct resource *res;
>   	int ret;
>   
> @@ -656,7 +659,23 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>   	ipa->mem_addr = res->start;
>   	ipa->mem_size = resource_size(res);
>   
> -	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
> +	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (ipa_slice_np) {
> +		ret = of_address_to_resource(ipa_slice_np, 0, res);
> +		of_node_put(ipa_slice_np);
> +		if (ret)
> +			return ret;
> +
> +		imem_base = res->start;
> +		imem_size = resource_size(res);
> +	} else {
> +		/* Backwards compatibility for DTs lacking
> +		 * an explicit reference */

I think netdev style says the end-of-comment should go on
the line below.

					-Alex

> +		imem_base = mem_data->imem_addr;
> +		imem_size = mem_data->imem_size;
> +	}
> +
> +	ret = ipa_imem_init(ipa, imem_base, imem_size);
>   	if (ret)
>   		goto err_unmap;
>   
> 


