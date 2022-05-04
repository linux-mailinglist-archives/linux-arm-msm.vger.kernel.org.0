Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCC7B51A4B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 17:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352944AbiEDP7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 11:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349756AbiEDP7x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 11:59:53 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F09E45AFD
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 08:56:15 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6ECAE3F75C;
        Wed,  4 May 2022 17:56:11 +0200 (CEST)
Message-ID: <5fac5a90-b646-2ac5-d992-d701c23dbf1f@somainline.org>
Date:   Wed, 4 May 2022 17:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm/dsi: fix address for second DSI PHY on SDM660
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 03/05/2022 22:43, Dmitry Baryshkov wrote:
> Correct a typo in the address of the second DSI PHY in the SDM660 device
> config.
>
> Fixes: 694dd304cc29 ("drm/msm/dsi: Add phy configuration for SDM630/636/660")
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Gah I'm blind, I think I even had a fixup for this locally at one point :P

In any case,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 75557ac99adf..8199c53567f4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1062,7 +1062,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>   	},
>   	.min_pll_rate = VCO_MIN_RATE,
>   	.max_pll_rate = VCO_MAX_RATE,
> -	.io_start = { 0xc994400, 0xc996000 },
> +	.io_start = { 0xc994400, 0xc996400 },
>   	.num_dsi_phy = 2,
>   };
>   
>
