Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F9870C11E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 16:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbjEVO3y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 10:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbjEVO3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 10:29:43 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C562DB
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:29:40 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3093a778089so4003575f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684765779; x=1687357779;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Iad/inN830RPSlsPxQfnkdWFAqtBzchjxSkSm862bmI=;
        b=ypjva5DFLqvmtX35LQvIjG1dUuFIWS29AKYZG2LRkXJnaZJegKgLIUY90VXfYCerwz
         phNDmlvMhc+G8bWGbwhDSQ/+UpPnoVjCurzhhh+cKIzgPZhoDjPcq1jw+ao6gOe75M5r
         Vk/5Eni21h+VI48Jo+mjEmae7SOMRD+LMfZejn2DtUPrcjjx5kCVAFET2tUiQPMCXXYJ
         0MWdl1wHvVax83RC1QqOVHl9Yl4ev/la1P5NWZg7aWcP4io5l+FZGWbGEYF8MwpVTtnw
         35FjlRi00q3JydodonXWpDwaspX2kFkIcd6EAf7bhHB0g8eRd+dt838NE+zx9WpxYVvI
         0PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684765779; x=1687357779;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iad/inN830RPSlsPxQfnkdWFAqtBzchjxSkSm862bmI=;
        b=hLv/RIv8R2du7dHnCv/NShE/hJgtlZEeEUu8I1UZvm2cFvZJZD4AWMIV23O4Rmt9n8
         b1/lvMhPPlRhcorzsG+kHFL3taIvz/i57VN9WRos5S+0PybmsMxIHzCtgCXMNe3yq54m
         pXzkwe+Ot836p/64DDl64oHl0+f0BoM0wGnSUGeUZ2o/unQ4B/tYWwZ1tWnKkbHH0mZ1
         tNW1K696EQlxOAQZU+NXcJtpRUQi98Umz9zQMqV+pIL2VrX7zY5lSBwFyCPiiake+o9H
         yuDAG5pTBe5xVVTydNbZG7y+lD7C/5igyC3E7aLmesdOENpc9S8RedHG/DVpFwJvLFqt
         uK3w==
X-Gm-Message-State: AC+VfDwe1hmLEwxAbmcnQV4AIAX/dJldAuFgS3LZ3XjYBJfk3LfEvtIZ
        RC+W7WoDmFTQRMnXYS109YfJqWhbXXtVq2FboTby1g==
X-Google-Smtp-Source: ACHHUZ7xRACcNOqYQj6vKBv911CqQyG+oqpV+epWPMiB7cFujbTJtJm8wErq4PfgG4JYjGkoolmsRQ==
X-Received: by 2002:a5d:5391:0:b0:306:2b5f:8d0a with SMTP id d17-20020a5d5391000000b003062b5f8d0amr7870727wrv.56.1684765778931;
        Mon, 22 May 2023 07:29:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df? ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b00307c0afc030sm8006851wrs.4.2023.05.22.07.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 07:29:38 -0700 (PDT)
Message-ID: <182177d8-08af-234e-f553-b9472f0b4ca9@linaro.org>
Date:   Mon, 22 May 2023 16:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
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

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
> INTF_SC7280_MASK) results in this bit (and corrsponding operations)
> being enabled for all interfaces, even the ones which do not have TE
> block. Move this bit setting to INTF_DSI_TE(), so that it is only
> enabled for those INTF blocks which have TE support.
> 
> Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1dee5ba2b312..162141cb5c83 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -101,7 +101,6 @@
>   
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_TE) | \
>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>   	 BIT(DPU_DATA_HCTL_EN))
>   
> @@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = _len, \
> -	.features = _features, \
> +	.features = _features | BIT(DPU_INTF_TE), \
>   	.type = _type, \
>   	.controller_id = _ctrl_id, \
>   	.prog_fetch_lines_worst_case = _progfetch, \

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
