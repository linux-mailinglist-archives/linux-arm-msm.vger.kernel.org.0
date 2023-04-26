Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66F06EEB37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 02:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbjDZAFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 20:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238170AbjDZAFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 20:05:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81B313F8B
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 17:05:14 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-505035e3368so11174833a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 17:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682467513; x=1685059513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92p144hgx5znGq0KmTtq1s2zoBLW41GayICC7BgVRAc=;
        b=Q8vyb4c/rWXerkuThA53GdodI5im0TWL1RvFHYNBSKKDDT74e1GmFEr8wfaiJOe/qF
         XzyW8Z7gaa/sjbIeLOuPwlK1CIuufBBZjfWshk+ESqSUueUXynVEF552Eo+UtoCuQ9QK
         Jni2LSJwYWeREWmFpfhc7i6ZwcLO4QbHgyQTrx2l+1lsu1xT1FzI47xY4BMCPtInL2WX
         eHoXFMv/ue/TxkTlVyyT0KPD2/smVhbeXTTt3PBPjwGCLcTBSwz1Flmyd18FBqQgL1JW
         L4+aPMpvedgZlelPQaX1Wr//HKYPRk/sgl1glu+hyrIm46qYWg7O92MCshXReDC/l1SB
         xr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682467513; x=1685059513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92p144hgx5znGq0KmTtq1s2zoBLW41GayICC7BgVRAc=;
        b=JNrlLbG6Ia4uGz/1JziZSEkUtH2LdWJhW3CFNxn/kTaSOudT4BwzTcpLmctVJEf97o
         NJeT7ZeKvX/FOMns3PijmqXRAd9Y1avBjGXFrek5PkxRvMTWNb2Hp13QmajT3ga+ypej
         xIWliVZb1gcc3xvBhNlNYbmyD+g71RIiB8CNHC54ydoqetF8m3iGuclLbi9ib8mt3/Zh
         58DnOMNwJhHvC/yaOk23lX/XTaDl6r2Z788NhmLe2G1JZIVP+uwU5OHBJB0v1PYFrj2V
         QB9QTEl63se17qRLAPQ/82ofT2UEpb7Ekhud6JcHohDlSKWZDuLn2UTwsj9UIlo+Kj7a
         ZlSA==
X-Gm-Message-State: AAQBX9cOgaLwmOeJyxken62I1p6P0xttfeOaLzLQ7hprDLypSZHQvZIA
        OOTUldz/A2P1l8ruwNolPBJBfQ==
X-Google-Smtp-Source: AKy350ZO1NHOy+ASN4UFeADw3/dg9KwafmbvI34h3IM7r5oTkaQvTdbe7+HDUhD1jHRqiI4qAgso9Q==
X-Received: by 2002:a05:6402:1a33:b0:504:b0d2:76c with SMTP id be19-20020a0564021a3300b00504b0d2076cmr16801903edb.32.1682467513133;
        Tue, 25 Apr 2023 17:05:13 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b005023ddb37eesm6464452eds.8.2023.04.25.17.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 17:05:12 -0700 (PDT)
Message-ID: <692a094b-1cb7-d4e1-7e44-6f9fab075c2f@linaro.org>
Date:   Wed, 26 Apr 2023 03:05:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 17/21] drm/msm/dpu: Describe TEAR interrupt registers
 for DSI interfaces
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-17-693b17fe6500@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v3-17-693b17fe6500@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2023 02:06, Marijn Suijten wrote:
> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
> the PINGPONG block and into the INTF block.  Wire up the IRQ register
> masks in the interrupt table for enabling, reading and clearing them.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 52 +++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  4 ++
>   2 files changed, 44 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index e116993b2f8f7..5e2d68ebb113e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -17,18 +17,26 @@
>    * Register offsets in MDSS register file for the interrupt registers
>    * w.r.t. the MDP base
>    */
> -#define MDP_INTF_OFF(intf)			(0x6A000 + 0x800 * (intf))
> -#define MDP_INTF_INTR_EN(intf)			(MDP_INTF_OFF(intf) + 0x1c0)
> -#define MDP_INTF_INTR_STATUS(intf)		(MDP_INTF_OFF(intf) + 0x1c4)
> -#define MDP_INTF_INTR_CLEAR(intf)		(MDP_INTF_OFF(intf) + 0x1c8)
> -#define MDP_AD4_OFF(ad4)			(0x7C000 + 0x1000 * (ad4))
> -#define MDP_AD4_INTR_EN_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x41c)
> -#define MDP_AD4_INTR_CLEAR_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x424)
> -#define MDP_AD4_INTR_STATUS_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x420)
> -#define MDP_INTF_REV_7xxx_OFF(intf)		(0x34000 + 0x1000 * (intf))
> -#define MDP_INTF_REV_7xxx_INTR_EN(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
> -#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
> -#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
> +#define MDP_INTF_OFF(intf)				(0x6A000 + 0x800 * (intf))
> +#define MDP_INTF_INTR_EN(intf)				(MDP_INTF_OFF(intf) + 0x1c0)
> +#define MDP_INTF_INTR_STATUS(intf)			(MDP_INTF_OFF(intf) + 0x1c4)
> +#define MDP_INTF_INTR_CLEAR(intf)			(MDP_INTF_OFF(intf) + 0x1c8)
> +#define MDP_INTF_TEAR_OFF(intf)				(0x6D700 + 0x100 * (intf))
> +#define MDP_INTF_INTR_TEAR_EN(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x000)
> +#define MDP_INTF_INTR_TEAR_STATUS(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x004)
> +#define MDP_INTF_INTR_TEAR_CLEAR(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x008)
> +#define MDP_AD4_OFF(ad4)				(0x7C000 + 0x1000 * (ad4))
> +#define MDP_AD4_INTR_EN_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x41c)
> +#define MDP_AD4_INTR_CLEAR_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x424)
> +#define MDP_AD4_INTR_STATUS_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x420)


Please don't reindent lines together with doing the actual changes. 
Please set the correct alignment in the patch 10

> +#define MDP_INTF_REV_7xxx_OFF(intf)			(0x34000 + 0x1000 * (intf))
> +#define MDP_INTF_REV_7xxx_INTR_EN(intf)			(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
> +#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
> +#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
> +#define MDP_INTF_REV_7xxx_TEAR_OFF(intf)		(0x34800 + 0x1000 * (intf))
> +#define MDP_INTF_REV_7xxx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x000)
> +#define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
> +#define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
>   
>   /**
>    * struct dpu_intr_reg - array of DPU register sets
> @@ -93,6 +101,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_INTR_EN(5),
>   		MDP_INTF_INTR_STATUS(5)
>   	},
> +	[MDP_INTF1_TEAR_INTR] = {
> +		MDP_INTF_INTR_TEAR_CLEAR(1),
> +		MDP_INTF_INTR_TEAR_EN(1),
> +		MDP_INTF_INTR_TEAR_STATUS(1)
> +	},
> +	[MDP_INTF2_TEAR_INTR] = {
> +		MDP_INTF_INTR_TEAR_CLEAR(2),
> +		MDP_INTF_INTR_TEAR_EN(2),
> +		MDP_INTF_INTR_TEAR_STATUS(2)
> +	},
>   	[MDP_AD4_0_INTR] = {
>   		MDP_AD4_INTR_CLEAR_OFF(0),
>   		MDP_AD4_INTR_EN_OFF(0),
> @@ -113,11 +131,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_REV_7xxx_INTR_EN(1),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(1)
>   	},
> +	[MDP_INTF1_7xxx_TEAR_INTR] = {
> +		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
> +		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
> +		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
> +	},
>   	[MDP_INTF2_7xxx_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
>   		MDP_INTF_REV_7xxx_INTR_EN(2),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(2)
>   	},
> +	[MDP_INTF2_7xxx_TEAR_INTR] = {
> +		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
> +		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
> +		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
> +	},
>   	[MDP_INTF3_7xxx_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
>   		MDP_INTF_REV_7xxx_INTR_EN(3),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 425465011c807..fda7f8c9caece 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -23,11 +23,15 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF3_INTR,
>   	MDP_INTF4_INTR,
>   	MDP_INTF5_INTR,
> +	MDP_INTF1_TEAR_INTR,
> +	MDP_INTF2_TEAR_INTR,
>   	MDP_AD4_0_INTR,
>   	MDP_AD4_1_INTR,
>   	MDP_INTF0_7xxx_INTR,
>   	MDP_INTF1_7xxx_INTR,
> +	MDP_INTF1_7xxx_TEAR_INTR,
>   	MDP_INTF2_7xxx_INTR,
> +	MDP_INTF2_7xxx_TEAR_INTR,
>   	MDP_INTF3_7xxx_INTR,
>   	MDP_INTF4_7xxx_INTR,
>   	MDP_INTF5_7xxx_INTR,
> 

-- 
With best wishes
Dmitry

