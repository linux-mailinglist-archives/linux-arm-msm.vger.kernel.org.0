Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38CE81960D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 23:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbgC0WFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 18:05:51 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35130 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgC0WFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 18:05:51 -0400
Received: by mail-pj1-f67.google.com with SMTP id g9so4319650pjp.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V9qwFjfcOrK0L+Z6+O8bfnxTyMS4r1ZhXiuuyox2uvQ=;
        b=AOjaVCkD/+gCJc5F7S06JCc5oBDxz2JF1rwGwspQMbkwKHkOsgXaTgyKmFLr7xzUv9
         kvXaszSKgI6qhLDHycDEKbyF7YOM/J2UwAt8t5/533w/zacXPT0nHLhEeVf0hM42LL8I
         jBeXTAOyTQk8PBVBuV8UXJBoMk+y0KAgkCoFWmY7MgGz4xl/+0M+bxN3EY6nYOYyyBXE
         SbflFWPSiXeUQ0IL0lHdMrgTBfgkJC1+Hl8JllwNFo7rAFCKIxe6XQmmU1XKDrWOiEop
         cz2y1vY4GApWZg/AhQtrsFHlChT3mog1UvkKeUtF0PBDQPPp2gWPr2kUQeuZHJs6KX9q
         TZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V9qwFjfcOrK0L+Z6+O8bfnxTyMS4r1ZhXiuuyox2uvQ=;
        b=QJpI5XiK56FPgW/mtY1zyNtZKJ3vx/MtHShs42O02jKO598crdWUnF8yS+CfsnXR8d
         bDUF2AAcOkQOLzwlaX2mLdGZgpquzAubvKdkIH4tncC/eeogq61OrpsULBCM+Z2rGFKy
         MQxOOajqwjvfRxfQ5vYr+huyRUiy21/jF96V/i/heKIn6rsDSXnp/pm2sccDHda2Xq6e
         Exn+MMRG3kxHp2lxyAIuEunraYQuezjJ5z9kFGVfLTWwlFiREOYdvx5Zd94dfHAji9qm
         sdmHDvXPoV6N/rxDb+D1NZuIpcAmyTFm48bMZxG92eEvZI6aK/dM2/8XRDY/LQaiu8Wa
         w/jw==
X-Gm-Message-State: ANhLgQ25/jix7GuL5slOB7SaBveyGeQ8HgSzIk2x6dvibxa+NDLFcYR+
        xDZDXIvnb/LJCDcPTlOL3tzdCg==
X-Google-Smtp-Source: ADFU+vvOwW5ae8gnn4rURyluPK7mymGqsX2Wt7ZW4cw9ZUQ0/VarXYdCUo2GLCTGThPxMRPaMkMBZw==
X-Received: by 2002:a17:90a:2489:: with SMTP id i9mr1519082pje.183.1585346748265;
        Fri, 27 Mar 2020 15:05:48 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w4sm4863933pfc.57.2020.03.27.15.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:05:47 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:05:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH] ARM: qcom: Add support for IPQ40xx
Message-ID: <20200327220545.GC5063@builder>
References: <20200106135715.1159420-1-robert.marko@sartura.hr>
 <CA+HBbNHEetusFNH-8Qmva=2-_HQRRJ33qfBRSudZBVW+vK0tnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNHEetusFNH-8Qmva=2-_HQRRJ33qfBRSudZBVW+vK0tnw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Mar 03:25 PDT 2020, Robert Marko wrote:

> On Mon, Jan 6, 2020 at 2:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > From: Christian Lamparter <chunkeey@gmail.com>
> >
> > Add support for the Qualcomm IPQ40xx SoC in Kconfig.
> > Also add its appropriate textofs.
> Any blockers on this patch?
> 

No, I must have missed it in the past. I've picked it up for 5.8.

Thanks for the reminder,
Bjorn

> Thanks
> >
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Tested-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> >  arch/arm/Makefile          | 1 +
> >  arch/arm/mach-qcom/Kconfig | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index db857d07114f..3db642722af0 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -152,6 +152,7 @@ textofs-$(CONFIG_PM_H1940)      := 0x00108000
> >  ifeq ($(CONFIG_ARCH_SA1100),y)
> >  textofs-$(CONFIG_SA1111) := 0x00208000
> >  endif
> > +textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> >  textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> >  textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> >  textofs-$(CONFIG_ARCH_MESON) := 0x00208000
> > diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
> > index ecbf3c4eb878..1772eccb5caf 100644
> > --- a/arch/arm/mach-qcom/Kconfig
> > +++ b/arch/arm/mach-qcom/Kconfig
> > @@ -12,6 +12,11 @@ menuconfig ARCH_QCOM
> >
> >  if ARCH_QCOM
> >
> > +config ARCH_IPQ40XX
> > +       bool "Enable support for IPQ40XX"
> > +       select CLKSRC_QCOM
> > +       select HAVE_ARM_ARCH_TIMER
> > +
> >  config ARCH_MSM8X60
> >         bool "Enable support for MSM8X60"
> >         select CLKSRC_QCOM
> > --
> > 2.24.1
> >
