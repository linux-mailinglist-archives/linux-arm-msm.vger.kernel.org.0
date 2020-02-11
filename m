Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA836159CF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 00:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgBKXM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 18:12:58 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:42236 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgBKXM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 18:12:58 -0500
Received: by mail-yb1-f194.google.com with SMTP id z125so6270065ybf.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2020 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=asxH5rE1mHmxca38giWrHRQ20XhnB22SkpjtANiGhwo=;
        b=yz4M8AJnylgO83dqd5cHyCjYaG5DRQ4oA07sMnefBQQQRRBCvVJY+osWsi+9Nu03Ym
         Nd18a44FRrJAJZ8GtRwQxwQpmiKD3/0GcxsgtiKJ50Oju6HP+mnhBMLqOxFNVrA6OJWt
         XSebUd/CBV4Y5UMZsn9YFteKAlIMCXiRs740o+q3oOGzk5H5nUFVQcxvtaqcZCrJXyZ4
         BSLVbiNVuufPe1A+TwmfZFeG7PX4HQvLeCsHqB47yQI69ky0//yxUSf9DnwZBJ+lktSw
         OQwg05nLXKwaryExroWR4AWqlmEVCxSUAH7YtiRHXA+t3Rb0xlAw3HW1Cr/74HddoJab
         zl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=asxH5rE1mHmxca38giWrHRQ20XhnB22SkpjtANiGhwo=;
        b=Gs4ZQrABU4I2VHEgiR/zmAPltwkZgKvXyL+znMaQRJKBmt9O3gFQN69YjBWDg5525C
         GtJt6PRsDN3xLYqvKT31Q/xDVsHzEGNZKTcjWU8dYDTHV4Fx3sMLL1IEESNOfzZdQq5r
         Hm4WwRKF4FPTG8ZWu0GxAFzK8R8JZMbCZigMy2y74pyeDxV+EsCTmoPuPSKKWJ+qILOI
         8qDkUrSVfQBJxwlsFZVjzNmTDleqrEA+2eygaT6oioWSyNnFSmHmkBPel+tD5IdWxGiN
         9TEh+5RYrJ43hIMm6eAOE4JTCZOOFDzRtCU32Zm/2ULOqMUAvM5L5UgUE6NmLudAO/O7
         E89Q==
X-Gm-Message-State: APjAAAVxExYaxR6zncb55JbVNY5m32eaF60jsPLod61GbgtvQibcyjfG
        KDrrgCGbBx7bjfHDULYejRSIqg==
X-Google-Smtp-Source: APXvYqwJAiJjVFrxBA/F030e6zWj2VmgaEv8EblImL79DbW353avRqr/AqP54XIFrQYHhF+KJtDchA==
X-Received: by 2002:a05:6902:526:: with SMTP id y6mr1973370ybs.132.1581462777524;
        Tue, 11 Feb 2020 15:12:57 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id s31sm2597687ywa.30.2020.02.11.15.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 15:12:56 -0800 (PST)
Date:   Tue, 11 Feb 2020 16:12:53 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Subject: Re: [PATCH v4 0/5] remoteproc: Add elf64 support
Message-ID: <20200211231253.GC27770@xps15>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
 <5b8045be-0942-2ecf-5dba-dad58071f6af@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b8045be-0942-2ecf-5dba-dad58071f6af@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 11, 2020 at 04:57:18PM +0100, Arnaud POULIQUEN wrote:
> Hi Clement,
> 
> I tested the series on the stm32 platform for remote proc firmwre load: no regression found.
> I do not test the da_to_va feature as not implemented on stm32 platform.

It would be very interesting if you could test the coredump, that would give us
a lot more confidence in the implementation.

Thanks,
Mathieu

> 
> Regards,
> Arnaud
> 
> 
> 
> On 2/10/20 5:22 PM, Clement Leger wrote:
> > This serie add support for elf64 in remoteproc (elf loader, coredump). 
> > First two patches modifies the type of len argument (in da_to_va) and
> > boot_addr in order to allow loading elf64 segment with a u64 size
> > and a u64 entry point.
> > Next patch introduce a set of macros to access elf64 and elf32
> > transparently.
> > Last two patches are the actual modification in the elf loader and
> > remoteproc coredump support to add elf64 support.
> > 
> > Changes from V3:
> >  - Adapt coredump to elf64 file format
> >  - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
> >  - Update copyright year in remoteproc_elf_helpers.h
> >  - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
> >  - Split elf64 loader patch in 3:
> >    - boot_addr u64 change
> >    - remoteproc_elf_helpers.h creation
> >    - elf64 loading
> > 
> > Clement Leger (5):
> >   remoteproc: Use u64 len for da_to_va
> >   remoteproc: Use u64 type for boot_addr
> >   remoteproc: Add elf helpers to access elf64 and elf32 fields
> >   remoteproc: Add elf64 support in elf loader
> >   remoteproc: Adapt coredump to generate correct elf type
> > 
> >  Documentation/remoteproc.txt                |   2 +-
> >  drivers/remoteproc/imx_rproc.c              |  11 +-
> >  drivers/remoteproc/keystone_remoteproc.c    |   4 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
> >  drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
> >  drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
> >  drivers/remoteproc/qcom_wcnss.c             |   2 +-
> >  drivers/remoteproc/remoteproc_core.c        |  69 +++++++------
> >  drivers/remoteproc/remoteproc_elf_helpers.h |  95 ++++++++++++++++++
> >  drivers/remoteproc/remoteproc_elf_loader.c  | 150 ++++++++++++++++++----------
> >  drivers/remoteproc/remoteproc_internal.h    |   4 +-
> >  drivers/remoteproc/st_remoteproc.c          |   2 +-
> >  drivers/remoteproc/st_slim_rproc.c          |   4 +-
> >  drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
> >  include/linux/remoteproc.h                  |   7 +-
> >  16 files changed, 252 insertions(+), 110 deletions(-)
> >  create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h
> > 
