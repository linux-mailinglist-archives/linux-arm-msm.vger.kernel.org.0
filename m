Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36269180204
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCJPiX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:38:23 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:34738 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgCJPiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:38:23 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id CD98327E06CF;
        Tue, 10 Mar 2020 16:38:20 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id B8fxa8_W8eoP; Tue, 10 Mar 2020 16:38:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F3C7327E0778;
        Tue, 10 Mar 2020 16:38:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 44Wf8UyRlh7P; Tue, 10 Mar 2020 16:38:19 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id D5B5627E06CF;
        Tue, 10 Mar 2020 16:38:19 +0100 (CET)
Date:   Tue, 10 Mar 2020 16:38:19 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Message-ID: <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200310152031.GA25781@xps15>
References: <20200210162209.23149-1-cleger@kalray.eu> <20200302093902.27849-1-cleger@kalray.eu> <20200302093902.27849-6-cleger@kalray.eu> <20200302231342.GE262924@yoga> <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu> <20200310000005.GF14744@builder> <20200310152031.GA25781@xps15>
Subject: Re: [PATCH v5 5/8] remoteproc: Rename rproc_elf_sanity_check for
 elf32
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC75 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Rename rproc_elf_sanity_check for elf32
Thread-Index: 744OYv16WCG9UdQXi+/ZzGoAOSiy2Q==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

----- On 10 Mar, 2020, at 16:20, Mathieu Poirier mathieu.poirier@linaro.org wrote:

> On Mon, Mar 09, 2020 at 05:00:05PM -0700, Bjorn Andersson wrote:
>> On Tue 03 Mar 00:02 PST 2020, Cl?ment Leger wrote:
>> 
>> > Hi Bjorn,
>> > 
>> > ----- On 3 Mar, 2020, at 00:13, Bjorn Andersson bjorn.andersson@linaro.org
>> > wrote:
>> > 
>> > > On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:
>> > > 
>> > >> Since this function will be modified to support both elf32 and elf64,
>> > >> rename the existing one to elf32 (which is the only supported format
>> > >> at the moment). This will allow not to introduce possible side effect
>> > >> when adding elf64 support (ie: all backends will still support only
>> > >> elf32 if not requested explicitely using rproc_elf_sanity_check).
>> > >> 
>> > > 
>> > > Is there a reason for preventing ELF64 binaries be loaded?
>> > 
>> > I decided to go this way to let driver maintainer decide if they want
>> > to support elf64 to avoid problems with 64bits addresses/sizes which do
>> > not fit in their native type (size_t for instance). This is probably
>> > not going to happen and there are additionnal checks before calling
>> > rproc_da_to_va. And addresses should be filtered by rproc_da_to_va.
>> > So, actually it seems there is no reason to forbid supporting elf32/64
>> > for all drivers.
>> > 
>> 
>> I was hoping to hear some additional feedback on this from others.
> 
> I didn't follow up on this one because I agreed with your assesment and didn't
> think it was needed.
> 
> Simply put I would rather see rproc_elf_sanity_check() gain support for elf64
> and let the platform code decide what to do with format they don't support
> rather than spinning a new function.
> 
>> 
>> I've merge the patch as is, but think it would be nice to clean this up
>> and just have the driver ignore if fed a 32 or 64-elf.
> 
> It would be really nice to see this cleaned up in time for the coming merge
> window...

I could have sent a V7, but Bjorn was faster than my comment ;)
Bjorn, Is there any way to revert that or it's already pushed ?
I already have a clean V7.

Thanks,

Clément

> 
> Thanks
> Mathieu
> 
>> 
>> Regards,
>> Bjorn
>> 
>> > Regards,
>> > 
>> > Clément
>> > 
>> > > 
>> > > Regards,
>> > > Bjorn
>> > > 
>> > >> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> > >> ---
>> > >>  drivers/remoteproc/remoteproc_core.c       | 2 +-
>> > >>  drivers/remoteproc/remoteproc_elf_loader.c | 6 +++---
>> > >>  drivers/remoteproc/remoteproc_internal.h   | 2 +-
>> > >>  drivers/remoteproc/st_remoteproc.c         | 2 +-
>> > >>  drivers/remoteproc/st_slim_rproc.c         | 2 +-
>> > >>  drivers/remoteproc/stm32_rproc.c           | 2 +-
>> > >>  6 files changed, 8 insertions(+), 8 deletions(-)
>> > >> 
>> > >> diff --git a/drivers/remoteproc/remoteproc_core.c
>> > >> b/drivers/remoteproc/remoteproc_core.c
>> > >> index 4bfaf4a3c4a3..99f0b796fbc7 100644
>> > >> --- a/drivers/remoteproc/remoteproc_core.c
>> > >> +++ b/drivers/remoteproc/remoteproc_core.c
>> > >> @@ -2055,7 +2055,7 @@ struct rproc *rproc_alloc(struct device *dev, const char
>> > >> *name,
>> > >>  		rproc->ops->load = rproc_elf_load_segments;
>> > >>  		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
>> > >>  		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
>> > >> -		rproc->ops->sanity_check = rproc_elf_sanity_check;
>> > >> +		rproc->ops->sanity_check = rproc_elf32_sanity_check;
>> > >>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>> > >>  	}
>> > >>  
>> > >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> b/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> index c2a9783cfb9a..5a67745f2638 100644
>> > >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> @@ -25,13 +25,13 @@
>> > >>  #include "remoteproc_internal.h"
>> > >>  
>> > >>  /**
>> > >> - * rproc_elf_sanity_check() - Sanity Check ELF firmware image
>> > >> + * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
>> > >>   * @rproc: the remote processor handle
>> > >>   * @fw: the ELF firmware image
>> > >>   *
>> > >>   * Make sure this fw image is sane.
>> > >>   */
>> > >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>> > >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw)
>> > >>  {
>> > >>  	const char *name = rproc->firmware;
>> > >>  	struct device *dev = &rproc->dev;
>> > >> @@ -89,7 +89,7 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct
>> > >> firmware *fw)
>> > >>  
>> > >>  	return 0;
>> > >>  }
>> > >> -EXPORT_SYMBOL(rproc_elf_sanity_check);
>> > >> +EXPORT_SYMBOL(rproc_elf32_sanity_check);
>> > >>  
>> > >>  /**
>> > >>   * rproc_elf_get_boot_addr() - Get rproc's boot address.
>> > >> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> > >> b/drivers/remoteproc/remoteproc_internal.h
>> > >> index 0deae5f237b8..28639c588d58 100644
>> > >> --- a/drivers/remoteproc/remoteproc_internal.h
>> > >> +++ b/drivers/remoteproc/remoteproc_internal.h
>> > >> @@ -54,7 +54,7 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
>> > >>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>> > >>  int rproc_trigger_recovery(struct rproc *rproc);
>> > >>  
>> > >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
>> > >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw);
>> > >>  u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
>> > >>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>> > >>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
>> > >> diff --git a/drivers/remoteproc/st_remoteproc.c
>> > >> b/drivers/remoteproc/st_remoteproc.c
>> > >> index a3268d95a50e..a6cbfa452764 100644
>> > >> --- a/drivers/remoteproc/st_remoteproc.c
>> > >> +++ b/drivers/remoteproc/st_remoteproc.c
>> > >> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
>> > >>  	.parse_fw		= st_rproc_parse_fw,
>> > >>  	.load			= rproc_elf_load_segments,
>> > >>  	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
>> > >> -	.sanity_check		= rproc_elf_sanity_check,
>> > >> +	.sanity_check		= rproc_elf32_sanity_check,
>> > >>  	.get_boot_addr		= rproc_elf_get_boot_addr,
>> > >>  };
>> > >>  
>> > >> diff --git a/drivers/remoteproc/st_slim_rproc.c
>> > >> b/drivers/remoteproc/st_slim_rproc.c
>> > >> index 09bcb4d8b9e0..3cca8b65a8db 100644
>> > >> --- a/drivers/remoteproc/st_slim_rproc.c
>> > >> +++ b/drivers/remoteproc/st_slim_rproc.c
>> > >> @@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops = {
>> > >>  	.da_to_va       = slim_rproc_da_to_va,
>> > >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>> > >>  	.load		= rproc_elf_load_segments,
>> > >> -	.sanity_check	= rproc_elf_sanity_check,
>> > >> +	.sanity_check	= rproc_elf32_sanity_check,
>> > >>  };
>> > >>  
>> > >>  /**
>> > >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> > >> index a18f88044111..9a8b5f5e2572 100644
>> > >> --- a/drivers/remoteproc/stm32_rproc.c
>> > >> +++ b/drivers/remoteproc/stm32_rproc.c
>> > >> @@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops = {
>> > >>  	.load		= rproc_elf_load_segments,
>> > >>  	.parse_fw	= stm32_rproc_parse_fw,
>> > >>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>> > >> -	.sanity_check	= rproc_elf_sanity_check,
>> > >> +	.sanity_check	= rproc_elf32_sanity_check,
>> > >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>> > >>  };
>> > >>  
>> > >> --
> > > >> 2.15.0.276.g89ea799
