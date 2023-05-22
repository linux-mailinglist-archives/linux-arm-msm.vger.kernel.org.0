Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E853F70CABC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 22:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjEVUS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 16:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234788AbjEVUSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 16:18:22 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51209E4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 13:18:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so5012400e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684786683; x=1687378683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37m5+D6QbSo7LpsLyUnajXaAQuo/moN3fPGc1pIbZaA=;
        b=jOt+EAODFpuxIJLWaKzdp+pMdUS4J2LONY/bPDZ1UV71sTDvUl1mAhEKKQmvxqDAxs
         ec9wpq9XKKsxfr6odEx5txda1qV8uzEJC26OH0lyIJ8eo4k5cJdxbA8IuKDfHtsESHvs
         giO+lt0n7/+N/qeIdl/rCoHKUfQLcMR6NqTJHa1V2uwMKwCGyZF2mYxGVZb8yskiWuKZ
         XjHJF9K4LpDXQ8r9fUXGW3QPN7PJW3f6ivBuXc8n71i95zzVzy13SdB6wHyxkGG1/kMJ
         NB0jDlVqefoBKhyzIj0EnVj+z4k/Foh0XF8FLKuxPAfNp0O5hFpo2uZsa/IpQRnyNloW
         +yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684786683; x=1687378683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37m5+D6QbSo7LpsLyUnajXaAQuo/moN3fPGc1pIbZaA=;
        b=fOPjhetb9Na/SbhmZST3SSfTfpdG2H89l9rXFzAf8hRjqJuCY+rFN4jGslKXY1cbFP
         VicswGAbG3ybxtRG3NaY1id25jOn98UYhVr65vBJTkzmcMcOtxc/yMNvFnPbtptgwGkc
         m/H7P/ZEjp6xkG1rYgd+hQ017oIhRmsBM8iHe9hBjhvJdo2cVsuEpJL38NBhC0cDEhrt
         LDTIOn0AvvrBDTsY16zFNpD24dQyVvM1kaexCXj+Z7o7TpMbp6KVj3KKtBJICmUTOpaV
         GHWhLf3/eaVjz4DlKwLmbqCjoHKALpXYifl9T1hHX+gjSbRSBR50Y09IR3czy5EpCGuM
         onqw==
X-Gm-Message-State: AC+VfDynEbadnS2/QgZIBJsHOmK5hC9Na4lx70dOLBmKFYjYYbAqAULR
        Q/ut/JgeRPBGFIkiJt49rzumKg==
X-Google-Smtp-Source: ACHHUZ4Yh5ixyr5evffTASHfLrrR9A5Kjg+Xi2i0N+jguD6R64U7zzHl/6oiWqR/erTmCJzKuZ9/uw==
X-Received: by 2002:a05:6512:6c4:b0:4f4:aeb8:aebe with SMTP id u4-20020a05651206c400b004f4aeb8aebemr1372588lff.25.1684786683546;
        Mon, 22 May 2023 13:18:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a5-20020ac25205000000b004f392625952sm1093573lfl.26.2023.05.22.13.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 13:18:03 -0700 (PDT)
Message-ID: <d5e232d6-b789-a8c3-4ec5-7af0b9d8b9ae@linaro.org>
Date:   Mon, 22 May 2023 23:18:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 01/10] drm/msm/dpu: set DSC flush bit correctly at MDP
 CTL flush register
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1684783853-22193-1-git-send-email-quic_khsieh@quicinc.com>
 <1684783853-22193-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684783853-22193-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 22:30, Kuogee Hsieh wrote:
> DSC flush bit is the bit 22 of CTL flush register. BIT(22) is expected
> to be written to CTL flush register to indicates that DSC is ready for
> flush. However 0x22 (BIT(1) and BIT(5)) was written mistakenly at current

DSC_IDX is 22, not 0x22.

> implementation. Fix this problem by writing BIT(22) to CTL flush register
> for DSC to work properly.
> 
> Changes in V12:
> -- split this patch out of "separate DSC flush update out of interface"
> 
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4f7cfa9..69d0ea2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -525,7 +525,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
>   	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, BIT(DSC_IDX));
>   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>   	}
>   }

-- 
With best wishes
Dmitry

