Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6576C7620C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 19:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjGYR6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 13:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjGYR6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 13:58:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB4F2688
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:39 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fde022de07so7961609e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690307915; x=1690912715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMKz+TTfcKiqAZL/r0ZMj0g0KndoteFH21pGmnEW37o=;
        b=Fx/HAWViQYXbLSWPN4TDWSm+xGmkKajrRZBKgKzNAQjTjA4BLlOBUSFvzQHA+Dux9o
         7BLa5Lxm7a8nfFLM0/Dd3yRACTU1Kc7XCvlyX1XnSc2AgF0WU6v8qXULtFGN3S1KM894
         QxxcY3JZeihzx6NZiXJuGibHGvK4kA073L/xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690307915; x=1690912715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMKz+TTfcKiqAZL/r0ZMj0g0KndoteFH21pGmnEW37o=;
        b=CpXEcCCY4yVgxXPTDmugMhAb6v0Ax8OscntcWWKJFdAm39MbunyJYuadvXkMRMBojF
         Wz0qH1DwGRSulqXZENRjY9jDvxOFAOAWy1wx/+GIZf71ZGFl505vqOtEoV3CG5eNeYap
         9G8imLkWVOVY2RgdNcuw9lnqPqFUQCdB0nyIb4qaWQcrpCPQtTo6++4+JekE4JqYJyLR
         TtdVp0+LlW5S9cXhkgbR70I0rrmvf2NYDk58LyXWlGieFRxGxIU/KHM6Ce3jQ7fztoLo
         hu4W95SZUyQKpCOpbi5NlGdTbNFwIt4yRRg5FUutpMciUYAKiVGyXKcIweqyFjBb67Dc
         Ichg==
X-Gm-Message-State: ABy/qLZNcRHruZT33iLs9u0f8NpRfZE7YCEIl+vrbh03PLFmdWPpjX2b
        Z3L493LH7NBJk7nQpsjymfijd/vbbOfBkjTbLzmLY59h
X-Google-Smtp-Source: APBJJlFKiiXP87VXr0W3EB1V829/3H8U04B5mzJj20+gBJbneV4I+5ixi04iGB+VN+uY5BcOIHTPAQ==
X-Received: by 2002:a05:6512:31d4:b0:4fb:f2d5:467f with SMTP id j20-20020a05651231d400b004fbf2d5467fmr8972049lfe.13.1690307914858;
        Tue, 25 Jul 2023 10:58:34 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id b10-20020a170906038a00b009929ab17bdfsm8497360eja.168.2023.07.25.10.58.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 10:58:34 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so1501a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:33 -0700 (PDT)
X-Received: by 2002:a50:d6de:0:b0:51e:5773:891d with SMTP id
 l30-20020a50d6de000000b0051e5773891dmr136155edj.4.1690307913684; Tue, 25 Jul
 2023 10:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <1690285689-30233-1-git-send-email-quic_vnivarth@quicinc.com> <1690285689-30233-5-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1690285689-30233-5-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 10:58:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+LULPZW7fccz2aMqfrR=fuOvBAb7LN-mGYeppuxAQZw@mail.gmail.com>
Message-ID: <CAD=FV=X+LULPZW7fccz2aMqfrR=fuOvBAb7LN-mGYeppuxAQZw@mail.gmail.com>
Subject: Re: [PATCH 4/4] spi: spi-qcom-qspi: Add DMA_CHAIN_DONE to ALL_IRQS
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 25, 2023 at 4:48=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Add latest added DMA_CHAIN_DONE irq to QSPI_ALL_IRQS that encompasses all
> of the qspi IRQs.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I don't think this really does anything since the interrupts shouldn't
really be "hanging around" when a PIO transfer starts and that's the
only place it's used. I suspect we could actually fully remove that
bit of "Ack any previous interrupts that might be hanging around" code
and everything would be fine.

In any case, I don't have any huge objections, thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
