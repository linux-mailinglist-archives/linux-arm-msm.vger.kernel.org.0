Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6BD6EB09E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 19:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjDURfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 13:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjDURfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 13:35:24 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30550903A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 10:35:23 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-74d0d5126baso225707985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682098521; x=1684690521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXK86wEYiVwAAffwU2RrQU5w4OvwpRlSMCsUx9Wsyw8=;
        b=g9RUci6GfdPCRoHhsbDogJbyd6H26hRCBNTfUpAMYmjglXbDHoKuOkyTind4TekQ1f
         Di4L3ubZgiLXwC7t65MxULp5ienXXpdMjgSrLtinWXnrgCIfAdMMa7W9CRvhHGMdRuML
         HZrJEnnJSZi6giQJZwFOdwPa9KfpvZ7oLFeiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682098521; x=1684690521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXK86wEYiVwAAffwU2RrQU5w4OvwpRlSMCsUx9Wsyw8=;
        b=mDk9TFhwt7wg8gVAUhvcgx27AbYDIHp2XCYQERhcu+CG0gLMmOH1eTTGOjbpuwnzBV
         7FJjvX0wyYom2RDgC6IyZeWmkjdcT+fsObrJfIEX6pV0/N3n/3Erpz1V1pfuSxQjHmpn
         Jl0TOUvtg0oNEwMyM6QdXm84Ffb5FA/nBQgsSxD7xrJq3Mk9G1wD8HEmdjuxmyfesHQw
         Gpcsp1ozULsZNpzNq7/tA7ExrCjKq40Dt3QyOUYy4c8xj4b1jvWn96J3YtRW7LrKH9qi
         pT//jTuOeJWT0/2c3kxUoBegq/1KrM/6i+cX/u3UhLoOM3bHkp2c1IK/7GziHsMH+GRn
         5gLQ==
X-Gm-Message-State: AAQBX9cv+q8USxj/88gDxlF82VuxelH9kk2L9+QBluit7sWW2C93aSVj
        DSgsn/f1+yFi6XKGa3EWRslB8zOdzYASAmNbfOg=
X-Google-Smtp-Source: AKy350bkA2kZPXGVLsK3FrEcu5EL/mjXqvh16ZfuAKNDOl1g3hCiZh5Vv4UEZ6UKMn1yVBViyQ98Ag==
X-Received: by 2002:a05:622a:50f:b0:3eb:8f6a:a11 with SMTP id l15-20020a05622a050f00b003eb8f6a0a11mr8302860qtx.16.1682098521330;
        Fri, 21 Apr 2023 10:35:21 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id dz20-20020a05620a2b9400b0074dd97b28b3sm1461872qkb.113.2023.04.21.10.35.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 10:35:17 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3ef36d814a5so1199361cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 10:35:17 -0700 (PDT)
X-Received: by 2002:ac8:588f:0:b0:3ef:26ec:f27a with SMTP id
 t15-20020ac8588f000000b003ef26ecf27amr395030qta.13.1682098516847; Fri, 21 Apr
 2023 10:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <1681996394-13099-1-git-send-email-quic_vnivarth@quicinc.com>
 <1681996394-13099-6-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=VU9Zdk2wz=90cjmuBWxaVz9w+UxzrTtW_ny-jrwVLV3w@mail.gmail.com> <7a6fe89b-5898-08d3-6c44-2cfc9d8fae7a@quicinc.com>
In-Reply-To: <7a6fe89b-5898-08d3-6c44-2cfc9d8fae7a@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 21 Apr 2023 10:35:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_7t4H9nXy6Ku49qLqbhZ02K-_XQv_Ssgkp26s3LyDMw@mail.gmail.com>
Message-ID: <CAD=FV=U_7t4H9nXy6Ku49qLqbhZ02K-_XQv_Ssgkp26s3LyDMw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] spi: spi-qcom-qspi: Add DMA mode support
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
        mka@chromium.org, swboyd@chromium.org, quic_vtanuku@quicinc.com
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

On Fri, Apr 21, 2023 at 9:58=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Hi,
>
> Thanks a lot for the review and inputs...
>
>
> On 4/20/2023 10:49 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 20, 2023 at 6:13=E2=80=AFAM Vijaya Krishna Nivarthi
> > <quic_vnivarth@quicinc.com> wrote:
> >> @@ -137,11 +155,29 @@ enum qspi_clocks {
> >>          QSPI_NUM_CLKS
> >>   };
> >>
> >> +enum qspi_xfer_mode {
> >> +       QSPI_FIFO,
> >> +       QSPI_DMA
> >> +};
> >> +
> >> +/*
> >> + * Number of entries in sgt returned from spi framework that-
> >> + * will be supported. Can be modified as required.
> >> + * In practice, given max_dma_len is 64KB, the number of
> >> + * entries is not expected to exceed 1.
> >> + */
> >> +#define QSPI_MAX_SG 5
> > I actually wonder if this would be more nicely done just using a
> > linked list, which naturally mirrors how SGs work anyway. You'd add
> > "struct list_head" to the end of "struct qspi_cmd_desc" and just store
> > a pointer to the head in "struct qcom_qspi".
> >
> > For freeing, you can always get back the "virtual" address because
> > it's just the address of each node. You can always get back the
> > physical address because it's stored in "data_address".
> >
> Please note that in "struct qspi_cmd_desc"
>
> data_address - dma_address of data buffer returned by spi framework
>
> next_descriptor - dma_address of the next descriptor in chain
>
>
> If we were to have a linked list of descriptors that we can parse and
> free, it would require 2 more fields
>
> this_descriptor_dma - dma address of the current descriptor

Isn't that exactly the same value as "data_address"? Sure,
"data_address" is a u32 and the DMA address is 64-bits, but elsewhere
in the code you already rely on the fact that the upper bits of the
DMA address are 0 when you do:

virt_cmd_desc->data_address =3D dma_ptr


> next_descriptor_virt - virtual address of the next descriptor in chain

Right, this would be the value of the next node in the linked list,
right? So basically by adding a list_node_t you can find it easily.


> >> +static int qcom_qspi_alloc_desc(struct qcom_qspi *ctrl, dma_addr_t dm=
a_ptr,
> >> +                       uint32_t n_bytes)
> >> +{
> >> +       struct qspi_cmd_desc *virt_cmd_desc, *prev;
> >> +       dma_addr_t dma_cmd_desc;
> >> +
> >> +       /* allocate for dma cmd descriptor */
> >> +       virt_cmd_desc =3D (struct qspi_cmd_desc *)dma_pool_alloc(ctrl-=
>dma_cmd_pool,
> >> +               GFP_KERNEL, &dma_cmd_desc);
> > Remove unnecessary cast; "void *" assigns fine w/out a cast.
> >
> > Add "| GFP_ZERO" and then get rid of the need to clear the "reserved"
> > and "next_descriptor" stuff below.
> >
> I needed __GFP_ZERO to prevent a compile error, used same.

Ah, sorry. Sounds good.

-Doug
