Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE21B3E29F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 13:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241405AbhHFLpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 07:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240091AbhHFLpG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 07:45:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4053660560;
        Fri,  6 Aug 2021 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628250291;
        bh=ylElM3/2TB5KabnQxPRU8uY/y3PWqs7tryeGz7oBMiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rUOrN3Y/Kc814zvi012b8DI+SWu9Ob59xRcAmMBdjbgUq/u5LCL0Ui4lOCZ1vZPLA
         SVc+jTHxtNhLEcc5l4n4XSU8cIwAldW+4ZzdI6pFYYeW9mgKruXO0C5A/s4T4QUlnD
         s0Jm/RmPQf61id64HtYf5K0+B54/6vmYqXFbbVNX2PuNOmkHu+E7BwSU1vSt6aJ1aR
         o7e00tR/gaPFYFltzN0pzdKZEJHGWVoNHTZnyymVvJQRSNlWzTGH+/K2kQAV0DSUTQ
         vb/LcucDxgeVNVJ1uo5TMU7q4vcCWmq6DrN1BhoQ6PBDVQEwNgSJxUpSj1HPsKLGqU
         Kcm3r0h8T/71Q==
Date:   Fri, 6 Aug 2021 17:14:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qmp: Provide unique clock names for DP clocks
Message-ID: <YQ0gr/DkhecbPKn9@matsya>
References: <20210722030738.3385821-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722030738.3385821-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-21, 20:07, Bjorn Andersson wrote:
> The USB/DP combo PHY exposes the "qmp_dp_phy_pll_link_clk" and
> "qmp_dp_phy_pll_vco_div_clk" clocks, that are consumed by the display
> clock controller. But for boards with multiple enabled QMP USB/DP combo
> instances the hard coded names collides - and hence only the first
> probed device is allowed to register.
> 
> Given that clocks are no longer reference globally by name and it's
> possible to replace the hard coded names by something unique, but still
> user friendly.
> 
> The two new clock names are based on dev_name() and results in names
> such as "88ee000.phy::link_clk" and "88ee000.phy::vco_div_clk".

Applied, thanks

-- 
~Vinod
