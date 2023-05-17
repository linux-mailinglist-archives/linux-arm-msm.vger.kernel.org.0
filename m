Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D60F706B00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 16:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjEQOXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 10:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjEQOXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 10:23:40 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92689422D
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 07:23:39 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-61b79b93ac5so3576826d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684333417; x=1686925417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3rLC5o1yC5tyPBlrF7L0OcHbxmqALVQTPYwjd+0mhk=;
        b=ewkfbRVqV5cyOI09+i9rNtwAtAxUzomDMpEnBivHBHECvh1h9nHT3XfQrrJVL+dQRe
         7XKCse198NBfPCc1P0EyijpIgQy2/QIfonW2bj/xoEivf5y8U2l+kBlzSPWgHZfO1QIp
         MhZVln2mo8OWaUc5+S0TBqtN5L7YB8gNDCXPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684333417; x=1686925417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3rLC5o1yC5tyPBlrF7L0OcHbxmqALVQTPYwjd+0mhk=;
        b=X3UVoCDCiuAhvF1HRHK/dvDWh7hnbc8hvwcmvGUS/Nlv0wrw+PAF2+dC8MOnBzHmxd
         3drcqJxvn1x45H2+TFbJiElSdG7gwDNGZU58EpmrZ/WM2AqAX+r31gMj0ra+DiCkYJz0
         CEtG8SIsPvWYhbMnMfjE+R+K8U7Koi1OzkM7j4GZkAP12ucbdXnI5IPFXZdufzrIPYT0
         jaMN+HXpqqJkxULBnoiLhETjRQqCum7Y9suC0q46k97QDu98zsneqWKvMXpmJ09KUqi8
         AnZ0Eu0PCnlFinfTkzxITUvwcEdOJLE95NXolk03lJu6PJ0UxFlJx87FfDIOBKrf3jMD
         qDYg==
X-Gm-Message-State: AC+VfDyqZwIJhPs292x20kxaf2xmBt3GQfgcISD5cegPggEWbQxIeV4Z
        fJAwWGl2h9O9IRma2Zf325uItZFXZaB2oliYhzE=
X-Google-Smtp-Source: ACHHUZ7sxhGHqWml48YFyXMTOXsjyV8CerJYTtiSmIkPq2o5EhCo6GgcM15KMM9lrUsp1mMAiXL5Vg==
X-Received: by 2002:ad4:5c6c:0:b0:619:c50b:8dc5 with SMTP id i12-20020ad45c6c000000b00619c50b8dc5mr64088974qvh.49.1684333417262;
        Wed, 17 May 2023 07:23:37 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id i11-20020ad44bab000000b00623839cba8csm699368qvw.44.2023.05.17.07.23.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:23:36 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f396606ab0so188261cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 07:23:35 -0700 (PDT)
X-Received: by 2002:ac8:5c8c:0:b0:3e0:c2dd:fd29 with SMTP id
 r12-20020ac85c8c000000b003e0c2ddfd29mr427162qta.4.1684333415183; Wed, 17 May
 2023 07:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <1683911265-3395-1-git-send-email-quic_vnivarth@quicinc.com>
 <1683911265-3395-3-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=WbMFDsC7dVjLNrtwi-hDEbSx9R8XzVGFW902OSKSFWjA@mail.gmail.com> <27ed4b11-14bf-081f-619e-75789d8caced@quicinc.com>
In-Reply-To: <27ed4b11-14bf-081f-619e-75789d8caced@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 May 2023 07:23:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xg4svcZrE+NH-MWJUumDThiYxjACFvCs+YVLZDiE5YvA@mail.gmail.com>
Message-ID: <CAD=FV=Xg4svcZrE+NH-MWJUumDThiYxjACFvCs+YVLZDiE5YvA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 17, 2023 at 5:17=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> > One last question: should you call:
> >
> > dma_set_max_seg_size(dev, INT_MAX)
> >
> > ...in your probe function? I don't think you have any limitations of
> > maximum segment size, right? Right now if you don't set anything it
> > looks as if it considers your max to be 64K. That would cause the SPI
> > framework to break things up into multiple chunks which would make you
> > fall back to FIFO mode, right?
>
>
> Actually we would need to call:
>
> dma_set_max_seg_size(dev->parent, INT_MAX)
>
> Please note that in probe()
>
> spi->dma_map_dev =3D dev->parent;
>
> and in __spi_map_msg()
>
> tx_dev =3D ctlr->dma_map_dev;
>
> ret =3D spi_map_buf(ctlr, tx_dev, &xfer->tx_sg,...
>
>
> Since the dev->parent is QUP containing other SEs and its max_seg_size
> seems to be getting set from elsewhere than code (perhaps kernel
> scripts) it seemed safer not to modify that.
>
> So I made below change and uploaded v2...
>
> spi->max_dma_len =3D 0xffff0; /* 24 bits for tx/rx dma length */
>
> which actually doesnt help much because spi_map_buf() picks the lower of
> these 2 but added it anyway
>
> desc_len =3D min_t(size_t, max_seg_size, ctlr->max_dma_len);

OK, fair enough.


> Any case as next step we will look into scatter list support to DMA; and
> practically we may not have transfers over 64KB, so its ok for now?

I think it's OK for now, especially since you do properly fall back to
FIFO in cases that aren't handled. Thanks!

-Doug
