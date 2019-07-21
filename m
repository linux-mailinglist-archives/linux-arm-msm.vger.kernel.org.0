Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6BC16F3B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2019 16:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfGUOgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jul 2019 10:36:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39026 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfGUOgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jul 2019 10:36:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id f17so12145846pfn.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jul 2019 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dUXYRm/uz8K2XBOkvg3xI+TWD4KiZR/gBR+tdrB+5/M=;
        b=u0nQEgsK5XW04foSXvHPhWir6Of8Loz+g4o1MYIxaxq55hOEcaaWNiMpb5HGyV69Mp
         zU7SxNdTK7YpclZx+ToLBA1sXGYxMOst7ZBHPvmZjezavtjt0dCkOh+1Syq5z41v1q81
         CNj+TO6N3SxamhlgyGY7RPZ8nVqLWTuxbi6oqlsp8HrU92n2O9ZGzCAHMy8MsvMJg7ct
         8oaWekIuk5dKn/WDFAM/VOTVjTAixOtgtR4sTEUIR/B0t5v8ujKPs43C0WXLTJfkRPwA
         +4IP3CoifdQcu33xzcgM5KKdfH/PyzLTXybDCY4YhqijHirIPsr/ICvB7G61iXgFTngb
         x7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dUXYRm/uz8K2XBOkvg3xI+TWD4KiZR/gBR+tdrB+5/M=;
        b=hiIi8yJkg5hlMmOD8qNVqbyWlMixoOboMs2lxgCISyQMc7azbpVs5jDww9QEG31Cq4
         FA8u9AmxsvSCn0h2Mpbb+mhN0Ar0sf6+gBDPPJ1mkev263WKV9mg6grtvlemoYzFAgd6
         l6WT2qcvhAgJ2IDs/721ERuLnjySge7DRz15RsAwTE98sU9gunBk0/RMf97mEIO+KOKy
         6CozDAbohLPYEk1Ea6rTd0BBsP+UZbgvF4B14pqoWrEfoaDwc7KKRX5jIkrlh4qL+ZqZ
         yMMNTnKk9PimTGuVsFhrZ55N3D0ClVY8zzF1MzZViQ1uDGg57spAIEAzR1Q0kTIT4Ie1
         LapA==
X-Gm-Message-State: APjAAAVmlTA6JWSMDlO7Isf4uGDxdX/hvLeQI/1dqMvP+mdSrmW5C3UE
        P+4DgEv3Hz68hUjtNJNiEWpRDw==
X-Google-Smtp-Source: APXvYqy6pit+B+1VE5RtCzbLoThJOVpMtSj3TBYYM5jFRngMM3NfToD4eEpQOnXJCxl5W46gRJWmTA==
X-Received: by 2002:a63:774c:: with SMTP id s73mr66455192pgc.238.1563719761745;
        Sun, 21 Jul 2019 07:36:01 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1433-81.members.linode.com. [45.33.106.81])
        by smtp.gmail.com with ESMTPSA id o3sm68687081pje.1.2019.07.21.07.35.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2019 07:36:00 -0700 (PDT)
Date:   Sun, 21 Jul 2019 22:35:53 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCHv8 5/5] coresight: cpu-debug: Add support for Qualcomm Kryo
Message-ID: <20190721143553.GA25136@leoy-ThinkPad-X240s>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e2c4cc7c6ccaa5695f25af20c8e487ac53b39955.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717165602.GA4271@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717165602.GA4271@xps15>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 17, 2019 at 10:56:02AM -0600, Mathieu Poirier wrote:
> On Fri, Jul 12, 2019 at 07:46:27PM +0530, Sai Prakash Ranjan wrote:
> > Add support for coresight CPU debug module on Qualcomm
> > Kryo CPUs. This patch adds the UCI entries for Kryo CPUs
> > found on MSM8996 which shares the same PIDs as ETMs.
> > 
> > Without this, below error is observed on MSM8996:
> > 
> > [    5.429867] OF: graph: no port node found in /soc/debug@3810000
> > [    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
> > [    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
> > [    5.446474] OF: graph: no port node found in /soc/debug@3910000
> > [    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
> > [    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
> > [    5.487765] OF: graph: no port node found in /soc/debug@3a10000
> > [    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
> > [    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
> > [    5.501802] OF: graph: no port node found in /soc/debug@3b10000
> > [    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
> > [    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized
> > 
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > ---
> >  .../hwtracing/coresight/coresight-cpu-debug.c | 33 +++++++++----------
> >  drivers/hwtracing/coresight/coresight-priv.h  | 10 +++---
> >  2 files changed, 21 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > index 2463aa7ab4f6..96544b348c27 100644
> > --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > @@ -646,24 +646,23 @@ static int debug_remove(struct amba_device *adev)
> >  	return 0;
> >  }
> >  
> > +static const struct amba_cs_uci_id uci_id_debug[] = {
> > +	{
> > +		/*  CPU Debug UCI data */
> > +		.devarch	= 0x47706a15,
> > +		.devarch_mask	= 0xfff0ffff,
> > +		.devtype	= 0x00000015,
> > +	}
> > +};
> > +
> >  static const struct amba_id debug_ids[] = {
> > -	{       /* Debug for Cortex-A53 */
> > -		.id	= 0x000bbd03,
> > -		.mask	= 0x000fffff,
> > -	},
> > -	{       /* Debug for Cortex-A57 */
> > -		.id	= 0x000bbd07,
> > -		.mask	= 0x000fffff,
> > -	},
> > -	{       /* Debug for Cortex-A72 */
> > -		.id	= 0x000bbd08,
> > -		.mask	= 0x000fffff,
> > -	},
> > -	{       /* Debug for Cortex-A73 */
> > -		.id	= 0x000bbd09,
> > -		.mask	= 0x000fffff,
> > -	},
> > -	{ 0, 0 },
> > +	CS_AMBA_ID(0x000bbd03),				/* Cortex-A53 */
> > +	CS_AMBA_ID(0x000bbd07),				/* Cortex-A57 */
> > +	CS_AMBA_ID(0x000bbd08),				/* Cortex-A72 */
> > +	CS_AMBA_ID(0x000bbd09),				/* Cortex-A73 */
> > +	CS_AMBA_UCI_ID(0x000f0205, uci_id_debug),	/* Qualcomm Kryo */
> > +	CS_AMBA_UCI_ID(0x000f0211, uci_id_debug),	/* Qualcomm Kryo */
> > +	{},
> >  };
> >  
> >  static struct amba_driver debug_driver = {
> > diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> > index 7d401790dd7e..41ae5863104d 100644
> > --- a/drivers/hwtracing/coresight/coresight-priv.h
> > +++ b/drivers/hwtracing/coresight/coresight-priv.h
> > @@ -185,11 +185,11 @@ static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
> >  	}
> >  
> >  /* coresight AMBA ID, full UCI structure: id table entry. */
> > -#define CS_AMBA_UCI_ID(pid, uci_ptr)	\
> > -	{				\
> > -		.id	= pid,		\
> > -		.mask	= 0x000fffff,	\
> > -		.data	= uci_ptr	\
> > +#define CS_AMBA_UCI_ID(pid, uci_ptr)		\
> > +	{					\
> > +		.id	= pid,			\
> > +		.mask	= 0x000fffff,		\
> > +		.data	= (void *)uci_ptr	\
> >  	}
> 
> I will pickup this patch - it will show up in my next tree when rc1 comes out.

I tested this patch on the mainline kernel with latest commit
f1a3b43cc1f5 ("Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input"). FWIW:

Tested-by: Leo Yan <leo.yan@linaro.org>

P.s. Acutally I tested this patch for 5.2-rcx a few days ago and found
a regression for CPU debug module: I observed the CPU debug module
panic dump will stuck.  After I pulled to latest kernel code base the
CPU debug module can work well; also works well with this patch.  F.Y.I.

Thanks,
Leo Yan
