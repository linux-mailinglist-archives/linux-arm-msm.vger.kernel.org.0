Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB9F710E49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 16:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241432AbjEYO0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 10:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbjEYO0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 10:26:00 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42333187
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 07:25:59 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7747df5b674so185922639f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685024758; x=1687616758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIaS1CiG05qxEN3YCh4DxBPvMLd9g2DK0yZG+wFH+TY=;
        b=a4NokHhg9Bu44lIpBjF2CGfyCa3pgvGppbekAn0VvUBlzF3HVxulNaACPjqy2LmjKZ
         o7d7Rpqvj5KtbkO/Kb4k6EBUVJNjh4r5EInJASluv2YG8Y47cd5BBL7UXlYQNeGmntxJ
         Wj1iRKlRblCDY0RdMlwq1cWrb67i/DPS1i5hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685024758; x=1687616758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIaS1CiG05qxEN3YCh4DxBPvMLd9g2DK0yZG+wFH+TY=;
        b=ga3fxLzi+GT5YV2mVi2t4kR/8Zqcjiq3exF/mzR5YTO0mA+xzOYH086CsohOEh1u9e
         4HXLeLFx4wshYmxh9LaZZmx8QXJbVxBs6rIojc8X4PtLAV/n3vnnoETkdwKJ2Rrk3yZN
         OU+ASjTcYUxWNvtdut4DR4TYz6URy9cTJh8Dlot2q8YfcF6uNxi9qV8MyYIfZ9f0p4ja
         lQGBbNFhiH1GjprU6P0fsmQQ0HVHvrJ6QCtA4EvufQwfAfiAJNVu1pQkoHP6mGblmFuD
         4Fi44FpB9Xp43n5SROEsp1EBqEXit7kDf8iEQrRdodypJzY8ENo3XHgSl/kj+XMlExnw
         sv4Q==
X-Gm-Message-State: AC+VfDwR78xQuuaJEfZjjFzUo8sg2VluK1yNSepgpQJHntBa+CbM5yhN
        sq6Y7W0x+6sXCuMOmea2NjVeWJxpelTVt8fQoNU=
X-Google-Smtp-Source: ACHHUZ7yBLLdf73VDkUb5hDT/FO+EoC1LxZsp0w5cEjeNgfru7qGr8+zrGCuuQoKTK8jeSYoXbX+uw==
X-Received: by 2002:a5e:dd0b:0:b0:769:c95b:29d2 with SMTP id t11-20020a5edd0b000000b00769c95b29d2mr14993771iop.15.1685024758058;
        Thu, 25 May 2023 07:25:58 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id g65-20020a028547000000b00418849c2ea7sm459297jai.122.2023.05.25.07.25.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 07:25:57 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-338458a9304so144605ab.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 07:25:57 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d12:b0:331:aabc:c8b7 with SMTP id
 i18-20020a056e021d1200b00331aabcc8b7mr224459ila.10.1685024756622; Thu, 25 May
 2023 07:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <1682328761-17517-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1682328761-17517-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 May 2023 07:25:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdTS6UA9oSahdn8k2hKRLZo974A4b8nrDYSiTggKAv+g@mail.gmail.com>
Message-ID: <CAD=FV=WdTS6UA9oSahdn8k2hKRLZo974A4b8nrDYSiTggKAv+g@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] spi: Add DMA mode support to spi-qcom-qspi
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
        mka@chromium.org, swboyd@chromium.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, Apr 24, 2023 at 2:32=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> There are large number of QSPI irqs that fire during boot/init and later
> on every suspend/resume.
> This could be made faster by doing DMA instead of PIO.
> Below is comparison for number of interrupts raised in 2 scenarios...
> Boot up and stabilise
> Suspend/Resume
>
> Sequence   PIO    DMA
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Boot-up    69088  19284
> S/R        5066   3430
>
> Speed test results...
> spi-nor read times in sec after 2 min uptime
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PIO - Iterations-1000, min=3D3.18, max=3D3.74, avg=3D3.53
> DMA - Iterations-1000, min=3D1.21, max=3D2.28, avg=3D1.79
>
> spi-nor write times in sec after 2 min uptime
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PIO - Iterations-1000, min=3D3.20, max=3D8.24, avg=3D3.58
> DMA - Iterations-1000, min=3D1.25, max=3D5.13, avg=3D1.82
>
> Further testing performed...
> a) multiple entries in sgt (simulated by max_dma_len =3D 1024)
> b) fallback to pio (simulated by dma setup failure)
>
> Vijaya Krishna Nivarthi (5):
>   spi: dt-bindings: qcom,spi-qcom-qspi: Add iommus
>   arm64: dts: qcom: sc7180: Add stream-id of qspi to iommus
>   arm64: dts: qcom: sc7280: Add stream-id of qspi to iommus
>   arm64: dts: qcom: sdm845: Add stream-id of qspi to iommus
>   spi: spi-qcom-qspi: Add DMA mode support

Mark has landed the bindings / code changes:

b5762d95607e spi: spi-qcom-qspi: Add DMA mode support
64c05eb3a0f4 spi: dt-bindings: qcom,spi-qcom-qspi: Add iommus

...so I think the dts changes here are ready for you to land. There
are no hard dependencies here so you can land the dts without needing
the code changes.

Thanks!

-Doug
