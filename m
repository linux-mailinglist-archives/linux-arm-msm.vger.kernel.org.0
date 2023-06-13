Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABAE72EA59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 19:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjFMR5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 13:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239299AbjFMR5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 13:57:44 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CB613E
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 10:57:43 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9788faaca2dso956205766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686679061; x=1689271061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucwpoQAK13prSY87pdp529JG6f/Yd6pwjydVL0f7ZAE=;
        b=g6QycsEa60HrU6oWp4C6SFMy1pdFd652snvvf0ntl1GhXQjWP/LV8GkoyTAc38GwR9
         gS+Z/pm5AdbpUeGjsZ6eSgABpd1orEbn4k0e7PXtz6D35bbOgg2MPqt6ZaiL+KjiCPvE
         NpGL9cGrMRH1KbKPW3XsirNVR3ujXqd6O7ccY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686679061; x=1689271061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucwpoQAK13prSY87pdp529JG6f/Yd6pwjydVL0f7ZAE=;
        b=ibAdH/S510fvNnN3HkcOJWRXrk4lIqfv2m1oKxjRKwjvRcxXL0AFaCCv+2q8vDWbGR
         1IAehQ4cEaj6T131p3uvs6zo1OvDO8EE/E4rJ9Kte2Ir2GgjCNyc9rJVrdgO50iFumEQ
         h9WYy1uZAD8AhD6roF5ek8mnPQAP4zzTM2380MtF3aBL9zXj3XY0aOSW8oawA+1zsMgB
         Nx89DZI0KRjELjlrTh8NJsj6K0LoWx42pkQSPa6DAAry9LPTSJM7kF/6+2SbZ50fwb/q
         l7jHpqtXdrafGEcQgXpM0cT3LJg6Rbx0h4XP2VIkcoDq2AYAKcbcTX3BWpfcyoQ4xziZ
         Pagw==
X-Gm-Message-State: AC+VfDyOpsPnz1Wo7Ln274NtOPoJN+LL4mDlagieGVktTxSIDTSWtlCZ
        YNbRJYJdtpMU5Yih9lCIzqCpuWXLKqiKZ5zTDj1C7OSL
X-Google-Smtp-Source: ACHHUZ5CUAQBUzUvdEqDWf0Q8T2Fq0LOzEMiZSueqZe/6M+bf2WsEZfvYvy0uhg8DsKPCXDAV65xuw==
X-Received: by 2002:a17:907:6ea0:b0:973:ff35:a9b8 with SMTP id sh32-20020a1709076ea000b00973ff35a9b8mr15297685ejc.62.1686679060759;
        Tue, 13 Jun 2023 10:57:40 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id k7-20020a17090627c700b00977da9d4ef9sm7089429ejc.18.2023.06.13.10.57.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 10:57:39 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-513ea2990b8so1417a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 10:57:39 -0700 (PDT)
X-Received: by 2002:a50:ab0b:0:b0:514:95d4:c2bb with SMTP id
 s11-20020a50ab0b000000b0051495d4c2bbmr2429edc.2.1686679059461; Tue, 13 Jun
 2023 10:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <1685729609-26871-1-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=Uy=ELwg2jhtFSrpndw-GxUO=0NTKotNymi3sqwG=ggnQ@mail.gmail.com>
 <af4c131a-b97d-a8e8-957d-77c31d3c816a@quicinc.com> <02dabcc8-2340-2188-f6a8-51513b147e7c@quicinc.com>
In-Reply-To: <02dabcc8-2340-2188-f6a8-51513b147e7c@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Jun 2023 10:57:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwcpyvMem08rOXrBMUWW_7ADgfGZGEnEFDky+96pSdpQ@mail.gmail.com>
Message-ID: <CAD=FV=WwcpyvMem08rOXrBMUWW_7ADgfGZGEnEFDky+96pSdpQ@mail.gmail.com>
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 13, 2023 at 9:07=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Hi,
>
>
> On 6/12/2023 7:09 PM, Vijaya Krishna Nivarthi wrote:
> > Hi,
> >
> > Thank you very much for the review...
> >
> >
> > On 6/7/2023 9:41 PM, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Fri, Jun 2, 2023 at 11:13=E2=80=AFAM Vijaya Krishna Nivarthi
> >> <quic_vnivarth@quicinc.com> wrote:
> >>> The select_fifo/dma_mode() functions in geni driver enable/disable
> >>> interrupts (secondary included) conditionally for non-uart modes, whi=
le
> >>> uart is supposed to manage this internally.
> >>> However, only uart uses secondary IRQs while spi, i2c do not care abo=
ut
> >>> these at all making their enablement (or disablement) totally
> >>> unnecessary
> >>> for these protos.
> >>>
> >>> Drop enabling/disabling secondary IRQs for non-uart modes.
> >>> This doesn't solve any observed problem but only gets rid of code
> >>> pieces
> >>> that are not required.
> >>>
> >>> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> >>> ---
> >>>   drivers/soc/qcom/qcom-geni-se.c | 24 ++++--------------------
> >>>   1 file changed, 4 insertions(+), 20 deletions(-)
> >> This seems like a nice cleanup to me. It's still odd that the general
> >> code has a special case for UART, but I guess the alternative is to
> >> duplicate the exact same logic for both the i2c and SPI drivers. I
> >> won't insist on that, though I wouldn't be opposed to it either.
> >>
> >> I guess one comment, though: should we also remove the code that
> >> messes with "SE_GENI_S_IRQ_EN" in geni_se_select_gpi_mode()?
> >
> >
> > Right now we have gpi-dma mode support for i2c and spi but not for uart=
.
> >
> > Even when gpi-dma support is added, uart driver's interrupt handler
> > would not be invoked so I believe it would be safe to drop that code
> > from geni_se_select_gpi_mode() too.
> >
> > I will post v2 dropping same after some more lookup.
>
>
> Looking at this once again, I am more inclined towards leaving alone
> gpi_mode() for now.
>
> It probably needs cleanup but we want to take that up at a later time.
>
> Meanwhile its not causing much harm as we don't switch modes dynamically
> for gpi case, so we are not losing much time there reading from and
> writing to registers.
>
> Please let know your thoughts.

It's not really about the time needed for the extra register writes,
but just someone trying to understand the code who might be trying to
figure out what bits are relevant. The bits related to the secondary
sequencer's interrupts don't do anything useful when we're using the
controller for i2c/spi, so why not delete them?

-Doug
