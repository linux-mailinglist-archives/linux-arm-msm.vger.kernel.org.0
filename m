Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB041C0BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 03:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgEAB2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 21:28:06 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45175 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727114AbgEAB2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 21:28:06 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Apr 2020 18:28:05 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 30 Apr 2020 18:28:01 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 563BB4D45; Thu, 30 Apr 2020 18:28:01 -0700 (PDT)
Date:   Thu, 30 Apr 2020 18:28:01 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Joe Perches <joe@perches.com>
Cc:     Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mfd: Introduce QTI I2C PMIC controller
Message-ID: <20200501012801.GB28441@codeaurora.org>
Mail-Followup-To: Joe Perches <joe@perches.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <cover.1588115326.git.gurus@codeaurora.org>
 <5644dea146f8b49a5b827c56392ff916bfb343e9.1588115326.git.gurus@codeaurora.org>
 <20200429075010.GX3559@dell>
 <20200501011319.GA28441@codeaurora.org>
 <9844969151d1641a0bc68c1378b554d66cc0fcf9.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9844969151d1641a0bc68c1378b554d66cc0fcf9.camel@perches.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 30, 2020 at 06:18:18PM -0700, Joe Perches wrote:
> On Thu, 2020-04-30 at 18:13 -0700, Guru Das Srinagesh wrote:
> > On Wed, Apr 29, 2020 at 08:50:10AM +0100, Lee Jones wrote:
> > > On Tue, 28 Apr 2020, Guru Das Srinagesh wrote:
> > > > The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
> > > > multi-function PMIC devices which communicate over the I2C bus.  The
> > > > controller enumerates all child nodes as platform devices, and
> > > > instantiates a regmap interface for them to communicate over the I2C
> > > > bus.
> []
> > > > diff --git a/drivers/mfd/qcom-i2c-pmic.c b/drivers/mfd/qcom-i2c-pmic.c
> []
> > > Please don't role your own debug helpers.
> > > 
> > > The ones the kernel provides are suitably proficient.
> > 
> > Sure. Would this be acceptable instead, with the custom string replaced by a
> > macro that the kernel provides?
> > 
> > 	#define pr_fmt(fmt) "%s: %s: " fmt, KBUILD_MODNAME, __func__
> 
> trivia:
> 
> It's almost always smaller object code to use
> the KBUILD_MODNAME as a fixed string instead of
> as a printf argument.
> 
> 	#define pr_fmt(fmt) KBUILD_MODNAME ": %s: " fmt, __func__

Thanks, duly noted :)

Thank you.

Guru Das.
