Return-Path: <linux-arm-msm+bounces-13593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA81874B58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 10:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92FE628284B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0089342047;
	Thu,  7 Mar 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzbQa4Uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7EC657DA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805238; cv=none; b=LLP/eTfhdNd08XlvdTm2xDX/iRU+hVSG6JtRV44B4sV/BAmwpQYoFLrqiIk9JLF5MVgKf0VoFDOal1ezGEvSCV3DFfRfmXGjWoUo8mt8hO9uh+3Ra9XFkq+B25Yaj87FxJZPcuDdZ7BThResGuzhT6b/i+T/SrDSSkIq7UFd1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805238; c=relaxed/simple;
	bh=a+Kpvmvux957RfigtOoZBbVAV0mHWeC3USNGLdN/bxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLvb9ZzxX8f4ZFkmTIRPB/nmys75cEzyOHkbHfRaelGeJgK/41qY4qvhRyaUTlnVaURy0RKBr1vtRwvAnZbCC9QE641cjJWWdMzH2FHoJg04dDCDV07hUil6AlHMQEBgtIqTKThiiSkFxvstASccnu1p732yJq8FgmJ3bBja7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzbQa4Uv; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso643273276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 01:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709805236; x=1710410036; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Dz6YwFIubuJUHdtsTVCF50uZcHNIYtCL/HKdYW8aWk=;
        b=mzbQa4UvmS5YWZS42n5hKVzVcnnY2VS2Q2XyVvyEHSn3/nVTr5IkV2YsAQW5DiU5qX
         3cx3U4ARyhzVIrXJl1Y8iU8GAenlCdrG656uuZDAn8EqSc9jlsP1Dzkt4UW1YS6DUnod
         Ln/yOpLBfyQR2FTlqj5bufUu+XG/Een447HqVfo5cNSiKk1Pp3icaRtv+4bqXa70CM0o
         anzNc5G2RPmqL39Y5hsH6wSORmVqd7mimvCEPFeaztSQr3Tpu3kFK3cJ+BaQdMD20gyX
         Xdc7JY4807q0Q/e659MO6w3bc5+R1nZzQDTL8poLUWbc5rEmv/3K8Nev+xKpGJPc0A5T
         +IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709805236; x=1710410036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Dz6YwFIubuJUHdtsTVCF50uZcHNIYtCL/HKdYW8aWk=;
        b=d9ygfnCVZIe9N/sIjLzIjAE4mAeRJuHcx4hWEbTxdNW6D9b9XDzgRGp9RF7RShZqmX
         kimfhaj2tf3I7HYu8WRr0ceZc4r5jb3KTv1oo7PtWYiFKu5IbCqcLOwvQPHg9gGWvw2n
         XokQKBQw4hgd9pIpAVRhwtlkD2HedJ8C/h5MtoJ/V9XvbgKG09CigYfVlwnV7xoUEfIn
         pgLXFQ0OQsz2PdSqeFiP6oqK66sfqJyK+qTob4KFvBfRRCPqtN35NDYlgTyvmozD2ZbB
         Xk0r/u0M3xaksWVgBzfrnHRYa1wcdxbYo1MIhshcJ3YO+/d3UJSswzsuyjvW6tzgI+uB
         N0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXmvj+4ptktcSsgq9bCr7PQGsnMtVIZ+wgU18lObLTrDhRw0dg4KlECqhrHAtURRurrRF43qEEkTODz+NGQEI9uA3qDSr991Ec+DoJkeQ==
X-Gm-Message-State: AOJu0YyB5aqpe/TxvWZcH5Z8TtxemtYDKNltJm2cB1FP66UqWIRi2sti
	3dWdbE9GY1VBiW/Rq2jT/Xr5yDKudICbf0vh4NeQfssmnSV9c+zx/jYEh2Hr+TbZcus435vehVW
	qj9Yjh+IUoD1IJmYlVVeKHX2U2Jk+4bXPrreqzQ==
X-Google-Smtp-Source: AGHT+IGr6dbMWDZca7KXM/u/Stf8BFJYujevzJdkG/FmGUn8C5zlllKMqaL/ZsOWvc3SXl30Aicb2PzR+AFkOHln20E=
X-Received: by 2002:a25:d6c2:0:b0:dc7:4c92:16a3 with SMTP id
 n185-20020a25d6c2000000b00dc74c9216a3mr16265517ybg.27.1709805235602; Thu, 07
 Mar 2024 01:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307093605.4142639-1-quic_msavaliy@quicinc.com>
In-Reply-To: <20240307093605.4142639-1-quic_msavaliy@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 11:53:44 +0200
Message-ID: <CAA8EJprndszVSjAVs_UzAjhb+x1B1Of4JCkygZ=8kgzuY2RwCQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org, 
	andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 11:36, Mukesh Kumar Savaliya
<quic_msavaliy@quicinc.com> wrote:
>
> We are seeing transfer failure instead of NACK error for simple
> device scan test.Ideally it should report exact error like NACK
> if device is not present.
>
> We may also expect errors like BUS_PROTO or ARB_LOST, hence we are
> adding such error support in GSI mode and reporting it accordingly
> by adding respective error logs.

Please take a look at the
Documentation/process/submitting-patches.rst. This is not the expected
style of commit messages.

>
> During geni_i2c_gpi_xfer(), we should expect callback param as a
> transfer result. For that we have added a new structure named
> gpi_i2c_result, which will store xfer result.
>
> Upon receiving an interrupt, gpi_process_xfer_compl_event() will
> store transfer result into status variable and then call the
> dmaengine_desc_callback_invoke(). Hence i2c_gpi_cb_result() can
> parse the respective errors.
>
> while parsing error from the status param, use FIELD_GET with the

Sentences start with the uppercase letter.

> mask instead of multiple shifting operations for each error.


>
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> ---
> - Commit log changed we->We.
> - Explained the problem that we are not detecing NACK error.
> - Removed Heap based memory allocation and hence memory leakage issue.
> - Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
> - Changed commit log to reflect the code changes done.
> - Removed adding anything into struct gpi_i2c_config and created new structure
>   for error status as suggested by Bjorn.
> ---
>  drivers/dma/qcom/gpi.c             | 12 +++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++----
>  include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
>  3 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 1c93864e0e4d..e3508d51fdc9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>         dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>
>         dma_cookie_complete(&vd->tx);
> -       dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +       if (gchan->protocol == QCOM_GPI_I2C) {
> +               struct dmaengine_desc_callback cb;
> +               struct gpi_i2c_result *i2c;
> +
> +               dmaengine_desc_get_callback(&vd->tx, &cb);
> +               i2c = cb.callback_param;
> +               i2c->status = compl_event->status;
> +               dmaengine_desc_callback_invoke(&cb, &result);
> +       } else {
> +               dmaengine_desc_get_callback_invoke(&vd->tx, &result);

Is there such error reporting for SPI or UART protocols?

> +       }
>
>  gpi_free_desc:
>         spin_lock_irqsave(&gchan->vc.lock, flags);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..36a7c0c0ff54 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -66,6 +66,7 @@ enum geni_i2c_err_code {
>         GENI_TIMEOUT,
>  };
>
> +#define I2C_DMA_TX_IRQ_MASK    GENMASK(12, 5)
>  #define DM_I2C_CB_ERR          ((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
>                                                                         << 5)
>
> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>         struct dma_chan *rx_c;
>         bool gpi_mode;
>         bool abort_done;
> +       struct gpi_i2c_result i2c_result;
>  };
>
>  struct geni_i2c_desc {
> @@ -484,9 +486,18 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>
>  static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  {
> -       struct geni_i2c_dev *gi2c = cb;
> -
> -       if (result->result != DMA_TRANS_NOERROR) {
> +       struct gpi_i2c_result *i2c_res = cb;
> +       struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
> +       u32 status;
> +
> +       status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
> +       if (status == BIT(NACK)) {
> +               geni_i2c_err(gi2c, NACK);
> +       } else if (status == BIT(BUS_PROTO)) {
> +               geni_i2c_err(gi2c, BUS_PROTO);
> +       } else if (status == BIT(ARB_LOST)) {
> +               geni_i2c_err(gi2c, ARB_LOST);
> +       } else if (result->result != DMA_TRANS_NOERROR) {
>                 dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>                 gi2c->err = -EIO;
>         } else if (result->residue) {
> @@ -568,7 +579,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         }
>
>         desc->callback_result = i2c_gpi_cb_result;
> -       desc->callback_param = gi2c;
> +       desc->callback_param = &gi2c->i2c_result;
>
>         dmaengine_submit(desc);
>         *buf = dma_buf;
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..f585c6a35e51 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -80,4 +80,14 @@ struct gpi_i2c_config {
>         bool multi_msg;
>  };
>
> +/**
> + * struct gpi_i2c_result - i2c transfer status result in GSI mode
> + *
> + * @status: store txfer status value as part of callback
> + *
> + */
> +struct gpi_i2c_result {
> +       u32 status;
> +};
> +
>  #endif /* QCOM_GPI_DMA_H */
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
>


-- 
With best wishes
Dmitry

