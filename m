Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF0022578F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 08:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgGTGZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 02:25:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgGTGZu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 02:25:50 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03FE621775;
        Mon, 20 Jul 2020 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595226350;
        bh=yfBTJcyyrH2HG3I5sIo8rfUoGpnlWKju/GhSCrKwek0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BqI77YOjr+uQQAWCUQmmNgTEMrBVTKcMKHuuQo3fiYfT5aSEtZKIDOOoqUZM05ctk
         ENadw/WpuDhAn2bW4RuXw09GehAUL3yKcXh5jRR1gI7a27qCXjNpMkOu7egPCDSTui
         v6aTrEquTDFO05cnjTuF6weF8AXgkOQdhWlrMg2Q=
Date:   Mon, 20 Jul 2020 11:55:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@codeaurora.org>,
        Jonathan McDowell <noodles@earth.li>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy
 driver
Message-ID: <20200720062545.GC12965@vkoul-mobl>
References: <20200717131635.11076-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717131635.11076-1-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-07-20, 15:16, Ansuel Smith wrote:
> This has lost in the original push for the dwc3 qcom driver.
> This is needed for ipq806x SoC as without this the usb ports
> doesn't work at all.

Applied both, thanks

My script found below errors with W=1, can you please send fixes for
these

drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function parameter or member 'phy_dwc3' not described in 'usb_phy_write_readback'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function parameter or member 'offset' not described in 'usb_phy_write_readback'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function parameter or member 'mask' not described in 'usb_phy_write_readback'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function parameter or member 'val' not described in 'usb_phy_write_readback'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:182: warning: Function parameter or member 'phy_dwc3' not described in 'usb_ss_write_phycreg'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:182: warning: Function parameter or member 'addr' not described in 'usb_ss_write_phycreg'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:182: warning: Function parameter or member 'val' not described in 'usb_ss_write_phycreg'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:219: warning: Function parameter or member 'phy_dwc3' not described in 'usb_ss_read_phycreg'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:219: warning: Function parameter or member 'addr' not described in 'usb_ss_read_phycreg'
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:219: warning: Function parameter or member 'val' not described in 'usb_ss_read_phycreg'

-- 
~Vinod
