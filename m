Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6666DB3B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 20:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbjDGSyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 14:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbjDGSxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 14:53:47 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC63C1115B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 11:51:36 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lj25so10233728ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 11:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680893446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcL5RQwRbKCR9jKKpmO5fbcLl+KsKBW01vJcykINQ7o=;
        b=BZEaxJx8fi3PadPepMd4khDx5Fd+W+EI29VJ02G6V+12uE/Mcnm1hglwAKHfIy/dCn
         YW0rxvUglDwJGHt8WH6pATU54E9IFc9e65UIwIUeKyu0trgqBedkTBJuysjERgmZXBtt
         9+bbMAQEE2v9kM2jZM/6DXkmSfpW6n9V5eCyCMEt+SphUl1lLIhyofkqTmXvMp1VV3JB
         Erb0orCJv80iJswqKh9Pz3Fk/8F0L0kKHNiQ7D9mCAqqHC5DikQWrCEkWf+TZn87ofZE
         Q8QRAO4zcLa1Ykj2hIQpRRXzUOMq66W0Xt3yDBjK56KCHN3TPLe79fUbNNfzjtdYlbfZ
         fpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680893446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcL5RQwRbKCR9jKKpmO5fbcLl+KsKBW01vJcykINQ7o=;
        b=SbYut9d41qLhKm85VfN0Wn9S9y88/vP/nvS5n8J/qYTz338L6xxcIUCOKBvbbZY5BG
         /5wqJyEOaG4riS2shysltBqVXae+naHBlebNI0PbRpM6SK0z/eSloVaerFobyPbJricj
         YukJQpwIyYywwpRVTVfX+cvyOSkE+PkLAEaOeRxV37eUnR52mKmg+WYF0xoehgLtGCOf
         zwOL59KZRhnyeOFv3ei1gUfuwV86LVbJODw2eXk8D00StkUgbOQSMbVzGXYfYcUrtBo5
         s6wBtC5kDvKYCc7ZnpQ6I7fqJJG41y9xWNTraK3JY45Z0gIZ0nQ721WkvQCYMCV+HhaH
         3wcQ==
X-Gm-Message-State: AAQBX9d2YqpjnmOHEpE2pk1U4104y5QoOepjMDiNzBTlOGBZktjsqAiv
        sQMZMw3NTPVOKRvyjg3phbS04gM8IIZGNO67Mp8=
X-Google-Smtp-Source: AKy350bN0EL2liYUBazmQcMILcD186k1FpU+gm3rW1rkRX2SPG6laczujT3Ga8DskZiaCyjh9JDXRTcCbnAisqDsPEQ=
X-Received: by 2002:a17:907:7898:b0:8af:43c6:10c0 with SMTP id
 ku24-20020a170907789800b008af43c610c0mr174684ejc.1.1680893446405; Fri, 07 Apr
 2023 11:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230203122118.15219-1-pvorel@suse.cz> <20230407165730.jfupmfiul6qb7yl3@ripper>
In-Reply-To: <20230407165730.jfupmfiul6qb7yl3@ripper>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Fri, 7 Apr 2023 20:50:34 +0200
Message-ID: <CAB1t1Cw3cB2fo9fCQam+aJQXM92uJzzb72Lng=D6Ey5HXi9YRQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add regulators
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

first, thanks a lot for your comments.

On Fri, 7 Apr 2023 at 18:54, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Feb 03, 2023 at 01:21:18PM +0100, Petr Vorel wrote:
> > From: Petr Vorel <petr.vorel@gmail.com>
> >
>
> Please add a commit message...

I thought the subject would be enough, as I added all regulators from
downstream.
But as the approach is different, I'll be more descriptive when adding
just regulators which are actually needed.

>
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi all,
> >
> > please what is the mapping of qcom,init-current from downstream to
> > mainline? Or is it not used at all?
> >
>
> It affects the mode the regulator operates in, you can find
> regulator-system-load in a few cases in other files as reference for
> when we force things into "high performance mode".
>
> There are some cases, such as eMMC/uSD where problems has been seen when
> the regulator is allowed to operate in low power mode...

+1, thank you.

>
> > Also, how can I verify these connections in downstream DTB?
> >       vdd_l1-supply = <&pm8994_s1>;
> >       vdd_l2_26_28-supply = <&pm8994_s3>;
>
> I don't think you can, without form of hardware documentation.
>
> I _think_ the RPM will take care of dependencies for you, and care
> should be taken before changing many of the regulators...
>
> So I'd suggest that you simply introduce the regulators that you need to
> touch from Linux today, rather than trying to add them all at once and
> then build from there.

Sure, makes sense.

Kind regards,
Petr

> Regards,
> Bjorn
