Return-Path: <linux-arm-msm+bounces-7456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906928304BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 12:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A022F1C23FC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 11:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301CB1DFC9;
	Wed, 17 Jan 2024 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZ8ySSrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C181DDF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705492190; cv=none; b=vDsHJEbXvaahD1KLQXt7wZ6C0xODhKBLJAvdLDtu8WKGFMiL+Z6Q+BtIlOBIusVqWH2vJHUlHOAEzM8tFhzucLB9nQOC1wX8upTJFRwH1KzVbmTYlEaBvsA8KUN82Hbo6Z5oqp6OPonehwVl+FihS780bGLnha6rU8oLNOt2aY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705492190; c=relaxed/simple;
	bh=kY5z25saFdI9aw7FeyrSL42gfsRrieLO5WzEyKAr6WE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=BSy8liT4KetmJApNMggEr4F8/+VnKlO9oqbD6SirSBZ7/V89mD5zLMnfERKrTlEfIappMePUYP4TNhPGiM+SunGIsBPuLe6s5InYOUVvXPecfdaYIBBvGnwP1CARhRzS3vgK76d8meiTG3GGfqsMsZYBNuGmN/AkLEydyiQnQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZ8ySSrW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eaabc36bcso13561416e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 03:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705492186; x=1706096986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxPSXuNJ8AUL8NOznZbrLecSi/2kLhBhAre/dygA9TY=;
        b=PZ8ySSrWwGapa/1KMJlQT7mPhCQVdA1y/JSiwQiAdRM+qZ6dUoKYWUygKbyNzzjGk6
         0qpVNL6ITvm3MzFEOB8df27RYtH4a6Jce4jMdqnXUQyHwt+625/vp4YMdr3JwgaPXybq
         xPIe0A4CUMzouJvQKBqSy4D2GbSvV+6ifdZvesuRaxyyN60BKy3jyJHPcLJlzT7Nv+My
         52CBt+GxfwIffBC1aQQuey3f8dLSIxrcpBwrSqk6dAcXOnZy1LVXCZ4ztAM0XUm0pNki
         zCdXOitFYLvnJDsxf3Njh6OXMfStdh7aASe4AY7aPRFoG33monsH4hfs391bjTKAEQE2
         plMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705492186; x=1706096986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxPSXuNJ8AUL8NOznZbrLecSi/2kLhBhAre/dygA9TY=;
        b=cTFvgFAmZrkSOkkxwUcglniPy0zB7NBl1qNyWk1W8TdXBAUsA8NBnbPMUEYDDsaUCX
         C80LNlnq9Oc3KKgE0+un1pyeBGugxiVlUyiJzLQCvDsdBi9Cq7HxdjpBOKRtr+bbkAJB
         4FFUQRN17IVYv6KW0JkCm8xqJKSCTG6Jk+gIJQLx9ST8jnyXfG5Xl0NEotRJgYILfu/F
         AmVLxy8cdDWQIJ271nrHA/uf6Z+Y3DMVELj0gZbc63DaKSzowSjamAdOXHXI3jQB4HuX
         MLWoZKJ5WcUH4deB8s+4DmaqUh7JQv5n0itxoLim1FeQeqQMWY+ulkvd7zSWWQhETzqe
         ysbg==
X-Gm-Message-State: AOJu0YzaIJ0LpHIL+xs16wa7MD19izeLIrgphhUG6D3LBNbYLsK1Hy4u
	FqyY7rWQa2rdGdgyo3+qVGYVYIwl0XWkYg==
X-Google-Smtp-Source: AGHT+IHy6JI/EVohyYH/EoKmNFo6jqE894SOm3wbOmN+sb1Pd71wkWp/cNEanbOIXigvY3x3FzvuNw==
X-Received: by 2002:a05:6512:3907:b0:50e:e888:2c3d with SMTP id a7-20020a056512390700b0050ee8882c3dmr3821308lfu.25.1705492186453;
        Wed, 17 Jan 2024 03:49:46 -0800 (PST)
Received: from [172.30.204.250] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e8-20020a196748000000b0050ee78fd23esm228767lfj.262.2024.01.17.03.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 03:49:46 -0800 (PST)
Message-ID: <9b177f7b-8dbf-4193-9a70-94f7b80f0a87@linaro.org>
Date: Wed, 17 Jan 2024 12:49:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Enhance check for VREG in-flight
 request
To: Maulik Shah <quic_mkshah@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_eberman@quicinc.com, quic_collinsd@quicinc.com, quic_lsrao@quicinc.com
References: <20240117-rpmh-rsc-fixes-v1-1-71ee4f8f72a4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117-rpmh-rsc-fixes-v1-1-71ee4f8f72a4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 09:54, Maulik Shah wrote:
> Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte aligned
> addresses associated with it. These control voltage, enable state, mode,
> and in legacy targets, voltage headroom. The current in-flight request
> checking logic looks for exact address matches. Requests for different
> addresses of the same RPMh resource as thus not detected as in-flight.
> 
> Enhance the in-flight request check for VREG requests by ignoring the
> address offset. This ensures that only one request is allowed to be
> in-flight for a given VREG resource. This is needed to avoid scenarios
> where request commands are carried out by RPMh hardware out-of-order
> leading to LDO regulator over-current protection triggering.
> 
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   drivers/soc/qcom/rpmh-rsc.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index a021dc71807b..5371d7e3090a 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
> @@ -91,6 +92,15 @@ enum {
>   #define CMD_STATUS_ISSUED		BIT(8)
>   #define CMD_STATUS_COMPL		BIT(16)
>   
> +#define ACCL_TYPE(addr)			((addr >> 16) & 0xF)
> +#define VREG_ADDR(addr)			(addr & ~0xF)

It would be nice to add some #define FNAME GENMASK(x, y) accessed
with FIELD_GET(FNAME, foobar), so that the code is a bit more
self-explanatory

Konrad

