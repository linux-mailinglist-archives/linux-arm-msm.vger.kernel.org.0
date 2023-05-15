Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB7C703273
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 18:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242532AbjEOQNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 12:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242523AbjEOQNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 12:13:42 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C5126BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 09:13:40 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7577ef2fa31so2730966385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684167218; x=1686759218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csg34yXmywWZKLFZGnKi20BPomzFwSWjkUKyBVPL+Vk=;
        b=mruUlVh7mNFE/ws9ZUcx/JISQ7Laqd4dwFX0BTQVKIxLjQnjquH/OQ9NL5mAnYC65F
         qGySTjF3DjBLlr6Rm1L5gws4KO1MX6qoyWiBkPPkwKUlbS9fsKANzJA/Pnt6j83fmQpo
         6dmQXb2samB+50dDwoNIV9bLv8ahrFJEI44cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684167218; x=1686759218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Csg34yXmywWZKLFZGnKi20BPomzFwSWjkUKyBVPL+Vk=;
        b=d6OgXF4d8HI5rsm8g9TFrZ6458tkoxvglQzFjRX293fGtW3ecZqP3wA18lWiHHRAkT
         jGjwmDNvOa8m7Y5FOwgCn4I7boZ+wrBmqTHVpfhuN4EdH/mz6hFVFcg8QqboAhI/jh5I
         oJZCcQFu2xZs7YGE3kwuOw63zKlvgsjuemwTY7lYxj4ORFSRbrR4DSTEUgXKieN1395E
         SUMbpVsyVXvQumcVxiY/avU4Zlixfw0rCn3pQqISysKAAac5hunZSunUMSVT2TsMzvxK
         3Q7SU/0o/o6+0JElYCCJ9TNIHdQ8MlCSw8Yr1riJhLEoji1OLlygvR/XSvtrlKySb6ID
         s1sA==
X-Gm-Message-State: AC+VfDxEu5HxOUKN+71QxDk8zEFKV26ZYLj1HFbDczj785psC0o3Nquc
        Ie3/cFjFcmVsDaV5X4bmXYSSBUIHlNdqAn17kHE=
X-Google-Smtp-Source: ACHHUZ7kwr2G/FTR6mb6+kcINfQ00lyxkhW0i16pumKKrVbKhBhAdppbtzArZfkAFDqF5Zv3YMq1Ww==
X-Received: by 2002:a05:622a:243:b0:3e2:6a40:5631 with SMTP id c3-20020a05622a024300b003e26a405631mr59266480qtx.10.1684167218134;
        Mon, 15 May 2023 09:13:38 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id fv10-20020a05622a4a0a00b003f3957f0fcbsm5465633qtb.96.2023.05.15.09.13.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:13:37 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3f38824a025so1504171cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 09:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:3ed:6bde:9681 with SMTP id
 v22-20020a05622a145600b003ed6bde9681mr1303834qtx.0.1684167216167; Mon, 15 May
 2023 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <1683911265-3395-1-git-send-email-quic_vnivarth@quicinc.com> <1683911265-3395-3-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1683911265-3395-3-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 May 2023 09:13:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WbMFDsC7dVjLNrtwi-hDEbSx9R8XzVGFW902OSKSFWjA@mail.gmail.com>
Message-ID: <CAD=FV=WbMFDsC7dVjLNrtwi-hDEbSx9R8XzVGFW902OSKSFWjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spi-geni-qcom: Do not do DMA map/unmap inside
 driver, use framework instead
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com, quic_ptalari@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 12, 2023 at 10:07=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> @@ -836,35 +858,24 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>         geni_se_setup_m_cmd(se, m_cmd, FRAGMENTATION);
>
>         if (mas->cur_xfer_mode =3D=3D GENI_SE_DMA) {
> +               dma_addr_t dma_ptr_sg;
> +               unsigned int dma_len_sg;
> +
>                 if (m_cmd & SPI_RX_ONLY) {
> -                       ret =3D  geni_se_rx_dma_prep(se, xfer->rx_buf,
> -                               xfer->len, &mas->rx_se_dma);
> -                       if (ret) {
> -                               dev_err(mas->dev, "Failed to setup Rx dma=
 %d\n", ret);
> -                               mas->rx_se_dma =3D 0;
> -                               goto unlock_and_return;
> -                       }
> +                       dma_ptr_sg =3D sg_dma_address(xfer->rx_sg.sgl);
> +                       dma_len_sg =3D sg_dma_len(xfer->rx_sg.sgl);
> +                       geni_se_rx_init_dma(se, &dma_ptr_sg, dma_len_sg);

nit: probably don't need local variables if you change patch set #1
like I suggested and don't pass in a pointer for the iova.


One last question: should you call:

dma_set_max_seg_size(dev, INT_MAX)

...in your probe function? I don't think you have any limitations of
maximum segment size, right? Right now if you don't set anything it
looks as if it considers your max to be 64K. That would cause the SPI
framework to break things up into multiple chunks which would make you
fall back to FIFO mode, right?

Other than that this looks good to me.

-Doug
