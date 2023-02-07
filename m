Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BF768D7E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbjBGNDx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232080AbjBGNDw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:03:52 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615AD360AC
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:03:51 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5249a65045aso162682367b3.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Xd+/5Y9VTyL6XxO9VJQ62sf2ccIN1/K2xW1odJL8Mo=;
        b=uWLALjwdLTy33c8dzkuoCBH5sSws4MdJkcHWMKUJ68n89+1DYYNLO/nHpKqfwWIKR2
         GckGI3CGQmfFKbnzwTbE2Qlg/MNBvKKT+R2nnvKMGsbVtyf2Cktm5eUoB4AuIOMLyiLB
         jJKLbjIo02MIev/iBsEEKLaGLk5bwNQ4UGh34TjhXCwtdU1EZ+Rq41w6SV4dTniHkUtF
         dMRDd6bxXLGBCT7MNb7tmxxYEZ2tq0EMBkFIu7p6suMbgxIC3QVwk2+1s6Gqjy76gz4g
         rkGhjeWxJC+XXO0qSHQIlqmVNmEaT7tMc25EVhqMhyrufIP95/Gporvw/sIuGz/Tk+Am
         +cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Xd+/5Y9VTyL6XxO9VJQ62sf2ccIN1/K2xW1odJL8Mo=;
        b=gsqIKwm3f9q02kAp+brdz9MkOagvmQTPv0wtuoD61pYNluHkGUe9FqIfXZHmF+dcc3
         OfEpKFWA+wKZq8/3UPQThQrkRd90scoKJ5CdYl0xYe7tQOXQ1YnFCDuo/X8VyMO7qXgh
         TZDXsWDTaQ41sWBmIKmdoGdEX7reL4Kb+Z553vqziwwQQDWT3y0gtwL/zZb+DM0STB5Q
         Iw4gt5t4Vz9is9WBlj5ABrnXadLbkQ+g9agoSQDprjsZIhB6tMuaiotUsn3RQP+1Ywpb
         PpYEcNB0GWEmf1rl/hvUK3X/fk11sdnA3E0Ex07WHET8inNka2lbFC7XGmEQM6xNElCx
         DUfw==
X-Gm-Message-State: AO0yUKU/ikpKxe/YCxn3cxYXEgwhaWTTZIewPrerrdCEvYDPy/NKJBEv
        pCBuJed5PtPJydqlaTybpVdZXkBJTMJzsjXygceY0A==
X-Google-Smtp-Source: AK7set80cxJ9Kb2iR+lHvpLM2k5mPTgvJUc4GK/bdANgCT+MK42k1rMj1ZkHPioNfa6E4lhwrcgs9S6voONnZ8inhxw=
X-Received: by 2002:a81:6c81:0:b0:527:af02:df16 with SMTP id
 h123-20020a816c81000000b00527af02df16mr317532ywc.138.1675775030572; Tue, 07
 Feb 2023 05:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
 <20230202133816.4026990-5-abel.vesa@linaro.org> <6f326ed7-6799-b965-fe3a-1f046546ed44@linaro.org>
 <Y+JDQt/T7pXh2/P7@linaro.org>
In-Reply-To: <Y+JDQt/T7pXh2/P7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 7 Feb 2023 15:03:39 +0200
Message-ID: <CAA8EJpq8ihMDGiJodA=AtoZOs31R6ceVrVB-9-d-vni4m8+adQ@mail.gmail.com>
Subject: Re: [RFC v3 4/7] phy: qcom: Add QCOM SNPS eUSB2 repeater driver
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Feb 2023 at 14:25, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 23-02-03 18:51:13, Dmitry Baryshkov wrote:
> > On 02/02/2023 15:38, Abel Vesa wrote:
> > > PM8550B contains a eUSB2 repeater used for making the eUSB2 from
> > > SM8550 USB 2.0 compliant. This can be modelled SW-wise as a Phy.
> > > So add a new phy driver for it.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >   drivers/phy/qualcomm/Kconfig                  |   9 +
> > >   drivers/phy/qualcomm/Makefile                 |   1 +
> > >   .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 278 ++++++++++++++++++
> > >   3 files changed, 288 insertions(+)
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> > >
>
> [ ... ]
>
> > > +
> > > +static int eusb2_repeater_init(struct phy *phy)
> > > +{
> > > +   struct eusb2_repeater *rptr = phy_get_drvdata(phy);
> > > +   const struct eusb2_repeater_init_tbl *init_tbl = rptr->cfg->init_tbl;
> > > +   int num = rptr->cfg->init_tbl_num;
> > > +   int ret = 0;
> > > +   u32 val;
> > > +   int i;
> > > +
> > > +   ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   regmap_update_bits(rptr->regmap, rptr->base + EUSB2_EN_CTL1,
> > > +                           EUSB2_RPTR_EN, EUSB2_RPTR_EN);
> > > +
> > > +   for (i = 0; i < num; i++)
> > > +           regmap_update_bits(rptr->regmap,
> > > +                                   rptr->base + init_tbl[i].offset,
> > > +                                   init_tbl[i].val, init_tbl[i].val);
> >
> > I'd move this to a separate function. Then you can use it in the set_mode()
> > too.
> >
>
> I don't think this is necessary in set_mode.

It's not necessary. However as set_mode() is also a sequence of simple
register updates, it might be easy to have everything as an
offset-mask-value table.

>
> > > +
> > > +   ret = regmap_read_poll_timeout(rptr->regmap,
> > > +                                   rptr->base + EUSB2_RPTR_STATUS, val,
> > > +                                   val & RPTR_OK, 10, 5);
> > > +   if (ret)
> > > +           dev_err(rptr->dev, "initialization timed-out\n");
> > > +
> > > +   return ret;
> > > +}
> > > +
>
> [ ... ]



-- 
With best wishes
Dmitry
