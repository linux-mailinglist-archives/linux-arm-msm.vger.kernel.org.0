Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064706D04B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjC3M3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjC3M3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:29:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4824C35
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:29:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g17so24304443lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sH+/15LsbOgawXELBUf5vQdjqObcddF1Ko7jUuzxZvc=;
        b=phOj9XOYcMB4LaY4xiDu4qfIm6NODIYYs9FlR0lSlK3zQNPbFzyl9ntWCj4ra40QzE
         aUvcMKu86OwqLEtQYfLK2Hdd6FxObXrQtgnGYyRgHls7K4RDFZiK5L5SawN0+sRQ3EE+
         bw38LMFzdZvL0JM1gtp+rWYzrjV6NqnjGRmnO7zwNSkGxF20NbglN0BavBttuX0rf+Zi
         2Tq+f/93txuxqPKVMYPhvnTeWM02nDZcs/elwc5ABCVIbHwRmX8PbHLI1Stg72SOyWlh
         rlE6t6Udm5MaXvQxGJ2Fl48uqpXiiAzpaer6cxdGdQpHmYm4snKjUwVqLx/tzai9hDag
         vikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sH+/15LsbOgawXELBUf5vQdjqObcddF1Ko7jUuzxZvc=;
        b=2BCKDkDe1P+mOpqs19sNpH/LfsMlvF+cQOypyYyMdrg/i96xkzlX/tYN27Qhv/DJUN
         3tSTsE7SD4RfjFF+8YP6J0eDw50huNTUJrFYaW6GHrLLEIzRNp4ej3rKUUUxY0TF74sU
         /PbiMzUBkxQLNmyV7lfSNQ2Ez+oPiW/gi/Zt9tPg4UnXTPLeWE0fm2GrFM+sbGDRO0ON
         hkA/xU/zDvCwzasv4h/vntxtsq1kHC/CSzGvAsbTwNqdEkAhHGe2WX3n/RqucRh3g6Aw
         Dz1FUDa9L9NKvNlVhpLEnCc/1o/H10xiz3X9siM+X6GGnHfpqYx8ahfA5fMdgs8fpZ/2
         4oEw==
X-Gm-Message-State: AAQBX9cgQ1X8xKG445qLR/Pyx8CKUYRNMl0Kf+bAS1tdbOPVXNj9plt6
        WtkrHCXC/078TsFxyhmBEAbMHw==
X-Google-Smtp-Source: AKy350a+by+b1eUxNDL9AVM2SvfTpys/gok8XCOaNuVpBLC5raT5r4Ig7ANjaoVrdGhy+Oh/syE/lg==
X-Received: by 2002:ac2:530d:0:b0:4de:8588:b57c with SMTP id c13-20020ac2530d000000b004de8588b57cmr6891896lfh.28.1680179386152;
        Thu, 30 Mar 2023 05:29:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id e4-20020ac25464000000b004d58e782886sm5850384lfn.303.2023.03.30.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:29:45 -0700 (PDT)
Message-ID: <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
Date:   Thu, 30 Mar 2023 14:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Theoretically since sm8150 we should be using a single CTL for the
> source split case, but since we do not support it for now, fallback to
> DPU_CTL_SPLIT_DISPLAY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Hmm.. so is it a software construct? E.g. "pass half of the data to
each of the INTFs and tell them to cooperate"?

Apart from that, since it's temporary, I think it deserves a comment
reminding us to fix it eventually™

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index a3a79d908451..094876b1019b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
