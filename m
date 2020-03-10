Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFC0180826
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 20:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgCJTc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 15:32:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40404 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgCJTc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 15:32:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so6959928pfl.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 12:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qMuGgR0+CRDM0BuHZ2Ae6KXyGRvF/Wi0RAPV3JkXST8=;
        b=O7XNI6K/jach7eBMD0zokAVd37z8MwdLv7WqFDGJUXpzEHJv/6LF5IM1MssL5NHx69
         sERBdH0/wvxJRbfXc8ZfBW6WmU/BI5HjmYU5Pwy6aJgYPsoC/QOCaZUUfklrPzeM+LmE
         PliHwz3PwFW+ET0WFX++nrj0fUsGiY5wb79UMhnPsZ4NSU56/TwfJhVBhRED1eo7IZvY
         tSQ6LFPA1n/cAURoK6zJWkEVSXYiL6y+KiwY8l+yxV5JDY+n10m2MA3KzHqx7bRV4sL6
         CAx0URzemFt5ihkASDeSRezGbX69RIjNEsoJ9YZzp9qrBY5Pp5i1yewl1O6hD70yt0SH
         wjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qMuGgR0+CRDM0BuHZ2Ae6KXyGRvF/Wi0RAPV3JkXST8=;
        b=Qo+sxUYNFFob+VERVJU2lRNYNnRkC0i80ttG8iLIUWpKBv6w0nt5AJB+YfWO3we1AE
         oxR2jsjUDyWN/oovkGXXJ4Zog8ISKY58+qgUeDAYfzcNzpQQGeqquSstVgU0Cbnz4juP
         UlFFXOQCx8XsgFxRop20cu0JHbzJJ/E5A0NB1IDDHa9IEgM01S1WRJ8jaTgsWzk6p/DC
         31flXQssjYkPlZr4gnqT7wzFNwxH3Z6PdoTsp7+UeTvqJz/VjA1zjJYJ20pGKN0o3gqM
         9j080lkW0GkD1DghHFM+b0ECE0ciRLuiN2x3s3azk/Lu6WOGL5nBxbVxu2pJXVukveOk
         sa0w==
X-Gm-Message-State: ANhLgQ3RzImvG4XL4KLefKpOdGXyB7/stvMHRw7caVo8QuAZoi9iTQ9M
        9uCILIo5YHIeKMX8yiV3u8PQaw==
X-Google-Smtp-Source: ADFU+vv+xHc+Rr1UGKn/v70xw8LFUA/EYdzRhMgcJY4xJ9NFuwzP6M5LicOfJuYbs5v5GixSEdrWVA==
X-Received: by 2002:a63:7f09:: with SMTP id a9mr22043810pgd.375.1583868777114;
        Tue, 10 Mar 2020 12:32:57 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s18sm3003094pjp.24.2020.03.10.12.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:32:56 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:32:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Cl?ment Leger <cleger@kalrayinc.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
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
Subject: Re: [PATCH v5 3/8] remoteproc: Use u64 type for boot_addr
Message-ID: <20200310193253.GL264362@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-4-cleger@kalray.eu>
 <20200309195247.GC1399@xps15>
 <1297722115.9030349.1583827151221.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1297722115.9030349.1583827151221.JavaMail.zimbra@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Mar 00:59 PDT 2020, Cl?ment Leger wrote:

> 
> 
> ----- On 9 Mar, 2020, at 20:52, Mathieu Poirier mathieu.poirier@linaro.org wrote:
> 
> > On Mon, Mar 02, 2020 at 10:38:57AM +0100, Clement Leger wrote:
> >> elf64 entry is defined as a u64. Since boot_addr is used to store the
> >> elf entry point, change boot_addr type to u64 to support both elf32
> >> and elf64. In the same time, fix users that were using this variable.
> >> 
> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
> >> ---
> >>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
> >>  drivers/remoteproc/remoteproc_internal.h   | 2 +-
> >>  drivers/remoteproc/st_remoteproc.c         | 2 +-
> >>  include/linux/remoteproc.h                 | 4 ++--
> >>  4 files changed, 5 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> >> b/drivers/remoteproc/remoteproc_elf_loader.c
> >> index 606aae166eba..c2a9783cfb9a 100644
> >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
> >>   * Note that the boot address is not a configurable property of all remote
> >>   * processors. Some will always boot at a specific hard-coded address.
> >>   */
> >> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >>  {
> >>  	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
> >>  
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h
> >> b/drivers/remoteproc/remoteproc_internal.h
> >> index 58580210575c..0deae5f237b8 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -55,7 +55,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
> >>  int rproc_trigger_recovery(struct rproc *rproc);
> >>  
> >>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
> >> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> >> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> >>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
> >>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
> >>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> > 
> > The return type of function rproc_get_boot_addr() should also be changed from
> > u32 to u64.  Or perhaps this is intentional to make sure rproc->bootaddr never
> > occupies more than 32bit?
> 
> No, this is a mistake clearly. I haven't been able to test with a 64 bit
> boot address since our remote processors always boot in the 32 bits
> space. But since the elf64 boot address is on 64 bitsn this was a logical
> modification. I will fix that.
> 

Sorry, I forgot to reply to this one. I fixed it up while applying the
patch.

Thanks,
Bjorn

> > 
> >> diff --git a/drivers/remoteproc/st_remoteproc.c
> >> b/drivers/remoteproc/st_remoteproc.c
> >> index ee13d23b43a9..a3268d95a50e 100644
> >> --- a/drivers/remoteproc/st_remoteproc.c
> >> +++ b/drivers/remoteproc/st_remoteproc.c
> >> @@ -190,7 +190,7 @@ static int st_rproc_start(struct rproc *rproc)
> >>  		}
> >>  	}
> >>  
> >> -	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> >> +	dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
> >>  
> >>  	return 0;
> >>  
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index bee559330204..1683d6c386a6 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -382,7 +382,7 @@ struct rproc_ops {
> >>  				struct rproc *rproc, const struct firmware *fw);
> >>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
> >>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> >> -	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> >> +	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> >>  };
> >>  
> >>  /**
> >> @@ -498,7 +498,7 @@ struct rproc {
> >>  	int num_traces;
> >>  	struct list_head carveouts;
> >>  	struct list_head mappings;
> >> -	u32 bootaddr;
> >> +	u64 bootaddr;
> >>  	struct list_head rvdevs;
> >>  	struct list_head subdevs;
> >>  	struct idr notifyids;
> >> --
> >> 2.15.0.276.g89ea799
