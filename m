Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 245FD1042D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 05:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfEAD0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 23:26:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40448 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfEAD0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 23:26:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id u17so4089210pfn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2019 20:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PrgypJchVkXOthqiW8EugRGKE4eU23dOnNO+Q9MJg1c=;
        b=bTp/e3F3LR1UcC6Ez9JrwvETfC4QbKvQCC1jRnXChLpKqCOKzg3tXle9kPQja6SCiu
         O4SupA47nYzraIXoICu7s0UV8HoaINcI1VerAlw0RRqpXBy39aHgch8SDYbV7/uV655D
         VYvGrj/yfiK33z618S3UUZyTiuEAmKUXVk0NcQNOwLt77akQbwxPy/oyBsQvdMZy5x15
         KQldz/hYsrutbH5CmS2FsncMHZqJd9k9O0h+TBSytEI1SRi7CaPjyfEtFoRcx57dVR86
         R+m1ueMBNuP55uJx6vmaQ+K5hNekZfGHHDaGyDwlbpkP0H6q004Yci19sFhWJlNVHWad
         F7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PrgypJchVkXOthqiW8EugRGKE4eU23dOnNO+Q9MJg1c=;
        b=hs/ugc40aGRRtGRi/gTs8VOFCCX3mki7ckN+PI43tJb6fSGhygJirOJozXuDRHxpfI
         o4M/i7tCK6y6OZMB5VEJ4UHIFJmBElK5BRuI9aI7sNYhXN6HmFYJRg6o59NRI0xGzrBV
         B69YMHLBZWrmiyjvE0eDZ1lDQ5DLDpue4Fu4ylm4ZNRh8QuMFzqHoo4eDE/0QIaS1DXN
         8qCmtNFgRNXE9EPkSqFpWgS3tWnePdF4pdVg40B/AXa7w44A5L31KhcbE8bXwLJ5To7E
         qm1aH5tErrafgSxprQ4SY8DStRvcBvr0A7OPRV4Qq7/7S+wkqIlLWsYNakQyVgnQdS67
         +CeA==
X-Gm-Message-State: APjAAAXkUG9lB1HLGerOIW+cnjLde9M0e9s0AAeFF9BUGYj54nqAYa2N
        ut3KzN2HyNpwI0lbEOs0RA3YEA==
X-Google-Smtp-Source: APXvYqxVx0/CIjnR/4b55P3uKYaSVY0N+fflXJiN/5EuWpt63pRSdHIaCRs2hPMO+ExuQ52QwosJPw==
X-Received: by 2002:aa7:842f:: with SMTP id q15mr12062413pfn.161.1556681163980;
        Tue, 30 Apr 2019 20:26:03 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a19sm429171pgm.46.2019.04.30.20.26.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 20:26:02 -0700 (PDT)
Date:   Tue, 30 Apr 2019 20:26:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        marc.w.gonzalez@free.fr, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/6] clk: qcom: smd: Add XO clock for MSM8998
Message-ID: <20190501032603.GA2938@tuxbook-pro>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677576-29336-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556677576-29336-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 30 Apr 19:26 PDT 2019, Jeffrey Hugo wrote:

> The XO clock generally feeds into other clock controllers as the parent
> for a lot of clock generators.
> 
> Drop the "fake" XO clock in GCC now that it is redundant can will cause a
> namespace conflict.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++++++++++----
>  drivers/clk/qcom/gcc-msm8998.c | 29 ++++++++++++-----------------
>  2 files changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 22dd42a..55a622df 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -68,7 +68,7 @@
>  	}
>  
>  #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
> -				    stat_id, r, key)			      \
> +				    stat_id, r, key, ignore_unused)			      \

I expect that we can revert the ignore_unused part once we have a proper
way to deal with resource handover.


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  	static struct clk_smd_rpm _platform##_##_active;		      \
>  	static struct clk_smd_rpm _platform##_##_name = {		      \
>  		.rpm_res_type = (type),					      \
> @@ -83,6 +83,7 @@
>  			.name = #_name,					      \
>  			.parent_names = (const char *[]){ "xo_board" },	      \
>  			.num_parents = 1,				      \
> +			.flags = (ignore_unused) ? CLK_IGNORE_UNUSED : 0,     \
>  		},							      \
>  	};								      \
>  	static struct clk_smd_rpm _platform##_##_active = {		      \
> @@ -99,6 +100,7 @@
>  			.name = #_active,				      \
>  			.parent_names = (const char *[]){ "xo_board" },	      \
>  			.num_parents = 1,				      \
> +			.flags = (ignore_unused) ? CLK_IGNORE_UNUSED : 0,     \
>  		},							      \
>  	}
>  
> @@ -108,7 +110,17 @@
>  
>  #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
>  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> -		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
> +		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, false)
> +
> +/*
> + * Intended for XO clock where we don't want it turned off during late init
> + * if we don't have a consumer by then, but can turn it off later for deep
> + * sleep
> + */
> +#define DEFINE_CLK_SMD_RPM_BRANCH_SKIP_UNUSED(_platform, _name, _active, type,\
> +					      r_id, r)			      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> +		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, true)
>  
>  #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
>  		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> @@ -117,12 +129,12 @@
>  #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
>  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
>  		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> -		QCOM_RPM_KEY_SOFTWARE_ENABLE)
> +		QCOM_RPM_KEY_SOFTWARE_ENABLE, false)
>  
>  #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
>  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
>  		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> -		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
> +		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY, false)
>  
>  #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
>  
> @@ -656,6 +668,8 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
>  };
>  
>  /* msm8998 */
> +DEFINE_CLK_SMD_RPM_BRANCH_SKIP_UNUSED(msm8998, xo, xo_a, QCOM_SMD_RPM_MISC_CLK,
> +				      0, 19200000);
>  DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
>  DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
>  DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
> @@ -678,6 +692,8 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
>  DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
>  static struct clk_smd_rpm *msm8998_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC] = &msm8998_xo,
> +	[RPM_SMD_XO_A_CLK_SRC] = &msm8998_xo_a,
>  	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
>  	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
>  	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
> index 0336882..47c3163 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  
> @@ -117,17 +118,6 @@ enum {
>  	"core_bi_pll_test_se",
>  };
>  
> -static struct clk_fixed_factor xo = {
> -	.mult = 1,
> -	.div = 1,
> -	.hw.init = &(struct clk_init_data){
> -		.name = "xo",
> -		.parent_names = (const char *[]){ "xo_board" },
> -		.num_parents = 1,
> -		.ops = &clk_fixed_factor_ops,
> -	},
> -};
> -
>  static struct pll_vco fabia_vco[] = {
>  	{ 250000000, 2000000000, 0 },
>  	{ 125000000, 1000000000, 1 },
> @@ -2959,10 +2949,6 @@ enum {
>  	.fast_io	= true,
>  };
>  
> -static struct clk_hw *gcc_msm8998_hws[] = {
> -	&xo.hw,
> -};
> -
>  static const struct qcom_cc_desc gcc_msm8998_desc = {
>  	.config = &gcc_msm8998_regmap_config,
>  	.clks = gcc_msm8998_clocks,
> @@ -2971,14 +2957,23 @@ enum {
>  	.num_resets = ARRAY_SIZE(gcc_msm8998_resets),
>  	.gdscs = gcc_msm8998_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_msm8998_gdscs),
> -	.clk_hws = gcc_msm8998_hws,
> -	.num_clk_hws = ARRAY_SIZE(gcc_msm8998_hws),
>  };
>  
>  static int gcc_msm8998_probe(struct platform_device *pdev)
>  {
>  	struct regmap *regmap;
>  	int ret;
> +	struct clk *xo;
> +
> +	/*
> +	 * We must have a valid XO to continue, otherwise having a missing
> +	 * parent on a system critical clock like the uart core clock can
> +	 * result in strange bugs.
> +	 */
> +	xo = clk_get(&pdev->dev, "xo");
> +	if (IS_ERR(xo))
> +		return PTR_ERR(xo);
> +	clk_put(xo);
>  
>  	regmap = qcom_cc_map(pdev, &gcc_msm8998_desc);
>  	if (IS_ERR(regmap))
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
