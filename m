Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96584F6B04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 22:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbiDFUOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 16:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbiDFUNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 16:13:42 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4521B8FDF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 11:16:10 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-d6ca46da48so3776196fac.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 11:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=W6QLU9dpsf8mc4939lySYzSPSw/dtTexZuzBHIuLUrg=;
        b=EBTf1bBIiIG/kG0lhqJVTnNvF5u0I5Bml0AKBgrXKGQB/0qt+BtzLG+NBXiFyM1x8D
         olDpNLvBJ790rjNjiYjgWvGsRpx8xFizHYfJ16SP9BmBooefqv5zWU3ErFPjkkz+knCA
         rIsgx8howkxkhEF/ME5pJYrDyjSfoyrm1ECGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=W6QLU9dpsf8mc4939lySYzSPSw/dtTexZuzBHIuLUrg=;
        b=WWJph0S8K6VMw6Z8j44Mz+aMkZR3Df3/XhQaU5EYYrubYiorjPKx/+3qOAWoFo+zTz
         eYj4WoxLUpJFqS7kFAu3PRFQyRB9BHoNJt6npA4CD8AZej5FDqp1ZEGKJV53gVjJKRLM
         YhLJPfC8JHhlsmzEOgigoK9Pivy3M72RCdQfkPIVyNWWuYVH/fxPM4yeegYoMglhHuOK
         LwQS8oMu94TXSCkWVPeNtv/bwyEl5FkK0aYDzsGq3MuxSbOszMd80Fm2nP/Kmn8LWdYa
         cxyID4BjMabLUFbRpqexGynPVpQmOpo1LTN9n/8uRnZW2n5fqIvkZOZsxKblfUr1r2jn
         IASw==
X-Gm-Message-State: AOAM5315nfQwBPTcbI1cXjcd4ZHvAIuHYfb0JwcRNrg7NHB9i8LTwbKq
        /uTiolQvZvAIAFlZwPzd4mt6W7BEcF9Fktrjym54/g==
X-Google-Smtp-Source: ABdhPJw1RdwYSbawGoUWfudSiGTBCjFseP6+LEsJiUEoEd7sXlF3awSAqT7Ef73IMxW5Sp5PVs4oa7X7vTackHPxJx4=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr4580721oao.63.1649268969711; Wed, 06
 Apr 2022 11:16:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 11:16:09 -0700
MIME-Version: 1.0
In-Reply-To: <Yk3NkNK3e+fgj4eG@sirena.org.uk>
References: <1649166633-25872-1-git-send-email-quic_c_skakit@quicinc.com>
 <1649166633-25872-5-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n53G-atsuwqcgNvi3nvWyiO3P=pSj5zDUMYj0ELVYJE54Q@mail.gmail.com>
 <Yk1B4f51WMGIV9WB@sirena.org.uk> <CAE-0n53Cv_bR92M64dhdnDge_=_jeOs4VZzDhUkksN90Y7rgog@mail.gmail.com>
 <Yk21pdu16lyR8jXm@sirena.org.uk> <CAE-0n50C8khP2x4sgNP5xnfLVMRQj2=LChyWWx1BWL+Xgecgyw@mail.gmail.com>
 <Yk3Bfnxe/meBYokp@sirena.org.uk> <CAE-0n53O23=N0zkZpg87Q3EyKquLe3WLNJT8qnZz4WEor6QK7A@mail.gmail.com>
 <Yk3NkNK3e+fgj4eG@sirena.org.uk>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Apr 2022 11:16:09 -0700
Message-ID: <CAE-0n51DJyWQKG1AsMjD1wwxx=KCyvyp7-P9BGfiRX=EKjxfdw@mail.gmail.com>
Subject: Re: [PATCH V9 4/6] regulator: Add a regulator driver for the PM8008 PMIC
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mark Brown (2022-04-06 10:27:44)
> On Wed, Apr 06, 2022 at 10:21:01AM -0700, Stephen Boyd wrote:
> > Quoting Mark Brown (2022-04-06 09:36:14)
> > > On Wed, Apr 06, 2022 at 08:51:48AM -0700, Stephen Boyd wrote:
>
> > > > My guess is that this is one IC that responds to multiple i2c addresses.
> > > > The "main" qcom,pm8008 address is 0x8 and that supports things like
> > > > interrupts. Then there's an address for regulators at 0x9 which controls
> > > > the handful of LDOs on the PMIC.
>
> > > So it's like the TI TWL4030 and Palmas - in which case it should
> > > probably be handled similarly?
>
> > How did those work out? I wasn't involved and I don't know what you
> > mean. Do they have multiple i2c addresses they respond to?
>
> Yes, exactly.  The main device uses i2c_new_dummy_device() to
> instantiate the extras when it probes.  See twl-core.c

Cool. That approach sounds good to me. Then the regulators can be child
nodes of the qcom,pm8008 node at i2c address 0x8? It still feels like
making a struct driver for each regulator node is overkill and will
waste memory.

>
> >
> > > Note that the original sumbission was
> > > *also* a MFD subfunction, but using a DT compatible to match the
> > > platform device - this is the first I've heard of this being a separate
> > > I2C function.
>
> > I'm mainly looking at the dts file now. It clearly has two i2c devices
> > at 0x8 and 0x9. Maybe the regulator driver followed the mfd design
> > because the first driver for this device is an mfd.
>
> I'm guessing from the naming that they're also externally described as
> the same device - presumably it's two dies shoved together in the same
> package for some reason without being otherwise joined up.  Is the
> second device geniunely regulators only or does it have anything else
> bundled in there?

I think it's regulators only. Pretty sure I asked qcom this a round or
two ago on this patch series and they said that. Let's wait for Satya to
respond.
