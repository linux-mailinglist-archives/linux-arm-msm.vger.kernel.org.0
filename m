Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CBC7620BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 19:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbjGYR6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 13:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjGYR62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 13:58:28 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E944E1BE
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:27 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5221cf2bb8cso5266039a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690307906; x=1690912706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaGwDr9AOa0YcSew23uPTw15yDAJZfLiLPUyBUI4SsE=;
        b=X7k/1bByTsLMMhsIwtBnrzwdTCTf1IwGXQYG+xZIdDX7M+VLZGYvQNswEkvA6mhFdV
         dL/LmPdIgTKidtd2KTNYb+ktJISP/CDARSUzo4MPWb8eNpO2eWxZnt13WvGEo9J+jSs5
         R4bek6Xcn3mh2cXlvPKHPZtc2I3bkF5Fz+IXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690307906; x=1690912706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaGwDr9AOa0YcSew23uPTw15yDAJZfLiLPUyBUI4SsE=;
        b=RJ0Ls197hmY5VKzpfCujrQUQpa4jpiLdYNEJQ8Ft7BwL4TwSKFp29FzcpS4NS1H0pC
         kVRvONZ74qfT0v3N3NbwLV+PFVNy/bg6HghhF24MlEfOoCYRGkDzxdeaqpP+3zeoCXqb
         l36kF0TpS6cyhpjEA4PeikXOEC351y3qbpVJkeS53ftfLIDnR9feNESDsCFGI0qRKPad
         WIL3+9gH2MfupX0p4p4mYD5Vv5b4Cd0cRkx1/gra9UdYzRZpF/6+30P3PlGDRbanus+T
         jQTYpHND6/wgobxjik3loi01dxyzL6s5WRaXrMcSkVoEdl2vvdCter7kBw0hya+RwPJX
         R6Dg==
X-Gm-Message-State: ABy/qLYFKgGxgMr/HYfjX8+85YSPT2GSZp75gVQcqMWJrdOH0UkNWf8P
        uvTNJTE8xqLvBPb/91bO1E2MC7yzcZWYH2tEdpGlKvwL
X-Google-Smtp-Source: APBJJlHbriYZHCxqY4MpMXxaWeF5BPqac4RaxiJ5g2igIfKqNoBGCcyyDGynNjjXY/wY3D4pH6doyA==
X-Received: by 2002:a17:907:a064:b0:982:7545:efb6 with SMTP id ia4-20020a170907a06400b009827545efb6mr13494336ejc.66.1690307906117;
        Tue, 25 Jul 2023 10:58:26 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id p24-20020a170906a01800b00992f2befcbcsm8498285ejy.180.2023.07.25.10.58.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 10:58:25 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5223910acf2so1690a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:25 -0700 (PDT)
X-Received: by 2002:a50:d6de:0:b0:522:4741:d992 with SMTP id
 l30-20020a50d6de000000b005224741d992mr145884edj.4.1690307905506; Tue, 25 Jul
 2023 10:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <1690285689-30233-1-git-send-email-quic_vnivarth@quicinc.com> <1690285689-30233-4-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1690285689-30233-4-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 10:58:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZFXiT6R=RBy=Mj4TEewHPYpz9cG6wE_SeE8=KrBVVVg@mail.gmail.com>
Message-ID: <CAD=FV=VZFXiT6R=RBy=Mj4TEewHPYpz9cG6wE_SeE8=KrBVVVg@mail.gmail.com>
Subject: Re: [PATCH 3/4] spi: spi-qcom-qspi: Call dma_wmb() after setting up descriptors
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com, dan.carpenter@linaro.org
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

Hi,

On Tue, Jul 25, 2023 at 4:48=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> After setting up dma descriptors and before initiaiting dma transfer, cal=
l
> dma_wmb() to ensure all writes go through.
> This doesn't fix any reported problem but is added for safety.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This looks right to me.

Fixes: b5762d95607e ("spi: spi-qcom-qspi: Add DMA mode support")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
