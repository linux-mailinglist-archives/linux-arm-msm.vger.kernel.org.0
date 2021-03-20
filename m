Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D85342A0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 03:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhCTCh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 22:37:56 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:54528 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229708AbhCTChk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 22:37:40 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Mar 2021 19:37:39 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 19 Mar 2021 19:37:39 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 6EA671A15; Fri, 19 Mar 2021 19:37:39 -0700 (PDT)
Date:   Fri, 19 Mar 2021 19:37:39 -0700
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
Message-ID: <20210320023739.GA26323@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
 <4b77a308ccdabbe96ed68623bd6eead9510e1fc9.1615423027.git.gurus@codeaurora.org>
 <20210312121916.GE5348@sirena.org.uk>
 <20210315203336.GA8977@codeaurora.org>
 <20210317204212.GE5559@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317204212.GE5559@sirena.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 17, 2021 at 08:42:12PM +0000, Mark Brown wrote:
> On Mon, Mar 15, 2021 at 01:33:37PM -0700, Guru Das Srinagesh wrote:
> 
> > Since I do need to write to two extra registers, I'll need two
> > register_base's and two buffers to hold their data. This can be
> > generalized to "extra config registers" in the framework as follows:
> > 
> > - Add these two fields to `struct regmap_irq_chip`:
> > 
> > 	unsigned int *extra_config_base; /* Points to array of extra regs */
> > 	int num_extra_config_regs;	 /* = ARRAY_SIZE(array above) */
> 
> I'm having a hard time loving this but I'm also not able to think of any
> better ideas so sure.  I'd change the name to virtual (or virt) rather
> than extra since that's what they are so it makes it a bit omre clear.

Thanks for accepting the first patch in this series. I will test out my
proposed changes and then send a new patchset sometime next week.

Thank you.

Guru Das.
