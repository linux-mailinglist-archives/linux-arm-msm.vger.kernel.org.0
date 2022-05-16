Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682E852841A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 14:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiEPMX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 08:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239803AbiEPMXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 08:23:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6B42DD4E
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 05:23:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8463FB81128
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 12:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB07C385B8;
        Mon, 16 May 2022 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652703799;
        bh=vjr+sYh43sWwlmgGg+ndrIcpFt2TjxdJbmBK4XwQ7yA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jhRDhmrnwrC7CzRcA23skFHqAFt2RYp+ypjPVQR/79Aie+uvRFjNe9FS8z99vZ3cK
         FydIsBQnGCm8tu3kXuySCiNMTV16NAEdsih9oFIoO1oqk/8LirO9WfNkbRbv7qLtV/
         YgW/Rc+/507me5TewIwSdtGx0T1NBRsitpLKJ2BXohPDWgd14/7kzxzpoemYHsV2rB
         liJbWatimmbsuCb7mhrc80Q2JcgdeUAhefRhJidCSId6OlEQUe0Jpga4lAFXiBj/60
         JpDSjuOtfnNAh0wvMm07UBG10g8bH1aR+x4wfHuXAX5TeNmXjFjG2PQBInrIiKFBEf
         kdsbr7hHzLfig==
Date:   Mon, 16 May 2022 17:53:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 0/5] phy: qcom-qmp: split the QMP PHY driver
Message-ID: <YoJCMhF0c1t6Joa+@matsya>
References: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
 <652b11e8-bd2e-e1e1-363f-4f460bb20913@linaro.org>
 <YoI68x3mQVSYIJa7@matsya>
 <CAA8EJpqmOR-3FV8fGDUyRRvLSUAV0oGZ2MHUMbVPxrgakdHuhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqmOR-3FV8fGDUyRRvLSUAV0oGZ2MHUMbVPxrgakdHuhg@mail.gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-05-22, 15:01, Dmitry Baryshkov wrote:
> On Mon, 16 May 2022 at 14:52, Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 16-05-22, 14:50, Dmitry Baryshkov wrote:
> > > On 16/05/2022 14:45, Dmitry Baryshkov wrote:
> > > > While adding support for the PCIe EP mode support to the QMP driver I
> > > > couldn't help but notice that the QMP PHY driver has slowly become the a
> > > > beast with tons of conditions and corner cases being inserted here and
> > > > there.r
> > > >
> > > > This an RFC for an attempt to to cleanup the QMP driver by splitting the
> > > > QMP PHY driver into four smaller drivers, each targeting a particular
> > > > family of PHY backends (DP/combo, PCIe, UFS and USB). Yes, this results
> > > > in some code duplication, but I hope that the end result is still better
> > > > than the current situation.
> > > >
> > > > If the idea looks good, I will continue polishing the drivers. A
> > > > feedback regarding the common functions (ones, left in the
> > > > phy-qcom-qmp.c file) would be appreciated.
> > >
> > > Oh. 3 patches out of five bounced because of moving the tables between
> > > source files. It looks like for the review I will have to split this
> > > somehow. Ideas are appreciated.
> >
> > I have released the patches but yes maybe do the table moves one bit at
> > a time...?
> 
> Well, I can do this, but it would be then a series of
> - add foo QMP PHY driver
> - move tables for msm7777-foo to the foo QMP PHY driver
> -  move tables for sdm5555-foo to the foo QMP PHY driver
> - ......
> - remove foo QMP support from the main driver
> 
> How does that sound?

yes that sounds sane to me, but lets see if Bjorn has better ideas?

> 
> >
> > >
> > > >
> > > > Dmitry Baryshkov (5):
> > > >    phy: qcom-qmp: split combo PHY support
> > > >    phy: qcom-qmp: split DP data to DP-specific structures
> > > >    phy: qcom-qmp: split UFS PHY support
> > > >    phy: qcom-qmp: split PCIe PHY support
> > > >    phy: qcom-qmp: complete split of the QMP driver
> > > >
> > > >   drivers/phy/qualcomm/Makefile             |    2 +-
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1362 +++++
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |  290 +
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  | 1945 +++++++
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c   |  863 +++
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 2104 ++++++++
> > > >   drivers/phy/qualcomm/phy-qcom-qmp.c       | 5983 +--------------------
> > > >   drivers/phy/qualcomm/phy-qcom-qmp.h       |   43 +
> > > >   8 files changed, 6732 insertions(+), 5860 deletions(-)
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.h
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >
> > --
> > ~Vinod
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
~Vinod
