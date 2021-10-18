Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989D243267B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 20:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhJRSgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 14:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhJRSgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 14:36:41 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9DFC061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 11:34:30 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o83so1048905oif.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tKaMbG/HjQb1/sn/s5rHZFomdMxjFwW4dEMmTzlPHS8=;
        b=yN/H6xPd86rnApymhFQ7SZ+78t8zzeTlEtB19Gx3zH0IOa4dPbQwLIRIQNZWtwER6B
         CwNQeSs8aSPGiCcLbgXxlKofjNbexue2Wa7HzgsQBMJZiSj5QE/fYcW/zx6zWXp81K/z
         HZCgN0yDcBV4adpjsuxpWsEaIwzLu+SZawX3fxx1kBBDMW+4ghExRu5an6pjh/6xWLcc
         US2bDN/+VA26re2zGwmRVtn0tbIuHvC+7uToFpoVb3ppEfkMpJvo+1WbCPtQIitF+fZN
         pyZlzBqnjrzaykZ2d9qf0ak0rgG+Pgzc6f+0eMYqTknVy+MTB8hv2peHKNC2lw3iPLPm
         KnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tKaMbG/HjQb1/sn/s5rHZFomdMxjFwW4dEMmTzlPHS8=;
        b=g7eQBqXf4ncNo87Acr4XZLM94YXsiJ4GqkiQRskDHWlToZFcPmmRLmfU7k5gQKtko/
         wryQmoPiJXDgnmyfbxCO8AIIpnQC60IdjpwLhz6+BBdADsJxIkfBjn6wabdG7BQc5JLn
         NhKJpk0GocCL6gastOJZQVAAA+sEZpYbVU7+fD5o+5z5AU/XESlFo6Y98JM7Ojs0Icy9
         VY2bCMDXYXezq15ezLG549IhFTU2zi8j543BXqz4g0fo6IUjFqW8DpPHMWb3Rzzm9Xah
         4tpuOE2il6ovJDH9iuwF6EO6gR3ywdkBmn7HHglI2Zl2RBRb6r4aZg695HbjQj5WT+aT
         066w==
X-Gm-Message-State: AOAM5329ONZh+muwbjNkRDJC076jnE19ZsKBmpMC1cnf7Aq4l3TVu71S
        ODeuuWXk5eDkgaEo/eAD38+ZlA==
X-Google-Smtp-Source: ABdhPJzK20lcnPtdHXO77ypwnn+a88tKFbfx7sDYPV4ofif5vDe2lzQoPS9sWvyhKw8jWcUFjUIMTA==
X-Received: by 2002:aca:b787:: with SMTP id h129mr484432oif.86.1634582069791;
        Mon, 18 Oct 2021 11:34:29 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id o80sm3115568ota.68.2021.10.18.11.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:34:29 -0700 (PDT)
Date:   Mon, 18 Oct 2021 11:36:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Move debugfs files into
 subdirectory
Message-ID: <YW2+oPIaVPO7QsqK@ripper>
References: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
 <f72263e0d4c118653fff8b1341dc487b@codeaurora.org>
 <YWxSWlRp+log+Trz@ripper>
 <7a77045f4069a21305e5c3614a6739f0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a77045f4069a21305e5c3614a6739f0@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Oct 11:07 PDT 2021, abhinavk@codeaurora.org wrote:

> Hi Bjorn
> 
> On 2021-10-17 09:42, Bjorn Andersson wrote:
> > On Fri 15 Oct 16:53 PDT 2021, abhinavk@codeaurora.org wrote:
> > 
> > > On 2021-10-15 16:17, Bjorn Andersson wrote:
> > > > In the cleanup path of the MSM DP driver the DP driver's debugfs files
> > > > are destroyed by invoking debugfs_remove_recursive() on debug->root,
> > > > which during initialization has been set to minor->debugfs_root.
> > > >
> > > > To allow cleaning up the DP driver's debugfs files either each dentry
> > > > needs to be kept track of or the files needs to be put in a subdirectory
> > > > which can be removed in one go.
> > > >
> > > > By choosing to put the debugfs files in a subdirectory, based on the
> > > > name of the associated connector this also solves the problem that these
> > > > names would collide as support for multiple DP instances are introduced.
> > > >
> > > > One alternative solution to the problem with colliding file names would
> > > > have been to put keep track of the individual files and put them under
> > > > the connector's debugfs directory. But while the drm_connector has been
> > > > allocated, its associated debugfs directory has not been created at the
> > > > time of initialization of the dp_debug.
> > > >
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > 
> > > I have been thinking about this problem ever since multi-DP has been
> > > posted
> > > :)
> > > Creating sub-directories seems right but at the moment it looks like
> > > IGT
> > > which
> > > uses these debugfs nodes doesnt check sub-directories:
> > > 
> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c#L215
> > > 
> > > It looks for the DP debugfs nodes under /sys/kernel/debug/dri/*/
> > > 
> > > We have to fix IGT too to be able to handle multi-DP cases. I will
> > > try to
> > > come up
> > > with a proposal to address this.
> > > 
> > > Till then, can we go with the other solution to keep track of the
> > > dentries?
> > > 
> > 
> > I'm afraid I don't see what you're proposing.
> > 
> > Afaict we need one set of dp_test{type,active,data} per DP controller,
> > so even doing this by keeping track of the dentries requires that we
> > rename the files based on some identifier (id or connector name) - which
> > will cause igt to break.
> 
> Yes, I also thought the same that there needs to be some identifier.
> 
> "To allow cleaning up the DP driver's debugfs files either each dentry
> needs to be kept track of or the files needs to be put in a subdirectory
> which can be removed in one go"
> 
> I guess I misunderstood your statement in the commit text thinking that you
> had some other way to keep track of the dentries as it mentioned that
> use a subdirectory OR keep track of each dentry.
> 

No, I did write that code as well and then ditched it.

Unfortunately I don't think it would help you, because we still need to
add some identifier to the file names and preferably we should add that
to the single case as well to make things consistent.

> > 
> > As such, I think the practical path forward is that we merge the
> > multi-DP series as currently proposed. This will not cause any issues on
> > single-DP systems, but on multi-DP systems we will have warnings about
> > duplicate debugfs entries in the kernel logs.
> > 
> > Then you can figure out how to rework igt to deal with the multiple DP
> > instances and update the dp_debug interface accordingly.
> > 
> 
> Fine with me, I will take care of this.
> 

Cool, thanks.

Regards,
Bjorn

> > 
> > Which also implies that we should hold this patch back. But if we go
> > that path, I think we should fix dp_debug_deinit() so that it doesn't
> > remove /sys/kernel/debug/dri/128 when the DP driver is unloaded.
> Yes, lets hold this patch back till I fix multi-DP for IGT.
> > 
> > Regards,
> > Bjorn
> > 
> > > > ---
> > > >
> > > > This depends on
> > > > https://lore.kernel.org/linux-arm-msm/20211010030435.4000642-1-bjorn.andersson@linaro.org/
> > > > reducing the connector from a double pointer.
> > > >
> > > >  drivers/gpu/drm/msm/dp/dp_debug.c | 15 +++++++++------
> > > >  1 file changed, 9 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > index da4323556ef3..67da4c69eca1 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > @@ -210,26 +210,29 @@ static const struct file_operations
> > > > test_active_fops = {
> > > >  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor
> > > > *minor)
> > > >  {
> > > >  	int rc = 0;
> > > > +	char path[64];
> > > >  	struct dp_debug_private *debug = container_of(dp_debug,
> > > >  			struct dp_debug_private, dp_debug);
> > > >
> > > > -	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> > > > +	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
> > > > +
> > > > +	debug->root = debugfs_create_dir(path, minor->debugfs_root);
> > > > +
> > > > +	debugfs_create_file("dp_debug", 0444, debug->root,
> > > >  			debug, &dp_debug_fops);
> > > >
> > > >  	debugfs_create_file("msm_dp_test_active", 0444,
> > > > -			minor->debugfs_root,
> > > > +			debug->root,
> > > >  			debug, &test_active_fops);
> > > >
> > > >  	debugfs_create_file("msm_dp_test_data", 0444,
> > > > -			minor->debugfs_root,
> > > > +			debug->root,
> > > >  			debug, &dp_test_data_fops);
> > > >
> > > >  	debugfs_create_file("msm_dp_test_type", 0444,
> > > > -			minor->debugfs_root,
> > > > +			debug->root,
> > > >  			debug, &dp_test_type_fops);
> > > >
> > > > -	debug->root = minor->debugfs_root;
> > > > -
> > > >  	return rc;
> > > >  }
