Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4BAE5690A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 19:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbiGFRZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 13:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiGFRZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 13:25:58 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD3038B7
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 10:25:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id j23so2583850lji.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JsyVsYNpDQ8zJGakyxKtjvi7pOZE5FqBAEsh3JtW6QA=;
        b=NRWx5mkTEWIKWytjf1z0cO7hyGFLCIKUeLoUKFmMtM6xjTigvO/PaPNteYAS65MSzG
         vdVJ+EuplQFAcakz/rUqERWWiiCK3jG8ETdoZu6Y9ET+yr7KGaiVip3da5sEdsPBNQjp
         FnQmumbdAoqypEjN/2j/xM2SNmDe0pLuXGpJkB/pJNapsI7oHFxe2IXcTbr1Z7VZu1h9
         KxkW1Kdcf5egxUYoSwIDsEyQSGh4btPW+3Ptug8wmwHzISHm1SSYevWHXpW4FmoUCo5t
         /tw+PaLrywznmn45dZzUG19x0JZBM/l9X7WPTaIN+RAL4QTOyRNkdOrR1kFH6FiGyoXE
         6O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JsyVsYNpDQ8zJGakyxKtjvi7pOZE5FqBAEsh3JtW6QA=;
        b=e2n0owzN/HZPz+2Iv2KueIgF3lPdxrRz8CdtwtQN9HBNlFT1EGgF975lr8itaCL+RV
         ZMpFoAdtBK5Lj1t14wYBuJ24F0oNQvUXBkcjy9lrJb2R3zI+qwV/rjPlki+MmDc2Zec2
         ppNUNArXO5+Nzan5RtncSXTU+W74wUyi+pkgT+yK4t0f9XYwTBGgJP3Gkc37MvqacD2S
         Y5Zg3eMy+s5peXE74G6+ZSbIp2hcqiqHHPkgNApFaL6gR1A8mSwmhmBR7llQeGGfEul8
         sdYNwJvBr+4bEPbSI2fCoJhb7Lr1bXoeHBZmmkg2scW0Ky2WnCRhufzVJBECqbjZZyZk
         TpwQ==
X-Gm-Message-State: AJIora9JIlqq15StQx5dHZGox1RNwETDdRNz27I3K82XQwOW9WXUTMUg
        pTlG+0iy5B7UdReQ2nd089I0Kw==
X-Google-Smtp-Source: AGRyM1vF2LMbfQeR6t993SuZPpvogaQi52LTs4BKWbGufEcHutNXTzHNLjelj7R9O6jbPxTcOE+3hg==
X-Received: by 2002:a2e:a41b:0:b0:25b:b56f:1476 with SMTP id p27-20020a2ea41b000000b0025bb56f1476mr22445280ljn.381.1657128356338;
        Wed, 06 Jul 2022 10:25:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w6-20020a05651204c600b00478df9f4d64sm6364715lfq.227.2022.07.06.10.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 10:25:55 -0700 (PDT)
Message-ID: <86ee9636-8827-7bad-6bd9-22191b2d293c@linaro.org>
Date:   Wed, 6 Jul 2022 20:25:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] drm/msm/dp: make eDP panel as the first connected
 connector
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
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

On 06/07/2022 20:24, Kuogee Hsieh wrote:
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
> 
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
> 
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
> 		dpu_kms_drm_obj_init()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931..50ff666 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	if (ret)
>   		return ret;
>   
> +	drm_helper_move_panel_connectors_to_head(dev);

This should be in msm_drv.c unless you have a strong reason to have it here.

> +
>   	num_encoders = 0;
>   	drm_for_each_encoder(encoder, dev)
>   		num_encoders++;


-- 
With best wishes
Dmitry
