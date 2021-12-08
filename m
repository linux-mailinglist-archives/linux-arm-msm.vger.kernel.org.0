Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB55D46DF20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 00:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238519AbhLHX5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 18:57:53 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:52881 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238498AbhLHX5w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 18:57:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639007660; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=u15F77aBFCZJ0MAZoaaY1dZuTLowi9SVkhbrAQjxT1U=;
 b=hjC1tQkspDP1UpmqeaODMTsCc/YKTdvDi/K9QzECIl1AXfBEfenTtfGmY+R7j+RlSbgxbYbp
 vLOFfq8nuvGTOF5+XyluCGG6BQhMNIkB4grWMHMRbbiaIa6QfZs3Iz78R2T9OOv8f4FqiYG4
 kcJffNQG+gAxo9M0h9jfeFji6bg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61b145ab465c4a723b18d67e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Dec 2021 23:54:19
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1AC4C4360D; Wed,  8 Dec 2021 23:54:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C257C4338F;
        Wed,  8 Dec 2021 23:54:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Dec 2021 15:54:18 -0800
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Move debugfs files into
 subdirectory
In-Reply-To: <YW2+oPIaVPO7QsqK@ripper>
References: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
 <f72263e0d4c118653fff8b1341dc487b@codeaurora.org> <YWxSWlRp+log+Trz@ripper>
 <7a77045f4069a21305e5c3614a6739f0@codeaurora.org> <YW2+oPIaVPO7QsqK@ripper>
Message-ID: <8fa353a5fd6e37f570f3a9d4812158a2@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-18 11:36, Bjorn Andersson wrote:
> On Mon 18 Oct 11:07 PDT 2021, abhinavk@codeaurora.org wrote:
> 
>> Hi Bjorn
>> 
>> On 2021-10-17 09:42, Bjorn Andersson wrote:
>> > On Fri 15 Oct 16:53 PDT 2021, abhinavk@codeaurora.org wrote:
>> >
>> > > On 2021-10-15 16:17, Bjorn Andersson wrote:
>> > > > In the cleanup path of the MSM DP driver the DP driver's debugfs files
>> > > > are destroyed by invoking debugfs_remove_recursive() on debug->root,
>> > > > which during initialization has been set to minor->debugfs_root.
>> > > >
>> > > > To allow cleaning up the DP driver's debugfs files either each dentry
>> > > > needs to be kept track of or the files needs to be put in a subdirectory
>> > > > which can be removed in one go.
>> > > >
>> > > > By choosing to put the debugfs files in a subdirectory, based on the
>> > > > name of the associated connector this also solves the problem that these
>> > > > names would collide as support for multiple DP instances are introduced.
>> > > >
>> > > > One alternative solution to the problem with colliding file names would
>> > > > have been to put keep track of the individual files and put them under
>> > > > the connector's debugfs directory. But while the drm_connector has been
>> > > > allocated, its associated debugfs directory has not been created at the
>> > > > time of initialization of the dp_debug.
>> > > >
>> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > >
>> > > I have been thinking about this problem ever since multi-DP has been
>> > > posted
>> > > :)
>> > > Creating sub-directories seems right but at the moment it looks like
>> > > IGT
>> > > which
>> > > uses these debugfs nodes doesnt check sub-directories:
>> > >
>> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c#L215
>> > >
>> > > It looks for the DP debugfs nodes under /sys/kernel/debug/dri/*/
>> > >
>> > > We have to fix IGT too to be able to handle multi-DP cases. I will
>> > > try to
>> > > come up
>> > > with a proposal to address this.
>> > >
>> > > Till then, can we go with the other solution to keep track of the
>> > > dentries?
>> > >
>> >
>> > I'm afraid I don't see what you're proposing.
>> >
>> > Afaict we need one set of dp_test{type,active,data} per DP controller,
>> > so even doing this by keeping track of the dentries requires that we
>> > rename the files based on some identifier (id or connector name) - which
>> > will cause igt to break.
>> 
>> Yes, I also thought the same that there needs to be some identifier.
>> 
>> "To allow cleaning up the DP driver's debugfs files either each dentry
>> needs to be kept track of or the files needs to be put in a 
>> subdirectory
>> which can be removed in one go"
>> 
>> I guess I misunderstood your statement in the commit text thinking 
>> that you
>> had some other way to keep track of the dentries as it mentioned that
>> use a subdirectory OR keep track of each dentry.
>> 
> 
> No, I did write that code as well and then ditched it.
> 
> Unfortunately I don't think it would help you, because we still need to
> add some identifier to the file names and preferably we should add that
> to the single case as well to make things consistent.
> 
>> >
>> > As such, I think the practical path forward is that we merge the
>> > multi-DP series as currently proposed. This will not cause any issues on
>> > single-DP systems, but on multi-DP systems we will have warnings about
>> > duplicate debugfs entries in the kernel logs.
>> >
>> > Then you can figure out how to rework igt to deal with the multiple DP
>> > instances and update the dp_debug interface accordingly.
>> >
>> 
>> Fine with me, I will take care of this.
>> 
> 
> Cool, thanks.
> 
> Regards,
> Bjorn
> 
Following up on this, Rob has posted the igt change today which i acked.
https://patchwork.freedesktop.org/patch/465930/
With this in place, we can actually go ahead with this change.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> >
>> > Which also implies that we should hold this patch back. But if we go
>> > that path, I think we should fix dp_debug_deinit() so that it doesn't
>> > remove /sys/kernel/debug/dri/128 when the DP driver is unloaded.
>> Yes, lets hold this patch back till I fix multi-DP for IGT.
>> >
>> > Regards,
>> > Bjorn
>> >
>> > > > ---
>> > > >
>> > > > This depends on
>> > > > https://lore.kernel.org/linux-arm-msm/20211010030435.4000642-1-bjorn.andersson@linaro.org/
>> > > > reducing the connector from a double pointer.
>> > > >
>> > > >  drivers/gpu/drm/msm/dp/dp_debug.c | 15 +++++++++------
>> > > >  1 file changed, 9 insertions(+), 6 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > > > b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > > > index da4323556ef3..67da4c69eca1 100644
>> > > > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > > > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > > > @@ -210,26 +210,29 @@ static const struct file_operations
>> > > > test_active_fops = {
>> > > >  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor
>> > > > *minor)
>> > > >  {
>> > > >  	int rc = 0;
>> > > > +	char path[64];
>> > > >  	struct dp_debug_private *debug = container_of(dp_debug,
>> > > >  			struct dp_debug_private, dp_debug);
>> > > >
>> > > > -	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
>> > > > +	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
>> > > > +
>> > > > +	debug->root = debugfs_create_dir(path, minor->debugfs_root);
>> > > > +
>> > > > +	debugfs_create_file("dp_debug", 0444, debug->root,
>> > > >  			debug, &dp_debug_fops);
>> > > >
>> > > >  	debugfs_create_file("msm_dp_test_active", 0444,
>> > > > -			minor->debugfs_root,
>> > > > +			debug->root,
>> > > >  			debug, &test_active_fops);
>> > > >
>> > > >  	debugfs_create_file("msm_dp_test_data", 0444,
>> > > > -			minor->debugfs_root,
>> > > > +			debug->root,
>> > > >  			debug, &dp_test_data_fops);
>> > > >
>> > > >  	debugfs_create_file("msm_dp_test_type", 0444,
>> > > > -			minor->debugfs_root,
>> > > > +			debug->root,
>> > > >  			debug, &dp_test_type_fops);
>> > > >
>> > > > -	debug->root = minor->debugfs_root;
>> > > > -
>> > > >  	return rc;
>> > > >  }
