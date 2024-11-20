Return-Path: <linux-arm-msm+bounces-38415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B79D33F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 08:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201D71F24030
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 07:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3638415958A;
	Wed, 20 Nov 2024 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H33PDapd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E44157495
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086377; cv=none; b=P1CI+HpRg74/zgVrZSspfvzUXWXWLFGU1MUgQunrxVhGNZPVCYiLf7wsr7mejnQXNZ+oJhO4NOabtyhDYCVmImrjbRJAYMpwb2UHo6Hyx5pvisfNvhbX6xc3hKG1PjWgZunLGtEMnx/hQFcnw/h8lRNlwmiVSYy3lttaKZZTJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086377; c=relaxed/simple;
	bh=0QHVYNFuM5fqxbZcEwW2FcFh0HSf7VDXQoUIZFuhlkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkNgCUYiIDwEPCZ2nhHnb9dZtgKHLqft9jU3kqsaOE9pw3ht+yUT7tDu72/GCeZhnB9tb6tuOcaAAyFLMlk9XBF0eO5zs2Xdoyf8AHJr491PF+dgU+0F2MykaOvUhPrRVKb8TxdZtETc1HHUASN9F3ivbPjwxlYZ4krBLVdagPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H33PDapd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2972213b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 23:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732086374; x=1732691174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlckAjenAV33rPr5YF519n7jq2uOFDgePjeaHrWm9Hg=;
        b=H33PDapdB1PEGeVOdLayjIJkenb2RVUyEc9lJDwumZt25T1SxnhKBf4tzwj0A6TQfc
         txqaiV+RvZQtEVOkXYhkeZSSUb293vNWHSqnxekmPDky8IL3WYJbaqWvFg+FyP6vumUp
         zsjSk2uQvA7sKiig1zuveXgwqJlksERbsHaBd5OFT3Thj17a9a7TuP8XuKOwIK34udfP
         7wfw2sbCh3qrzzZ7NFZX4bKVAME+guP8Mkk8gVnxA9Sm00QaJOOcr4zgexpYRCFA0ABV
         9J/KebuGa4JL5mLkPMBR62PsAxBbfKGDTC5EFWexDUl4/MHGl8KesQhq/mkM0aKuDTgD
         OLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732086374; x=1732691174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlckAjenAV33rPr5YF519n7jq2uOFDgePjeaHrWm9Hg=;
        b=EEOmKfJXVapRYIwOVC4om+m+vfwRw1p++Mgb8mZiMmobSVVuSxNuRu6YeDy9q4C4bN
         fP3+eKUJJ/d+9D5Z71n+eM2i18rRo7gtU6m8rybRrHYyR1zPNNQbHDipX7xbudYBFVb8
         i1ZxeKHJu6xPNU1vRx4jc2HZlIhpuXxQ+XwhuFHGq8H5VyI8aoYUDKkhah0/N0PEvrA8
         RnTO7+TQGidj9sOyMXN7+n3m3yMPH6KZbDLv74k2UlFR5q/1KaYiwJye0Gan5KeEnTA6
         rLfgFOOLqu3q4X5nak53aKIVbR+ihTkbrnLU74YAxsulN3jBDpfHgbXxp0qcSd8dgZDA
         b6ew==
X-Forwarded-Encrypted: i=1; AJvYcCXV28Xn3tq3lpbcPcFslzpOCw207Lig4nvlYvg1LnkZ864sxuUbDtsOyAmhsTzxKyjUZMr3nLgDXExZVFWk@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpxbizLQeUhvXS/v1rAJ2hJipKSbF1AnjFDFWIS6qpJj2Z+ys
	hTbU4L6V+gd6vH1HYGNat8nyjOHBjlHai5T1lMnY/Lwsk0WW3IkerKFDSFvHkg==
X-Google-Smtp-Source: AGHT+IGSkaeCqxZh6I0KH/lMTfLgGDtX5lRLGmOyj6/PpDk//NzNcx/J304/S7fAeqjaH7OiB7Kb9Q==
X-Received: by 2002:a05:6a00:1311:b0:724:5aac:1687 with SMTP id d2e1a72fcca58-724bed54e77mr2782307b3a.20.1732086373854;
        Tue, 19 Nov 2024 23:06:13 -0800 (PST)
Received: from thinkpad ([120.60.129.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef9142dsm901174b3a.100.2024.11.19.23.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 23:06:13 -0800 (PST)
Date: Wed, 20 Nov 2024 12:36:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 2/2] mtd: rawnand: qcom: Fix onfi param page read
Message-ID: <20241120070609.u2nzofwnupyqnjqp@thinkpad>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-3-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119092058.480363-3-quic_mdalam@quicinc.com>

On Tue, Nov 19, 2024 at 02:50:58PM +0530, Md Sadre Alam wrote:
> For QPIC V2 onwards there is a separate register to read
> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
> 
> qcom_param_page_type_exec() is used to read only one code word
> If we will configure number of code words to 1 in QPIC_NAND_DEV0_CFG0

No 'we' in commit message. Also use imperative tone.

> register then QPIC controller thinks its reading the last code word,
> since we are having separate register to read the last code word,
> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n" register
> to fetch data from QPIC buffer to system memory.
> 
> Also there is minimum size to fetch the data from device to QPIC buffer
> is 512-bytes. If size is less than 512-bytes the data will not be
> protected by ECC as per QPIC standard. So while reading onfi parameter
> page from NAND device setting nandc->buf_count = 512.
> 

This is a separate fix and should be in a separate patch.

> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")

Please describe the impact of the issue. Add relevant failure messages, affected
SoC names etc...

Finally, you should also CC stable list to backport the fixes.

- Mani

> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 34ee8555fb8a..6487f2126833 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2859,7 +2859,12 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>  	const struct nand_op_instr *instr = NULL;
>  	unsigned int op_id = 0;
>  	unsigned int len = 0;
> -	int ret;
> +	int ret, reg_base;
> +
> +	reg_base = NAND_READ_LOCATION_0;
> +
> +	if (nandc->props->qpic_v2)
> +		reg_base = NAND_READ_LOCATION_LAST_CW_0;
>  
>  	ret = qcom_parse_instructions(chip, subop, &q_op);
>  	if (ret)
> @@ -2911,14 +2916,17 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>  	op_id = q_op.data_instr_idx;
>  	len = nand_subop_get_data_len(subop, op_id);
>  
> -	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
> +	if (nandc->props->qpic_v2)
> +		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
> +	else
> +		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
>  
>  	if (!nandc->props->qpic_v2) {
>  		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
>  		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
>  	}
>  
> -	nandc->buf_count = len;
> +	nandc->buf_count = 512;
>  	memset(nandc->data_buffer, 0xff, nandc->buf_count);
>  
>  	config_nand_single_cw_page_read(chip, false, 0);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

