Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD3A42FF3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 01:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243519AbhJOX4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 19:56:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51910 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243589AbhJOX4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 19:56:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634342035; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=n3BK7738hTdiczHIt7ONeEK/GbdKAOD/zY0ItqmwjZU=;
 b=GzsBWXJJXa0ULg5WWk5wXd6THdu08o8aOeKvV5U1cxUsCW8PzEjUm+dl7SzrxOy4isyFttb4
 TAyqN9iLPbSiA16eFeQs2aj7zGUsZnJQUgwJvbLItwjBUJQpqz7Z1YjaaWi6U2KR5S5/5noB
 Buzh847taSXGtehta+LLnXWLTAs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 616a1492f922f9e77218eb9c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 23:53:54
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3B04CC4314F; Fri, 15 Oct 2021 23:53:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CEE9C4360D;
        Fri, 15 Oct 2021 23:53:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Oct 2021 16:53:48 -0700
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
In-Reply-To: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
References: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
Message-ID: <f72263e0d4c118653fff8b1341dc487b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-15 16:17, Bjorn Andersson wrote:
> In the cleanup path of the MSM DP driver the DP driver's debugfs files
> are destroyed by invoking debugfs_remove_recursive() on debug->root,
> which during initialization has been set to minor->debugfs_root.
> 
> To allow cleaning up the DP driver's debugfs files either each dentry
> needs to be kept track of or the files needs to be put in a 
> subdirectory
> which can be removed in one go.
> 
> By choosing to put the debugfs files in a subdirectory, based on the
> name of the associated connector this also solves the problem that 
> these
> names would collide as support for multiple DP instances are 
> introduced.
> 
> One alternative solution to the problem with colliding file names would
> have been to put keep track of the individual files and put them under
> the connector's debugfs directory. But while the drm_connector has been
> allocated, its associated debugfs directory has not been created at the
> time of initialization of the dp_debug.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I have been thinking about this problem ever since multi-DP has been 
posted :)
Creating sub-directories seems right but at the moment it looks like IGT 
which
uses these debugfs nodes doesnt check sub-directories:

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c#L215

It looks for the DP debugfs nodes under /sys/kernel/debug/dri/*/

We have to fix IGT too to be able to handle multi-DP cases. I will try 
to come up
with a proposal to address this.

Till then, can we go with the other solution to keep track of the 
dentries?

> ---
> 
> This depends on
> https://lore.kernel.org/linux-arm-msm/20211010030435.4000642-1-bjorn.andersson@linaro.org/
> reducing the connector from a double pointer.
> 
>  drivers/gpu/drm/msm/dp/dp_debug.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> b/drivers/gpu/drm/msm/dp/dp_debug.c
> index da4323556ef3..67da4c69eca1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -210,26 +210,29 @@ static const struct file_operations 
> test_active_fops = {
>  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor 
> *minor)
>  {
>  	int rc = 0;
> +	char path[64];
>  	struct dp_debug_private *debug = container_of(dp_debug,
>  			struct dp_debug_private, dp_debug);
> 
> -	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> +	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
> +
> +	debug->root = debugfs_create_dir(path, minor->debugfs_root);
> +
> +	debugfs_create_file("dp_debug", 0444, debug->root,
>  			debug, &dp_debug_fops);
> 
>  	debugfs_create_file("msm_dp_test_active", 0444,
> -			minor->debugfs_root,
> +			debug->root,
>  			debug, &test_active_fops);
> 
>  	debugfs_create_file("msm_dp_test_data", 0444,
> -			minor->debugfs_root,
> +			debug->root,
>  			debug, &dp_test_data_fops);
> 
>  	debugfs_create_file("msm_dp_test_type", 0444,
> -			minor->debugfs_root,
> +			debug->root,
>  			debug, &dp_test_type_fops);
> 
> -	debug->root = minor->debugfs_root;
> -
>  	return rc;
>  }
