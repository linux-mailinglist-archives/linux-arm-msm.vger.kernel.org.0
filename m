Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB631BB58E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 06:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgD1Ezl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 00:55:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:56132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgD1Ezl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 00:55:41 -0400
Received: from localhost (unknown [106.51.110.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3517C20661;
        Tue, 28 Apr 2020 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588049741;
        bh=bJ2GA1cKnRxJvK/h1+T9DCVtgtktPWAAKYcd7I1gnpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nDdkMYnUzH3RqTO30Cf7BScxO6W+DRjTMKLRBs6rhtKXpuMGOy3QLMqLaPW7g9YPe
         N9xRxCT6ergYAN5u6zkpKyirNx7pXoN/mtvNIbZ80Apmui0Ie1mmB6yAA640Y26UjI
         5CTkyPu5yL1AOqHetXg09XMQzRHgVNuKzdeZq/wE=
Date:   Tue, 28 Apr 2020 10:25:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: usb-hs-28nm: Prepare clocks in init
Message-ID: <20200428045536.GX56386@vkoul-mobl.Dlink>
References: <20200408012854.3070187-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408012854.3070187-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-04-20, 18:28, Bjorn Andersson wrote:
> The AHB clock must be on for qcom_snps_hsphy_init() to be able to write
> the initialization sequence to the hardware, so move the clock
> enablement to phy init and exit.

Applied, thanks

-- 
~Vinod
