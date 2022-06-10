Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D540A547016
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jun 2022 01:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345134AbiFJXap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 19:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238705AbiFJXao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 19:30:44 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FC628972D
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 16:30:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c30so643239ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sv8K11oZ7Lv4AmiRrISFf7n2mB2iCSpIfL4GspaERss=;
        b=eCYr1lrWDY+g9PwdpzhAXIvVxv5ugWFG3MIQ6r/G3RgHmdBMDW3KVqfsjE3DDe/PqK
         X4XHTXmaztJIMHFgq3lq0rMIHkmLTRNbvrTrCrznepvxo6pIlRBJgwfTmcFexLMcUlhY
         M/0YsMbWPaQ6fOeI5YsWEKqC/Ov831IT/gWDSL0mbN+DIeKW6WfZuzM6s0BVrJGVsf1E
         3dKv9ThqZ3QeZQWEUY77vb6R/e3iapUATovF/px7SmivgLoznSYJiU109MJ+G0QYSmcC
         PtxU+H0QWGlDFibQOgP/npf810d2+kCJdU6ztAeRvPM/gTf67JOUDtX1k3RmA0lElGsH
         SyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sv8K11oZ7Lv4AmiRrISFf7n2mB2iCSpIfL4GspaERss=;
        b=h0AmtlivbTaYxyPirDTyU388oEhw9BagGHVRTq0UtC1zSTJLVTCnrYdkc8Vq/nUX3j
         PxLz7Bb2gMY56hZwDAFEZB/oBypgCp10gyYxCNF6/1ILtUYmL9MStgC5JdgvE1yWLlyx
         cXXp9DhYM1lrfxy085WlLEIGe89Kk3XXMp/bsU1llejnsoiAWuLGcL3oX+jtRBebAadd
         nh5nByR9u4rqM0338Ehdj3rPB8p5WorTZ/KxmseFj3fmVluzAU5zoaMxhkgU4b84BI1m
         z2gD+SrCme/h7Z5s1xA+c0KbHWHQv7p/YcGuXINQvaiF7m4NexNpX4lSi7eyrrDpSs29
         gz/w==
X-Gm-Message-State: AOAM530zSKU/9+dOj/3kn+nHnsY7geJ9BX42ovO3/Q/twP1gL4p5Ykgr
        KSRfKz/oFgNM952+LwHfcNRlDA==
X-Google-Smtp-Source: ABdhPJyQWfgzv3lGQjgGqamMRcSrJ3LohMrscyux/fTbfyQePC67i0s9ib/Pgwby9VZ76BA7VJ7wgg==
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id h1-20020a05651c158100b0025548d1fdaemr36354825ljq.286.1654903841934;
        Fri, 10 Jun 2022 16:30:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c28-20020ac2531c000000b0047889d37464sm35918lfh.196.2022.06.10.16.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 16:30:40 -0700 (PDT)
Message-ID: <68399bf2-4cb7-69e4-0923-6ca8db386de6@linaro.org>
Date:   Sat, 11 Jun 2022 02:30:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] drm/msm/mdp5: Add perf data for MDP v1.16
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        James Willcox <jwillcox@squareup.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220610225304.267508-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220610225304.267508-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/06/2022 01:53, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the perf data for the mdp found in msm8953.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1bf9ff5dbabc..b17f868ffca8 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -837,6 +837,11 @@ static const struct mdp5_cfg_hw msm8x53_config = {
>   			[2] = INTF_DSI,
>   		},
>   	},
> +	.perf = {
> +		.ab_inefficiency = 100,
> +		.ib_inefficiency = 200,
> +		.clk_inefficiency = 105
> +	},
>   	.max_clk = 400000000,
>   };
>   


-- 
With best wishes
Dmitry
