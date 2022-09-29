Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2AF5EF2FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 12:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbiI2KGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 06:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbiI2KGY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 06:06:24 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D4C4A827
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:06:19 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id j7so931406ybb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uOjBpR0wXiSksc7oPhYdRZkX5LJfmohwHgmy4jHV2Lg=;
        b=CJhopwTxUXuqPCMfoXuohVoLDGZD/ruIQ2af9zkFkVJpkd6L/jRDbVEunbFnM5X5ba
         lYD6vqAsWrcQzj3yFg8Cw+uklZT800iRHLuhfAHZZlp/8WbAt6lnxiKoAH0V0BnrFkkx
         sHbXA+709094kZgziOXSOFGSuFzidkvLLEdKH3jCXehOANgNYUXlmIbXIEmTFtpJjJ5P
         DA7j3oU/H8O6bEAo09Qg5AEfgvIY+veTNdUumqtFnWdzdc1QM/+GjwfxomXVtjpnhGYl
         UK2xbB+OV9dU9/BfGjlLnR28xfEwdwBN2VrWGC7ze1rJWv3lSuE6/ZEfpN5vAbhs3TxA
         PxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uOjBpR0wXiSksc7oPhYdRZkX5LJfmohwHgmy4jHV2Lg=;
        b=PdkHwZaO0WBKbzhieHQ0eD2K4Xp+3JSfrIKeSxTgLrWvMVfAF/CY7G5jzKTbJmXX/l
         EWWEZXFwkHVZ3p14RXwpBP3YGlON6X9px8+s3C7BmfsQMrrpVtOJYLdsA7fOoOwugAEi
         ENOQFk20Ro1LJx+RNRQzQGCObxjV3QeGIIJVMev71BP2T5MFw2gMBtdiud9iu3NZSMIC
         aXRd186+Vo0pQaqIqSZH4Qv31kS6BFiCqIWkFT3J5/wBjPUwCdvU3LOUaSphS0o2PrSo
         J63xCXbMF+lYGjCoVqeHH6pEScireOhX4wXJ/ODdQ9dhGFRXsioewY3TwFwooWLLYf9w
         ASQw==
X-Gm-Message-State: ACrzQf25Sa6yx3exGw9vgydYi38JIP1rn5p8KDKSZxzxW2xfYr2Km3kN
        qKhKUkDJ0ZmBIVqtY0ZX/v0lSEnyf4fPINxcnFqbjlj4U0A=
X-Google-Smtp-Source: AMsMyM5/wkIMQDgN4Sbr7kMfAeh/RpwFo1XVLCMUcgsodOXvBIkFBo3D7t8mIJBefNEt6R9oOjJaMuCQXrJhSBMwHh0=
X-Received: by 2002:a05:6902:102f:b0:6b4:7cba:b77a with SMTP id
 x15-20020a056902102f00b006b47cbab77amr2423354ybt.516.1664445978945; Thu, 29
 Sep 2022 03:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org> <YzVpA9zN9Fc45l7r@hovoldconsulting.com>
In-Reply-To: <YzVpA9zN9Fc45l7r@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 13:06:08 +0300
Message-ID: <CAA8EJpq6C2WRJrtRYzFunG+7F8+7dGu8mTr2oASo8=cqB3ASWA@mail.gmail.com>
Subject: Re: [PATCH 00/18] phy: qcom-qmp: rework register layout tables
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sept 2022 at 12:44, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 02:09:56AM +0300, Dmitry Baryshkov wrote:
> > This is an alternative implementation of the QMP PHY driver cleanup
> > proposed by Johan at [1]. This patchset changes register layout tables
> > to use symbolic names instead of bare values and attempts to tie the reg
> > layout with the version of the QMP PHY.
>
> I wouldn't call this an alternative, but rather a separate change on
> top. Using separate per-IP version "register-layout" structs is in
> principle a good idea. It does require a bit of extra work though, as
> it's not always clear what version of the IP each platform is using (e.g.
> IPQ).
>
> I've respun the clean up series that triggered Dimitry to send this
> series:
>
>         https://lore.kernel.org/lkml/20220929092916.23068-1-johan+linaro@kernel.org/
>
> and dropped the two patches merging the IPQ and SDM845 structs.
>
> The register layout work can be rebased on top (trivially).
>
> I'm not so fond of the whole splitting of header files into atoms as you
> lose the overview. But I guess that's a separate discussion.

It was done so to ease merging new platforms, where we have tons of
similar headers. It is much easier to compare downstream header to the
single-version qmp header rather than finding a spot in a monolithic
header which fits the one you have. And also as a result it is also
much easier to spot the actual difference between e.g. v2 and v3.

> > [1] https://lore.kernel.org/linux-phy/20220928152822.30687-1-johan+linaro@kernel.org
>
> > Dmitry Baryshkov (12):
> >   phy: qcom-qmp-pcie: rework regs layout arrays
> >   phy: qcom-qmp-pcie: rename regs layout arrays
> >   phy: qcom-qmp-ufs: split UFS-specific v2 PCS registers to a separate
> >     header
> >   phy: qcom-qmp-ufs: rework regs layout arrays
> >   phy: qcom-qmp-ufs: rename regs layout arrays
> >   phy: qcom-qmp-usb: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
> >   phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
> >   phy: qcom-qmp-usb: rework regs layout arrays
> >   phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
> >   phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
> >   phy: qcom-qmp-usb: rework regs layout arrays
> >   phy: qcom-qmp: move type-specific headers to particular driver
> >
> > Johan Hovold (6):
> >   phy: qcom-qmp-pcie: drop unused common-block registers
> >   phy: qcom-qmp-pcie: clean up power-down handling
> >   phy: qcom-qmp-pcie-msm8996: clean up power-down handling
> >   phy: qcom-qmp-combo: clean up power-down handling
> >   phy: qcom-qmp-ufs: clean up power-down handling
> >   phy: qcom-qmp-usb: clean up power-down handling
>
> Johan



-- 
With best wishes
Dmitry
