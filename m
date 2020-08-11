Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602A8241DD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 18:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgHKQIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 12:08:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728924AbgHKQIm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 12:08:42 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 368E020756;
        Tue, 11 Aug 2020 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597162122;
        bh=c0bG2i1Yo67i7IiXHYRfswulMbXblEFqkOVi4XhGV88=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qEZSye+miar8vUJnqElxOTF+POpDxRLrwgb4PFF6bSP2+ggDRLHJqs/AfECj87jDo
         1dznyQAFkuNwLkHu0LO3+yWcPxweWPpRdDSW8sKfRXW3yCDeVZMbUR7azBqArgGOTe
         KV83OQUa/6vq3aQLEdM8lF2WgrK1juCFqTxYsaIw=
Date:   Tue, 11 Aug 2020 18:08:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mayulong <mayulong1@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/33] spmi, regulator, mfd: add drivers for hikey970
 SPMI PMIC
Message-ID: <20200811180837.2285c8b5@coco.lan>
In-Reply-To: <20200811155810.GH6967@sirena.org.uk>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
        <36a548c10ea8c75d13c3e796c4cee65132819ef1.1597160086.git.mchehab+huawei@kernel.org>
        <20200811155810.GH6967@sirena.org.uk>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Tue, 11 Aug 2020 16:58:10 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Tue, Aug 11, 2020 at 05:41:28PM +0200, Mauro Carvalho Chehab wrote:
> 
> >  drivers/mfd/hisi_pmic_spmi.c            | 759 ++++++++++++++++++++++++
> >  drivers/regulator/hisi_regulator_spmi.c | 741 +++++++++++++++++++++++
> >  drivers/spmi/hisi-spmi-controller.c     | 390 ++++++++++++
> >  include/linux/mfd/hisi_pmic.h           | 165 ++++++  
> 
> This is a single patch for three subsystems, please split it into per
> subsystem patches.

Ok, I'll split on a next version. 


Yet, it would be good to have all tree drivers applied via the same tree,
as those drivers are needed altogether in order for this PMIC to work:

- The SPMI controller driver talks with the hardware and provides
  support via the SPMI bus calls;
- The MFD PMIC driver binds into the SPMI bus and provide support
  for interrupts. It also has support for binding the regulator
  driver;
- The regulator driver needs the PMIC driver (which in turn needs
  the SPMI bus) in order to be able to talk with the hardware and
  set the power supplied.

That's basically why I opted to send the entire series altogether.

Thanks,
Mauro
