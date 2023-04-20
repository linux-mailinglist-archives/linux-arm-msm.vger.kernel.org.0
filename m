Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29AC06E8693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 02:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjDTAcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 20:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbjDTAcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 20:32:06 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DF92711
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:32:04 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec86aeeb5cso213089e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681950722; x=1684542722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Nd7HhhsmQrigh61dvTiVokWTk2+5/4WKyz3jRZXbJ4=;
        b=a+40sUdKRlsWqlp51b0RhAxzrbuNll8UIcDmVP8tAIkAfLGz+KtdREVLHC01Jd4UUL
         l/kqTYkR2KkldC8plqDQsctlU1Xg2Lfvyl56q4I/SBWMyXJAq+ubGmzwHIC93BoNMNiF
         OBRtfwuVpCJbELT9UnzNwSpcrUv4lYol3z+3Z89d1pW66lmpO3K9ihBYxcgr8qU6rL7R
         Wc5UCnoCrOiWMUrXngDGaxcJ03FoKaUfHK7Cv6D0or17FhYaQWIBOKAKGeuSbKkBdDw0
         IxtnhP6CSYR7QehJB9NqRlZw3m60HVNlu5+YW0dGmynBRCzsORI+iOc3d4U+DZF2YHBM
         yDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681950722; x=1684542722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Nd7HhhsmQrigh61dvTiVokWTk2+5/4WKyz3jRZXbJ4=;
        b=GiCYI1H0rmZ+xe2liwQxsVbvyrPNPdwXuYhwfMsDhao3M17NixIq/BSDhLBJX/aWKz
         IFJoECBidJbQhuALGJf+JELbcPxCafingXKVPX4FZ0wY/teJAVxG0RVupuxU0aPjKb3d
         iwZ8weq4otCo5a5ru4fbdRBI4uanFowNPf7VNYFYaX2n2OTnA6KbbBMxkFrQ94oMwkaU
         jXf/BCAiLBIjlonCMIt57pZWy1ohWeGbD3lvhcvQViWf/eXyYSn5Nr94vvZrJ33CNGcX
         zdMVC8qmbzOVBnXj77B1Ct/ZyeprvX+sFff9lNtibFGpD1sj01azmAlRm+DUOsFJJDOu
         NnBw==
X-Gm-Message-State: AAQBX9cklwjnmHHPJfesMBwaneN/3IphGCVtDgSct7cbxeGlsxe1EWbI
        bR2d9D3Ba7ARwkIBv5DT+rYaPg==
X-Google-Smtp-Source: AKy350YbBBV05nPshdqlgV2P6Dq/C9Pi9ijk/pMzjguyytXcyvtxrmAbivOyAiwCtHn5hF2Oibff4g==
X-Received: by 2002:ac2:4423:0:b0:4ed:d250:1604 with SMTP id w3-20020ac24423000000b004edd2501604mr2651356lfl.57.1681950722649;
        Wed, 19 Apr 2023 17:32:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ee0c000000b004edd3f011cfsm55550lfb.43.2023.04.19.17.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:32:02 -0700 (PDT)
Message-ID: <d4e25a0f-3bb4-6803-ac7f-eb19083cb04a@linaro.org>
Date:   Thu, 20 Apr 2023 03:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/5] drm/msm/mdss: Rename path references to mdp_path
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
 <20230417-topic-dpu_regbus-v2-3-91a66d04898e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-3-91a66d04898e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 15:10, Konrad Dybcio wrote:
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as

Nit: msm_mdss.c is not DPU1.

> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

