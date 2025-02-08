Return-Path: <linux-arm-msm+bounces-47231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038EA2D568
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 11:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F35E3A7AEB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 10:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223D51A8F71;
	Sat,  8 Feb 2025 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndo971Yb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF623C8D0;
	Sat,  8 Feb 2025 10:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739009238; cv=none; b=WE3iWgjSbL9gdx7xzbUC3YeOt8Jysbfex3XLib+g+lTNxXh2fy2OgrHpx1jUkvdKdtmm1G7u/tH3XxJ2RoYKpQfxjnv54dDvLtRHBusUMSOGxs3kzcWoCTdyCXBOctGWv4lCXWfQFELynxx7TXxBtV3cacNJiyJX7MK7Iq3gT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739009238; c=relaxed/simple;
	bh=OYYXHmEK4uC8uh1aKA3QInVH4oIIoO297mHhpIcVwmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8xarE5VBHv23LeLlzEsyGN/+Xb6vTWwkvLMOiV98DX4KY9JkYrmP4nG/rLbfSpyEOFd8hoXZU0Wqz68HaeD2xkre49ZpsIiBFLZRKNi3VjO9Uu8C9AVA/fmdzE5YwBPVCLpuvr994etl4e4B+fyTU3o5/STa3k4MLY6qDQwRq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndo971Yb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso505793166b.1;
        Sat, 08 Feb 2025 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739009234; x=1739614034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pyb3ufJSTQ8U3pKurPleGgl26RyZuM45GOpbWBuw9I=;
        b=ndo971YbKoWItPr39hG1nM0wHEeraYN3wlLEf50FMPvbGAlbFNxrucp8nCX2gHSOa8
         rFradmRxN8MTiPp3HLYJcafjB94ZN+zD91KhR2KqYZrd/HwFBlMkFrKKIamz8/DTulsm
         0ubmX5uu6EmNSXBrfZqRuayEf+9DKDUNxdKZFFutWkfhGnDl0FzXQ1xAT4RFeX+W4Z3M
         drCtc3atA7f0RSRRxX1gMbnlZuyok2F8vGIeWKaEzVaG2Wrc+gg5spBzKkc03ETE9ouv
         irPMRXX+1Hp93yWnXMzv7rxooBgY2UiglSX4PhD09LCcoNUYWW0d3CsZSTp2jBbJbrCC
         wu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739009234; x=1739614034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pyb3ufJSTQ8U3pKurPleGgl26RyZuM45GOpbWBuw9I=;
        b=DGwS8bQRVRtVKVq6dGsGLd1dnGCImO6f1V4v1alL37ISPJL9My/Eyx9VYYErtK2mPj
         gQvQyg0GjL26tgIDtnVPqJ9wQ++lWrx5+97rbsFpIQTsfiBrzxI7M12YS9HBEHd7GjiY
         SUM1IRdGkjUICxml0Pz6LoW4GAoEvL5CTcEYSczsr2uCKya8TxL6A7j3gFJbLKffUjXV
         BBIokzdpTAj2oplLLXYf/qfnAM1bXvyScFs4HWzrjwhtA+gneaD03UrMfCQ7PtiITx5E
         Ln5Nh95d2dMr9CYmNsbBTnskfJuHvWvrtHm/5RGTOUJ8t/WOxI0p2WdBzUiHhKbnvODo
         IPRw==
X-Forwarded-Encrypted: i=1; AJvYcCVP1Eu+t9tLv3QEwUctadit3L253V+d2d7b/Qv0kl+1Y4w69OSxhj86cwJcRjc4HmSCj2+0P6nQARpgQZlS@vger.kernel.org, AJvYcCXloM3IINYwOJh14ZFTPxlUSFv6k+PLFLzi9l+y/vDNa/XQnm7TUL2DSx5yznAPuWMIL0RxlbH7BntkuKT+@vger.kernel.org
X-Gm-Message-State: AOJu0YyFovpGcHw/XNF+kak1vSKu3tx5rlUzpuqc9WYiNKT0xjZleyuY
	b4wyofNSlVHoSOeOj+g3tXWQlmSaD/IU2sGm6diCYVnhNDZE0pG9
X-Gm-Gg: ASbGncsYFxULeBjYy1+Wj1INMwrh/fwClt3dVIioG93RoC7tcWMsyjkJZ0eU9pNgz67
	h8SdyODwglMJWA65e+BacfaRRaTjQnERYRUJBFE5UASlxHsnKzRE8ZXblBzz+nRh03ynThNdu/Q
	a88lyGVdC45kCYXPK/RxAj5Kk87Lo7Vi+apavPZuaIYY1BUq1bqxVor6Uo1w0eWG2X9yIeho45F
	VVlTAXivdc8ZKORFbdQwZM/Vj6Civ0q+WJ8UF32GfEWwukEVgAYKDV3i0WHqGLq5uHwK5O0yVER
	O60d4M5nCVWISEgtr1pIKogWa9U45wXCZFonDwO4ld2HfDN5FBxajexi
X-Google-Smtp-Source: AGHT+IFothKq1c5gcI7clQBK7JiID9fpYLS2hgokmh6v32rCA6ZIVZGfs9O9ATM73c8F8fjW+P620Q==
X-Received: by 2002:a17:907:7e97:b0:ab6:de35:730a with SMTP id a640c23a62f3a-ab789a9ebc9mr693900666b.8.1739009234265;
        Sat, 08 Feb 2025 02:07:14 -0800 (PST)
Received: from [192.168.3.32] (cpe-188-129-46-137.dynamic.amis.hr. [188.129.46.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a8a3aa3esm36318066b.88.2025.02.08.02.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 02:07:13 -0800 (PST)
Message-ID: <81563943-f5cc-4489-bfaa-d58ad3816516@gmail.com>
Date: Sat, 8 Feb 2025 11:07:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
To: Christian Marangi <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Md Sadre Alam <quic_mdalam@quicinc.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250207195442.19157-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Robert Marko <robimarko@gmail.com>
In-Reply-To: <20250207195442.19157-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07. 02. 2025. 20:54, Christian Marangi wrote:
> Fix broken config in qcom_param_page_type_exec caused by copy-paste error
> from commit 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
>
> In qcom_param_page_type_exec the value needs to be set to
> nandc->regs->cfg0 instead of host->cfg0. This wrong configuration caused
> the Qcom NANDC driver to malfunction on any device that makes use of it
> (IPQ806x, IPQ40xx, IPQ807x, IPQ60xx) with the following error:
>
> [    0.885369] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xaa
> [    0.885909] nand: Micron NAND 256MiB 1,8V 8-bit
> [    0.892499] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> [    0.896823] nand: ECC (step, strength) = (512, 8) does not fit in OOB
> [    0.896836] qcom-nandc 79b0000.nand-controller: No valid ECC settings possible
> [    0.910996] bam-dma-engine 7984000.dma-controller: Cannot free busy channel
> [    0.918070] qcom-nandc: probe of 79b0000.nand-controller failed with error -28
>
> Restore original configuration fix the problem and makes the driver work
> again.
>
> Cc: stable@vger.kernel.org
> Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Tested-by: Robert Marko <robimarko@gmail.com> #IPQ8074 and IPQ6018
> ---
>   drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index d2d2aeee42a7..4e3a3e049d9d 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1881,18 +1881,18 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>   	nandc->regs->addr0 = 0;
>   	nandc->regs->addr1 = 0;
>   
> -	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
> -		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
> -		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
> -		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
> -
> -	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> -		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
> -		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
> -		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
> -		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> -		     FIELD_PREP(WIDE_FLASH, 0) |
> -		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
> +	nandc->regs->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
> +			    FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
> +			    FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
> +			    FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
> +
> +	nandc->regs->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> +			    FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
> +			    FIELD_PREP(CS_ACTIVE_BSY, 0) |
> +			    FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
> +			    FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> +			    FIELD_PREP(WIDE_FLASH, 0) |
> +			    FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
>   
>   	if (!nandc->props->qpic_version2)
>   		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);

