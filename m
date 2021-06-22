Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7353B03F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 14:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhFVMPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 08:15:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231193AbhFVMPV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 08:15:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A87C561164;
        Tue, 22 Jun 2021 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624363985;
        bh=HMc+AaVlUBL9Fk0wuvUdCoGwd/6UNRyT+datpIwVnPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s6JtEev0QMm45uy2S0lSdy5ORFgw8gAWVkE1aS1TEoip1UsI0es1avVViPpIDmQ8p
         QYVPARLHbEqQ5qij5CDxjugEhjxm9WDGAtxdhFHru5ordyp7CYVhAY4Kq4YbdIoA6T
         5E9/CHuUsPG9b7plQUHHS7+FGIKmDoWk7k+EVBQVjlBmm1X9m5Ph24nNkEkY4gPKlp
         Cy+AAi445AHu0N5RtYtD98IrozTbh1080qGO7Vp/hn9MWl8OXL0hRM0h/qJKZMsUf6
         RLBgOuYADLEymdnRa9nbRYm2eZ+YbL4vYdFj/uPvi/ZX267NbeJ4UvOuRkRqRclSc5
         FEJeOOntxOCJw==
Date:   Tue, 22 Jun 2021 17:43:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: geni: move GENI_IF_DISABLE_RO to
 common header
Message-ID: <YNHTzfVOIi7DglbF@vkoul-mobl>
References: <20210618141839.3777270-1-vkoul@kernel.org>
 <20210618141839.3777270-2-vkoul@kernel.org>
 <YMzR/H3QyQeEB2hB@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMzR/H3QyQeEB2hB@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-06-21, 12:03, Bjorn Andersson wrote:
> On Fri 18 Jun 09:18 CDT 2021, Vinod Koul wrote:
> 
> > GENI_IF_DISABLE_RO is used by geni spi driver as well to check the
> > status if GENI, so move this to common header qcom-geni-se.h
> > 
> > Also, add FIFO_IF_DISABLE define.
> > 
> 
> Afaict these registers relates to the hardware block that is primarily
> owned by the individual engine-drivers, would it not make sense to move
> them all to the shared header file?

the GENI_IF_DISABLE_RO is used by SPI and I2C drivers, so we would create two
copies. So better to be defined in geni header
-- 
~Vinod
