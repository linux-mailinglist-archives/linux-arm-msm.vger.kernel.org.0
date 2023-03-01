Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051836A6963
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 10:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCAJDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 04:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCAJDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 04:03:39 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C5226CD1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 01:03:25 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so16586264pjh.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kLFJAEhf38Z91ErKT+SpxGk8u9CKv5JjAsWvmwSh1U=;
        b=kFV6gWvUnLZUgZ3rx1fWN6XsMVZGaOvEhSfcLg/s8cO8hXYZcsfYyMQVpM1nPe0baw
         9ArjHkD/rTNKS5uasdrwh9EyO2HLnFSdTwYbjkFKAu3WyoU4IHt3Tz34CYydA9oO369D
         BObp7hV6riaekilNuiKshaOLfMCvvMGnhgoDEztu+nfov0YCkeX/+HL/23Yn7jAZ8k5x
         NMf4axghp3wg1SxSNbK2DtkVk61xSTsSv7ln/oLuupE6mXwtZ4StRepp85j7sHIy6sLP
         gDU3wf3dZ189e0zn3+AZIZ/STcotbaSfkInW+N3RhCLw3z5qel277LPsO3bAKE4Pkh8k
         BMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kLFJAEhf38Z91ErKT+SpxGk8u9CKv5JjAsWvmwSh1U=;
        b=S7Qc7A/6aIU5OPeLgV/wyCvb9p9/uaYyrHrPUtX2Diz+g+7KO1dostor8S1Qxqloti
         vuiMI5xhU49ptN/UAs95KEyk8UkUcSfCICp40kSxZRKTu14amm4WXImG5VlH3t76FN6h
         ipLTffbtWaz7kIBRc8Lu8l5MC4EOn4N/hp7L76H4WLG2t85PyYXDA8Eu2zrvg/T9Z4lJ
         uHfdp37A1gltHhKKLu6UP2KBELKUq5LmcHT5t29jZfzmzbOYixlKDxrepigGdecaQHPG
         0/yyGoYKO7I5wRY2MH9Jk+DayRapKt4IiuEt74nyTOJLvWlblDw/2+Gb4adqSTzuw5S8
         hlkA==
X-Gm-Message-State: AO0yUKUDI2IqNV4K81v5aIdoXuNPCUnZRW05MvN7BiR1H4L52aDTZqQG
        zklWjDgAGh714Qy/AKzsZz3IFmMWczdC8t0QPdkDZQ==
X-Google-Smtp-Source: AK7set/EtY+OG6oXO/oVlz80z4XiEM8n0HHmXdl5DR+0gJsIWwZvMhJ6meksEeV5+DLgP3I/bf83eA0yaUAqAI17xbc=
X-Received: by 2002:a17:902:e5d0:b0:19a:fa2f:559e with SMTP id
 u16-20020a170902e5d000b0019afa2f559emr3823016plf.3.1677661405158; Wed, 01 Mar
 2023 01:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <Y0hr9XTGAg8Q6K6y@google.com> <CAA8EJppuGbDGb1D-yf2WL77U1bqx1QQStQeDArWmGFCUiOtnww@mail.gmail.com>
 <10237323.nUPlyArG6x@steina-w>
In-Reply-To: <10237323.nUPlyArG6x@steina-w>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 1 Mar 2023 10:02:48 +0100
Message-ID: <CAPDyKFq7NFx_cwTZajqjOnRsjJ1i-F0ip+b0ZjFUcOdLjMJSkQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Mar 2023 at 09:17, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> sorry for being late to the party.
>
> Am Mittwoch, 19. Oktober 2022, 08:03:22 CET schrieb Dmitry Baryshkov:
> > Ho,
> >
> > On Thu, 13 Oct 2022 at 22:50, Matthias Kaehlcke <mka@chromium.org> wrote:
> > > Do you still plan to refresh this series?
> > >
> > > I know there have been multiple attempts to get something similar
> > > landed in the past 10 year or so. Your series didn't seem to get
> > > much pushback from maintainers, might be worth sending a refresh :)
> >
> > Yes, I hope to return to it eventually. I just had no time for it lately.
>
> I just found this thread while searching for power sequencing devices in
> Linux. From what I understand this is transforming the existing mmc pwrseq
> drivers into generic ones. What is the intention of this new subsystem? What
> is it supposed to address?
> In my case I have an LTE module attached via USB, but in order to use it I
> need to perform several steps:
> 1. apply power supply
> 2. Issue a reset pulse(!), the length actually defines whether its a reset or
> poweroff/on
> 3a. wait for a GPIO to toggle
> 3b. wait a minimum time
> 4a. device will enumerate on USB
> 4b. device can be access using UART
>
> This is something required to actually see/detect the device in the first
> place, thus it cannot be part of the device driver side.
> Is this something pwrseq is supposed to address?

Yes, this is one of those typical use-cases for discoverable buses
that we need to add support for, in one way or the other.

>
> Best regards,
> Alexander

[...]

Kind regards
Uffe
