Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A9F98347
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 20:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfHUSm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 14:42:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54174 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfHUSm4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 14:42:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1186A608D4; Wed, 21 Aug 2019 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566412974;
        bh=3usH6zGMgZfcdZibKCpV+j/4/h6fq0KXvbyLRIfF+co=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YKGnwDoUyenvSthxx76i5QvPWbLOU+HSzyuSKnExVA+mEBNJpY9C+7CznJNh/Y8sO
         5+LB+KU7BlH7iRpFNy/3/NLiTtQOdkFfE3IqLJSKshD1EtQA/Kbz6XABoKK2t6plBc
         boXdxktUz6imBdnhKQl5iTSCMRcL74H8VE5vUtVU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id EF629604D4;
        Wed, 21 Aug 2019 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566412971;
        bh=3usH6zGMgZfcdZibKCpV+j/4/h6fq0KXvbyLRIfF+co=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=idRT9qzGLFoSCKsv9stMXEWvr822bkf15z66JB7qNIJ4nrBUNTolbzzNI3tByRKXt
         UH0vrvvdKwrQa2NJbHzPchYNzAWwmSB6w0gGshiuRDVsXw8/OtDJTACfMowB9MBBtZ
         l54YPA35/OiSIYkHWgLzNP7xms8trgOEx3H3CwO4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Aug 2019 18:42:50 +0000
From:   saiprakash.ranjan@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [RFC] clk: Remove cached cores in parent map during unregister
In-Reply-To: <20190821181009.00D6322D6D@mail.kernel.org>
References: <20190723051446.20013-1-bjorn.andersson@linaro.org>
 <20190729224652.17291206E0@mail.kernel.org>
 <20190821181009.00D6322D6D@mail.kernel.org>
Message-ID: <cda27c942f332d9da47fe8c4c5305207@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2019-08-21 18:10, Stephen Boyd wrote:
> 
> Here's an attempt at the simple approach. There's another problem where
> the cached 'hw' member of the parent data is held around when we don't
> know when the caller has destroyed it. Not much else we can do for that
> though.
> 
> ---8<---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..f42a803fb11a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3737,6 +3737,37 @@ static const struct clk_ops clk_nodrv_ops = {
>  	.set_parent	= clk_nodrv_set_parent,
>  };
> 
> +static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
> +						struct clk_core *target)
> +{
> +	int i;
> +	struct clk_core *child;
> +
> +	if (!root)
> +		return;
> +
> +	for (i = 0; i < root->num_parents; i++)
> +		if (root->parents[i].core == target)
> +			root->parents[i].core = NULL;
> +
> +	hlist_for_each_entry(child, &root->children, child_node)
> +		clk_core_evict_parent_cache_subtree(child, target);
> +}
> +
> +/* Remove this clk from all parent caches */
> +static void clk_core_evict_parent_cache(struct clk_core *core)
> +{
> +	struct hlist_head **lists;
> +	struct clk_core *root;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	for (lists = all_lists; *lists; lists++)
> +		hlist_for_each_entry(root, *lists, child_node)
> +			clk_core_evict_parent_cache_subtree(root, core);
> +
> +}
> +
>  /**
>   * clk_unregister - unregister a currently registered clock
>   * @clk: clock to unregister
> @@ -3775,6 +3806,8 @@ void clk_unregister(struct clk *clk)
>  			clk_core_set_parent_nolock(child, NULL);
>  	}
> 
> +	clk_core_evict_parent_cache(clk->core);
> +
>  	hlist_del_init(&clk->core->child_node);
> 
>  	if (clk->core->prepare_count)


Thanks for the patch. This fixes the dispcc issue which I was observing 
with latest kernel on cheza.
You can have the tested by when you post the actual patch.

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

For reference, below is the error log:

[    3.992243] msm ae00000.mdss: Adding to iommu group 1
[    3.999877] msm ae00000.mdss: bound ae01000.mdp (ops 
0xffffff8010a87b78)
[    4.023597] msm ae00000.mdss: failed to bind ae94000.dsi (ops 
0xffffff8010a8b360): -517
[    4.031898] msm ae00000.mdss: master bind failed: -517
[    5.297509] msm ae00000.mdss: bound ae01000.mdp (ops 
0xffffff8010a87b78)
[    5.320906] msm ae00000.mdss: failed to bind ae94000.dsi (ops 
0xffffff8010a8b360): -517
[    5.329261] msm ae00000.mdss: master bind failed: -517
[    5.648667] msm ae00000.mdss: bound ae01000.mdp (ops 
0xffffff8010a87b78)
[    5.672005] clk_core_set_parent_nolock: clk dsi0_phy_pll_out_byteclk 
can not be parent of clk disp_cc_mdss_byte0_clk_src p_index=-22 <--- 
error
[    5.699799] msm ae00000.mdss: failed to bind ae94000.dsi (ops 
0xffffff8010a8b360): -22
[    5.708086] msm ae00000.mdss: master bind failed: -22
[    5.714052] msm: probe of ae00000.mdss failed with error -22

[    6.033541] clk_core_set_parent_nolock: clk dsi0_phy_pll_out_dsiclk 
can not be parent of clk disp_cc_mdss_pclk0_clk_src p_index=-22 <--- 
error

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

