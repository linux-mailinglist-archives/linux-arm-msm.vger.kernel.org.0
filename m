Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FA727A728
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 07:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgI1F6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 01:58:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:58398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgI1F6o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 01:58:44 -0400
Received: from localhost (unknown [122.179.43.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5FAA207E8;
        Mon, 28 Sep 2020 05:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601272723;
        bh=IgjnKRfiNYyLJ7chUdt8lXcSYhAnrsMC3SPuMP5B9TM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KlUuDy3sxT6kNUHW8hBz7v/zD77hRI6flODdL6AwwHWLC5ipshFNlSs/FmoOjhYPd
         pg6Gy9TDU2DNKF3C2+MIuX2o2jlq7yxaGKSoWxPryuV5coloomGIh4cIlwD8nf03uI
         nuM3tKnuve9n09BMJvtw3BFJAFZcpa+M2MtQU1ZM=
Date:   Mon, 28 Sep 2020 11:28:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 00/10] Support qcom USB3+DP combo phy (or type-c phy)
Message-ID: <20200928055819.GK2968@vkoul-mobl>
References: <20200916231202.3637932-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916231202.3637932-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-09-20, 16:11, Stephen Boyd wrote:
> This patch series is based on v12 of the msm DP driver submission[1]
> plus a compliance patch[2]. In the v5 patch series review I suggested
> that the DP PHY and PLL be split out of the drm driver and moved to the
> qmp phy driver. This patch series does that, but it is still marked as
> an RFC because there are a couple more things to do, mostly updating the
> DT binding and getting agreement on how to structure the code.
> 
> Eventually I believe the qmp phy driver will need to listen for type-c
> notifiers or somehow know the type-c pinout being used so this driver
> can program things slightly differently. Right now, I don't have any way
> to test it though, so I've left it as future work. For some more
> details, the DP phy and the USB3 phy share the same physical pins on the
> SoC and those pins pretty much line up with a type-c pinout modulo some
> CC pins for cable orientation detection logic that lives on the PMIC. So
> the DP phy can use all four lanes or it can use two lanes and the USB3
> phy can use two lanes. In the hardware designs that I have access to it
> is always two lanes for USB3 and two lanes for DP going through what
> looks like a type-c pinout so this just hard codes that configuration in
> the driver.

Applied 1 thru 8, thanks

-- 
~Vinod
