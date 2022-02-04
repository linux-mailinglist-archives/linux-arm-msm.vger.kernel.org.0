Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0676E4AA333
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346580AbiBDWgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350731AbiBDWgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:36:36 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996D6D210536
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 14:36:35 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a25so10421076lji.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c7x/cvlOShTxU2gJe80KgOcsq6QIAA84CFY6qHZapHE=;
        b=yAtSvEMHAuKcx9GO/1aZqwwNTknxA1L7vce6ArzLQbnqULt7LUrkE0CDGvrJTwT+2q
         Opk0ugJBzAOgXCBlfKM4aLgLlYt25b07+9bcEn7oXJSHdomwWpzRDUrzXvYyYCoyVMil
         xM73zdZAHrTM+mJYpqk6Cr52kp7/eCdRTrjgAMvfr5sS99VYYNtdUH6xV7ZEJP/pZKXE
         iGZmh39HN0ZXMISDAoC7mWV/ULMDi7VzSnVDvuTOe9rfOvPHVg3QdEGKLQBL7Jn7riTe
         FxL4/XwYJJ/QR25B4iw9inaz0gs+I3UydgMxwLjOsV75gthBM0y6B3vO+npCt4syc5dl
         odjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c7x/cvlOShTxU2gJe80KgOcsq6QIAA84CFY6qHZapHE=;
        b=6vthKoB8SewxUiw/Lt5zjWIi7UPVld2trF8xYUqBvC9hjwADhQuSsYypcLN2eYJ8PT
         m09ugjtTcDXzIoPQ0IbRk6+iXetXsFnaa3QbBZD2JvD8nJa2F9ScHyHefC4fQgF5dlUT
         fHpwmf01gzZKvrrkDMyijY03JpiL/QUPouAOOtUhzzeV3mpn3U1bWPJaTvkqlIVPk1Rg
         0eI+7Yuvo4ACiGVYThFd8ygVSUf3gs66Vd3RPtTwXK/zOpI+K+3nW2NAkL1qYBajX/pg
         VYGpff3k5/sESX7PKLzVQgZi5H/nFlRzoxwbRm2HfTAcdkgwGLxku0t/f2LfknEyz6ob
         AE1A==
X-Gm-Message-State: AOAM531rCYV0xvegt3EE10CoB1Udu1s0D0Dr2TutApHJuz7Bzqy79fV6
        /JqFScQpP9DnguBLoNxuwRtJng==
X-Google-Smtp-Source: ABdhPJza7guCeIafEsHqEj+4mjDnBcgDEeyjXetzyWRS8/qRpdN2KL/BqPWnHD4+5zgY4hI2FXDI4g==
X-Received: by 2002:a2e:9bd4:: with SMTP id w20mr697734ljj.324.1644014193996;
        Fri, 04 Feb 2022 14:36:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j2sm478643lfc.174.2022.02.04.14.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 14:36:33 -0800 (PST)
Message-ID: <06082678-f677-b4e4-67af-d45d11f81c26@linaro.org>
Date:   Sat, 5 Feb 2022 01:36:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/12] drm/msm/dpu: add writeback blocks to the display
 snapshot
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org, daniel@ffwll.ch,
        markyacoub@chromium.org, quic_jesszhan@quicinc.com
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Add writeback block information while capturing the display
> snapshot.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6327ba9..e227b35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -987,6 +987,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>   				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>   
> +	/* dump WB sub-blocks HW regs info */
> +	for (i = 0; i < cat->wb_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
> +				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
> +
>   	msm_disp_snapshot_add_block(disp_state, top->hw.length,
>   			dpu_kms->mmio + top->hw.blk_off, "top");
>   


-- 
With best wishes
Dmitry
