Return-Path: <linux-arm-msm+bounces-59862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D928AAC8A60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8AC4A7613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB991EA7C8;
	Fri, 30 May 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngLD0vVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C931DF72C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595839; cv=none; b=dkR8OCkk+JM8PbEu4AvKeBdGxSE/RfXCuchOWDQft9KV4RcWtdEMSAFtRUx1z39ih6KJa011mbDBM/wdLJcqAJ5qNKE3nCyVDy3oSiZpVla2Uoon1iDd+EHI/LIOj2LnRKSb2i4CFcOn92Wjmpbfm/TOjuWy7hruh3p6liJxYhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595839; c=relaxed/simple;
	bh=UWE2jdlEzI9YD+Dg6NIoCE8U1hSoBC3xQFtAghveJv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OX/w4Ws2BTjUWWrq4fhpUFV3DZI23PNVB//JbiNBS4ixORUThKbCCjP5opbYE2mKdr8czdNKkg74tE7lglPpGS1RGjoNPOAQ0nC/n2mhOKavBRjAXTNxDN4Oqcz2yR33+wK6bcyjIDAayryI+OHeFbeZ4GY7TeYUsSDTw1ZqkG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngLD0vVH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad883afdf0cso333820866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748595835; x=1749200635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSnECUFkt1/JvJRDNh/81S1RiOSnxf9TGj9i5tAOdx8=;
        b=ngLD0vVH5Hhw4bjiHCdPZVRuyuivNX7i7FrmCeimc5bkEflN2v/Vh7HiVVpY7rT8GJ
         EopD/uUlI/vdm6JsD4WG1WNUK+Whq/boUnPq+fCa5saC/Dr6fsMgNDoynheb9N190Gyl
         RzF9jMtGHfgMilAEwWX1xD9G8FPfHncDz6Va+3zlxsxWoQDq0B5Sz5ODcPhNLwQfJZ4p
         D2pmp1qpiaqmq5mdWwvImVM69lUbHGAsabE3gXmT7MXIwrTlnHqGyDTt6t8NwSzo3FEs
         IpTBPQkibdtNqK0QgmfpsmJ7zM4T91CMLvz/CtUcfYgwGApsXNABrC3F4CG3Uzw92eoh
         bqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748595835; x=1749200635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSnECUFkt1/JvJRDNh/81S1RiOSnxf9TGj9i5tAOdx8=;
        b=kK3xhD6mbsT2I91zY9xjgEdCc9HwhYi4Pu/oP8FMD1N768xNSkdoUgHKUWS8t4FRQS
         CkBSctJNcJWcWrzgisGCvtj7WSBnxIY+qoF8zsSOblk+ckekFwyln/fhYnNGsHh6B9J2
         Z4G+OuLlJU7KEhcgF1Ig1kkhwFdzWsUGN6JDLhsgqxlWTLHHoMaDpZhipIKerpksw7B/
         QdmWzOU+xGlWXss0deWfc2EWOmmCnFeoRkdsKnnDuaS29L68uZhYkAKJGhGztpA9NgZn
         xDCJUK0cMkmwUBVcY+R+dgeqHUc/sccyeeHe1ZsnKmnH6aASCnFor6TdMUoeMgYu0I2S
         k4UA==
X-Forwarded-Encrypted: i=1; AJvYcCXYX32EoDK/XCcf3IatSKLv2IbLEZ4zbpOV7nhPJKKc1CifIeciEzcpw2Mw+uXPf84kqDLPLmj+wCGRnhfx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wFVY78x8Hw00SkUKEkq2BzAO7wVskcs1REqG47r175ppjdMs
	oBSjg0fyjsoPYBnqA8YQ+6ZvudxSdG4hUAtdMAiELe+YxRPpmfseMwqU9qrelJRgIzuK6Q59NPB
	gxHXFHbA=
X-Gm-Gg: ASbGncsHWIl7IDJJ/qvjZMGNtGSiYsR5yewJru/53Jhss/bR72cjRsBZW98QlbS7RAw
	wnKfRdg7CPlpRUYbhhuGevYyDWPOL1I0vtA+SSS2e42IDqJMEapwrwbGdH2Qg6o3m1ieyoUWOk5
	bkxnERjnhT8KDfMUDlt53l+jLhIreld//9opWAtNod0+2LI6QWqRFUe11mW4lzhGoNTZnYz8SVs
	06nmWXwQFaZezlpJJNKwhTX3nJCOUBGpsHo02TvluRi4eHZ8MGm0Rf4X2LegKfQwR0+Zpf3GMm6
	+IUNI2Y6qRZpA2gqjumFGDU51CEeZMdzEc8DG3saAmyOELHBJgL+iuuRQuult0ncc6sXNPnlbEE
	+ZvYCjNeDKEuw3ddbwl/WegWgrss=
X-Google-Smtp-Source: AGHT+IEdTEPwz3I3fiIOCvTUuIwyDXev7/ivsylgXDu6Xsiav4J6EpqE94XmbzdMFCw668axV924fg==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:dfc2:b9e1 with SMTP id ffacd0b85a97d-3a4f89a7e71mr1193613f8f.2.1748595375484;
        Fri, 30 May 2025 01:56:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0a96sm4271388f8f.96.2025.05.30.01.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:56:15 -0700 (PDT)
Message-ID: <68c54d56-3e44-4f43-8bd6-f6b7fa1f379b@linaro.org>
Date: Fri, 30 May 2025 09:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lakshmi Sowjanya D <quic_laksd@quicinc.com>
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
 <KuueBg3qliXMt9QN9kV_5_on2xJV-BEWZAsktO_Ce-Fq1iBAPCFypbYUVZxlV4LjF0AUZG57KqiXZZ3uefQrXw==@protonmail.internalid>
 <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/05/2025 18:25, Gabor Juhos wrote:
> The common QPIC code does not do any boundary checking when it handles
> the command elements and scatter gater list arrays of a BAM transaction,
> thus it allows to access out of bounds elements in those.
> 
> Although it is the responsibility of the given driver to allocate enough
> space for all possible BAM transaction variations, however there can be
> mistakes in the driver code which can lead to hidden memory corruption
> issues which are hard to debug.
> 
> This kind of problem has been observed during testing the 'spi-qpic-snand'
> driver. Although the driver has been fixed with a preceding patch, but it
> still makes sense to reduce the chance of having such errors again later.
> 
> In order to prevent such errors, change the qcom_alloc_bam_transaction()
> function to store the number of elements of the arrays in the
> 'bam_transaction' strucutre during allocation. Also, add sanity checks to
> the qcom_prep_bam_dma_desc_{cmd,data}() functions to avoid using out of
> bounds indices for the arrays.
> 
> Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>     # on SDX75
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>    - remove the inline qcom_err_bam_array_full() function and print the error
>      messages directly from the respective functions instead
>    - add 'Tested-by' tag from Lakshmi Sowjanya D, and remove the
>      "Tested with the 'spi-qpic-snand' driver only." line from the
>      commit message as SDX75 uses the qcom_nandc driver
>    - move the note about of the preferred merging order into the cover letter
> ---
>   drivers/mtd/nand/qpic_common.c       | 30 ++++++++++++++++++++++++++----
>   include/linux/mtd/nand-qpic-common.h |  8 ++++++++
>   2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> index e0ed25b5afea9b289b767cd3d9c2d7572ed52008..30f17d959300cc7448d0c2e9e2516c52655494f0 100644
> --- a/drivers/mtd/nand/qpic_common.c
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -57,14 +57,15 @@ qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc)
>   	bam_txn_buf += sizeof(*bam_txn);
> 
>   	bam_txn->bam_ce = bam_txn_buf;
> -	bam_txn_buf +=
> -		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
> +	bam_txn->bam_ce_nitems = QPIC_PER_CW_CMD_ELEMENTS * num_cw;
> +	bam_txn_buf += sizeof(*bam_txn->bam_ce) * bam_txn->bam_ce_nitems;
> 
>   	bam_txn->cmd_sgl = bam_txn_buf;
> -	bam_txn_buf +=
> -		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
> +	bam_txn->cmd_sgl_nitems = QPIC_PER_CW_CMD_SGL * num_cw;
> +	bam_txn_buf += sizeof(*bam_txn->cmd_sgl) * bam_txn->cmd_sgl_nitems;
> 
>   	bam_txn->data_sgl = bam_txn_buf;
> +	bam_txn->data_sgl_nitems = QPIC_PER_CW_DATA_SGL * num_cw;
> 
>   	init_completion(&bam_txn->txn_done);
> 
> @@ -237,6 +238,11 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
>   	struct bam_cmd_element *bam_ce_buffer;
>   	struct bam_transaction *bam_txn = nandc->bam_txn;
> 
> +	if (bam_txn->bam_ce_pos + size > bam_txn->bam_ce_nitems) {
> +		dev_err(nandc->dev, "BAM %s array is full\n", "CE");
> +		return -EINVAL;
> +	}
> +
>   	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
> 
>   	/* fill the command desc */
> @@ -258,6 +264,12 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
> 
>   	/* use the separate sgl after this command */
>   	if (flags & NAND_BAM_NEXT_SGL) {
> +		if (bam_txn->cmd_sgl_pos >= bam_txn->cmd_sgl_nitems) {
> +			dev_err(nandc->dev, "BAM %s array is full\n",
> +				"CMD sgl");
> +			return -EINVAL;
> +		}
> +
>   		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
>   		bam_ce_size = (bam_txn->bam_ce_pos -
>   				bam_txn->bam_ce_start) *
> @@ -297,10 +309,20 @@ int qcom_prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
>   	struct bam_transaction *bam_txn = nandc->bam_txn;
> 
>   	if (read) {
> +		if (bam_txn->rx_sgl_pos >= bam_txn->data_sgl_nitems) {
> +			dev_err(nandc->dev, "BAM %s array is full\n", "RX sgl");
> +			return -EINVAL;
> +		}
> +
>   		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
>   			   vaddr, size);
>   		bam_txn->rx_sgl_pos++;
>   	} else {
> +		if (bam_txn->tx_sgl_pos >= bam_txn->data_sgl_nitems) {
> +			dev_err(nandc->dev, "BAM %s array is full\n", "TX sgl");
> +			return -EINVAL;
> +		}
> +
>   		sg_set_buf(&bam_txn->data_sgl[bam_txn->tx_sgl_pos],
>   			   vaddr, size);
>   		bam_txn->tx_sgl_pos++;
> diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
> index cd7172e6c1bbffeee0363a14044980a72ea17723..3ca4073a496b8fd2a99112a9caefd3f110260568 100644
> --- a/include/linux/mtd/nand-qpic-common.h
> +++ b/include/linux/mtd/nand-qpic-common.h
> @@ -240,6 +240,9 @@
>    * @last_data_desc - last DMA desc in data channel (tx/rx).
>    * @last_cmd_desc - last DMA desc in command channel.
>    * @txn_done - completion for NAND transfer.
> + * @bam_ce_nitems - the number of elements in the @bam_ce array
> + * @cmd_sgl_nitems - the number of elements in the @cmd_sgl array
> + * @data_sgl_nitems - the number of elements in the @data_sgl array
>    * @bam_ce_pos - the index in bam_ce which is available for next sgl
>    * @bam_ce_start - the index in bam_ce which marks the start position ce
>    *		   for current sgl. It will be used for size calculation
> @@ -258,6 +261,11 @@ struct bam_transaction {
>   	struct dma_async_tx_descriptor *last_data_desc;
>   	struct dma_async_tx_descriptor *last_cmd_desc;
>   	struct completion txn_done;
> +
> +	unsigned int bam_ce_nitems;
> +	unsigned int cmd_sgl_nitems;
> +	unsigned int data_sgl_nitems;
> +
>   	struct_group(bam_positions,
>   		u32 bam_ce_pos;
>   		u32 bam_ce_start;
> 
> --
> 2.49.0
> 
> 

This one doesn't apply to -next

deckard 
{~/Development/worktree/reviews/linux-next-25-05-30-daily-reviews}±(linux-next-25-05-30-daily-reviews); 
greetings, earthling [1.052Mb]$ ☞ b4 shazam 
20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gm
Grabbing thread from 
lore.kernel.org/all/20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 3 messages in the thread
Analyzing 12 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2 1/2] spi: spi-qpic-snand: reallocate BAM transactions
   ✓ [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds access 
of BAM arrays
   ---
   ✓ Signed: DKIM/gmail.com
---
Total patches: 2
---
  Base: using specified base-commit b00d6864a4c948529dc6ddd2df76bf175bf27c63
Applying: spi: spi-qpic-snand: reallocate BAM transactions
Applying: mtd: nand: qpic_common: prevent out of bounds access of BAM arrays
Patch failed at 0002 mtd: nand: qpic_common: prevent out of bounds 
access of BAM arrays
error: patch failed: drivers/mtd/nand/qpic_common.c:237
error: drivers/mtd/nand/qpic_common.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"
deckard 
{~/Development/worktree/reviews/linux-next-25-05-30-daily-reviews}±(linux-next-25-05-30-daily-reviews); 
greetings, earthling [1.052Mb]$ ☞ git-log-graph
* 4ae57ce867d8f - (HEAD -> linux-next-25-05-30-daily-reviews) spi: 
spi-qpic-snand: reallocate BAM transactions (8 seconds ago)


