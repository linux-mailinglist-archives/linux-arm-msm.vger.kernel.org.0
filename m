Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5D2267D8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 06:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgIMEBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 00:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgIMEAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 00:00:53 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A85C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 21:00:52 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x14so13959161oic.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 21:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Qi5BgYlxZ+ct/MUg8TILEG4D9MjaZLwf9MYNlT0Qzno=;
        b=r9Aj14+lIdavpJ+NJsWC5vYv24n/3JKlHJXYauYP+KP7wRy0NBwYopDsVwkaJh2/jI
         4O7ffbUlthukJ/+7JpBwOKJ93Un7onuHbmbYPot5XtgB0Z8Fm4GnsrTPWGZk1EaElfBA
         uAXX48ChLHVnn9YRpRE7OCCpNmN1ilxu/5apivEkTnrKKoluIxKxKdRDoTRbxHqaXepE
         8whj2m0loKB+t8CjS/jttbE6Fg/lulMCeHe230kkl/tYy73Yxs/1fYd/pwYzp/nD4OQ+
         3FuDYHWzIHBGUy3Na5SsTS7EGbuYCoOu+/aokDzh8ENfnyaDNSPne/knkGCwN97gFbwH
         VtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Qi5BgYlxZ+ct/MUg8TILEG4D9MjaZLwf9MYNlT0Qzno=;
        b=Qwtee2N2UvqsqIS+L2KDbzVfrYIceyCTO7cuTg7r3/0UTJaiXRq3WXyqVp/L2gm9A6
         wst/RN8GQe3iWgPmMGxYqu+yN8KMthNNqw83cXeYgbMoJbEJsqwRZwgjG25C71B9spzZ
         C/22Owh9kmsvNSzAkOAx+jGRVs/8EOZ9truPJMDm2fmX72RNSZITo2m5tW6w3SXUpSzm
         xdQlI/Zp8K/XcFIVx7ThpZ+TQSYwsLm4ZjrPr7gyUfTatbB5xwF0dmuYJn8U5YHSe7fw
         3LJ5oF/PY4AIMdlqellVgVP4KLdwl0QlesD1EKRQGszFCEdw6kwUulbST7MCXGpa9Cm1
         vklQ==
X-Gm-Message-State: AOAM532S2/V0fX/ZhZWFWplHcv20rzMQQ/sMy4MSjL/cHaLYxZOeMUdR
        vOzOBm2JEzx3aKqvsI2H7AN32A==
X-Google-Smtp-Source: ABdhPJwNYI3tbmjRhOMPSg1q/E9ENKcpMD3csMUaeIexQSGGM27buobS7pe4XCQ3RS+eggJQ6MS3lg==
X-Received: by 2002:aca:1a09:: with SMTP id a9mr5074891oia.164.1599969651969;
        Sat, 12 Sep 2020 21:00:51 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id o108sm1228694ota.25.2020.09.12.21.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 21:00:50 -0700 (PDT)
Date:   Sat, 12 Sep 2020 23:00:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8939: remove defined but not used
 variables
Message-ID: <20200913040048.GW3715@yoga>
References: <20200911013722.1459387-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200911013722.1459387-1-yanaijie@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Sep 20:37 CDT 2020, Jason Yan wrote:

> This addresses the following gcc warning with "make W=1":
> 
> drivers/clk/qcom/gcc-msm8939.c:610:32: warning:
> ‘gcc_xo_gpll6_gpll0a_map’ defined but not used
> [-Wunused-const-variable=]
>  static const struct parent_map gcc_xo_gpll6_gpll0a_map[] = {
>                                 ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/qcom/gcc-msm8939.c:598:32: warning: ‘gcc_xo_gpll6_gpll0_map’
> defined but not used [-Wunused-const-variable=]
>  static const struct parent_map gcc_xo_gpll6_gpll0_map[] = {
>                                 ^~~~~~~~~~~~~~~~~~~~~~
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/clk/qcom/gcc-msm8939.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 778354f82b1e..39ebb443ae3d 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -595,24 +595,12 @@ static const struct clk_parent_data gcc_xo_gpll1_emclk_sleep_parent_data[] = {
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>  };
>  
> -static const struct parent_map gcc_xo_gpll6_gpll0_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL6, 1 },
> -	{ P_GPLL0, 2 },
> -};
> -
>  static const struct clk_parent_data gcc_xo_gpll6_gpll0_parent_data[] = {
>  	{ .fw_name = "xo" },
>  	{ .hw = &gpll6_vote.hw },
>  	{ .hw = &gpll0_vote.hw },
>  };
>  
> -static const struct parent_map gcc_xo_gpll6_gpll0a_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL6, 1 },
> -	{ P_GPLL0_AUX, 2 },
> -};
> -
>  static const struct clk_parent_data gcc_xo_gpll6_gpll0a_parent_data[] = {
>  	{ .fw_name = "xo" },
>  	{ .hw = &gpll6_vote.hw },
> -- 
> 2.25.4
> 
