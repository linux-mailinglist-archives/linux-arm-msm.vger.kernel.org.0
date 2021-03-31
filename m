Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865A23503CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbhCaPtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:49:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235410AbhCaPsz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:48:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC5EC61002;
        Wed, 31 Mar 2021 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617205734;
        bh=J242/NbTOFQruKkTsBUMXjsDtW/KiQMFDij8NuPdH6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gvfhSOr93va1KKhQ/pkAClMn5YNQb+aM3SBgYufVYewD2N48nVvzYrplqtQAv0Yia
         k6cSEILjhNV9oz5qXAihoLKKRXLNKpe1pTmpoaRHe8IBjLINZVSLNyCgPqiL6SS3N+
         CKb9ppUZOOOU9q6QH19NBZErNAs+7y858xx914NuuxhLfhlTgcrcEuK7s0Svtl9qyk
         W8tM+VToG4SDEphdQNCWZN2PL9PoEBPenGIaOOQBG7izDjPuuNJojKCSTnRwDTW1Kh
         NFLC6xg6N2AAiqKc7hP1ci+yXVIZ/ohdXLwPeRN87r6ppui7tR67+bi16ZgUwP0Svg
         hZmA6FkTzhctg==
Date:   Wed, 31 Mar 2021 21:18:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soundwire: qcom: use signed variable for error return
Message-ID: <YGSZ4sAwMUA5kQsc@vkoul-mobl.Dlink>
References: <20210331072111.2945945-1-vkoul@kernel.org>
 <9cdef4e9-a38a-6c77-1b23-739f85384b12@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cdef4e9-a38a-6c77-1b23-739f85384b12@linux.intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-03-21, 09:41, Pierre-Louis Bossart wrote:
> 
> 
> On 3/31/21 2:21 AM, Vinod Koul wrote:
> > We get warning for using a unsigned variable being compared to less than
> > zero. The comparison is correct as it checks for errors from previous
> > call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
> > variable instead.
> > 
> > drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
> > condition '(devnum < 0) => (0-255 < 0)'
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/soundwire/qcom.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index b08ecb9b418c..55ed133c6704 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
> >   	struct qcom_swrm_ctrl *swrm = dev_id;
> >   	u32 value, intr_sts, intr_sts_masked, slave_status;
> >   	u32 i;
> > -	u8 devnum = 0;
> > +	s8 devnum = 0;
> 
> it's not great to store negative error codes with s8. That works in this
> specific case because the function only returns -EINVAL.

Yeah I did check EINVAL was the case which would work but in general I
agree that makes sense, I discussed with Srini on IRC and looks like I
havent posted v2, should hit the pipes shortly

-- 
~Vinod
