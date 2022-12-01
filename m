Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A26E63E672
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 01:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiLAA0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 19:26:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiLAA0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 19:26:23 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA31858BC9
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 16:26:21 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so9548lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 16:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IigBehPc+Em/qusf/7j6u/r/e7HcF8wFshWUasQJ9B8=;
        b=jgQJptowxk+tpWm5JxfxLPZwgR+m+Otq4kBaWUfskKldD7GOkjHQI8c1yN6MFxojOn
         OJ6TBG7mwc0Tbr4l/vtUCCgley8qf2inX64QF059GLKiCOEeGuO//CjDxYsziREdqREF
         PwaIzaWDzaMiar5Ynyc2kgkNc91VZ/q2xLMvFZPuYfuqs4+1ZRxXvgvacj7F8Wue40Cc
         A2SDp/u46syaVrCHgAxDcU79nj779XG5rnceNUJtIbeG0pDpdtJP1hTB2NLGTMeD2I+H
         QLtpdoxtZzTuzLo6dK2dmNChr0r9f1j79Tm7nKvD1rbU2pV1XZ+COTVnPvFDvJwjpsbT
         mG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IigBehPc+Em/qusf/7j6u/r/e7HcF8wFshWUasQJ9B8=;
        b=SX4s/a4THY87lHWEj9k55CcJFUPBlVZeCd+lPS9oyZORhqxQ70V8UGAVt/JAijIxjf
         dbwIKHc8R/fZUg4GDiE3W00yDZCICbCAV8HwfBoTWbE2CrnmAw/q1HAmHHBWGZc8+j7e
         8HRFjeLjeWU3Fqg9IfW/xzo57gW8kdg+Xer9k4ZbQVB5kMvihKQ4t7rpt45MeL3fZVni
         t0t4fjW/6j4XoUP16/4bIz6VGPnX4HgZ09kJFG81yALoUISynJycjPLEgepn/HFsZU3E
         lyD2gGrei5Jkx9M24cq0nacN05KTATyV61QpcpgJUL7JgsFYppU+lGyBGSXeBckjMUQi
         SOWw==
X-Gm-Message-State: ANoB5pmJh28O2DdLF23E6K+lfoyXgeTeKH7DlCPrPpeDBAIXPhuW8T3j
        xdfaJeLjYWGzoSVwfBxMIG99Uw==
X-Google-Smtp-Source: AA0mqf6Y/rBxKmL6xGjcEbKjQtStZUc7jyTJiN1dVB/hUBKz123VUR/fTeFuMFM5wE5Gj9ziDBr4Lg==
X-Received: by 2002:a05:6512:15a8:b0:4a6:3ed2:3717 with SMTP id bp40-20020a05651215a800b004a63ed23717mr16703128lfb.637.1669854380184;
        Wed, 30 Nov 2022 16:26:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t15-20020a056512208f00b004b4ec76016esm426881lfr.113.2022.11.30.16.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 16:26:19 -0800 (PST)
Message-ID: <3ead3652-1241-89bd-3441-8ca4a4c8df57@linaro.org>
Date:   Thu, 1 Dec 2022 02:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 3/4] drm/msm/dp: parser link-frequencies as property of
 dp_out endpoint
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-4-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1669852310-22360-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/12/2022 01:51, Kuogee Hsieh wrote:
> Add capability to parser and retrieve max DP link supported rate from
> link-frequencies property of dp_out endpoint.
> 
> Changes in v6:
> -- second patch after split parser patch into two patches
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 16 ++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index b06ff60..2006341 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -95,6 +95,7 @@ static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
>   	struct device_node *endpoint;
> +	u64 frequency;
>   	int cnt;
>   
>   	/*
> @@ -103,6 +104,7 @@ static int dp_parser_misc(struct dp_parser *parser)
>   	cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>   	if (cnt > 0) {
>   		parser->max_dp_lanes = cnt;
> +		parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
>   		return 0;
>   	}
>   
> @@ -116,8 +118,22 @@ static int dp_parser_misc(struct dp_parser *parser)
>   			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>   		else
>   			parser->max_dp_lanes = cnt;
> +
> +		cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +		if (cnt < 0) {
> +			parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
> +		} else {
> +			if (cnt > DP_MAX_NUM_DP_LANES)
> +				cnt = DP_MAX_NUM_DP_LANES;

Why are you comparing the number of link frequencies with the number of 
lanes? You don't need the comparison at all.

> +
> +			of_property_read_u64_index(endpoint, "link-frequencies",
> +							cnt - 1, &frequency);

Checking of the return value?

> +
> +			parser->max_dp_link_rate = (frequency / 1000); /* kbits */
> +		}
>   	} else {
>   		parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +		parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */

Instead of having all the nested if's and setting of max_dp_link rate in 
several branches, please add a function that returns either a valid rate 
or an error. Then you can simply check the result of that function and 
set the default.

>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 866c1a8..3ddf639 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -15,6 +15,7 @@
>   #define DP_LABEL "MDSS DP DISPLAY"
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
>   #define DP_MAX_NUM_DP_LANES	4
> +#define DP_LINK_RATE_HBR2       540000
>   
>   enum dp_pm_type {
>   	DP_CORE_PM,
> @@ -119,6 +120,7 @@ struct dp_parser {
>   	struct dp_io io;
>   	struct dp_display_data disp_data;
>   	u32 max_dp_lanes;
> +	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>   
>   	int (*parse)(struct dp_parser *parser);

-- 
With best wishes
Dmitry

