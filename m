Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B274B218595
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 13:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgGHLIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 07:08:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:43916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728385AbgGHLIu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 07:08:50 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F432206F6;
        Wed,  8 Jul 2020 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594206530;
        bh=PX+Tl6Z+ucttcdnX6yan9JqgC+XiZFi4A+RYHbfceGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uuMXZ5C/hEVuNl4HZnQWo5EQ8Bna/1CZ8gxK0+nfXTYAvoUpay4HQCxfSHheRhZi8
         lTk0CjF2qTbnr4y6uljKGkn891WukDr+vVDCYcO9yfcKasuUkRqj67feTp0ZVTJUva
         NQvZRsFGHbAWHKYxLhamPiOsdzWMwsC9lkvLSi5A=
Date:   Wed, 8 Jul 2020 16:38:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: remove ufs qmp phy driver
Message-ID: <20200708110846.GD34333@vkoul-mobl>
References: <20200629145452.123035-1-vkoul@kernel.org>
 <20200629192416.GJ388985@builder.lan>
 <20200630045426.GO2599@vkoul-mobl>
 <20200707050837.GN11847@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707050837.GN11847@yoga>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-07-20, 22:08, Bjorn Andersson wrote:
> On Mon 29 Jun 21:54 PDT 2020, Vinod Koul wrote:
> 
> > Hi Bjorn,
> > 
> > On 29-06-20, 12:24, Bjorn Andersson wrote:
> > > On Mon 29 Jun 07:54 PDT 2020, Vinod Koul wrote:
> > > 
> > > > UFS QMP phy drivers are duplicate as we are supposed to use common QMP
> > > > phy driver which is working fine on various platforms. So remove the
> > > > unused driver
> > > > 
> > > 
> > > This describes the current state, but the UFS QMP driver had a purpose
> > > not that long ago and I would like the commit message to describe what
> > > changed and why it's now fine to remove the driver.
> > 
> > Would below look better, also feel free to suggest as you have the
> > more history on this :)
> > 
> > "UFS QMP driver is dedicated driver for QMP phy for UFS variant. We
> > also have a common QMP phy driver which works not only for UFS but
> > USB and PCIe as well, so retire this driver in favour of the common
> > driver"
> > 
> 
> How about:
> 
> "The UFS specific QMP PHY driver started off supporting the 14nm and
> 20nm hardware. With the 20nm support marked broken for a long time and
> the 14nm support added to the common QMP PHY, this driver has not been
> used in a while. So delete it."

I have applied it with above log, thanks

-- 
~Vinod
