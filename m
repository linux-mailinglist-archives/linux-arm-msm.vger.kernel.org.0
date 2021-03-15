Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A0B33C7D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 21:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhCOUgN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 16:36:13 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12593 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231981AbhCOUgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 16:36:09 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Mar 2021 13:36:09 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 15 Mar 2021 13:36:08 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id BF4D719B3; Mon, 15 Mar 2021 13:36:08 -0700 (PDT)
Date:   Mon, 15 Mar 2021 13:36:08 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] regmap-irq: Add support for POLARITY_HI and
 POLARITY_LO config regs
Message-ID: <20210315203608.GB8977@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
 <4b77a308ccdabbe96ed68623bd6eead9510e1fc9.1615423027.git.gurus@codeaurora.org>
 <20210312121916.GE5348@sirena.org.uk>
 <20210315203336.GA8977@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315203336.GA8977@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 15, 2021 at 01:33:36PM -0700, Guru Das Srinagesh wrote:
> On Fri, Mar 12, 2021 at 12:19:16PM +0000, Mark Brown wrote:
> > On Wed, Mar 10, 2021 at 04:39:53PM -0800, Guru Das Srinagesh wrote:
> > > If an interrupt is already configured as either edge- or
> > > level-triggered, setting the corresponding bit for it in the POLARITY_HI
> > > register further configures it as rising-edge or level-high triggered
> > > (as the case may be), while setting the same bit in POLARITY_LO further
> > > configures it as falling-edge or level-low triggered.
> > 
> > I think you probably need to bring these three fields together into a
> > single virtual field and then map the values within that field using
> > the existing type stuff.
> 
> Sure, how about this scheme then, for patches 2 and 3 in this series?
> (Patch 1 will remain the same, pending your review of it.)
> 
> Since I do need to write to two extra registers, I'll need two
> register_base's and two buffers to hold their data. This can be
> generalized to "extra config registers" in the framework as follows:
> 
> - Add these two fields to `struct regmap_irq_chip`:
> 
> 	unsigned int *extra_config_base; /* Points to array of extra regs */
> 	int num_extra_config_regs;	 /* = ARRAY_SIZE(array above) */
> 
> - Add this field to `struct regmap_irq_chip_data`:
> 
> 	unsigned int **extra_config_buf;
>   	/* Will be dynamically allocated to size of:
>   	 * [chip->num_extra_config_regs][chip->num_regs]
>   	 */
> 
> - Add a new function callback in `struct regmap_irq_chip`:
> 
> 	int (*configure_extra_regs)(void *irq_drv_data, unsigned int
> 	type)
> 
>   This callback will be called at the end of regmap_irq_set_type():
>   	
>   	if (d->chip->configure_extra_regs)
> 		d->chip->configure_extra_regs();
> 
>   The callback, defined in the client driver, will specifically address
>   the changes to regmap_irq_set_type() made in patches 2 and 3 of this
>   series, viz. overriding how type_buf is to be handled, plus the
>   populating of polarity_*_buf's (rechristened as extra_config_bufs in
>   this proposed new scheme).
> 
> This new scheme thus makes v2 more generic. I thought I'd discuss this
> with you before implementing it as v3 RFC. Could you please let me know
> your thoughts?

Typo. I meant:

This new scheme thus makes *v3* more generic. I thought I'd discuss this
with you before implementing it as *v4* RFC. 

Guru Das.
