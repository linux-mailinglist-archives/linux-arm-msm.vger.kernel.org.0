Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30A120ECF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 06:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgF3Eyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 00:54:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:33646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgF3Eyb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 00:54:31 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FDEA206A1;
        Tue, 30 Jun 2020 04:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593492871;
        bh=iUL0HzRFaOYTRUyFURJ92azHcCmB0zlQui/uvTPtioc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HZABgPCGAudx4VuJtLiLRoLEutKQ0W1Ulfm1VV6VNR94Xj8TKWywqAHrnhAeHdWo3
         0OdrU47BSwGh7jCS/H0scAaNhDvnHcdeKjO3qrvP4zWObanp2nrpF1dgSIHn3ts0nC
         2u0QW/9dx+4/gK9SMYwsHEWi2OMBzfoyx8Xlqcew=
Date:   Tue, 30 Jun 2020 10:24:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: remove ufs qmp phy driver
Message-ID: <20200630045426.GO2599@vkoul-mobl>
References: <20200629145452.123035-1-vkoul@kernel.org>
 <20200629192416.GJ388985@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629192416.GJ388985@builder.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 29-06-20, 12:24, Bjorn Andersson wrote:
> On Mon 29 Jun 07:54 PDT 2020, Vinod Koul wrote:
> 
> > UFS QMP phy drivers are duplicate as we are supposed to use common QMP
> > phy driver which is working fine on various platforms. So remove the
> > unused driver
> > 
> 
> This describes the current state, but the UFS QMP driver had a purpose
> not that long ago and I would like the commit message to describe what
> changed and why it's now fine to remove the driver.

Would below look better, also feel free to suggest as you have the
more history on this :)

"UFS QMP driver is dedicated driver for QMP phy for UFS variant. We
also have a common QMP phy driver which works not only for UFS but
USB and PCIe as well, so retire this driver in favour of the common
driver"

> 
> I'm happy with the patch itself (i.e. the removal of the driver) though.

Thanks
-- 
~Vinod
