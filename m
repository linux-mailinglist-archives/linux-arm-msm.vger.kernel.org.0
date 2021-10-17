Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2972D430AD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 18:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344251AbhJQQm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 12:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344249AbhJQQm0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 12:42:26 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC7BC061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 09:40:16 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id u5-20020a4ab5c5000000b002b6a2a05065so183945ooo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S+wD9XkgSed3YnQrWeHZSeNz6phpMb5NOVyWUp1LNR8=;
        b=IqRj1TgGnkmpeqB32fjFM4JGdwwpjL3umO4j6FYp4tM0j2vnN1b+zcHFo+VVJ+Oumb
         Q838SKAo/Waru9Dnnryg7vfLZRYGdlBn2T1y+3+FL18PbTNEfX5LyQNyfU6FINvLXxbY
         YUkJozYh8elTnWdoGOBV3TkFzZLdPKkcQSfAbjv9nnD4Thwr+RYFbQcB/hHmGrIkLeTT
         H+OoXpvF5iryEE47MjaSSHqcM+DKNmqkrRr+1JwbQWn0KHLm1+ai3gzktMZ1V9Y+0voN
         qe8sTFRxqgrVfGhR0Jxl8N04zUOTi5ZKhTeEtS6WPXFo0+wPXc3zsTEs9mZTPEig46S0
         15iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S+wD9XkgSed3YnQrWeHZSeNz6phpMb5NOVyWUp1LNR8=;
        b=dukTeEG7c9RwkRAVgOCVscUko4e5HVuGQlsthXeIefBp/7v/rdXk69AR+K20Be7ERH
         F2WSzlSsji46OxPey7lMSNfKwk0APIE6aEqld676Twdml6gP0va89hV1zBynwRucVuHj
         WiHanWv4dAKBJPWJOkvDwRDviHi5tlpk/ZDpu6G8OTs4IZNJbpmRfyNXyBm3HPIv9KEH
         wdtB/nh2G+X7vYdh6LvL7mYaJDfzUGZ3I5TxCVvFEtP1XOmhbQKwcDEfa7KQaVCTKzKz
         T+hDuD5GAgOlg/qRyHaCuL+r7xOc37922WQdYbDAgANEy4eJgTbZjeAVuEy9x9BNJ7Tt
         7F7Q==
X-Gm-Message-State: AOAM532OwyhYjlSYpD91U7PbL5jWDhL1igPsk7x3TSjvxlDnxJQk1l/0
        mGHj+1aHqSjjBKCS7nLUeBNb/g==
X-Google-Smtp-Source: ABdhPJxV1Dyy+xIIE2S8LmCEwYcnn47VfSispukfh6RIemyyEc+rIhY/8swuUr7SZouT5A4LUkO+Cw==
X-Received: by 2002:a4a:e1fd:: with SMTP id u29mr17911773ood.0.1634488815468;
        Sun, 17 Oct 2021 09:40:15 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id t8sm2547964otc.74.2021.10.17.09.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:40:14 -0700 (PDT)
Date:   Sun, 17 Oct 2021 09:42:02 -0700
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
Message-ID: <YWxSWlRp+log+Trz@ripper>
References: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
 <f72263e0d4c118653fff8b1341dc487b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f72263e0d4c118653fff8b1341dc487b@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Oct 16:53 PDT 2021, abhinavk@codeaurora.org wrote:

> On 2021-10-15 16:17, Bjorn Andersson wrote:
> > In the cleanup path of the MSM DP driver the DP driver's debugfs files
> > are destroyed by invoking debugfs_remove_recursive() on debug->root,
> > which during initialization has been set to minor->debugfs_root.
> > 
> > To allow cleaning up the DP driver's debugfs files either each dentry
> > needs to be kept track of or the files needs to be put in a subdirectory
> > which can be removed in one go.
> > 
> > By choosing to put the debugfs files in a subdirectory, based on the
> > name of the associated connector this also solves the problem that these
> > names would collide as support for multiple DP instances are introduced.
> > 
> > One alternative solution to the problem with colliding file names would
> > have been to put keep track of the individual files and put them under
> > the connector's debugfs directory. But while the drm_connector has been
> > allocated, its associated debugfs directory has not been created at the
> > time of initialization of the dp_debug.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> I have been thinking about this problem ever since multi-DP has been posted
> :)
> Creating sub-directories seems right but at the moment it looks like IGT
> which
> uses these debugfs nodes doesnt check sub-directories:
> 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c#L215
> 
> It looks for the DP debugfs nodes under /sys/kernel/debug/dri/*/
> 
> We have to fix IGT too to be able to handle multi-DP cases. I will try to
> come up
> with a proposal to address this.
> 
> Till then, can we go with the other solution to keep track of the dentries?
> 

I'm afraid I don't see what you're proposing.

Afaict we need one set of dp_test{type,active,data} per DP controller,
so even doing this by keeping track of the dentries requires that we
rename the files based on some identifier (id or connector name) - which
will cause igt to break.

As such, I think the practical path forward is that we merge the
multi-DP series as currently proposed. This will not cause any issues on
single-DP systems, but on multi-DP systems we will have warnings about
duplicate debugfs entries in the kernel logs.

Then you can figure out how to rework igt to deal with the multiple DP
instances and update the dp_debug interface accordingly.


Which also implies that we should hold this patch back. But if we go
that path, I think we should fix dp_debug_deinit() so that it doesn't
remove /sys/kernel/debug/dri/128 when the DP driver is unloaded.

Regards,
Bjorn

> > ---
> > 
> > This depends on
> > https://lore.kernel.org/linux-arm-msm/20211010030435.4000642-1-bjorn.andersson@linaro.org/
> > reducing the connector from a double pointer.
> > 
> >  drivers/gpu/drm/msm/dp/dp_debug.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > index da4323556ef3..67da4c69eca1 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > @@ -210,26 +210,29 @@ static const struct file_operations
> > test_active_fops = {
> >  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor
> > *minor)
> >  {
> >  	int rc = 0;
> > +	char path[64];
> >  	struct dp_debug_private *debug = container_of(dp_debug,
> >  			struct dp_debug_private, dp_debug);
> > 
> > -	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> > +	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
> > +
> > +	debug->root = debugfs_create_dir(path, minor->debugfs_root);
> > +
> > +	debugfs_create_file("dp_debug", 0444, debug->root,
> >  			debug, &dp_debug_fops);
> > 
> >  	debugfs_create_file("msm_dp_test_active", 0444,
> > -			minor->debugfs_root,
> > +			debug->root,
> >  			debug, &test_active_fops);
> > 
> >  	debugfs_create_file("msm_dp_test_data", 0444,
> > -			minor->debugfs_root,
> > +			debug->root,
> >  			debug, &dp_test_data_fops);
> > 
> >  	debugfs_create_file("msm_dp_test_type", 0444,
> > -			minor->debugfs_root,
> > +			debug->root,
> >  			debug, &dp_test_type_fops);
> > 
> > -	debug->root = minor->debugfs_root;
> > -
> >  	return rc;
> >  }
