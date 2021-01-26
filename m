Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0816303FA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405672AbhAZOFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405573AbhAZOEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 09:04:48 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40010C061D73
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:04:08 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id i30so16245143ota.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MsK4CaeZUuQbxzldo8dFAj7Ip1Nra/4PEZy0IWNDwKA=;
        b=oJDgbuOkCoz6zAvL2MLojuABQE1LnOHQsv8Sr8dJJkZmRIJW4fT+lBOiWCHwFxgyXl
         f5SppIvh70EKm2GeJyfWlQ5OA7825I/pCJhXVsP0EmZKDWarGYzCLE4YFS4n44X63N27
         CuzTTDKuisrWcbigIqWkS1qeGfiDC76d2VkFbKyVzkzUgTqKWz8lqCKQ0drBWS9ehbTi
         ixyXptqL0Wa8G7XtYbpibYb3mZr2LJbpj5/Uxwy2/qnrdXTXSg77XIk7N1xvgWp6euQ4
         jEXzA2BR8T82RcTsXX0Gr8l2vemy9hL5H7+O+sZKFrEyDvKrYauu0QHcsbcqMQXMc7Qd
         vaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MsK4CaeZUuQbxzldo8dFAj7Ip1Nra/4PEZy0IWNDwKA=;
        b=jcXRiOzSVUohu3RSAEeFSy+wzHhBkAhSq/7Sw+K+bzQ8pwtCpOm3zdFMqVMP2b3yiQ
         WAII0+ICe9Oa4rKm+Am5ql8kcgl4nb82UdglNHLfa8ujQITvHYSKDA2GvfvlcVE1uQqC
         808eEZYT70fQQAu5oeBfCTordUutknjIVOcppPg2/f3C3oYgURq+u+nhhj1K9bqcXB0d
         v2NNxcU/zLF4J4zhI3DTVzNX2b/e7urigHssm5793rkMejFuBbhQn0HWNHfPge2JF/GH
         vl9LF5Cu4nYLRhuvA9hUFwK2ybLhmCIUQ86xkNYnZYIyP0rAzxgJntUveYQiJiTi2mkt
         mAmA==
X-Gm-Message-State: AOAM533ICHBjn3fWE7I1cO0qzLqkckOp1vNHYEpyqlfhV4dJ1tgYhAcu
        uayhYSA6L59xgscHnCqfKBijbw==
X-Google-Smtp-Source: ABdhPJxX8nY7QjrZBeaPXb5VbSrI1X+GKXGhNuDRRN1eLhvoaMkZFItzLc7hvWzb53yTMa8LtnmSMQ==
X-Received: by 2002:a9d:6c90:: with SMTP id c16mr4106448otr.177.1611669846924;
        Tue, 26 Jan 2021 06:04:06 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm3853267ood.6.2021.01.26.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:04:06 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:04:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 18/21] clk: qcom: clk-rpm: Remove a bunch of superfluous
 code
Message-ID: <20210126140404.GF1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-19-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-19-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/clk-rpm.c:453:29: warning: ‘clk_rpm_branch_ops’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpm.c | 63 --------------------------------------
>  1 file changed, 63 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index f71d228fd6bd5..a18811c380187 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -73,62 +73,6 @@
>  		},							      \
>  	}
>  
> -#define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, _active, r_id, r)	      \
> -	static struct clk_rpm _platform##_##_active;			      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.active_only = true,					      \
> -		.peer = &_platform##_##_active,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_name,					      \
> -			.parent_names = (const char *[]){ "pxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	};								      \
> -	static struct clk_rpm _platform##_##_active = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_name,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_active,				      \
> -			.parent_names = (const char *[]){ "pxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	}
> -
> -#define DEFINE_CLK_RPM_CXO_BRANCH(_platform, _name, _active, r_id, r)	      \
> -	static struct clk_rpm _platform##_##_active;			      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_active,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_name,					      \
> -			.parent_names = (const char *[]){ "cxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	};								      \
> -	static struct clk_rpm _platform##_##_active = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.active_only = true,					      \
> -		.peer = &_platform##_##_name,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_active,				      \
> -			.parent_names = (const char *[]){ "cxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	}
> -
>  #define to_clk_rpm(_hw) container_of(_hw, struct clk_rpm, hw)
>  
>  struct rpm_cc;
> @@ -450,13 +394,6 @@ static const struct clk_ops clk_rpm_ops = {
>  	.recalc_rate	= clk_rpm_recalc_rate,
>  };
>  
> -static const struct clk_ops clk_rpm_branch_ops = {
> -	.prepare	= clk_rpm_prepare,
> -	.unprepare	= clk_rpm_unprepare,
> -	.round_rate	= clk_rpm_round_rate,
> -	.recalc_rate	= clk_rpm_recalc_rate,
> -};
> -
>  /* MSM8660/APQ8060 */
>  DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
>  DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -- 
> 2.25.1
> 
