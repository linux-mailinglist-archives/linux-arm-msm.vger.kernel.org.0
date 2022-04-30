Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C444515DA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 15:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiD3Njp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 09:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382824AbiD3NjO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 09:39:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC98BE41
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 06:35:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s27so13553597ljd.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iFd3GeSeIxlhnThIEOE0AizZsykGoTGqF7fBHefKcRw=;
        b=Yr3jeQ0YjWaMXpO8OQ1W8EZfdyqJVppd6BhrmMbbvqLP6S68HZZwKkRIGYf/qV4dul
         4tSM8t5PhEMHmFvJxCgcOfOycXb3VPC2jFS1TEFNpOwsIHLh+2GgoT1GqcGpd3dyJ57W
         uiPLQbMfEaN95s8/7JTye6E5Mm91v8JTXIjRYw+zsaVTuQVj1XFWMeGeM6meUp9F6Xmj
         Anq5Qavha3apIlnPE6w9suHpOo7vTCSfTjkMlJ/M4qUj8lXfKlwgWBLI67R14M6Xwql0
         6KW0oLcXMv87mPpVMpf0ns2D+x26Ece7Jzjy7EAI89JSntU4q3hjjWUXRf+fhMWEGK7S
         DBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iFd3GeSeIxlhnThIEOE0AizZsykGoTGqF7fBHefKcRw=;
        b=kwMaP3TptbD05iW4CkcsaoQm6Z2QJyuTskhqocUS0MTDjFieSb3xl7n/zKuIfkPZwe
         +lIOWFj46b7GLZn77LSkaqxej9ZrPxrQT2AsmtCRJo88bkEifH8XzYERx2P1sWd+q1un
         eD/2HrQZYQ+gXSu5KFlkIX9qkEpmKfmHa8j8gHXYOnrLar+k10kGUsMEkECqr8GlVBaF
         An8Y72wO/ceEqBTWWBaVJ18O//O93P3GZwUZzOiJUPcRRxMwrnjyui7B3Ct2Ih0W80a3
         YFxkrNjDSDUoxqhyjYvsXAWKmGT/d9UfhtjWEjrEUQzYKhI+WcOR/3BMMxndSkEWIRkj
         KD2w==
X-Gm-Message-State: AOAM533Y/R3WeT6wkd/q7+fqliQuxhYuEULUvWwc7g/ELvxdvohnd42E
        qJ3AOexmVjrMw4cobgOHcrb9Lw==
X-Google-Smtp-Source: ABdhPJzNLw1eQyaosYQdzqMuY+hEWVebXW38tY390DGAvqBSK2Y0QLCP3hM9BFw9y1b5xpiCcdKFZQ==
X-Received: by 2002:a2e:a58a:0:b0:24f:328f:3a5c with SMTP id m10-20020a2ea58a000000b0024f328f3a5cmr2566255ljp.25.1651325751235;
        Sat, 30 Apr 2022 06:35:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v20-20020ac25594000000b0047255d211ffsm193099lfg.302.2022.04.30.06.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 06:35:50 -0700 (PDT)
Message-ID: <45513aa3-cc0b-2952-a282-94829021f552@linaro.org>
Date:   Sat, 30 Apr 2022 16:35:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/msm/dpu: Clean up CRC debug logs
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com,
        Rob Clark <robdclark@chromium.org>
References: <20220430005210.339-1-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430005210.339-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/04/2022 03:52, Jessica Zhang wrote:
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
> 
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
> 
> Changes since V1:
> - Added reported-by and suggested-by tags
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558ef566..16ba9f9b9a78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -204,7 +204,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
>   
>   		if (rc) {
> -			DRM_DEBUG_DRIVER("MISR read failed\n");
> +			if (rc != -ENODATA)
> +				DRM_DEBUG_DRIVER("MISR read failed\n");
>   			return rc;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 86363c0ec834..462f5082099e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -138,7 +138,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>   	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
>   
>   	if (!(ctrl & LM_MISR_CTRL_ENABLE))
> -		return -EINVAL;
> +		return -ENODATA;
>   
>   	if (!(ctrl & LM_MISR_CTRL_STATUS))
>   		return -EINVAL;


-- 
With best wishes
Dmitry
