Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5979333AFA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 11:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCOKLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 06:11:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:35040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhCOKLZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 06:11:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D959F64E20;
        Mon, 15 Mar 2021 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615803084;
        bh=TBo4JwGbMiYixxXMujavD0wEMBia0P6yh8TLzXUBZzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOGSfzOzZu3WPcJKhfaB+U8hFVaTdnHRTr1+sIvJEryXLDLuDgt8t/MJfqUQOwjIO
         cp8Q5ACafH+L8yLTejSJOAzUoEqdocdz1y3G8AGmz6bT3KWYUxUtYjj64ug4CmHJGk
         zO68is3LBZ7kBPlRG+mvmkHLp6AtlzRrioXl+FsxQ6XfCco/SxusF0kDA3Vaq3TL46
         EBfzfRGUUZydBWis22hkhpzcoeNffWfmMpnRXkj00+bGIbP7l1FET/BAJPeaq/I5w2
         hfBbdU6fnRhX1/7qf2IQu8jFPczuOzrxIo5Gcha/OFvrbbLp1qiaDbI2weT1P1jr9i
         uEsLjhNC9Ah9Q==
Date:   Mon, 15 Mar 2021 15:41:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] phy/qualcomm: add hbr3_hbr2 voltage and
 premphasis swing table
Message-ID: <YE8yyK7l9qQKuF3V@vkoul-mobl>
References: <1613667070-27613-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613667070-27613-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-02-21, 08:51, Kuogee Hsieh wrote:
> Add hbr3_hbr2 voltage and premphasis swing table to support
> HBR3 link rate.

Please use phy: qcom-qmp: "...." for the patch title

> 
> Changes in V2:
> -- replaced upper case with lower case at hbr3_hbr2 table
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 0939a9e..4dcc074 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2965,6 +2965,20 @@ static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
>  	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
>  }
>  
> +static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
> +        { 0x00, 0x0c, 0x15, 0x1a },
> +        { 0x02, 0x0e, 0x16, 0xff },
> +        { 0x02, 0x11, 0xff, 0xff },
> +        { 0x04, 0xff, 0xff, 0xff }

This should use tabs and not spaces, please fix this and resend the
patch after running checkpatch --strict and adding Steve's acks

> +};
> +
> +static const u8 qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] = {
> +        { 0x02, 0x12, 0x16, 0x1a },
> +        { 0x09, 0x19, 0x1f, 0xff },
> +        { 0x10, 0x1f, 0xff, 0xff },
> +        { 0x1f, 0xff, 0xff, 0xff }
> +};
> +
>  static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
>  	{ 0x00, 0x0c, 0x14, 0x19 },
>  	{ 0x00, 0x0b, 0x12, 0xff },
> @@ -3000,8 +3014,13 @@ static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
>  		drvr_en = 0x10;
>  	}
>  
> -	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> -	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> +	if (dp_opts->link_rate <= 2700) {
> +		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> +		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> +	} else {
> +		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
> +		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +	}
>  
>  	/* TODO: Move check to config check */
>  	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
