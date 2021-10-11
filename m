Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD954298A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 23:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhJKVLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 17:11:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63944 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235122AbhJKVLs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 17:11:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633986587; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mcbzMvbJjsJzfGMVHA2HceukDUBg6GF8UwE11dJYi1E=;
 b=lsj8debvUwv9P22eGb7sAHT2yBDQz6rsb7TlySQaHfVLmCEf9w5E1EYdGurlMQ1RvRjikbO/
 hggVvqMa2kWc3cGWsL3RZ+TkKzEnT6hbxZkEsaSXXge6LQOEET6PyaYU0pKoxoMQiV1iCdC5
 TOa5kA21vuKT4dOR/T7tu6ga+yw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6164a81bab9da96e64d20c08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 21:09:47
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94D03C43618; Mon, 11 Oct 2021 21:09:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9096CC43460;
        Mon, 11 Oct 2021 21:09:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Oct 2021 14:09:45 -0700
From:   abhinavk@codeaurora.org
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Use division result from
 div_u64_rem in 7nm and 14nm PLL
In-Reply-To: <20211011201642.167700-1-marijn.suijten@somainline.org>
References: <20211011201642.167700-1-marijn.suijten@somainline.org>
Message-ID: <51e9b0197656385025cd5c8a25bf01e8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-11 13:16, Marijn Suijten wrote:
> div_u64_rem provides the result of the division and additionally the
> remainder; don't use this function to solely calculate the remainder
> while calculating the division again with div_u64.
> 
> A similar improvement was applied earlier to the 10nm pll in
> 5c191fef4ce2 ("drm/msm/dsi_pll_10nm: Fix dividing the same numbers
> twice").
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes in v2:
> - Corrected two typos in the first commit-message sentence.
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 9a959a5dcc1e..de3c6556a587 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -215,9 +215,7 @@ static void pll_14nm_dec_frac_calc(struct
> dsi_pll_14nm *pll, struct dsi_pll_conf
>  	DBG("vco_clk_rate=%lld ref_clk_rate=%lld", vco_clk_rate, fref);
> 
>  	dec_start_multiple = div_u64(vco_clk_rate * multiplier, fref);
> -	div_u64_rem(dec_start_multiple, multiplier, &div_frac_start);
> -
> -	dec_start = div_u64(dec_start_multiple, multiplier);
> +	dec_start = div_u64_rem(dec_start_multiple, multiplier, 
> &div_frac_start);
> 
>  	pconf->dec_start = (u32)dec_start;
>  	pconf->div_frac_start = div_frac_start;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9f7c408325ba..36eb6109cb88 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -114,9 +114,7 @@ static void dsi_pll_calc_dec_frac(struct
> dsi_pll_7nm *pll, struct dsi_pll_config
> 
>  	multiplier = 1 << FRAC_BITS;
>  	dec_multiple = div_u64(pll_freq * multiplier, divider);
> -	div_u64_rem(dec_multiple, multiplier, &frac);
> -
> -	dec = div_u64(dec_multiple, multiplier);
> +	dec = div_u64_rem(dec_multiple, multiplier, &frac);
> 
>  	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
>  		config->pll_clock_inverters = 0x28;
> --
> 2.33.0
