Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B241EAB17A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 06:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfIFETg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 00:19:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:48600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfIFETg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 00:19:36 -0400
Received: from localhost (unknown [223.226.32.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A473206CD;
        Fri,  6 Sep 2019 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567743575;
        bh=9wEomr15DqQQFhjsBZXapKuHKKB45PBaOQHhXs8HHp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m1WiMGmptBN2cyjUduyaacqO6M/p/cHX8x1ZtV+FkmhG8+yMNjTy7XbuRmojKpBgk
         20yF9UStj0DwHs/HL/OH2iagYGmh6iq4YooP9WYcTwHo1DJSDF/bZt4qj1KAmX6LeO
         028BuJAfK6mS5lGVPXXuUXSjNEjn/RYCMby7ACxA=
Date:   Fri, 6 Sep 2019 09:48:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
Message-ID: <20190906041827.GD2672@vkoul-mobl>
References: <20190904100835.6099-1-vkoul@kernel.org>
 <20190904100835.6099-4-vkoul@kernel.org>
 <5d70475a.1c69fb81.650ed.0ad0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d70475a.1c69fb81.650ed.0ad0@mx.google.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-09-19, 16:23, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-09-04 03:08:35)
> > @@ -878,6 +883,93 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
> >         QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
> >  };
> >  
> > +static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> > +       QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_SYSCLK_EN_SEL, 0xD9),
> 
> Can you use lowercase hex?

Sure will update

> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_SEL, 0x11),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_HS_SWITCH_SEL, 0x00),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP_EN, 0x01),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_MAP, 0x02),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_IVCO, 0x0F),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_INITVAL2, 0x00),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_HSCLK_SEL, 0x11),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_DEC_START_MODE0, 0x82),
> > +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_CP_CTRL_MODE0, 0x06),
> 
> Gotta love the pile of numbers and register writes...

:D

-- 
~Vinod
