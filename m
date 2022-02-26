Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56EA4C58AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 00:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiBZXck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 18:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiBZXck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 18:32:40 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AD41FC2E3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 15:32:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id t13so3413571lfd.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uAAifAuUillXLfQ7S+jdv/GEcpCcdBCKNAMWe6JBNCQ=;
        b=kl11QDr19mfELOll6E4duE12IWzb1KZJnezNEUMeKbnT52BQWSU2on3w5bbUe3b3EW
         rW3t8Br5tZpLcivUEk/wgLUs9+lOCoXY7uTd4WNNnXoGGA306Jvu0z30aTwIYWAfpOwz
         S79pIYJEmp+GFERuOgiC4x7JSTRcQ/8v05gtvfBYOdpvRHb4l+XWw9hddfR5NZsIZ88j
         4WLwfONr7lUMjEwRSNIQhLHHF1KNW7axMExyPQ89luM9cykWc+2wpJLp/WqDQ+kJjOvm
         t0ddBSdC/QeY+k5sC7iHqI4e9CRE9i2eRETY734XLUgur6PTpPk9rjYmKl4sTiDjCWoS
         fkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uAAifAuUillXLfQ7S+jdv/GEcpCcdBCKNAMWe6JBNCQ=;
        b=O+wt+hRkEKORGe45eVB5byEXyggBe1HSUUactMC3SsXPKooUkyPcH5iSGLyOm9xW5U
         suvGaVgvPe1jlL7zIImTZjtkdk2EynW50mIL/VQYQ5uri7KxDbOjnYZuioUt3JgI/CNs
         nhbbAWWwTXp2DWvBIcQyeguQBRDOr7SoQZ+kUOP+ziHhVNo1n/xPH8ImBOtHwCdpym2M
         ashHc/kS65+hkjAua25lQqYz2jIP+cuFPfaevv7cJDk22iGJexgF6IkJtULivDLQiZ61
         GcqHFV07i7zpmRw6vEmodrkoPiqKF7y91o9uFxyVCUTgSJLT/m9lsi3gkxZ8bw3d3lG2
         lvOw==
X-Gm-Message-State: AOAM5311ihb+sF2TpqhHwKjaNTV410mXSYMIeoBMvQhI+OQljGelXDrW
        0T7HANwgqE2rig0S+/DMIwp2Zg==
X-Google-Smtp-Source: ABdhPJyfWldaoFQncybaXzOhjS2bFagYJ2D6zN/7PsPqDmUkKFn53ZIxnFc/UfVapBieoSk7IZEt8Q==
X-Received: by 2002:ac2:5c09:0:b0:443:7ae5:c341 with SMTP id r9-20020ac25c09000000b004437ae5c341mr8956054lfp.623.1645918321159;
        Sat, 26 Feb 2022 15:32:01 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a11-20020ac2520b000000b0044363e18b34sm548911lfl.148.2022.02.26.15.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 15:32:00 -0800 (PST)
Message-ID: <33aac1d8-acea-215c-0a76-05f992831f87@linaro.org>
Date:   Sun, 27 Feb 2022 02:31:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/msm/dpu: Use indexed array initializer to prevent
 mismatches
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220226194633.204501-1-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220226194633.204501-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/02/2022 22:46, Marijn Suijten wrote:
> While there's a comment pointing from dpu_intr_set to dpu_hw_intr_reg
> and vice-versa, an array initializer using indices makes it so that the
> indices between the enum and array cannot possibly get out of sync even
> if they're accidentially ordered wrongly.  It is still useful to keep
> the comment to be made aware where the register offset mapping resides
> while looking at dpu_hw_intr_reg.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 34 +++++++++----------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index c515b7cf922c..c61b5b283f08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -54,87 +54,87 @@ struct dpu_intr_reg {
>    * When making changes be sure to sync with dpu_hw_intr_reg
>    */
>   static const struct dpu_intr_reg dpu_intr_set[] = {
> -	{
> +	[MDP_SSPP_TOP0_INTR] = {
>   		MDP_SSPP_TOP0_OFF+INTR_CLEAR,
>   		MDP_SSPP_TOP0_OFF+INTR_EN,
>   		MDP_SSPP_TOP0_OFF+INTR_STATUS
>   	},
> -	{
> +	[MDP_SSPP_TOP0_INTR2] = {
>   		MDP_SSPP_TOP0_OFF+INTR2_CLEAR,
>   		MDP_SSPP_TOP0_OFF+INTR2_EN,
>   		MDP_SSPP_TOP0_OFF+INTR2_STATUS
>   	},
> -	{
> +	[MDP_SSPP_TOP0_HIST_INTR] = {
>   		MDP_SSPP_TOP0_OFF+HIST_INTR_CLEAR,
>   		MDP_SSPP_TOP0_OFF+HIST_INTR_EN,
>   		MDP_SSPP_TOP0_OFF+HIST_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF0_INTR] = {
>   		MDP_INTF_0_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_0_OFF+INTF_INTR_EN,
>   		MDP_INTF_0_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF1_INTR] = {
>   		MDP_INTF_1_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_1_OFF+INTF_INTR_EN,
>   		MDP_INTF_1_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF2_INTR] = {
>   		MDP_INTF_2_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_2_OFF+INTF_INTR_EN,
>   		MDP_INTF_2_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF3_INTR] = {
>   		MDP_INTF_3_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_3_OFF+INTF_INTR_EN,
>   		MDP_INTF_3_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF4_INTR] = {
>   		MDP_INTF_4_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_4_OFF+INTF_INTR_EN,
>   		MDP_INTF_4_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF5_INTR] = {
>   		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_5_OFF+INTF_INTR_EN,
>   		MDP_INTF_5_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_AD4_0_INTR] = {
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_STATUS_OFF,
>   	},
> -	{
> +	[MDP_AD4_1_INTR] = {
>   		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
>   		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
>   	},
> -	{
> +	[MDP_INTF0_7xxx_INTR] = {
>   		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF1_7xxx_INTR] = {
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF2_7xxx_INTR] = {
>   		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF3_7xxx_INTR] = {
>   		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF4_7xxx_INTR] = {
>   		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF5_7xxx_INTR] = {
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
> 
> base-commit: 06aeb1495c39c86ccfaf1adadc1d2200179f16eb


-- 
With best wishes
Dmitry
