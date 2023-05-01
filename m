Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A7C6F30EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjEAMiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjEAMiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:38:03 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4882E43
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:38:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8a5f6771fso23422501fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682944680; x=1685536680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IbVhpk+6YPf6UP0JUxSgmpnmuOZSagBqkf05LKlAxI=;
        b=t+luffE6T+59qh3ntjYNcC3D1SBpx/+RpIpcCQ85pY/H9DOvzmmPnASP8r052HqmLS
         +kzRdc3ATuzCgKbT1UAlQts5r3DdvAAEhgbDYC6F5dACbOvATDkkZUiDDpUo7eUC9tsZ
         F0gQLIJCzriXoyvmlMMBEx4XB3nYgeF7r1DIIQMqzdeTyJifaEFf2z555o9DUFyHy6ad
         e5W7QSlbtoj7qEf3xMe4ENjjMdEtYWNPsyxjUrY1Sp7N/l4iCnIVBRoRU8UqI4spwpST
         vpTpKVb69D56fnwKY+0ANtVg9wg7pQ1tuSS075AEKWW7Sq/miTHoN1s3Qe6J3PPIjhHI
         0yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944680; x=1685536680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IbVhpk+6YPf6UP0JUxSgmpnmuOZSagBqkf05LKlAxI=;
        b=HvipE6Fs+Wahuw3nDGCyeQSR8BurReLJwK3HH1u9LeWPDa6iO+xmhJr9n6KNXLIbeU
         Yl2aOosjeb38oDNwjkRCqNiW66ub7flXQwa/TCfq1TEv/RknswxjT26omqdwIyagjsBh
         R4yKqIdh6i7yoFrObyFzYfKYHCrxC5cmp3U1jnjQ376YzkmEUK4JfXDG4SSu45G6NRSp
         8QsMugxs3uDCijRMn1wlm8rwy/ScvuQc1m6CwgwUwM7YPs7L1bHDyGz63WVjydsihTqM
         dvAW3yROv06pMp9resgqKgiGi/cZpJYVFtD7DorecM0+Lk2102/DIJEVdkU4/GdJfkFc
         gCfw==
X-Gm-Message-State: AC+VfDwfCSqXfBSXPZhIkwLDDLu6HVQagJn1PbRMnBTXqqbcgVqbMD6W
        xMDZjA/ik144ncfR2UvZmupHvA==
X-Google-Smtp-Source: ACHHUZ4JrEAVZU7gK3ZcuZgwQYC6Wox623r/U+ysIg9R1y1XMRn7lrpbRiifYov8TJDnd2uPAthOdg==
X-Received: by 2002:a2e:9658:0:b0:2a8:bce4:c712 with SMTP id z24-20020a2e9658000000b002a8bce4c712mr3814440ljh.43.1682944680000;
        Mon, 01 May 2023 05:38:00 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id p3-20020a05651238c300b004ec5229092dsm4722852lft.34.2023.05.01.05.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 05:37:59 -0700 (PDT)
Message-ID: <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
Date:   Mon, 1 May 2023 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with
 unprogrammed rate
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2023 03:12, Dmitry Baryshkov wrote:
> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
> enabling VCO before the rate has been programmed. This can cause clock
> lockups and/or other boot issues. Program the VCO to the minimal PLL
> rate if the read rate is 0 Hz.
> 
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I think this should also be implemented on other PLL gens.

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 9f488adea7f5..3ce45b023e63 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  	if (unlikely(pll_14nm->phy->pll_on))
>  		return 0;
>  
> +	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> +		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?

Konrad
> +
>  	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>  	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>  
