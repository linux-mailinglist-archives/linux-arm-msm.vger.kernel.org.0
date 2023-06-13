Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF2EC72EBBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 21:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjFMTOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 15:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbjFMTOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 15:14:33 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C331C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:14:32 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-977cc662f62so855076766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686683669; x=1689275669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7S1/D27u6WKdj6tifOuv3Tm0xI7mxTXpBSlAiR/eCY=;
        b=jBVtqBPzhxozZ13UmrIUh04tkfIDeSfvsfa6z/1VnPetlv7w7+WsBT69fngsy3NA2c
         updCmsHI9XgXt1U/66HB5goYeKrHdG21MfiQzoCubosXSNcLe1Q1OgZXfHds9NwWwf/h
         21DX7l8R91PrgemKo5B2WfBaUJGfQCnS9KMV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686683669; x=1689275669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7S1/D27u6WKdj6tifOuv3Tm0xI7mxTXpBSlAiR/eCY=;
        b=UlFHynadggAwO69ciSSZBj2r0hQmZEQn5Q7SP+sKb7G/Q58EBsjAw1AmTf/DVGEZL5
         aDKTN7E6hAuiRkG+PD3Kr52sAqhM4jIRZnz7H0No0Vexwlp/Hn+dZI9dJ/Ulcw6WmZng
         ePHtJQL1HnlgIKq2iIV5rPLmVV/oZvAQhyciJx7F5GxSpGLmKqKQNzG85Y9ZQIciMegG
         fpQNnOjaBpiOfC/YUwHHYbJiAHEa2NiqwwiywmyYYyzFxoJs6sYptq1lm/0dxrt5qTdy
         +vwbVvR1FWdcWNKzzABSDiDHUAyY0isuaFf8NJB0WVZxDdnhqmKvVtWOjt3QXYBOcldU
         fmyw==
X-Gm-Message-State: AC+VfDwsayj8eIWG4EpjACOSFEripq3yF5AAJdzPCTxzFG4j/YzvSbj0
        y7eVzDZYecqTwEW/ZUtpONKKpeLEkUlaoWnEo3IoBMfT
X-Google-Smtp-Source: ACHHUZ4lnbDa+12oEqjnGq70XjZpjp+V9fxYIr6f/euh8dyy/eIu7bAKp13rAjvk9FUzYahF8fHDrA==
X-Received: by 2002:a17:907:72c7:b0:978:8746:bd75 with SMTP id du7-20020a17090772c700b009788746bd75mr12497603ejc.58.1686683669422;
        Tue, 13 Jun 2023 12:14:29 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id i24-20020a17090671d800b00967004187b8sm6965211ejk.36.2023.06.13.12.14.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 12:14:28 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-513ea2990b8so2754a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:14:28 -0700 (PDT)
X-Received: by 2002:a50:bac8:0:b0:507:6632:bbbf with SMTP id
 x66-20020a50bac8000000b005076632bbbfmr8870ede.6.1686683667750; Tue, 13 Jun
 2023 12:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <1685729609-26871-1-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=Uy=ELwg2jhtFSrpndw-GxUO=0NTKotNymi3sqwG=ggnQ@mail.gmail.com>
 <af4c131a-b97d-a8e8-957d-77c31d3c816a@quicinc.com> <02dabcc8-2340-2188-f6a8-51513b147e7c@quicinc.com>
 <CAD=FV=WwcpyvMem08rOXrBMUWW_7ADgfGZGEnEFDky+96pSdpQ@mail.gmail.com> <39b5a025-d678-57d4-9e97-432ee1763186@quicinc.com>
In-Reply-To: <39b5a025-d678-57d4-9e97-432ee1763186@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Jun 2023 12:14:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wwj=1Pt9vaWTABi2GDXS4qGV-5RvSbZuGJdgWXRh_OyA@mail.gmail.com>
Message-ID: <CAD=FV=Wwj=1Pt9vaWTABi2GDXS4qGV-5RvSbZuGJdgWXRh_OyA@mail.gmail.com>
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

On Tue, Jun 13, 2023 at 11:24=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Hi,
>
>
> On 6/13/2023 11:27 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jun 13, 2023 at 9:07=E2=80=AFAM Vijaya Krishna Nivarthi
> > <quic_vnivarth@quicinc.com> wrote:
> >> Hi,
> >>
> >>
> >> On 6/12/2023 7:09 PM, Vijaya Krishna Nivarthi wrote:
> >>> Hi,
> >>>
> >>> Thank you very much for the review...
> >>>
> >>>
> >>> On 6/7/2023 9:41 PM, Doug Anderson wrote:
> >>>> Hi,
> >>>>
> >>>> On Fri, Jun 2, 2023 at 11:13=E2=80=AFAM Vijaya Krishna Nivarthi
> >>>> <quic_vnivarth@quicinc.com> wrote:
> >>>>> The select_fifo/dma_mode() functions in geni driver enable/disable
> >>>>> interrupts (secondary included) conditionally for non-uart modes, w=
hile
> >>>>> uart is supposed to manage this internally.
> >>>>> However, only uart uses secondary IRQs while spi, i2c do not care a=
bout
> >>>>> these at all making their enablement (or disablement) totally
> >>>>> unnecessary
> >>>>> for these protos.
> >>>>>
> >>>>> Drop enabling/disabling secondary IRQs for non-uart modes.
> >>>>> This doesn't solve any observed problem but only gets rid of code
> >>>>> pieces
> >>>>> that are not required.
> >>>>>
> >>>>> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> >>>>> ---
> >>>>>    drivers/soc/qcom/qcom-geni-se.c | 24 ++++--------------------
> >>>>>    1 file changed, 4 insertions(+), 20 deletions(-)
> >>>> This seems like a nice cleanup to me. It's still odd that the genera=
l
> >>>> code has a special case for UART, but I guess the alternative is to
> >>>> duplicate the exact same logic for both the i2c and SPI drivers. I
> >>>> won't insist on that, though I wouldn't be opposed to it either.
> >>>>
> >>>> I guess one comment, though: should we also remove the code that
> >>>> messes with "SE_GENI_S_IRQ_EN" in geni_se_select_gpi_mode()?
> >>>
> >>> Right now we have gpi-dma mode support for i2c and spi but not for ua=
rt.
> >>>
> >>> Even when gpi-dma support is added, uart driver's interrupt handler
> >>> would not be invoked so I believe it would be safe to drop that code
> >>> from geni_se_select_gpi_mode() too.
> >>>
> >>> I will post v2 dropping same after some more lookup.
> >>
> >> Looking at this once again, I am more inclined towards leaving alone
> >> gpi_mode() for now.
> >>
> >> It probably needs cleanup but we want to take that up at a later time.
> >>
> >> Meanwhile its not causing much harm as we don't switch modes dynamical=
ly
> >> for gpi case, so we are not losing much time there reading from and
> >> writing to registers.
> >>
> >> Please let know your thoughts.
> > It's not really about the time needed for the extra register writes,
> > but just someone trying to understand the code who might be trying to
> > figure out what bits are relevant. The bits related to the secondary
> > sequencer's interrupts don't do anything useful when we're using the
> > controller for i2c/spi, so why not delete them?
>
>
> Agreed the s_irqs are not useful for spi/i2c but Right now I am not
> really sure how uart + gsi mode is going to look like.
>
> So how about we move the part that messes with s_irq in gpi_mode() into
> a *if(proto =3D=3D GENI_SE_UART)* conditional?
>
> Understand we are adding to weirdness but Would that be ok for now?

For the non-GPI DMA path and for the PIO path we don't touch the
"S_IRQ" for UART either (we don't touch any IRQs for the UART). ...so
it doesn't seem right to be tweaking with the S_IRQ for UART. I would
say delete it and if/when the UART needs GPI mode then we can figure
out what to do.

I'd actually wonder if GPI will ever be implemented for UART anyway.
The whole idea of GPI is to allow sharing a port between more than one
user. Each user could submit a "transaction" and they'd get the port
for the duration of that transaction. After the transaction was done
then another user would be able to grab the port. Typically UART isn't
used like this. I'm not saying that it couldn't be done, but just
saying that it would be a pretty non-standard way of using a UART...

-Doug
