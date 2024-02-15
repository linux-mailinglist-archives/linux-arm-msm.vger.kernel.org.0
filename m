Return-Path: <linux-arm-msm+bounces-11203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9278566BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 16:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E209F1C22862
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 15:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AC8133405;
	Thu, 15 Feb 2024 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fy6L9q3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F91E12EBDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708009215; cv=none; b=tL+qP+19JFM2wrsZ0n6APJ2kMSgLzxJpQ3IyIExc6VVGsbVCWQCjbC2tNQVdGO0c9Pcnm5KKbj/EYBcUzUV5S6JHBX7k/DjQy61XzIs2tpE3HxWyk603Wquu8xQU72xtT4bz3sFi1Oyi1vP6LXfkE08Wqs5Xo/IlGYW3JSfckwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708009215; c=relaxed/simple;
	bh=UlLpq6ptjkFE4SLoHOdwCV2cdC3BUnUnSX6rNIe0NW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XP4WCGYdxJzb2tlJ9KXj+3hJLdoKa2NwufWgzb3lOjFnP76qofpzd+uXE83PmqCwiD0k03rVrIhzlUg25ja7WuaXXg8jROV7FQVKwUpM6jaF51KFxvfYUNAsKdUdzX8WuLut1KldCqq0mtdlqx7jslRgOnOmUvUiyo3kCmWo5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fy6L9q3C; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so729674276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 07:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708009212; x=1708614012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RadMiDe92m4brTDSBbZrQSBMUCpi10GCJT9OlMPEwXY=;
        b=fy6L9q3Cc4Vv7bpubHQk3jX8OFfP70h4berDhK2xIJvQ3FKhxZyq0xRCTuoNTKBqGE
         JCgVJEZLZFQZe0ks+23sG/22cYL9/Z7Rt3hslyvNpdx/GoMuZx+gYR6W7EM3K7O0IWe8
         wYPsERgtWu8n/xA+b2iUE5tqxhOpxmuCw2ZD+YfTAOcWyhmxBKc/NezQPgLbo+WiiSRJ
         yX16pmD4jOx+6nMwpZy31jz3vPiB/fuXKj/9scmzyawXIn3g2LJCIPS72peV8T0unRVR
         gFZDIR3lqs5QuLhf0vcvMRwn4q62KL9o+Pp6shtK3OjloAqfcyf+MEOoZkVjnEOUgLNy
         2Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708009212; x=1708614012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RadMiDe92m4brTDSBbZrQSBMUCpi10GCJT9OlMPEwXY=;
        b=MVLlaHWR1eI5GwInLNNqze1i+eNJE6y2M/OSibs+Oex55NxI3Sa+Ha1n+17DMfB3Xi
         8fqLh1YEBKc6ZFnRIVn8cbEjzUH3aAHwgqrUcXzPE0SIHpNbIRNHquIFlzAKmpCNXM9u
         LIBfVm6iPRRZvpjb4tzEhUX9F/U2bsBUJQYkmoxG3enGaidudDvMr1jtrmfn5PnpeJJT
         9QmAWflFfIpFuPEAFm7o7hbYcBGpbSuB0xxeFsAt6sDdx+PvyYaOmLZBSwIifIiTOlZE
         bU7ZbtohWs2Q57tavJlAQ8qPem18iE6Hw4DQvJzUC8/rQQ/bk0h7sN7ltknv8oUhIbDI
         In1A==
X-Forwarded-Encrypted: i=1; AJvYcCVXQ+C6SwriIUlG77D3FapkfFR5vDBVgWy7r1aywDHVP5laBMHC36RqxybeIxy/l1IDyH7BZXWEL7uCgPbhc5yEvt9TrfP225Vv42Qwxg==
X-Gm-Message-State: AOJu0Yz84acHTrC7QA9IkFmkQa3mmeqcfQgst40nwSEvsh8aUiajgcKC
	1bzXu84JDCtppe3lXtX4KRFujAKzWp/KhoXE4tx3PRAfl4kGdpE5CA5O1qPvEZj5Tfr0abwg++4
	sJmBi176ivZtpuSswXh0dLFcyCzWZBFC5bRRKlQ==
X-Google-Smtp-Source: AGHT+IG9VjWm3vrwjladOxmvn95+Q9vBX02+e37fghrXCVUWsX2DFBhY2VjHQFCFnjilBT/8d54Qvp6HvXvaehGIGn0=
X-Received: by 2002:a25:ae28:0:b0:dc2:4fff:75ee with SMTP id
 a40-20020a25ae28000000b00dc24fff75eemr1336871ybj.3.1708009211944; Thu, 15 Feb
 2024 07:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com> <20240215134856.1313239-3-quic_mdalam@quicinc.com>
In-Reply-To: <20240215134856.1313239-3-quic_mdalam@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 17:00:00 +0200
Message-ID: <CAA8EJpquDwDg+OrZKeJrTWEtokCF7uyHMyzCFK2etSsDip8_6Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers: mtd: nand: Add qpic_common API file
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 15:53, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Add qpic_common.c file which hold all the common
> qpic APIs which will be used by both qpic raw nand
> driver and qpic spi nand driver.
>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/mtd/nand/Makefile            |    1 +
>  drivers/mtd/nand/qpic_common.c       |  786 +++++++++++++++++
>  drivers/mtd/nand/raw/qcom_nandc.c    | 1226 +-------------------------
>  include/linux/mtd/nand-qpic-common.h |  488 ++++++++++
>  4 files changed, 1291 insertions(+), 1210 deletions(-)
>  create mode 100644 drivers/mtd/nand/qpic_common.c
>  create mode 100644 include/linux/mtd/nand-qpic-common.h
>
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 19e1291ac4d5..131707a41293 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -12,3 +12,4 @@ nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
> +obj-y += qpic_common.o
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> new file mode 100644
> index 000000000000..4d74ba888028
> --- /dev/null
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -0,0 +1,786 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * QPIC Controller common API file.
> + * Copyright (C) 2023  Qualcomm Inc.
> + * Authors:    Md sadre Alam           <quic_mdalam@quicinc.com>
> + *             Sricharan R             <quic_srichara@quicinc.com>
> + *             Varadarajan Narayanan   <quic_varada@quicinc.com>

This is a bit of an exaggeration. You are moving code, not writing new
code. Please retain the existing copyrights for the moved code.

> + *
> + */
> +
> +#include <linux/mtd/nand-qpic-common.h>
> +
> +struct qcom_nand_controller *
> +get_qcom_nand_controller(struct nand_chip *chip)
> +{
> +       return container_of(chip->controller, struct qcom_nand_controller,
> +                           controller);
> +}
> +EXPORT_SYMBOL(get_qcom_nand_controller);

NAK for adding functions to the global export namespace without a
proper driver-specific prefix.

Also, a bunch of the code here seems not so well thought. It was fine
for an internal interface, but it doesn't look so good as a common
wrapper. Please consider defining a sensible common code module
interface instead.

At least each function that is being exported should get a kerneldoc.

Last, but not least, please use EXPORT_SYMBOL_GPL.

> +
> +/*
> + * Helper to prepare DMA descriptors for configuring registers
> + * before reading a NAND page.
> + */
> +void config_nand_page_read(struct nand_chip *chip)
> +{
> +       struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> +
> +       write_reg_dma(nandc, NAND_ADDR0, 2, 0);
> +       write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> +       if (!nandc->props->qpic_v2)
> +               write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
> +       write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
> +       write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
> +                     NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
> +}
> +EXPORT_SYMBOL(config_nand_page_read);
> +
> +/* Frees the BAM transaction memory */
> +void free_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +       struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +       devm_kfree(nandc->dev, bam_txn);

devm_kfree is usually a bad sign. Either the devm_kfree should be
dropped (because the memory area is allocated only during probe / init
and doesn't need to be freed manually) or use kalloc/kfree directly
without devres wrapping.

> +}
> +EXPORT_SYMBOL(free_bam_transaction);
> +

[skipped the rest]

> --
> 2.34.1
>
>


--
With best wishes
Dmitry

