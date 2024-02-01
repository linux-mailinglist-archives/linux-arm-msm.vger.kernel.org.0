Return-Path: <linux-arm-msm+bounces-9312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 862208456A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 12:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8DB51C23C79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 11:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F9615D5AD;
	Thu,  1 Feb 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6vF4Bja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27C15D5AC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788461; cv=none; b=p2lAxhXp+eLXvtZH3qFvWjyLYEH4O498+Q1gBQYfEDo9BT8pXy+sB/1Bw4PSBIyFLSKNgmhrvOdJMIBa6aFDgRSvb7rmOw1Zaa7GcNoXPjL0g6dCLlZMRFJ9ZVNLJVSbUHcpw0wdJsmzPC6eLfbpELpwJrnyLhGsteIAlKX+cIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788461; c=relaxed/simple;
	bh=xZlpBSv6fkEsA2L7w/b7DPQtVdArKyORbXqibI/jExE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2WlacPpc2Tkz6wwwJJ96Mo8VDpMNkDpj27ejIuWt1WnbCeutsCITyEzke2OcX9SnCyEdCZae56k5OY36fDiA/EYT2oTEDEZepF0qD/gFFeMloHcqtXqq2KTUmwoGe3pVMgCRpRdLVYqHOknxuGZotoJjkVGvx9fvvYL68uXdJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6vF4Bja; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d5267cceso724922276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 03:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706788457; x=1707393257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4H6LBU62Ttqy2KFiZYwMZoro4w2GfWXjhJ/+N8HmJ1Q=;
        b=O6vF4BjaZHJsVk+if3ylpZuTdmZqQl6byk8gKQnHWFhb7sWpaCl4/h9/WhoUZGcjlj
         RAZiLtkhd1ruUsusSrcVKZ1Tnd/T1CFs2eI6MQw3j6Sa6/KJo4bE68rJjUD750+bev/8
         dd4lZ4plJzB64YdWPfNV3gBpPeD6AUx7TS4Y4YKBZyUlVNsaFebumcaOoyuiH+YuOHEB
         D48jOgfx9soZEeuFaGD1rVQTqbwb9qO9za29W8sZRgG4kwGQdX7TpsOk69P7PLlm6G+Z
         acLlCRoCSvBXJeB2k3voGjmkFEIf3hGp648irabqF+TTul9B+RCSNRE3aMUAIZA1sJ0O
         7GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788457; x=1707393257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4H6LBU62Ttqy2KFiZYwMZoro4w2GfWXjhJ/+N8HmJ1Q=;
        b=a/fGmqwRHYHRK5NX0AY2gVa0qY4ZXjt2VwVcHnFdEFv1ZOHkwtDA/UNsDFWYhZaEM+
         V4ruu2dHjIQW0OoB3VPYkl0yX+cEgfamkvIzxYU0FJ+c2pV1Knxo9ohkf3akgDdynMTL
         hwiMgiV4m4hAcoa5bch4zzrf7uwQ5CW1WKy2B8ms+fohFgJjSG1DM5vJLluN4TZQLmFl
         +tvnWqaJQt8v852uMawBq5PnJ5S8mlMnclMvo9V1svO4kUfbG5Wg87daZ+IwsldRaxR1
         kKY66zoxjfGvLJ+7nc2bx1RTxNT9joXze52rG+19TBZ4QXfsFTrQzNbx29IDgaDTF5Qw
         M1HA==
X-Gm-Message-State: AOJu0Yw4vN2frWc7i5Esy+M0Hc9xvEhe4Q+IyV+zFaql/DdowOZ2MLYg
	tygoZGpoDh9Bzy8aLpPF4vE1Gpq8HexbgT9A788JP1LwSm+SPz1mr0HCXkkRtLUgm4cTQiBx6No
	QiFl1hYd7UyKSC0yPezfZ3S089O9jlRhSwi/ijQ==
X-Google-Smtp-Source: AGHT+IHE6MUPQe2v8rCH9yiwR/6CfzgY+yrYyn3lZn+9J44z3It/avkbHeViCgHRCdu6QmraEUiD0NAB+hbfkJ9jn3w=
X-Received: by 2002:a25:2e4a:0:b0:dc6:ad45:3c51 with SMTP id
 b10-20020a252e4a000000b00dc6ad453c51mr4463301ybn.36.1706788457347; Thu, 01
 Feb 2024 03:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
In-Reply-To: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Feb 2024 13:54:06 +0200
Message-ID: <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com, 
	manivannan.sadhasivam@linaro.org, bryan.odonoghue@linaro.org, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
> For i2c read operation in GSI mode, we are getting timeout
> due to malformed TRE basically incorrect TRE sequence
> in gpi(drivers/dma/qcom/gpi.c) driver.
>
> TRE stands for Transfer Ring Element - which is basically an element with
> size of 4 words. It contains all information like slave address,
> clk divider, dma address value data size etc).
>
> Mainly we have 3 TREs(Config, GO and DMA tre).
> - CONFIG TRE : consists of internal register configuration which is
>                required before start of the transfer.
> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>                of the transfer.
>
> Driver calls GPI driver API to config each TRE depending on the protocol.
> If we see GPI driver, for RX operation we are configuring DMA tre and
> for TX operation we are configuring GO tre.
>
> For read operation tre sequence will be as below which is not aligned
> to hardware programming guide.
>
> - CONFIG tre
> - DMA tre
> - GO tre
>
> As per Qualcomm's internal Hardware Programming Guide, we should configure
> TREs in below sequence for any RX only transfer.
>
> - CONFIG tre
> - GO tre
> - DMA tre
>
> In summary, for RX only transfers, we are reordering DMA and GO TREs.
> Tested covering i2c read/write transfer on QCM6490 RB3 board.

This hasn't improved. You must describe what is the connection between
TRE types and the geni_i2c_gpi calls.
It is not obvious until somebody looks into the GPI DMA driver.

Another point, for some reason you are still using just the patch
version in email subject. Please fix your setup so that the email
subject also includes the `[PATCH` part in the subject, which is there
by default.
Hint: git format-patch -1 -v4 will do that for you without a need to
correct anything afterwards.

>
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

I think you got some review tags for v2, didn't you? They should have
been included here, otherwise the efforts spent by the reviewer are
lost.

> ---
> v2 -> v3:
> - Update commit log to explain change in simple way.
> - Correct fix tag format.
>
> v1 -> v2:
> - Remove redundant check.
> - update commit log.
> - add fix tag.
> ---
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0d2e7171e3a6..da94df466e83 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -613,20 +613,20 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>
>                 peripheral.addr = msgs[i].addr;
>
> +               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +               if (ret)
> +                       goto err;
> +
>                 if (msgs[i].flags & I2C_M_RD) {
>                         ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>                                             &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>                         if (ret)
>                                 goto err;
> -               }
> -
> -               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> -                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> -               if (ret)
> -                       goto err;
>
> -               if (msgs[i].flags & I2C_M_RD)
>                         dma_async_issue_pending(gi2c->rx_c);
> +               }
> +
>                 dma_async_issue_pending(gi2c->tx_c);
>
>                 timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
>


-- 
With best wishes
Dmitry

