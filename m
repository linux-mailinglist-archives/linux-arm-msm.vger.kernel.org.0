Return-Path: <linux-arm-msm+bounces-59248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC07AC2931
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D38FA4078E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C30029AB12;
	Fri, 23 May 2025 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="WKkIG6Ba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188929AAE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023178; cv=none; b=lSU82/WkHDMGRrVp7K3N2gKhMMq7ZC4HOq6vhyO/xKZo0OzC+zv6SXaFilmqn0nZ/vI6BMvlVoNaD07kdGcVf7DbKaDJQoerB1D9/4xEdzQfS5bytMkWkxk9l9otcQboZpDLkqdmF4pzyp/MtAPusKldp4UCFWn9OXA/Gy0Rh7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023178; c=relaxed/simple;
	bh=/yzNpMpyyZhhfCj85FSoI7CiSf/qoFm/Fy9Y9bnPFbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pePPP06p/emGquVUL+HUY7UiDFQQqCB/eSkbv4urRqt/qAn7Nb6as/Ok5LSRpf1jE0pR6Rq4s2vw/QVlzdjOwEEHVC6+dEazstfjmwMQj2/WY+6iAZEy3e4W44/8UFCIPkiuw0ZwH114sD8O0vbm9iSVfQ1sFm2Lhxenj1k6aag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=WKkIG6Ba; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3dc978d5265so853675ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1748023175; x=1748627975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhBDaNTzWlvTPxEir4mZRJwdB13jn1nJVWTFTNCoz3o=;
        b=WKkIG6Ba5lbNM89igSb0YUj758CbWuWcOSSaUd7sMCiV5tIg3DtON5Zs2sstc68XZt
         LA+HpOVGPBe+lFTJF7LBlRLq0e71UgBoGhFVr9mLNNAjQiSKcx1g2+ha5hjCgduhtl6j
         J5wWNZskpLP+1JnpPXOnH8op8o0yKPjCQ2z14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023175; x=1748627975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhBDaNTzWlvTPxEir4mZRJwdB13jn1nJVWTFTNCoz3o=;
        b=rqUuIU76PpEn6baRHOtE2aRFS4XFJZcdZMf/dfXAcPku++vq1Gc/OYQA4N2hJeSnkR
         oZj8QL+isTiiYDlzvRQtCw5rWncUCnrttY5XUEh06P5P586Ic0qg47d8HHsVR8EcdL4Q
         143fEOlblrpTOBQjDShrhUeXaP1zRw/156+yvzermCKYcI2cgOL+zZDd6Z3LQVEVHNY1
         N6EDIueTGbrERtpg1hIy1XcsV4yvlxRefTAktDLHk1QjQ5WOWofhok4LPEI/3n9ZmZi4
         G4UX048bHDNTxTEpXmEIlrHdeKJji/0vdU0euAT6jBa2P84ZThmzhn7HqOWVCsJPsvCa
         Q0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW6GaonOFOnwZ/NjdTQZK/SbE3qWk2OeaMaoGdT8vTbpojGa4Sj0qOZdnFpC/t3oz/ywifPf6cg3R9oIoIO@vger.kernel.org
X-Gm-Message-State: AOJu0YxvwCrhGbVd9+z+ZxuVB0SeHiCL1mAxsVj2kZ3+TOAxHHfNpE6t
	QUh+tFigqHkYrNtIdNj8fi8+K24qYNx5Hbj4W8RXHPPyT3Eo1H28CNIW0W33VoDi9w==
X-Gm-Gg: ASbGnctMbozv2tvVvYV6GCE1960nCHeNnQRv9rr2mpN2xmAYEpOvE2cS4dEZR7jSzHj
	u1dAAMAjFUwq++83fRpuV5HWWadUReGlxONV2XmOqBCPsV+e8HCTgn71bA1XQ4UCmcJFYsTihR2
	t2p7GgeqgKho3v2fxBRYPbvYFlwCR+h6OM0RTw2vwebdWMR/tX0CiF1XiYuOfoxCzjFXMj4fRBx
	k4BPRwu/CxRZ+P8tMuKw5Vla1hD6tzvgB4Ct41j7R/oZQZJmci2AZqyH1flZc0iWqufDP0kZ4Aj
	V8yai6pAvJfKnvhYZIENQd4AQS/Y2VnwA8Whw04ze7JkFZ5z7f+2eQsJCQhGV/XU+EwPzqL8Bxi
	7SMh0cOGS3Q==
X-Google-Smtp-Source: AGHT+IGPHZwu1y3fmBV6/SA9MrxkyTECcIAP4UrpCzWAITxakM2wVnv4idA9gL9CdXIurUt/Yc25DQ==
X-Received: by 2002:a05:6e02:3e91:b0:3dc:86aa:7ab1 with SMTP id e9e14a558f8ab-3dc9b70989amr798245ab.22.1748023175350;
        Fri, 23 May 2025 10:59:35 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3dc7f126188sm18218695ab.65.2025.05.23.10.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:59:34 -0700 (PDT)
Message-ID: <f6174a63-eee9-4138-8923-9f3d587ef548@ieee.org>
Date: Fri, 23 May 2025 12:59:33 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 6:08 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

You need to fix something here, but it otherwise look good.

Please fix, and assuming you do:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_data.h |  3 +++
>   drivers/net/ipa/ipa_mem.c  | 18 ++++++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 2fd03f0799b207833f9f2b421ce043534720d718..a384df91b5ee3ed2db9c7812ad43d03424b82a6f 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -185,8 +185,11 @@ struct ipa_resource_data {
>   struct ipa_mem_data {
>   	u32 local_count;
>   	const struct ipa_mem *local;
> +
> +	/* DEPRECATED (now passed via DT) fallback data, varies per chip and not per IPA version */
>   	u32 imem_addr;
>   	u32 imem_size;
> +
>   	u32 smem_size;
>   };
>   
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 835a3c9c1fd47167da3396424a1653ebcae81d40..020508ab47d92b5cca9d5b467e3fef46936b4a82 100644
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
> @@ -656,6 +659,21 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>   	ipa->mem_addr = res->start;
>   	ipa->mem_size = resource_size(res);
>   
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
> +		/* Backwards compatibility for DTs lacking an explicit reference */
> +		imem_base = mem_data->imem_addr;
> +		imem_size = mem_data->imem_size;
> +	}
> +
>   	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);

You want to pass imem_base and imem_size here?

					-Alex

>   	if (ret)
>   		goto err_unmap;
> 


