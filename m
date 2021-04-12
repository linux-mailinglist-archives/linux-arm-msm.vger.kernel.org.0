Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1DC35CFFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 20:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240777AbhDLSIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 14:08:25 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:50288 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240038AbhDLSIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 14:08:24 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Apr 2021 11:08:06 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 12 Apr 2021 11:08:05 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id A274719F4; Mon, 12 Apr 2021 11:08:05 -0700 (PDT)
Date:   Mon, 12 Apr 2021 11:08:05 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "subbaram@codeaurora.org" <subbaram@codeaurora.org>,
        "collinsd@codeaurora.org" <collinsd@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "joe@perches.com" <joe@perches.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "aghayal@codeaurora.org" <aghayal@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/3] regmap-irq: Extend sub-irq to support
 non-fixed reg strides
Message-ID: <20210412180805.GA18661@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
 <526562423eaa58b4075362083f561841f1d6956c.1615423027.git.gurus@codeaurora.org>
 <4abddb76d87a2e6e0d2ad98da0b8349251456158.camel@fi.rohmeurope.com>
 <d78cefad64d528e7c894c153950e4b4d2a18b300.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d78cefad64d528e7c894c153950e4b4d2a18b300.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matti,

On Mon, Apr 12, 2021 at 11:08:49AM +0000, Vaittinen, Matti wrote:
> Hi,
> 
> On Mon, 2021-04-12 at 09:05 +0300, Matti Vaittinen wrote:
> > Hi All,
> > 
> > On Wed, 2021-03-10 at 16:39 -0800, Guru Das Srinagesh wrote:
> > > Qualcomm's MFD chips have a top level interrupt status register and
> > > sub-irqs (peripherals).  When a bit in the main status register
> > > goes
> > > high, it means that the peripheral corresponding to that bit has an
> > > unserviced interrupt. If the bit is not set, this means that the
> > > corresponding peripheral does not.
> > > 
> > > Commit a2d21848d9211d ("regmap: regmap-irq: Add main status
> > > register
> > > support") introduced the sub-irq logic that is currently applied
> > > only
> > > when reading status registers, but not for any other functions like
> > > acking
> > > or masking. Extend the use of sub-irq to all other functions, with
> > > two
> > > caveats regarding the specification of offsets:
> > > 
> > > - Each member of the sub_reg_offsets array should be of length 1
> > > - The specified offsets should be the unequal strides for each sub-
> > > irq
> > >   device.
> > > 
> > > In QCOM's case, all the *_base registers are to be configured to
> > > the
> > > base addresses of the first sub-irq group, with offsets of each
> > > subsequent group calculated as a difference from these addresses.
> > > 
> > > Continuing from the example mentioned in the cover letter:
> > > 
> > > 	/*
> > > 	 * Address of MISC_INT_MASK		= 0x1011
> > > 	 * Address of TEMP_ALARM_INT_MASK	= 0x2011
> > > 	 * Address of GPIO01_INT_MASK		= 0x3011
> > > 	 *
> > > 	 * Calculate offsets as:
> > > 	 * offset_0 = 0x1011 - 0x1011 = 0       (to access MISC's
> > > 	 * 					 registers)
> > > 	 * offset_1 = 0x2011 - 0x1011 = 0x1000
> > > 	 * offset_2 = 0x3011 - 0x1011 = 0x2000
> > > 	 */
> > > 
> > > 	static unsigned int sub_unit0_offsets[] = {0};
> > > 	static unsigned int sub_unit1_offsets[] = {0x1000};
> > > 	static unsigned int sub_unit2_offsets[] = {0x2000};
> > > 
> > > 	static struct regmap_irq_sub_irq_map chip_sub_irq_offsets[] = {
> > > 		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
> > > 		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
> > > 		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
> > > 	};
> > > 
> > > 	static struct regmap_irq_chip chip_irq_chip = {
> > > 	--------8<--------
> > > 	.not_fixed_stride = true,
> > > 	.mask_base	  = MISC_INT_MASK,
> > > 	.type_base	  = MISC_INT_TYPE,
> > > 	.ack_base	  = MISC_INT_ACK,
> > > 	.sub_reg_offsets  = chip_sub_irq_offsets,
> > > 	--------8<--------
> > > 	};
> > > 
> > > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > > ---
> > >  drivers/base/regmap/regmap-irq.c | 81 ++++++++++++++++++++++++++--
> > > ------------
> > >  include/linux/regmap.h           |  7 ++++
> > >  2 files changed, 60 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/base/regmap/regmap-irq.c
> > > b/drivers/base/regmap/regmap-irq.c
> > > index 19db764..e1d8fc9e 100644
> > > --- a/drivers/base/regmap/regmap-irq.c
> > > +++ b/drivers/base/regmap/regmap-irq.c
> > > @@ -45,6 +45,27 @@ struct regmap_irq_chip_data {
> > >  	bool clear_status:1;
> > >  };
> > > 
> > 
> > Sorry that I am late with the "review" but I only now noticed this
> > change when I was following the references from PM8008 PMIC patch
> > mail.
> > 
> > 
> > >  
> > > +static int sub_irq_reg(struct regmap_irq_chip_data *data,
> > > +		       unsigned int base_reg, int i)
> > 
> > Do I read this correctly - this function should map the main status
> > bit
> > (given in i) to the (sub)IRQ register, right? How does this work for
> > cases where one bit corresponds to more than one sub-register? Or do
> > I
> > misunderstand the purpose of this function? (This is the case with
> > both
> > the BD70528 and BD71828).
> 
> I did some quick test with BD71815 which I had at home. And it seems to
> be I did indeed misunderstand this :) This is not for converting the
> main-IRQ bits to sub-irq registers - this is for getting the sub-IRQ
> register address based on the 'sub IRQ register index'.

Yes, that's right. With this change, the sub-irq concept which was
initially introduced to map the main-irq bits to sub-irq registers is
being extended and repurposed to cover the specific memory layout
described in the commit message and cover letter. 

I've updated the comment block in the header file for `sub_reg_offsets`
to make this clarification as well. 

The sub_irq_reg() function will not break existing functionality because
the crux of it will get executed only if not_fixed_stride is set.

> 
> So I do apologize the noise, it seems all is well and everything
> (except my self confidence) keeps working as it did :)
> 
> Thanks for the improvement Guru Das!

Thanks for testing this out and providing confirmation, Matti :)

Thank you.

Guru Das.
