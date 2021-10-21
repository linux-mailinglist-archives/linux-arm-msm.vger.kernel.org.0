Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB5E4369A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 19:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhJURtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 13:49:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232387AbhJURsw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 13:48:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 377D96139F;
        Thu, 21 Oct 2021 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634838396;
        bh=5yxyO+SbV4ZYkqAUmZBs+5tctJ2fRPEXvFU5ANq9jZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qzhf/5+Pld5SPs/JQcVt2xbCD+i/2WEBlxB3INFwDAqCoF42aXlcGmVOxJ7Ilim+n
         WrO5hmFMHl8iDrJQZA7qH/KalMweTcyLh8sMvy2ixC510EvyJLfhkQYDExImFpJOv/
         rmyCLLDGjtZ7XW5dnJ95FC19BD4lPvxQ1BA+omWqhdtR0zpKRJizCWgnmCjdz4bBFw
         wqtWsFMRoJpShJLb03nmvU7MMMMoxYpWje4nLroDb8Iy9/ePA9EZMqcsLtdCWY2UwX
         JZFAOjKiNq+eXwlAhnKixH1quWEBjPsz81OdAaLXUiilOvEsl9SxOT8F7Kyg2OHeza
         41u25IM9s7G+g==
Date:   Thu, 21 Oct 2021 23:16:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH] phy: qcom-snps: Correct the FSEL_MASK
Message-ID: <YXGndzeN/nVJp8A/@matsya>
References: <1634711785-25351-1-git-send-email-quic_c_sanm@quicinc.com>
 <CAE-0n51miQBAO2QBtHG75cB4TZnm9jiXFz3APBwrNbQcfjB-Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51miQBAO2QBtHG75cB4TZnm9jiXFz3APBwrNbQcfjB-Eg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-10-21, 10:35, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2021-10-19 23:36:25)
> > The FSEL_MASK which selects the refclock is defined incorrectly.
> > It should be [4:6] not [5:7]. Due to this incorrect definition, the BIT(7)
> > in USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1 is reset which keeps PHY analog
> > blocks ON during suspend.
> > Fix this issue by correctly defining the FSEL_MASK.
> >
> > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> Any Fixes tag?

Yes pls add

> 
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index ae4bac0..28459a1 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> I never thought I'd see this again! :)

Also, is it justified adding a new copyright for single code line change..?

> >   */
> >
> >  #include <linux/clk.h>
> > @@ -33,7 +34,7 @@
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0   (0x54)
> >  #define RETENABLEN                             BIT(3)
> > -#define FSEL_MASK                              GENMASK(7, 5)
> > +#define FSEL_MASK                              GENMASK(6, 4)
> >  #define FSEL_DEFAULT                           (0x3 << 4)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1   (0x58)

-- 
~Vinod
