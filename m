Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405E55283C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 14:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243622AbiEPMCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 08:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243673AbiEPMBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 08:01:48 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544B21A831
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 05:01:14 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id dm17so3022091qvb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6QUxKhZD7dg6SrR8olJzbWfcvHNB4B8kSPF8qfUx38=;
        b=P6ii775z8lYleFEFRXcqe+2dnyCW6s2TYhOY2oSOdVQ6lzkwMupbEuhvj94dY8wV3L
         NV7BrGCfjrpfiIldhK81AUxgBd+w00gSuJk9eYX1BuslhgQI1juimLvdG9BhSePXOJzD
         B/IB33YRW01xAVyo5OGv4o+MIZddTp9dk2QpfrJwnQNsihZJUNaZAKUPtTW6geowhKv1
         IkTQ4v+XvZi+sw1+z6glx21KyFsd00j9OR2g99Y8YlSlMPD7ZbHlFrLhkGzNhSDmKqbF
         Ef69EWQI1zNsJ/2r0h1jcRb07JfpoMyZYIxOtE/AliN5Mi3nRltNMmHZMNUWw4Xhi3Li
         V4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6QUxKhZD7dg6SrR8olJzbWfcvHNB4B8kSPF8qfUx38=;
        b=ZkgrHwuiYMdv5RaWHrC1clA0Acjh23tm4m8Q0j4cEsaYUc/obQdjgvayNLu1ug/fCd
         9/jabqqRf9dI5zGgOANUCjk/QqDiwgVmiidkPLTWvqQqLK/O5qihdw8uYB8sIoVL+1zy
         pMqLlHbex24T1maMv/AKY9cEXMVZu2WWf7crl/dn0q1WEcpCeed33UywQRzop5L1Iomp
         Ye0RrniOTLo6mAKgVROQfUXhwGc4gezceoXd+dumtOXAY1txqJZ0UaAh5YhR37Fpk3ex
         wo3/3R2JSrBETqyMC+0KurfCOiXE3CyEBqeS60jOuzKKpZ0+AXgFIsFnFy1+2mP3FZz9
         9eqQ==
X-Gm-Message-State: AOAM533hvFplPRIZk5v/K8nPSiyn+JDgi7WODCVuPOdp+vnQMG6t0b1f
        OF1x8SJr1gUFfgH/t6FWjCtBf6LF60fASaCT5d2YdA==
X-Google-Smtp-Source: ABdhPJwHa4RjXR9o8GoZi0AXSz4W0+XbdeL5C0dkgGkMhhdaEcK05tJ86QebCOnp//emSd0UMOOX0V9DoUugxa0fG7E=
X-Received: by 2002:a0c:ac02:0:b0:45a:91a4:c11b with SMTP id
 l2-20020a0cac02000000b0045a91a4c11bmr14898092qvb.119.1652702471784; Mon, 16
 May 2022 05:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
 <652b11e8-bd2e-e1e1-363f-4f460bb20913@linaro.org> <YoI68x3mQVSYIJa7@matsya>
In-Reply-To: <YoI68x3mQVSYIJa7@matsya>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 May 2022 15:01:00 +0300
Message-ID: <CAA8EJpqmOR-3FV8fGDUyRRvLSUAV0oGZ2MHUMbVPxrgakdHuhg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] phy: qcom-qmp: split the QMP PHY driver
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 May 2022 at 14:52, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 16-05-22, 14:50, Dmitry Baryshkov wrote:
> > On 16/05/2022 14:45, Dmitry Baryshkov wrote:
> > > While adding support for the PCIe EP mode support to the QMP driver I
> > > couldn't help but notice that the QMP PHY driver has slowly become the a
> > > beast with tons of conditions and corner cases being inserted here and
> > > there.r
> > >
> > > This an RFC for an attempt to to cleanup the QMP driver by splitting the
> > > QMP PHY driver into four smaller drivers, each targeting a particular
> > > family of PHY backends (DP/combo, PCIe, UFS and USB). Yes, this results
> > > in some code duplication, but I hope that the end result is still better
> > > than the current situation.
> > >
> > > If the idea looks good, I will continue polishing the drivers. A
> > > feedback regarding the common functions (ones, left in the
> > > phy-qcom-qmp.c file) would be appreciated.
> >
> > Oh. 3 patches out of five bounced because of moving the tables between
> > source files. It looks like for the review I will have to split this
> > somehow. Ideas are appreciated.
>
> I have released the patches but yes maybe do the table moves one bit at
> a time...?

Well, I can do this, but it would be then a series of
- add foo QMP PHY driver
- move tables for msm7777-foo to the foo QMP PHY driver
-  move tables for sdm5555-foo to the foo QMP PHY driver
- ......
- remove foo QMP support from the main driver

How does that sound?

>
> >
> > >
> > > Dmitry Baryshkov (5):
> > >    phy: qcom-qmp: split combo PHY support
> > >    phy: qcom-qmp: split DP data to DP-specific structures
> > >    phy: qcom-qmp: split UFS PHY support
> > >    phy: qcom-qmp: split PCIe PHY support
> > >    phy: qcom-qmp: complete split of the QMP driver
> > >
> > >   drivers/phy/qualcomm/Makefile             |    2 +-
> > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1362 +++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |  290 +
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  | 1945 +++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c   |  863 +++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 2104 ++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp.c       | 5983 +--------------------
> > >   drivers/phy/qualcomm/phy-qcom-qmp.h       |   43 +
> > >   8 files changed, 6732 insertions(+), 5860 deletions(-)
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.h
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
> ~Vinod



-- 
With best wishes
Dmitry
