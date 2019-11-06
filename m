Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B4EF1C54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 18:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbfKFRVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 12:21:21 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47552 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729384AbfKFRVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 12:21:21 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8A80C6050D; Wed,  6 Nov 2019 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573060879;
        bh=lIdKuIB1t60YjOmFaeZGgfs4tDLYQnqztGQvbk3zep8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HMu5wC6O8scrFQ/Db+RVyfETKpNF5L9ZUMqkGF5KAXTVYDT6Y7MgBrWwKNB+XKesi
         N1k6S+pVS8mFAuwjnHC83mwOUcF0h5ogupdnv8YVYtrFWsZj43iJdsrk/H1EO+wQ9d
         pbmaZauTXAtlZCfbc/2R1uR1bhotXcvofKv9kDXE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45D836063A;
        Wed,  6 Nov 2019 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573060879;
        bh=lIdKuIB1t60YjOmFaeZGgfs4tDLYQnqztGQvbk3zep8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HMu5wC6O8scrFQ/Db+RVyfETKpNF5L9ZUMqkGF5KAXTVYDT6Y7MgBrWwKNB+XKesi
         N1k6S+pVS8mFAuwjnHC83mwOUcF0h5ogupdnv8YVYtrFWsZj43iJdsrk/H1EO+wQ9d
         pbmaZauTXAtlZCfbc/2R1uR1bhotXcvofKv9kDXE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 45D836063A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 6 Nov 2019 10:21:16 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix debug bus register
 configuration
Message-ID: <20191106172116.GA12872@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
 <CAF6AEGtdEDAYg9bqKREv34aWiXR+uwEg+xsyJS_ySs4+-sFumg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtdEDAYg9bqKREv34aWiXR+uwEg+xsyJS_ySs4+-sFumg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 06, 2019 at 08:18:59AM -0800, Rob Clark wrote:
> On Wed, Nov 6, 2019 at 3:49 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > Fix the cx debugbus related register configuration, to collect accurate
> > bus data during gpu snapshot. This helps with complete snapshot dump
> > and also complete proper GPU recovery.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

This commit summary is far too polite. The word boneheaded should have appeared
several times. Thanks for this patch.

> (adding fixes tag for benefit of stable kernels)
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")

Thanks, I was going to suggest this as well.

> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > index 483e100..c5764b4 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
> >                 cxdbg = ioremap(res->start, resource_size(res));
> >
> >         if (cxdbg) {
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLT,
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
> >                         A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));
> >
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLM,
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
> >                         A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));
> >
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> >
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0,
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
> >                         0x76543210);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1,
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
> >                         0xFEDCBA98);
> >
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> > -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> > +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
> >         }
> >
> >         nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
> > --
> > 1.9.1
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
