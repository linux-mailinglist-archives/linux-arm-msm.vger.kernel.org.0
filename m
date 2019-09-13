Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE45B226F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 16:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387950AbfIMOow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 10:44:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59956 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729911AbfIMOow (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 10:44:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2DE4A6133A; Fri, 13 Sep 2019 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568385891;
        bh=6Sd2dpM9HRfzA5DVteOBc7URO2Jumcbqg21Ygsai7AI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j391YvrWswsDCumcZGnjL/lCSbKAolYn/m0WClXGjil62VBsEwPR1e7q9HhIv57CS
         DorROLMtEn7hfajc/9E/BtANly54sJNKe90lM5jOqJUEf91IOaSEGyRX2h3TkYIP4V
         GQT7I+eTCHgGPgbXKsB2niWVRT6FdWSuwlyk/zAc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E506A614DC;
        Fri, 13 Sep 2019 14:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568385887;
        bh=6Sd2dpM9HRfzA5DVteOBc7URO2Jumcbqg21Ygsai7AI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LPFidS2TnVseHQyypdlOaG9GMQBwBr5Z2BeRpxtAVnRdfdTBb6jhAH/egQaqNvRIZ
         HecTdMjWjY0B7RL+zzEEtM2p3b5i5GTh+FQy10oKkahFLdhc4DMghMSfDb2AbwUwxA
         AKJ1bWN2P/Fk0FCq9ECNgJaeVoX1/Ej9KdoBf2e8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E506A614DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 13 Sep 2019 08:44:45 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH] clk: Make clk_bulk_get_all() return a valid "id"
Message-ID: <20190913144444.GA25762@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>
References: <20190913024029.2640-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913024029.2640-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 12, 2019 at 07:40:29PM -0700, Bjorn Andersson wrote:
> The adreno driver expects the "id" field of the returned clk_bulk_data
> to be filled in with strings from the clock-names property.
> 
> But due to the use of kmalloc_array() in of_clk_bulk_get_all() it
> receives a list of bogus pointers instead.
> 
> Zero-initialize the "id" field and attempt to populate with strings from
> the clock-names property to resolve both these issues.

This looks great to me.  Thanks for fixing that so quickly.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Fixes: 616e45df7c4a ("clk: add new APIs to operate on all available clocks")
> Fixes: 8e3e791d20d2 ("drm/msm: Use generic bulk clock function")
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/clk-bulk.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
> index 524bf9a53098..e9e16425c739 100644
> --- a/drivers/clk/clk-bulk.c
> +++ b/drivers/clk/clk-bulk.c
> @@ -18,10 +18,13 @@ static int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
>  	int ret;
>  	int i;
>  
> -	for (i = 0; i < num_clks; i++)
> +	for (i = 0; i < num_clks; i++) {
> +		clks[i].id = NULL;
>  		clks[i].clk = NULL;
> +	}
>  
>  	for (i = 0; i < num_clks; i++) {
> +		of_property_read_string_index(np, "clock-names", i, &clks[i].id);
>  		clks[i].clk = of_clk_get(np, i);
>  		if (IS_ERR(clks[i].clk)) {
>  			ret = PTR_ERR(clks[i].clk);
> -- 
> 2.18.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
