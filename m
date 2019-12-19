Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDF01265E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfLSPkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:40:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:41092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbfLSPkP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:40:15 -0500
Received: from localhost (unknown [122.178.234.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F0BD206EC;
        Thu, 19 Dec 2019 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576770015;
        bh=zjrNAQxSo9YIjVhVdnA6CeKJyfbiwv9WV9GOdbURvIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O2pKAqW6CchuZ3q3t13kjD7vXWpT9Q6DWWEcJ3b2q6OcukXchJLA4qjr06s04Alqb
         ON8en1yzwROMzEYLJNLhf74MUqZdYay+NMrwsA+V2XV41AXRiEUwUdM5dpaneCJy0l
         W3JENpfEH82BvmCyxPXvk9LlYL+509+eUYOKR65k=
Date:   Thu, 19 Dec 2019 21:10:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Increase the phy init timeout
Message-ID: <20191219154009.GX2536@vkoul-mobl>
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-2-vkoul@kernel.org>
 <CAOCk7Npwkx0hJ6hom7yDbN_n-a=sybVi7A=unc4d3UPJysPr+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Npwkx0hJ6hom7yDbN_n-a=sybVi7A=unc4d3UPJysPr+Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-12-19, 08:29, Jeffrey Hugo wrote:
> On Thu, Dec 19, 2019 at 8:04 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > If we do full reset of the phy, it seems to take a couple of ms to come
> > up on my system so increase the timeout to 10ms.
> >
> > This was found by full reset addition by commit 870b1279c7a0
> > ("scsi: ufs-qcom: Add reset control support for host controller") and
> > fixes the regression to platforms by this commit.
> >
> > Suggested-by: Can Guo <cang@codeaurora.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> 
> Tested on the Lenovo Miix 630 laptop (a msm8998 based system).  This
> addresses the regression.

Thanks Jeff for quick test and reviews! Appreciate it.

> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index 091e20303a14..c2e800a3825a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -66,7 +66,7 @@
> >  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
> >  #define CLAMP_EN                               BIT(0) /* enables i/o clamp_n */
> >
> > -#define PHY_INIT_COMPLETE_TIMEOUT              1000
> > +#define PHY_INIT_COMPLETE_TIMEOUT              100000
> >  #define POWER_DOWN_DELAY_US_MIN                        10
> >  #define POWER_DOWN_DELAY_US_MAX                        11
> >
> > --
> > 2.23.0
> >

-- 
~Vinod
