Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9453ADE0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jun 2021 13:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhFTLIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Jun 2021 07:08:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:40906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229516AbhFTLIe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Jun 2021 07:08:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9AEB61004;
        Sun, 20 Jun 2021 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624187181;
        bh=qymr9SfDkc+9dNRRBfe77P0VL9S5dG9jtAMJzRsd7BI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tUyW18WLS2ZwOC1148/BLoZcvTM5Xvr/q/DK5Yv/TVjSmVI+19D6hd1axmCvFRN9o
         81+8YgFnPvn+6O9hpsbIYCRofSnfJMCHhYumZuwcJsmoGPIvkjNdeycSU9ndkidPSO
         61HChIOfzv/BvHgPlys7ddO+8/Ls6gdWHAq3BGoLu0VGiECyNmdGsWOrMAwR58/kQc
         3Vi/d/z6u6lZ2NzYNDxAqNBj3ax0ZxFdAiXvjoAzfySZ+I/xRPyG9pKvsRIet5H0ks
         cjly+dESlBMbmomjqkJqQ8LsrIA8O+tub4rqFVcacOiqTIEi4fvUOcuz+z8APNtUJ4
         6n+qmNqX1bv+g==
Date:   Sun, 20 Jun 2021 16:36:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] soc: qcom: geni: add support for gpi dma
Message-ID: <YM8hKeAoAHMiTmY5@vkoul-mobl>
References: <20210618141839.3777270-1-vkoul@kernel.org>
 <YMzRAS81fkMU+jun@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMzRAS81fkMU+jun@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-06-21, 11:59, Bjorn Andersson wrote:
> On Fri 18 Jun 09:18 CDT 2021, Vinod Koul wrote:
> 
> > This is version 2 of the GPI dma series [1]
> > 
> > This series add the GPI DMA in qcom geni drivers. For this we
> > first need to move GENI_IF_DISABLE_RO and struct geni_wrapper to common
> > headers and then add support in the gpi dma in geni driver.
> > 
> > The SPI and I2C driver changes shall follow shortly
> > 
> 
> Given that the continuation of this series will have build time
> dependencies on these patches I think it would be good to see them all
> as one chunk (and practically I can create a immutable branch of the
> soc/qcom pieces and share with Wolfram and Mark).

Okay, let me post full series in few days

> 
> Regards,
> Bjorn
> 
> > [1]: http://lore.kernel.org/r/20210111151651.1616813-1-vkoul@kernel.org
> > 
> > Changes in v2:
> >  - add r-b from Bjorn on patch 1
> >  - add more details in log for patch 2
> >  - Fix the comments from Doug and Bjorn for patch3, notable use read, modify
> >    update for irq registers, use geni_se_irq_clear() for irq, dont update
> >    single bit registers, add a bit more description for gpi dma etc
> > 
> > Vinod Koul (3):
> >   soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
> >   soc: qcom: geni: move struct geni_wrapper to header
> >   soc: qcom: geni: Add support for gpi dma
> > 
> >  drivers/soc/qcom/qcom-geni-se.c | 47 ++++++++++++++++++++++-----------
> >  include/linux/qcom-geni-se.h    | 23 ++++++++++++++--
> >  2 files changed, 52 insertions(+), 18 deletions(-)
> > 
> > -- 
> > 2.31.1
> > 

-- 
~Vinod
