Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6047B5EADDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 19:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiIZRQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 13:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIZRQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 13:16:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFE098CA4;
        Mon, 26 Sep 2022 09:29:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C275560FE2;
        Mon, 26 Sep 2022 16:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C5EC433D6;
        Mon, 26 Sep 2022 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664209760;
        bh=okahiuUC4WIQTaXvFWMrYyam+eRvHV8V6ybc8vpnj2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ry3nWeS5qG4sI7wp68MsqMBzGTUYCPEF+yLxiVbyyvWpBC+ZMi7/ohUug7poRWVL5
         ulXJGtrnqk9jKsme782/27ZhvBdaoysEDur1LbygkoKZVOm7fCe18VJZcSTiGVfcth
         NDCmPqT7k1sRQjP6mTaE80rwmwevVXiiZ1+VqXYJTt9O6N32BR5pp5rkH/A3NaTGoZ
         dpCm03a8F+QlhIscN3qb82P8ZaNc3JfMa3bcEseEnWOyx4Yxyi7zIzsHJoAOeWCv1C
         LWoGA1731KzWFfD10BI/Xh4LcDmFFs88LWNKL0s+SgORVJfTkb88ZumXYTZ4lD33fg
         1kqldJe0WcGug==
Date:   Mon, 26 Sep 2022 11:29:17 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: rpmpd: Add corner power-domains states
Message-ID: <20220926162917.yte3kooilqenufrp@builder.lan>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
 <20220805074935.1158098-3-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805074935.1158098-3-jun.nie@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 03:49:33PM +0800, Jun Nie wrote:
> Some SoCs use corner instead of level in rpm regulator, such as
> MSM8916 and MSM8939. Add these power-domains states value so that
> devices can vote them.
> 
> Note that there is a shift with 1 when converting the value from
> regulator usage in Qualcomm Linux 3.18 to power domain usage here.
> Because corner is not well hacked in regulator framework in 3.18.
> For example, RPM_REGULATOR_CORNER_RETENTION is 2 in 3.18 while
> RPM_SMD_CORNER_RETENTION is 1.
> 

How about we just stick with the numbers in the rpmpd node in DT, as
that would be the only place these constants are used and all the actual
users can use the label associated there?

Regards,
Bjorn

> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 6cce5b7aa940..f778dbbf083d 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -297,4 +297,12 @@
>  #define RPM_SMD_LEVEL_TURBO_HIGH      448
>  #define RPM_SMD_LEVEL_BINNING         512
>  
> +/* RPM SMD Power Domain performance levels in regulator corner method */
> +#define RPM_SMD_CORNER_RETENTION	1
> +#define RPM_SMD_CORNER_SVS_KRAIT	2
> +#define RPM_SMD_CORNER_SVS_SOC		3
> +#define RPM_SMD_CORNER_NORMAL		4
> +#define RPM_SMD_CORNER_TURBO		5
> +#define RPM_SMD_CORNER_SUPER_TURBO	6
> +
>  #endif
> -- 
> 2.25.1
> 
