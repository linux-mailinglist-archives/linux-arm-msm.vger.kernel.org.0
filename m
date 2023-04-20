Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC7F6E876C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 03:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjDTBZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 21:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjDTBZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 21:25:28 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83465B85
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 18:25:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec8da7aaf8so235687e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 18:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681953925; x=1684545925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0XK+8y4MT/KOSDossDvg1Vpqf+2iIPQlXjAG3Jypjs=;
        b=mSJpbVeHR/84SpjDjisOGfIxxcI9J6oNYELewt0FuEOLMhiAswG5eC/OaH3JJeiI1/
         4b679PyxTw8kcjYAMMdXsX6qya5qfL+hrYW5FaadKqOS/2W+cU7ngFrSXgZ4BNK7TkvL
         JUIVT/4zKH8sDjxZz3UC3FWLjHGbvTnLuJG2EF9nhb9WKLj/Ez+SS3c5jeFNnsnx+lr2
         +9q0Nu3eq5KOCN4QB4U7ZkryH0MK4iureG0PFD4hyZySqvPYrf6a28Xn+oPm8g7xGEZj
         dOKDGykeyejvrAM5u1V7p4WnHQlLII2KLNS1lwYL4YLj8itblVuhvBUGZj7TJkxfMn7o
         d1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681953925; x=1684545925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0XK+8y4MT/KOSDossDvg1Vpqf+2iIPQlXjAG3Jypjs=;
        b=Q4oWZRv9C6+D3WEE9ANfDeC4rKsHj+SbInZM6at17K23znyPp/fwPENg5wQrCyCxCE
         9nk47/U1KzTaUXXTcwUPCoQk4Z5btl6cBCKki7F086tuUGcI5fCnAIPqaiLDJPnIjrrS
         1ojJ4xT46k5AJWgUvL7oLoa79mc+HhVIkW4roGWqNqq0BAmkANOPVF55d8ELdIHGmCWz
         rrZ6gabAJM8qTndu+1KPsZCjVwNX54a8aUSn0Jk5WOCHtbLau6tOql863voUxteCg1o5
         foTzrGvmOhqyrrdjGxh6tTsDCIr0sf5+RFlOmORGRDIPchojf1RccZu022OLoY2DbrV1
         OAzA==
X-Gm-Message-State: AAQBX9eGKIyzUeofxR9MuOFvjBYHvVvN4Cu18VMYh2GkZt2rb0kFPISy
        oDtXfxNAVIlLCXxkCVSQj4NHMg==
X-Google-Smtp-Source: AKy350bmVhmmcvW69w5Z3K3vr624D7y0rkGwhbhc2WHBtOZSqtvMB4D1dCl6R5wcO4AvupQHYqAjBg==
X-Received: by 2002:a19:7606:0:b0:4d5:831a:1af8 with SMTP id c6-20020a197606000000b004d5831a1af8mr4553658lff.40.1681953925014;
        Wed, 19 Apr 2023 18:25:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h25-20020ac25979000000b004e9c8290512sm60805lfp.82.2023.04.19.18.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 18:25:24 -0700 (PDT)
Message-ID: <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
Date:   Thu, 20 Apr 2023 04:25:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] DPU1 GC1.8 wiring-up
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2023 04:14, Konrad Dybcio wrote:
> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
> dspp sub-block in addition to PCCv4. The other block differ a bit
> more, but none of them are supported upstream.
> 
> This series adds configures the GCv1.8 on all the relevant SoCs.

Does this mean that we will see gamma_lut support soon?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (2):
>        drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
>        drm/msm/dpu1: Enable GCv1.8 on many SoCs
> 
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  4 +++-
>   9 files changed, 55 insertions(+), 53 deletions(-)
> ---
> base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
> change-id: 20230420-topic-dpu_gc-6901f75768db
> 
> Best regards,

-- 
With best wishes
Dmitry

