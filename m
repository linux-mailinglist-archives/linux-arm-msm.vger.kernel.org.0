Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1AB46E4AEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjDQOIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 10:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjDQOIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 10:08:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34321A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:07:45 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so20321947a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681740461; x=1684332461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moL+4Bl3gFWXEYHuDwZ5rfkHMK20tDKYmlXyWn8rpAc=;
        b=DHkV6cbgYjGHmPy8kYvBirFJJbv/e21aF7Mmd4mvsdYiG+qGONpZnx2M6TWlToNGni
         AhAoliZVBjRJ7m/5gUPa3Y4Omml05X/jxLwBfjAX8amVSPMDATemwjywZJueMDJiwtlg
         zr8oEUyn3/0vv1tHRU2TsNyrwfkd8vncJdJT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681740461; x=1684332461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moL+4Bl3gFWXEYHuDwZ5rfkHMK20tDKYmlXyWn8rpAc=;
        b=e4fLgUo+xICRc4QwMJmNXQrt5MA6rkjLIey+dMxK8cvnZhzLEDMWyc6DcKGXIovyDY
         XHEsuna1TW+iy8vorFanxJS2xJkfqvEi2EO1CPf2dmA+6Z+/cS3T/kgU0a17Mw4lJB0Y
         lE7a7OwRS0XUmj/OcBtpxpSN+LxRdUNGt96djWTPLAVKTUrgaXQ5ItNLhB0n50o2ldTz
         d76Hr/fcH9pfujPUW4KBbJPz2elAR6NCA65adOb/BVo3z5hdyORvZf5DGcpzEGygqq1y
         74yffHkDYEgr94xXCVoMeuEMgF/dYfYHJCUpwfpNMu0n/f4kGiPXwHLahphIrYJNlb0v
         DLQw==
X-Gm-Message-State: AAQBX9cC2R3D8H+39g68FnEkxNzikBKSZhKVntnQQVQHeW7H86GQhwwu
        2G9xiL93DhAGGLLRhM+pw36Z9sZTujJcTPDoVe5LpA==
X-Google-Smtp-Source: AKy350ZKTGvNUXdyxGNFFC0HuK4WQRgH/2Edj/FFJyzHtqHAdAcCCr9RhEHjnp35PXPpGrbYxrcKbg==
X-Received: by 2002:aa7:c90e:0:b0:4fa:785d:121 with SMTP id b14-20020aa7c90e000000b004fa785d0121mr13430198edt.16.1681740461561;
        Mon, 17 Apr 2023 07:07:41 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id ca15-20020aa7cd6f000000b0050477decdfasm5835166edb.3.2023.04.17.07.07.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:07:41 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id he13so18855933wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:07:41 -0700 (PDT)
X-Received: by 2002:a7b:c40f:0:b0:3f1:6757:6239 with SMTP id
 k15-20020a7bc40f000000b003f167576239mr1471017wmi.6.1681740460987; Mon, 17 Apr
 2023 07:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <1681481153-24036-1-git-send-email-quic_vnivarth@quicinc.com>
 <1681481153-24036-4-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=VKY-0vX271G+EQQ5kC3gTqpPPyTGE0xHWPBncVUhZufQ@mail.gmail.com> <30a752c9-3ea0-43d3-959a-da2e8b526cb4@sirena.org.uk>
In-Reply-To: <30a752c9-3ea0-43d3-959a-da2e8b526cb4@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 17 Apr 2023 07:07:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VCbcUnf42tK-HV8j=71BXXytxku_0rGjKyhyR3WG4SUw@mail.gmail.com>
Message-ID: <CAD=FV=VCbcUnf42tK-HV8j=71BXXytxku_0rGjKyhyR3WG4SUw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] spi: spi-qcom-qspi: Add DMA mode support
To:     Mark Brown <broonie@kernel.org>
Cc:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
        mka@chromium.org, swboyd@chromium.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 17, 2023 at 5:12=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Apr 14, 2023 at 03:05:58PM -0700, Doug Anderson wrote:
>
> > Having alignment requirements like this doesn't seem like it should be
> > that unusual, though, and that's why it feels like the logic belongs
> > in the SPI core. In fact, it seems like this is _supposed_ to be
> > handled in the SPI core, but it isn't? In "spi.h" I see
> > "dma_alignment" that claims to be exactly what you need. As far as I
> > can tell, though, the core doesn't use this? ...so I'm kinda confused.
> > As far as I can tell this doesn't do anything and thus anyone setting
> > it today is broken?
>
> SPI consumers should only be providing dmaable buffers.

Ah, I think I see.

1. In "struct spi_transfer" the @tx_buf and @rx_buf are documented to
have "dma-safe memory".

2. On ARM64 anyway, I see "ARCH_DMA_MINALIGN" is 128.

So there is no reason to do any special rules to force alignment to
32-bytes because that's already guaranteed. Presumably that means you
can drop a whole pile of code and things will still work fine.

-Doug
