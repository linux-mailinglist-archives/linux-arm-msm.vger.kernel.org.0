Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594537265C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 18:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjFGQVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 12:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjFGQVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 12:21:04 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93A01BFA
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 09:21:00 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-777a78739ccso207443739f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686154859; x=1688746859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaVt71w97+WhGKDKIxvnNRAAH6Y2h7zhhmiqlnDleJI=;
        b=Aa4GF3GlsrVPkr7GqCkNjaaEZJqALcp70POxtlojqv5FN+VYfCBHgHcvhjllmKVxs1
         lTCvKiniPMl9K1xxlhyarZ7CzDzDA4MtdQ14UUP0gOk+w9eg3W7FxpQggcF/gmj59N6+
         oBd1XMuWPu10gTQ86ik2L31gZ20joXVJ9kuLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686154859; x=1688746859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaVt71w97+WhGKDKIxvnNRAAH6Y2h7zhhmiqlnDleJI=;
        b=TsCqVZCzJlZUx/9sLEAXGbUQnMGUojASnSskgIrZexxoaY8XynEvDbof+S1Kb3FTK5
         1W4ZH7iE5lPOmnbL21HhIVrlN+fP+sdGQOtIBGOazcPgIBfj6ygJbMGb+RTTTiPPVakh
         A04/WrPtTSltrsyuapNDblx+Xqf3Q2BmRtpJh94SFen/6FJfOtSgQvQjsV7pdOZRG/1b
         OiDD8YY8GPoGbIvosDkdwgzC/cABsMzTpD1vSU2EmNCjzm2YTwFoQACWMU5tljkAG7rl
         xxcJRNKie88O27k/hGQVabf77FnfXxETtC+fipATiv1Ej1zdAXrkadmNUrBPE8HSljrq
         vHjA==
X-Gm-Message-State: AC+VfDzu1clRgsXnld0pvFqzunuAT4oyiYYkNzIlEXepWi8MgxqWxpCd
        x9chvzkZ4iJJetTEwbHoJaD2vWWbS7TvI10telU=
X-Google-Smtp-Source: ACHHUZ7iu9zwJZvzse9B0qSbEoxXPoc8XgbQS5MTPmDUuJVpKIR5TMWBTw6JO4BU8zbLmn/xcB6gsw==
X-Received: by 2002:a5d:9382:0:b0:776:cfd8:b44a with SMTP id c2-20020a5d9382000000b00776cfd8b44amr8722474iol.8.1686154859757;
        Wed, 07 Jun 2023 09:20:59 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id e21-20020a02a515000000b00405f36ed05asm3541029jam.55.2023.06.07.09.20.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 09:20:59 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so156565ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 09:20:59 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bc1:b0:33d:cebd:e34d with SMTP id
 x1-20020a056e021bc100b0033dcebde34dmr270004ilv.12.1686154320941; Wed, 07 Jun
 2023 09:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <1685729609-26871-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1685729609-26871-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 7 Jun 2023 09:11:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uy=ELwg2jhtFSrpndw-GxUO=0NTKotNymi3sqwG=ggnQ@mail.gmail.com>
Message-ID: <CAD=FV=Uy=ELwg2jhtFSrpndw-GxUO=0NTKotNymi3sqwG=ggnQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: geni-se: Do not bother about enable/disable of
 interrupts in secondary sequencer for non-uart modes
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com
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

On Fri, Jun 2, 2023 at 11:13=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> The select_fifo/dma_mode() functions in geni driver enable/disable
> interrupts (secondary included) conditionally for non-uart modes, while
> uart is supposed to manage this internally.
> However, only uart uses secondary IRQs while spi, i2c do not care about
> these at all making their enablement (or disablement) totally unnecessary
> for these protos.
>
> Drop enabling/disabling secondary IRQs for non-uart modes.
> This doesn't solve any observed problem but only gets rid of code pieces
> that are not required.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)

This seems like a nice cleanup to me. It's still odd that the general
code has a special case for UART, but I guess the alternative is to
duplicate the exact same logic for both the i2c and SPI drivers. I
won't insist on that, though I wouldn't be opposed to it either.

I guess one comment, though: should we also remove the code that
messes with "SE_GENI_S_IRQ_EN" in geni_se_select_gpi_mode()?

-Doug
