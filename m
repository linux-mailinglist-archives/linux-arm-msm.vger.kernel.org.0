Return-Path: <linux-arm-msm+bounces-13608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC8875236
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 15:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C210E1F24C48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 14:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C4F1EEEA;
	Thu,  7 Mar 2024 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGC0olyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084F71E89A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709822766; cv=none; b=IOu73rCeRvmGqARXDgzgqUHybVo304fP1XGjJcFKNt6NmbRMqkOx+8CXzo8EiZviLToB//6oRgpXlj0g+MDH1FGqF3+3es7qVuBHVEfJxnWiHRlBdNrt8yPAHBT3EPiWq6sa7UxGH21fFH0IDnRhugNw8CsGJk+YqR0xMicRz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709822766; c=relaxed/simple;
	bh=T8zKZi+9e/wRkkXQuIyTPYSMNwjFkafxbUNOpkl3+qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbMQ3bfQyVam9dwY6YqYeqDXl8AkVsh4ffKt4L7EDSO2Qv5fyuf/E5gvyquCkUB10ru9RsIsR+NN1OQ82fw1ht9X7pUpyP42ZzTj1Q43hJH8nKyr1BDJRHSFjQDeNWqHkhtj8VKheFNOp7JzD8JdVvMVfTCV6/cEQdGvmrbULGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VGC0olyx; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso956617276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 06:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709822762; x=1710427562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2DO8lbCCr4NY9SSOFNXjweEcXDNHlsqaoWwqb/vXIE8=;
        b=VGC0olyx4+ekyU73epZOlVwW2fbB9ZZXbSlRsOpBP4DD4BHSrIMU9aYkFZWtzsl9BD
         swx7BBlIgnoHQTlhkihYv8dueiCe7oDPA5xQJnMO03jn2K9i5+xmDQFxhnloNVLGVwbA
         B2I6NWNDej/+MHz9TlrMkdF97+xDhJAkdD/gnvceALRxUD6v6EVkloBVVDrhPqX23inS
         tQbMUwiDoQmB+F0N76OClqB95Uu4Qv3YKu/GPoIzpaxBejDHlPe0f053YHiA/F4CUtTZ
         3MSmVpjlEsxq4sPPmjhdSmcsVYd9NVIXamXTTSkBX2Q2CsYJ0mxP76g4ZSm3gdWRTfXy
         dx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709822762; x=1710427562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DO8lbCCr4NY9SSOFNXjweEcXDNHlsqaoWwqb/vXIE8=;
        b=pI+JJEC/eYP7u5yVyZ/C/mB7Om3dK/n5/w/c3imhf0GJpgaXRiG/k6dqu0FJD86UOE
         QnYmu+BawZ4e1rlIlwidcWjxhaTxrPSUNGAovpkKZaa++17W/GqdaH4mKe1ysztcLZ7/
         PdZMzAbhzTviU/+dTwL6lkuvsXlsefhIh6/911tSL0OB3nSXvcdVqg6IiECpT2WToxIk
         d8ga9cvtSLBFT7q9Hb1YfIoTXWbw2bubptwxt35nC9RcrlxXTig1AKwT3LdsRhqOh5fG
         8HxhVjb0qfvarqvv3WSl8Mxo9yOpybGrP5mSL3dxpiGYCYgGz7HovzfMrXK+XW6e2Q6D
         Ru9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI0ttWpoApr+z22GygbAzH2ucq2NlTfkmGFoo/lqkLQXLWhzFUvHQPsvI4CcjPEBL+w4AH+ukQy7jMwpVF7D+Ynw/TFaU1blsGsqt+pQ==
X-Gm-Message-State: AOJu0YyVP/87Fnd61/60evMReofqs8bxBcBpxRzzLGHUypjRRu2T24kq
	DWGJwYK8WIHE2ivWy/POtlQl89YwCQBKqDru0reoZDzW8ntwSnzrQ/1WHrw5h1TOIHn53+/GXNC
	9cQfBo3ReIYTtHVYWLTZXfNh9kpOZelw+em2dCQ==
X-Google-Smtp-Source: AGHT+IHqhppg8UCV3HnmeMYmICt+0nHtX3/aUVZcC/1R/yM7ReBzagzjsighT1k9YP/mJ4X58nZ4HCAj9jCSD/TbItY=
X-Received: by 2002:a25:3604:0:b0:dcd:97ad:74b3 with SMTP id
 d4-20020a253604000000b00dcd97ad74b3mr14205958yba.63.1709822761998; Thu, 07
 Mar 2024 06:46:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307093605.4142639-1-quic_msavaliy@quicinc.com>
 <CAA8EJprndszVSjAVs_UzAjhb+x1B1Of4JCkygZ=8kgzuY2RwCQ@mail.gmail.com> <25ec87af-c911-46b7-87c9-b21065d70f9f@quicinc.com>
In-Reply-To: <25ec87af-c911-46b7-87c9-b21065d70f9f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 16:45:50 +0200
Message-ID: <CAA8EJprky=tFjJbGTBL7+9E=kqxQKjxB_RcmzHUt31GqUVfNmQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org, 
	andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 15:46, Mukesh Kumar Savaliya
<quic_msavaliy@quicinc.com> wrote:
>
>
>
>
> On 3/7/2024 3:23 PM, Dmitry Baryshkov wrote:
> > On Thu, 7 Mar 2024 at 11:36, Mukesh Kumar Savaliya
> > <quic_msavaliy@quicinc.com> wrote:
> >>
> >> We are seeing transfer failure instead of NACK error for simple
> >> device scan test.Ideally it should report exact error like NACK
> >> if device is not present.
> >>
> >> We may also expect errors like BUS_PROTO or ARB_LOST, hence we are
> >> adding such error support in GSI mode and reporting it accordingly
> >> by adding respective error logs.
> >
> > Please take a look at the
> > Documentation/process/submitting-patches.rst. This is not the expected
> > style of commit messages.
> >
>
> Thanks Dmitry ! Gone through the link and tried to align to the
> guidance. I will be adding into the actual upload in V3.

Let me quote the relevant part for you:

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

>
> When we run scan test for i2c devices, we see transfer failures instead
> of NACK. This is wrong because there is no data transfer failure but
> it's a slave response to the i2c master controller.
>
> This change correctly identifies NACK error. Also adds support for other
> protocol errors like BUS_PROTO and ARB_LOST. This helps to exactly know
> the response on the bus.
>
> Function geni_i2c_gpi_xfer() gets called for any i2c GSI mode transfer
> and waits for the response as success OR failure. If slave is not
> present OR NACKing, GSI generates an error interrupt which calls ISR and
> it further calls gpi_process_xfer_compl_event(). Now
> dmaengine_desc_callback_invoke() will call i2c_gpi_cb_result() where we
> have added parsing status parameters to identify respective errors.
>
> >>
> >> During geni_i2c_gpi_xfer(), we should expect callback param as a
> >> transfer result. For that we have added a new structure named
> >> gpi_i2c_result, which will store xfer result.
> >>
> >> Upon receiving an interrupt, gpi_process_xfer_compl_event() will
> >> store transfer result into status variable and then call the
> >> dmaengine_desc_callback_invoke(). Hence i2c_gpi_cb_result() can
> >> parse the respective errors.
> >>
> >> while parsing error from the status param, use FIELD_GET with the
> >
> > Sentences start with the uppercase letter.
>
> Sure, will do while/While change. Will take care in next patch.
>
> >
> >> mask instead of multiple shifting operations for each error.
> >
> >
> >>
> >> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> >> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> ---
> >> ---
> Sorry, i Missed to add V1 -> V2 : will add into next patch upload.
> >> - Commit log changed we->We.
> >> - Explained the problem that we are not detecing NACK error.
> >> - Removed Heap based memory allocation and hence memory leakage issue.
> >> - Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
> >> - Changed commit log to reflect the code changes done.
> >> - Removed adding anything into struct gpi_i2c_config and created new structure
> >>    for error status as suggested by Bjorn.
> >> ---
> >>   drivers/dma/qcom/gpi.c             | 12 +++++++++++-
> >>   drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++----
> >>   include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
> >>   3 files changed, 36 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> >> index 1c93864e0e4d..e3508d51fdc9 100644
> >> --- a/drivers/dma/qcom/gpi.c
> >> +++ b/drivers/dma/qcom/gpi.c
> >> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
> >>          dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
> >>
> >>          dma_cookie_complete(&vd->tx);
> >> -       dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> >> +       if (gchan->protocol == QCOM_GPI_I2C) {
> >> +               struct dmaengine_desc_callback cb;
> >> +               struct gpi_i2c_result *i2c;
> >> +
> >> +               dmaengine_desc_get_callback(&vd->tx, &cb);
> >> +               i2c = cb.callback_param;
> >> +               i2c->status = compl_event->status;
> >> +               dmaengine_desc_callback_invoke(&cb, &result);
> >> +       } else {
> >> +               dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> >
> > Is there such error reporting for SPI or UART protocols?
> >
>
> Such errors are not there for SPI or UART because
> NACK/BUS_PROTO/ARB_LOST errors are protocol specific errors. These error
> comes in
> middle of the transfers. As these are like expected protocol errors
> depending on the slave device/s response.

Yes, these particular errors are I2C specific. My question was more
generic: do we have any similar errors for SPI or UART GENI protocols
that we should report from GPI to the corresponding driver?

>
> >> +       }
> >>
> >>   gpi_free_desc:
> >>          spin_lock_irqsave(&gchan->vc.lock, flags);
> >> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> >> index da94df466e83..36a7c0c0ff54 100644
> >> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> >> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> >> @@ -66,6 +66,7 @@ enum geni_i2c_err_code {
> >>          GENI_TIMEOUT,
> >>   };
> >>
> >> +#define I2C_DMA_TX_IRQ_MASK    GENMASK(12, 5)
> >>   #define DM_I2C_CB_ERR          ((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
> >>                                                                          << 5)
> >>
> >> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
> >>          struct dma_chan *rx_c;
> >>          bool gpi_mode;
> >>          bool abort_done;
> >> +       struct gpi_i2c_result i2c_result;
> >>   };
> >>
> >>   struct geni_i2c_desc {
> >> @@ -484,9 +486,18 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >>
> >>   static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
> >>   {
> >> -       struct geni_i2c_dev *gi2c = cb;
> >> -
> >> -       if (result->result != DMA_TRANS_NOERROR) {
> >> +       struct gpi_i2c_result *i2c_res = cb;
> >> +       struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
> >> +       u32 status;
> >> +
> >> +       status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
> >> +       if (status == BIT(NACK)) {
> >> +               geni_i2c_err(gi2c, NACK);
> >> +       } else if (status == BIT(BUS_PROTO)) {
> >> +               geni_i2c_err(gi2c, BUS_PROTO);
> >> +       } else if (status == BIT(ARB_LOST)) {
> >> +               geni_i2c_err(gi2c, ARB_LOST);
> >> +       } else if (result->result != DMA_TRANS_NOERROR) {
> >>                  dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> >>                  gi2c->err = -EIO;
> >>          } else if (result->residue) {
> >> @@ -568,7 +579,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >>          }
> >>
> >>          desc->callback_result = i2c_gpi_cb_result;
> >> -       desc->callback_param = gi2c;
> >> +       desc->callback_param = &gi2c->i2c_result;
> >>
> >>          dmaengine_submit(desc);
> >>          *buf = dma_buf;
> >> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> >> index 6680dd1a43c6..f585c6a35e51 100644
> >> --- a/include/linux/dma/qcom-gpi-dma.h
> >> +++ b/include/linux/dma/qcom-gpi-dma.h
> >> @@ -80,4 +80,14 @@ struct gpi_i2c_config {
> >>          bool multi_msg;
> >>   };
> >>
> >> +/**
> >> + * struct gpi_i2c_result - i2c transfer status result in GSI mode
> >> + *
> >> + * @status: store txfer status value as part of callback
> >> + *
> >> + */
> >> +struct gpi_i2c_result {
> >> +       u32 status;
> >> +};
> >> +
> >>   #endif /* QCOM_GPI_DMA_H */
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

