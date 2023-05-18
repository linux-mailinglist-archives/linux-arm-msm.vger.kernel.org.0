Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A6B7076FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 02:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjERAhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 20:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjERAhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 20:37:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D31273D
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:37:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f24ddf514eso1807564e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684370262; x=1686962262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=po7UNoPfe5zteMAenfCEsCJy5ibuGbWHVGywTb2tWkE=;
        b=JsER1UtwtZcLVOBrVZY2jQdJ6RDCMYqgf7tSnsP4SAJd/1/z69VeZd4mYo3x1KmI+J
         gDVrZiB5k1bx/CgDmj/7SgBRddch0R0ON77aOgYINB/p//y2iKxhXS/GrDAJJmLLouWe
         xv0UTLP9iZXl5KHrNH+J58Pabcpi9nCwtmSZRVq28xyZGoGLNSvQhBb3M+lmoCj45r9i
         OajfAzakhTIvIXRBx9aWnSjrzVWCcB89yQYzZv3hS8umzmbMadetsV27PBC+9NHCOly9
         zLnrC/szTlctXjIVGycpiVZ5vTvBR7znRf1UeSOGaznsvu5ZRoDAEGSm1ocyXCSOlbS7
         QiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684370262; x=1686962262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=po7UNoPfe5zteMAenfCEsCJy5ibuGbWHVGywTb2tWkE=;
        b=DGCrw8AW28D1sbNS1Q1TW94YFTvUhY1ra49fwwbL2noooIeN2UMLxzMyLhL0ekQQ7L
         DES0zjOVtIJhRkU1A4H4fsyrzeHAhfrFJc9umsUaTiZKVkF+DnMRljEy49VJt6+oD/Pq
         wSg+E2nTk38c13lR/sbExgKtgrLrLROhGXXSFczsRgsxOVySiFZ4qeYjC04UmsNdfsEF
         RznFHjUNMEiHVrvdEnvvq0fX3OGP1PAQVn5lmDNMIqriq/2Uj/xxYhkOLkzYzQ6/89nE
         r2R3hacauoVUg8NO2bcEikqo57aRbb0STToZwD5AeJPNHSG086uayFKLnZxuw7QFCw+V
         B3aA==
X-Gm-Message-State: AC+VfDzOdEZhZAfZPdKsHD/3XsiW4gnXNeuxjr2+H6C3tc+JDmYz/uj4
        Ea/JtgKiBz/9jDlb0tY+boaVmA==
X-Google-Smtp-Source: ACHHUZ7uCv+ZI0mUztrk0hmK8n583XK43anSsX1bmIA6B2ZFDMBr3a/me0F+fkS4vq01B5IcoaTnUg==
X-Received: by 2002:ac2:550f:0:b0:4f3:8244:95e2 with SMTP id j15-20020ac2550f000000b004f3824495e2mr713166lfk.50.1684370262289;
        Wed, 17 May 2023 17:37:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r12-20020a2e994c000000b002ad8bccceb2sm6427ljj.57.2023.05.17.17.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 17:37:41 -0700 (PDT)
Message-ID: <769abc86-43c9-1f92-e484-108b8b561486@linaro.org>
Date:   Thu, 18 May 2023 03:37:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 01:27, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

