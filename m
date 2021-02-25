Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B110324B3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 08:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhBYH1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 02:27:08 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:35178 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233022AbhBYH1A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 02:27:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614238002; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cUew4Av0FJC4vQyEP5MpOnxBX/HGR6/3GwBlUCObe0g=;
 b=PMZ4kxfsr/qLpUguLzU1CNg02sjBS2lN3tVpguDPXRXsqILtbxxAubyDkDRvP6NDBHy9uzP2
 J/pk/UE1S3G7xb8Tbo4wYpvfen3sRYwQAqqzYC9g5Vy14Kl+4zvvO7e9u35klN1fTgfadPus
 6AwpN4ilvZ5jHgICZVd+P2xDwOU=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 603751122658fcb8732c0d8a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 07:26:10
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0FE43C433ED; Thu, 25 Feb 2021 07:26:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D79BC433CA;
        Thu, 25 Feb 2021 07:26:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Feb 2021 23:26:08 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi_pll_7nm: Fix variable usage for
 pll_lockdet_rate
In-Reply-To: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
References: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
Message-ID: <ab841076b17c509f2009145697e8cb67@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

Thanks for the patch.

On 2021-02-24 15:05, Dmitry Baryshkov wrote:
> The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
> directly, but the same value was also being specified in the
> dsi_pll_regs struct pll_lockdet_rate variable: let's use it!
> 
> Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
> pll_lockdet_rate")
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index 0458eda15114..e29b3bfd63d1 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -325,7 +325,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1,
> reg->frac_div_start_low);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1,
> reg->frac_div_start_mid);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
> reg->frac_div_start_high);
> -	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
> +	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1,
> reg->pll_lockdet_rate);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 
> for CPHY */
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS,
> reg->pll_clock_inverters);
