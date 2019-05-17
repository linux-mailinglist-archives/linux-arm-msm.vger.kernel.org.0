Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502E721E19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 21:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfEQTQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 15:16:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49978 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfEQTQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 15:16:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DC8E860275; Fri, 17 May 2019 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558120601;
        bh=UDu0988ZE+VQBR50SgJEt/dR2lv42ytmm9zgN71+Qlg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OrBVinkcuh1jiRpHR+jEUx8gGVeVx2nWoaqEvPm2vSvBoTy74pq5bMN3C0b6cHOCz
         i1juxM8hVd0hEFvyPPpyEoo5PtLybM8gNyJ2CWzIeqDkmQ/ul2UfNkeTheE14VXqpF
         S+UN/Pp9BwqV+JfH3wQ8Y6areQgX+7juWB7OcNB0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC32860735;
        Fri, 17 May 2019 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558120601;
        bh=UDu0988ZE+VQBR50SgJEt/dR2lv42ytmm9zgN71+Qlg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OrBVinkcuh1jiRpHR+jEUx8gGVeVx2nWoaqEvPm2vSvBoTy74pq5bMN3C0b6cHOCz
         i1juxM8hVd0hEFvyPPpyEoo5PtLybM8gNyJ2CWzIeqDkmQ/ul2UfNkeTheE14VXqpF
         S+UN/Pp9BwqV+JfH3wQ8Y6areQgX+7juWB7OcNB0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC32860735
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gdsc: WARN when failing to toggle
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190504001736.8598-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <fa15fb15-3597-8563-bf30-518ce345a232@codeaurora.org>
Date:   Fri, 17 May 2019 13:16:39 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504001736.8598-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/3/2019 6:17 PM, Bjorn Andersson wrote:
> Failing to toggle a GDSC as the driver core is attaching the
> power-domain to a device will cause a silent probe deferral. Provide an
> explicit warning to the developer, in order to reduce the amount of time
> it take to debug this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>

> ---
>   drivers/clk/qcom/gdsc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index dd63aa36b092..6a8a4996dde3 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -149,7 +149,9 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>   		udelay(1);
>   	}
>   
> -	return gdsc_poll_status(sc, status);
> +	ret = gdsc_poll_status(sc, status);
> +	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
> +	return ret;
>   }
>   
>   static inline int gdsc_deassert_reset(struct gdsc *sc)
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
