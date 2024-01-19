Return-Path: <linux-arm-msm+bounces-7624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82A832A7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 14:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A01A81C23372
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 13:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8630951C5A;
	Fri, 19 Jan 2024 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fB4wcuiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E0B54659
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670829; cv=none; b=jmv8yuj6BvMijZmFpG7lBrIxwISD5F357wyL13rNKSvq2YJYdPfE9SR+o5q9dJDnB1++eixPAxj5nuZNEgvZnEGHSinCkW43kVCedI3eH1ujMBW9bfd+lNcWiaEOStc8GfuKZEnhaUU/ke0jqi1AWMKiX8Me2KtJ9HKjQrWe/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670829; c=relaxed/simple;
	bh=tkNP5hdtLMLmdRU6kGCnnq1HZvK5vqTcSU7Mp+tbZQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2G3xei8UvhvMtYRcmJLFSGkSwMZ9m6pH8rsiZcqkLtb/ZGvM6DPzK+hUan54EoJrteCLcrZvhKl1l171QMhPIGhjpf9z35TNqUa4BkX2otS/FbYaN/waq+ikQPvIXI+s/0LlgnfNKh4UFErUKgVD5KZxyzktvgaQ8l9a6Fmnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fB4wcuiH; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc223463ee4so771199276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670827; x=1706275627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=42jWvBuWK7I9LjSS4bPIwTmo8OJpE10eZpVzP5bii30=;
        b=fB4wcuiH7Epb9QP7/JxhvLWtjh4BnKG0d9lSuS2SuzmdrHq8EdhUtOiACwFldx/wkL
         sgdYMnSCDb6nK5din5kMrMloFFhf3M2P0kao1LPszPtGnb7JQYITE6s1ClX0yeCxkoO8
         rX0sXoyL8Ob55mahZIfsEghci39GEXOu7dHAnzqkTDxlbJASGcxXZoocWZJfQIhbOKcS
         teOciIwYXLwJYDpKAeJms/Wq0viDV+zASrJQpyTJ9oE5FUaxB29chXiuwFiID2NHjENK
         GOlN8QSGtASuQ/igNrTURDBEG1ReCaGWqDi5i1AQEmPh+3G/3G8ZWfIGRG2om1Jg3pYA
         2pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670827; x=1706275627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42jWvBuWK7I9LjSS4bPIwTmo8OJpE10eZpVzP5bii30=;
        b=uhDs++/z0gjFTFIuNdzNqfWa+hl4tk3h5GhqerdVskaeZxxCOip8xur7x1jtncSrRT
         pOwjeBEF2aJb91q+Dk/91oxcr7iUqDJHm3772Hdj4L8Og9vH4SGkmMiotre0j9URNxuq
         l9CJF1bzRMGAZCVf47y5hBJpF5MeIJMJho7TYGuIxQ78nTlnpqRwjF928eQEZN0jsyb2
         h3C3k8t/ulkAsH5ZQ5waizQwOkiuFS1YU7+08+wk1LMtBCEKs6M7GV2so3nnLX/70/5B
         JTgdqlaGceA9RJ0UUvB1bQsgWIr0Ow5Sv/NT3c8UI97esL74rARmxpqs1bA0KcEHOkyK
         gHTA==
X-Gm-Message-State: AOJu0YyhVIjjDl8NUzmAdqILdQAfs+5QjFeghdlXQuCh6yYUXO5iiV5R
	RQzIw82RW3zNdB4GEKCZC4leKhgDzpVHNUC1O9GLlTxLeNUQnXM4E4KNU3ptGtdOBM4eH9GRZ3Z
	h5fnF1gauYJYV8yZxT3hakEWvWfhFadasGL1PfQ==
X-Google-Smtp-Source: AGHT+IHcNZ3z0a6KFk4Azj3BQtD3k/0SlfNc1gxTnmWDbYZDfxsy/+8Zo5qiZ4T2sE8zVUc9JU70wOEc2pwAJXP0ECs=
X-Received: by 2002:a25:c583:0:b0:dc2:46d7:d8d5 with SMTP id
 v125-20020a25c583000000b00dc246d7d8d5mr1960765ybe.65.1705670827062; Fri, 19
 Jan 2024 05:27:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com> <1705669223-5655-3-git-send-email-quic_msarkar@quicinc.com>
In-Reply-To: <1705669223-5655-3-git-send-email-quic_msarkar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 15:26:56 +0200
Message-ID: <CAA8EJprWHiShFpZdb+pWsCoxNvNEoP+3By2x4u8rq+ek37hJXw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] dmaengine: dw-edma: Introduce helpers for getting
 the eDMA/HDMA max channel count
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: vkoul@kernel.org, jingoohan1@gmail.com, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, manivannan.sadhasivam@linaro.org, 
	robh+dt@kernel.org, quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, 
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com, quic_schintav@quicinc.com, 
	quic_shijjose@quicinc.com, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jan 2024 at 15:00, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Add common helpers for getting the eDMA/HDMA max channel count.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  drivers/dma/dw-edma/dw-edma-core.c           | 18 ++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.c |  6 +++---
>  include/linux/dma/edma.h                     | 14 ++++++++++++++
>  3 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 7fe1c19..2bd6e43 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -902,6 +902,24 @@ static int dw_edma_irq_request(struct dw_edma *dw,
>         return err;
>  }
>
> +static u32 dw_edma_get_max_ch(enum dw_edma_map_format mf, enum dw_edma_dir dir)
> +{
> +       if (mf == EDMA_MF_HDMA_NATIVE)
> +               return HDMA_MAX_NR_CH;

This will break unless patch 5 is applied. Please move the
corresponding definition to this path.

> +
> +       return dir == EDMA_DIR_WRITE ? EDMA_MAX_WR_CH : EDMA_MAX_RD_CH;
> +}
> +
> +u32 dw_edma_get_max_rd_ch(enum dw_edma_map_format mf)
> +{
> +       return dw_edma_get_max_ch(mf, EDMA_DIR_READ);
> +}
> +
> +u32 dw_edma_get_max_wr_ch(enum dw_edma_map_format mf)
> +{
> +       return dw_edma_get_max_ch(mf, EDMA_DIR_WRITE);
> +}
> +
>  int dw_edma_probe(struct dw_edma_chip *chip)
>  {
>         struct device *dev;


-- 
With best wishes
Dmitry

