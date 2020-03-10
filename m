Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A32617ED03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 01:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgCJAAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 20:00:12 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38420 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbgCJAAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 20:00:10 -0400
Received: by mail-pg1-f194.google.com with SMTP id x7so5450090pgh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=CAIbp1jCToJI29feBeEcnjrXkxv3GWdOnu4cDh/4qr0=;
        b=gO8+QJsi1LWTUcN3H8T6YF+qHYOco+gtqLYeIuO3GQHRlMnsH/Vtkwb2IVlL5W/qfz
         degW0VCD/5IBWRsXabJZDYGAj84MkK37B53f8nt9r8XC+WXqpDpeXtOWRw44tkyalIn3
         Zd7B5grh6zPS916RvZ8amE93tj5xu0NuNA47heZkGuWAVidYRnuO4xG991aGR9WIhuUH
         rGnR5Pik1mBxN3u7r5oncPsRxUqa4u8A7IA2zuf96x8/hHWANutp4RC8M5HHtgzyj7Mr
         5qMS4mX+WNPsSrcbqYonC/pNJ6//OpShy9zk3uUqXqW8MzKqN2o4/QaBzS92HABci935
         6VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CAIbp1jCToJI29feBeEcnjrXkxv3GWdOnu4cDh/4qr0=;
        b=qGNm07tILeSaqQ8Jfqnwd4MhuwfhnCB4qfFjoto49r9dh3tpJiQH/veML8+L1JGgiI
         Xc0sqTAj1RBNn5h/NyXHi7qrvCgDhBLFRgjCtnxY0EofrtKu8a2NIdUbUe8mPkDgme/N
         XMgWiELs3kikdryy8FdITJ8EpW1T9XaYcjTWLocIgttF7AmboF0dc8Jw5i2PrYce7h1h
         SaXwnAOnketLJTEhFLJMPFUtDLY56SV/bFReP6Pm2H+hAY+fawHyzSJZg+ZUQgtpG1Jt
         wdX+ivhvDEo+cQUltZ3tJ/M6VAtwsJRDTDGSjar56nJ8Sblm8ycEARVKzVQc/d7SeNST
         Nvdw==
X-Gm-Message-State: ANhLgQ1bJYNjnj5sxIkZa/z3/x0XhDFdi8nZTQAPP8/lk5DjN69TfovL
        65cDxQuqpOUIGkjZcm7wzEBklw==
X-Google-Smtp-Source: ADFU+vuEVxae8PUP2mkQKbg4oGv3HhgzVoU3+FXQRgOedGkNbYK+mbKxWgf7oKhWBpdVHw6tg3w3RA==
X-Received: by 2002:a63:1201:: with SMTP id h1mr19039845pgl.284.1583798408689;
        Mon, 09 Mar 2020 17:00:08 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k14sm20564pfg.104.2020.03.09.17.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 17:00:08 -0700 (PDT)
Date:   Mon, 9 Mar 2020 17:00:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Cl?ment Leger <cleger@kalrayinc.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
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
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 5/8] remoteproc: Rename rproc_elf_sanity_check for
 elf32
Message-ID: <20200310000005.GF14744@builder>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-6-cleger@kalray.eu>
 <20200302231342.GE262924@yoga>
 <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 03 Mar 00:02 PST 2020, Cl?ment Leger wrote:

> Hi Bjorn, 
> 
> ----- On 3 Mar, 2020, at 00:13, Bjorn Andersson bjorn.andersson@linaro.org wrote:
> 
> > On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:
> > 
> >> Since this function will be modified to support both elf32 and elf64,
> >> rename the existing one to elf32 (which is the only supported format
> >> at the moment). This will allow not to introduce possible side effect
> >> when adding elf64 support (ie: all backends will still support only
> >> elf32 if not requested explicitely using rproc_elf_sanity_check).
> >> 
> > 
> > Is there a reason for preventing ELF64 binaries be loaded?
> 
> I decided to go this way to let driver maintainer decide if they want
> to support elf64 to avoid problems with 64bits addresses/sizes which do
> not fit in their native type (size_t for instance). This is probably
> not going to happen and there are additionnal checks before calling
> rproc_da_to_va. And addresses should be filtered by rproc_da_to_va.
> So, actually it seems there is no reason to forbid supporting elf32/64
> for all drivers.
> 

I was hoping to hear some additional feedback on this from others.

I've merge the patch as is, but think it would be nice to clean this up
and just have the driver ignore if fed a 32 or 64-elf.

Regards,
Bjorn

> Regards,
> 
> Clément
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c       | 2 +-
> >>  drivers/remoteproc/remoteproc_elf_loader.c | 6 +++---
> >>  drivers/remoteproc/remoteproc_internal.h   | 2 +-
> >>  drivers/remoteproc/st_remoteproc.c         | 2 +-
> >>  drivers/remoteproc/st_slim_rproc.c         | 2 +-
> >>  drivers/remoteproc/stm32_rproc.c           | 2 +-
> >>  6 files changed, 8 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> b/drivers/remoteproc/remoteproc_core.c
> >> index 4bfaf4a3c4a3..99f0b796fbc7 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -2055,7 +2055,7 @@ struct rproc *rproc_alloc(struct device *dev, const char
> >> *name,
> >>  		rproc->ops->load = rproc_elf_load_segments;
> >>  		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> >>  		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> >> -		rproc->ops->sanity_check = rproc_elf_sanity_check;
> >> +		rproc->ops->sanity_check = rproc_elf32_sanity_check;
> >>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> >>  	}
> >>  
> >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> >> b/drivers/remoteproc/remoteproc_elf_loader.c
> >> index c2a9783cfb9a..5a67745f2638 100644
> >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> >> @@ -25,13 +25,13 @@
> >>  #include "remoteproc_internal.h"
> >>  
> >>  /**
> >> - * rproc_elf_sanity_check() - Sanity Check ELF firmware image
> >> + * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
> >>   * @rproc: the remote processor handle
> >>   * @fw: the ELF firmware image
> >>   *
> >>   * Make sure this fw image is sane.
> >>   */
> >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >>  {
> >>  	const char *name = rproc->firmware;
> >>  	struct device *dev = &rproc->dev;
> >> @@ -89,7 +89,7 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct
> >> firmware *fw)
> >>  
> >>  	return 0;
> >>  }
> >> -EXPORT_SYMBOL(rproc_elf_sanity_check);
> >> +EXPORT_SYMBOL(rproc_elf32_sanity_check);
> >>  
> >>  /**
> >>   * rproc_elf_get_boot_addr() - Get rproc's boot address.
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h
> >> b/drivers/remoteproc/remoteproc_internal.h
> >> index 0deae5f237b8..28639c588d58 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -54,7 +54,7 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
> >>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
> >>  int rproc_trigger_recovery(struct rproc *rproc);
> >>  
> >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
> >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw);
> >>  u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> >>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
> >>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
> >> diff --git a/drivers/remoteproc/st_remoteproc.c
> >> b/drivers/remoteproc/st_remoteproc.c
> >> index a3268d95a50e..a6cbfa452764 100644
> >> --- a/drivers/remoteproc/st_remoteproc.c
> >> +++ b/drivers/remoteproc/st_remoteproc.c
> >> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
> >>  	.parse_fw		= st_rproc_parse_fw,
> >>  	.load			= rproc_elf_load_segments,
> >>  	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
> >> -	.sanity_check		= rproc_elf_sanity_check,
> >> +	.sanity_check		= rproc_elf32_sanity_check,
> >>  	.get_boot_addr		= rproc_elf_get_boot_addr,
> >>  };
> >>  
> >> diff --git a/drivers/remoteproc/st_slim_rproc.c
> >> b/drivers/remoteproc/st_slim_rproc.c
> >> index 09bcb4d8b9e0..3cca8b65a8db 100644
> >> --- a/drivers/remoteproc/st_slim_rproc.c
> >> +++ b/drivers/remoteproc/st_slim_rproc.c
> >> @@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops = {
> >>  	.da_to_va       = slim_rproc_da_to_va,
> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >>  	.load		= rproc_elf_load_segments,
> >> -	.sanity_check	= rproc_elf_sanity_check,
> >> +	.sanity_check	= rproc_elf32_sanity_check,
> >>  };
> >>  
> >>  /**
> >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >> index a18f88044111..9a8b5f5e2572 100644
> >> --- a/drivers/remoteproc/stm32_rproc.c
> >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> @@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops = {
> >>  	.load		= rproc_elf_load_segments,
> >>  	.parse_fw	= stm32_rproc_parse_fw,
> >>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> >> -	.sanity_check	= rproc_elf_sanity_check,
> >> +	.sanity_check	= rproc_elf32_sanity_check,
> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >>  };
> >>  
> >> --
> >> 2.15.0.276.g89ea799
