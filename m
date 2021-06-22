Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629AE3B03FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 14:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFVMR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 08:17:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhFVMR0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 08:17:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E184960FF1;
        Tue, 22 Jun 2021 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624364108;
        bh=ruteHNQkH7oYVMxq9jQObY+AJvoknaeqClR7S4DVslo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZZXaUu5BKuBV1ekqWSNHIpMwOY3IZVb8F1yb7TuEgEwLiX49zec0FTlni1wS4RRL
         nxwNW9txEWPteGLsnv6SBikbcFOldggJDOm9wZ1LhBdYUCkJfYPqOic63+MAOAOr0G
         qrpYUZOCX/g/zcTAkonFV9DU2HbiH1ygCoQ3bzVmnhw45MtVvKzfLrm8LUB/SFilzE
         h6wh/MOQPOa4ayda4vrCB24yU1+Le8vbxOJwapUJ8tBDaqaRD8QCSQnM9sXapAAZO9
         RYuJXQ6TA/s0yPG2vqnbRxJhVPm+Bj8fCxXrTmt25gVi6pcYRVKkLi2K1q7JM0zNLy
         fzacCLzl+/ZYw==
Date:   Tue, 22 Jun 2021 17:45:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soc: qcom: geni: Add support for gpi dma
Message-ID: <YNHUSVisKK6QnUX4@vkoul-mobl>
References: <20210618141839.3777270-1-vkoul@kernel.org>
 <20210618141839.3777270-4-vkoul@kernel.org>
 <YMzWpPnfczMBsZ2x@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMzWpPnfczMBsZ2x@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-06-21, 12:23, Bjorn Andersson wrote:
> On Fri 18 Jun 09:18 CDT 2021, Vinod Koul wrote:
> 
> > GPI DMA is one of the DMA modes supported on geni, this adds support to
> > enable that mode
> 
> I think you're missing an opportunity to describe what GPI DMA is.
> Perhaps something like:
> 
> In GPI DMA mode the serial engine uses the DMA controller found in the
> associated wrapper to perform its transaction, add support for enabling
> this mode in the engine.

Hmm looks like I did, I will update more kernel-doc style comments to
explain more details

> 
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/soc/qcom/qcom-geni-se.c | 32 +++++++++++++++++++++++++++++++-
> >  include/linux/qcom-geni-se.h    |  5 +++--
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > index 08d645b90ed3..40a0a1f88070 100644
> > --- a/drivers/soc/qcom/qcom-geni-se.c
> > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > @@ -307,6 +307,32 @@ static void geni_se_select_dma_mode(struct geni_se *se)
> >  		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
> >  }
> >  
> > +static void geni_se_select_gpi_mode(struct geni_se *se)
> > +{
> > +	unsigned int gpi_event_en;
> > +	unsigned int m_irq_en;
> > +	unsigned int s_irq_en;
> 
> readl and writel operates on u32, so better to use that.

Yes

> 
> > +
> > +	geni_se_irq_clear(se);
> > +	writel(0, se->base + SE_IRQ_EN);
> > +
> > +	s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> 
> I don't mind this being _relaxed if done on purpose, but as it's the
> only one (and there's no comment) I get the feeling that it's a mistake.

Yes it is a leftover, fixed now

> 
> > +	s_irq_en &= ~S_CMD_DONE_EN;
> > +	writel(s_irq_en, se->base + SE_GENI_S_IRQ_EN);
> 
> The use of 3 different variables (gpi_event_en, m_irq_en, s_irq_en)
> forced me to really look if the three sets of operations somehow reused
> previous results.
> 
> To clarify that this isn't the case I would suggest that you use a
> single variable ("val"?) instead.

Yes updated

> 
> > +
> > +	m_irq_en = readl(se->base + SE_GENI_M_IRQ_EN);
> > +	m_irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> > +		      M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> > +	writel(m_irq_en, se->base + SE_GENI_M_IRQ_EN);
> > +
> > +	writel(GENI_DMA_MODE_EN, se->base + SE_GENI_DMA_MODE_EN);
> > +
> > +	gpi_event_en = readl(se->base + SE_GSI_EVENT_EN);
> > +	gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
> > +			 GENI_M_EVENT_EN | GENI_S_EVENT_EN);
> > +	writel(gpi_event_en, se->base + SE_GSI_EVENT_EN);
> > +}
> > +
> >  /**
> >   * geni_se_select_mode() - Select the serial engine transfer mode
> >   * @se:		Pointer to the concerned serial engine.
> > @@ -314,7 +340,8 @@ static void geni_se_select_dma_mode(struct geni_se *se)
> >   */
> >  void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
> >  {
> > -	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
> > +	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA &&
> > +		mode != GENI_GPI_DMA);
> 
> This line can be left unbroken.

yaay 100 chars :-) will do

> 
> >  
> >  	switch (mode) {
> >  	case GENI_SE_FIFO:
> > @@ -323,6 +350,9 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
> >  	case GENI_SE_DMA:
> >  		geni_se_select_dma_mode(se);
> >  		break;
> > +	case GENI_GPI_DMA:
> > +		geni_se_select_gpi_mode(se);
> > +		break;
> >  	case GENI_SE_INVALID:
> >  	default:
> >  		break;
> > diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> > index 5fda675c5cfe..336b682392b1 100644
> > --- a/include/linux/qcom-geni-se.h
> > +++ b/include/linux/qcom-geni-se.h
> > @@ -11,8 +11,9 @@
> >  /* Transfer mode supported by GENI Serial Engines */
> >  enum geni_se_xfer_mode {
> >  	GENI_SE_INVALID,
> > -	GENI_SE_FIFO,
> > -	GENI_SE_DMA,
> 
> Is the order significant? Is there a reason why SE_DMA ended up last?

Nope not that I can tjing off.. I can add this as last!

-- 
~Vinod
