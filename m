Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4901868D8B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbjBGNML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjBGNLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:11:55 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9507F3D09F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:10:53 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so1039151wms.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8ZVzS/Or3KR8UiUvojWhtaTH2I6W2qDKBwwtWezZUk=;
        b=yIZUOYqhlAxZk+DNz2B3PvW492ztZIOUXQdlhFVkOOAnMrA1273NMH+FM+kBzsx9pE
         OzWxp3ccrFNAgasFi3oDC/eElCmzkIs6Gj7RjAfw8bgkBTd+HA9ayJYDIB8YEBlT5+AX
         r66ns5LAWGWWZas0f7tXU9CrsgTmmUykia5Sh90MC2bWNi85v9SHsuMliu6ZJ55ymV+E
         Jdcloh3wdkXc7atf/i5EeFqI+ci+EAYJh6kQxvBrk4A5OufAfPLBtplISDS5yUiUtY7k
         a8e3vFnOUD9o5aFsAqkALGLUY5k4F13nqOwC6SpLLv4cXaXR8uXi8egBi5ON3jap5hjI
         fbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8ZVzS/Or3KR8UiUvojWhtaTH2I6W2qDKBwwtWezZUk=;
        b=6P1J8cToLgzp2lg64LVYDQs2JVQriY9qb2hdsxCXtx609oZJrExWkHsPDdOsV8m4ZU
         z42ssg/IqZxzlten9o9D4XSuHVFMQ6Vk3yh2RRffTDbWF2zhSPIKM+pFisak2izZs/gx
         jza2m1jINdwdG5jms+OHIQfdZ/wQfexgMqDAAYqAYovwBDH8Q7SN6DjnD9m9NUJXLgep
         SnTkyzA+sdDPlP6q9FY1cMf5eE1b44V920CKYRpdf4IK4AMtrHUtP/ChMmEI7UbmxUmi
         H/4R+1vKMsIPE9AD47whqCAEvhtYBIM1hbd58/vpUyAf16IqNEaSfoZyMKJe8M4RDjjQ
         yJGA==
X-Gm-Message-State: AO0yUKVav33U2ZnCOr/pfNSZ4GPPMHmlLL0bxXtmdZjpXUxkeMYraTT5
        TZOLxFTNYrVNhN3tbwk7KHZaLQ==
X-Google-Smtp-Source: AK7set/jLpZMUh5jPBqbq1Zy33IPPDv+VmTQIjMzqb6M7NjqI1BqgoRNB3EtQJGu3TsQTy6Z/h6Lrw==
X-Received: by 2002:a05:600c:3416:b0:3df:57aa:db52 with SMTP id y22-20020a05600c341600b003df57aadb52mr2965431wmp.4.1675775451783;
        Tue, 07 Feb 2023 05:10:51 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b003c6bbe910fdsm20845580wms.9.2023.02.07.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:10:51 -0800 (PST)
Date:   Tue, 7 Feb 2023 15:10:49 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [RFC v3 4/7] phy: qcom: Add QCOM SNPS eUSB2 repeater driver
Message-ID: <Y+JN2d09YrYNRAkH@linaro.org>
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
 <20230202133816.4026990-5-abel.vesa@linaro.org>
 <6f326ed7-6799-b965-fe3a-1f046546ed44@linaro.org>
 <Y+JDQt/T7pXh2/P7@linaro.org>
 <CAA8EJpq8ihMDGiJodA=AtoZOs31R6ceVrVB-9-d-vni4m8+adQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq8ihMDGiJodA=AtoZOs31R6ceVrVB-9-d-vni4m8+adQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-02-07 15:03:39, Dmitry Baryshkov wrote:
> On Tue, 7 Feb 2023 at 14:25, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 23-02-03 18:51:13, Dmitry Baryshkov wrote:
> > > On 02/02/2023 15:38, Abel Vesa wrote:
> > > > PM8550B contains a eUSB2 repeater used for making the eUSB2 from
> > > > SM8550 USB 2.0 compliant. This can be modelled SW-wise as a Phy.
> > > > So add a new phy driver for it.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >   drivers/phy/qualcomm/Kconfig                  |   9 +
> > > >   drivers/phy/qualcomm/Makefile                 |   1 +
> > > >   .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 278 ++++++++++++++++++
> > > >   3 files changed, 288 insertions(+)
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> > > >
> >
> > [ ... ]
> >
> > > > +
> > > > +static int eusb2_repeater_init(struct phy *phy)
> > > > +{
> > > > +   struct eusb2_repeater *rptr = phy_get_drvdata(phy);
> > > > +   const struct eusb2_repeater_init_tbl *init_tbl = rptr->cfg->init_tbl;
> > > > +   int num = rptr->cfg->init_tbl_num;
> > > > +   int ret = 0;
> > > > +   u32 val;
> > > > +   int i;
> > > > +
> > > > +   ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
> > > > +   if (ret)
> > > > +           return ret;
> > > > +
> > > > +   regmap_update_bits(rptr->regmap, rptr->base + EUSB2_EN_CTL1,
> > > > +                           EUSB2_RPTR_EN, EUSB2_RPTR_EN);
> > > > +
> > > > +   for (i = 0; i < num; i++)
> > > > +           regmap_update_bits(rptr->regmap,
> > > > +                                   rptr->base + init_tbl[i].offset,
> > > > +                                   init_tbl[i].val, init_tbl[i].val);
> > >
> > > I'd move this to a separate function. Then you can use it in the set_mode()
> > > too.
> > >
> >
> > I don't think this is necessary in set_mode.
> 
> It's not necessary. However as set_mode() is also a sequence of simple
> register updates, it might be easy to have everything as an
> offset-mask-value table.

Yeah, but then you would reinit the repeater on set_mode, which should
not be done.

> 
> >
> > > > +
> > > > +   ret = regmap_read_poll_timeout(rptr->regmap,
> > > > +                                   rptr->base + EUSB2_RPTR_STATUS, val,
> > > > +                                   val & RPTR_OK, 10, 5);
> > > > +   if (ret)
> > > > +           dev_err(rptr->dev, "initialization timed-out\n");
> > > > +
> > > > +   return ret;
> > > > +}
> > > > +
> >
> > [ ... ]
> 
> 
> 
> -- 
> With best wishes
> Dmitry
