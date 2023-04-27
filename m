Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065C16F0B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 19:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244483AbjD0Rnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 13:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244481AbjD0RnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 13:43:20 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A98F1707
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 10:42:54 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a342f7c4cso1636846266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682617373; x=1685209373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1SAc0HcV8hEhAyAPR7y6pjkMxfBvrPrHvmJ+SfKKKc=;
        b=yAG0oIoiiWeumBvBDJF3ZsFnf5PXkOXoWw6EID+Y9XG2yTvAP6xsv/sk/ewXuqM0oW
         kD66hLM4pYZMHDuCQu+Q5guEZf51fsHDyuLmd31M8c1eKL3aCScUS9JDqtCRIMfaDsS7
         2CtcYjL6PQjAcDPdU0WRsCrK5uHcLbBA9kJ+jaTHKGPBcYmJyNAog8+o3L5TLekxUOlp
         gGweK9Db5qU1UYMMNoySSkIYeJHUvtLL1wbp+VABgDfRUm4GyyG8/Fjf30gzrmiA9d7b
         8uOM1wMSMFss8xyQss08PlH1AImkWl1clD0/A81X9T9N3gUzcmZom5JZu3ph7LIcTZbY
         fEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682617373; x=1685209373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1SAc0HcV8hEhAyAPR7y6pjkMxfBvrPrHvmJ+SfKKKc=;
        b=iXV0WdIoQfcA8oMJvmAjr28erf/ID+lp0UlFmTyLAD4gfspcMn2vyTXc7q9+sQ9zl7
         hILkez35Apiq4vQDjA5/oAbDvviy+3U/8vCbVfcXLiVknoVMndujVGAXl+jM3Nn+T9gQ
         oOyczBMMLbO8tc/sV7KgNujhhJTVwDT3Qz1CcBKlzpJAEGHaneZx8BFAVhBbMZYXGIEj
         vW09/Q4czYQT/JXn51Yk3tjD97JX9sz+E06AOAcvtFDhbMLM6Z5LojGISQCsevu1usQJ
         N47W6vl8sgeETtHEH4vUIZoRUVOOHk3VrePw2Z43k1mw8jRGQkl726XEbiRh3+psyT0J
         IDSg==
X-Gm-Message-State: AC+VfDxGClBeY8LbqvS2zapqwV8fEjXD2Rg2DZLwn8beHdMPpt4+ZfTu
        nxcAZ7a1ihzSG6wFyCS8rOwCMw==
X-Google-Smtp-Source: ACHHUZ4+E/IFCnlWTF5xlWJOov/l6OzVHmSPhNh/zH0h6Ak5Scx+1Je+GsxGhmB2P5fMQ8VujrmzGg==
X-Received: by 2002:a17:907:7fa7:b0:94f:3bf7:dacf with SMTP id qk39-20020a1709077fa700b0094f3bf7dacfmr3268721ejc.71.1682617372720;
        Thu, 27 Apr 2023 10:42:52 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id o19-20020a1709062e9300b0094f281bd279sm9930523eji.198.2023.04.27.10.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 10:42:51 -0700 (PDT)
Message-ID: <e0af881f-7350-05b8-4ec0-b56b4f70254f@linaro.org>
Date:   Thu, 27 Apr 2023 20:42:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/22] drm/msm/dpu: Set PINGPONG block length to zero
 for DPU >= 7.0.0
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
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
 <20230411-dpu-intf-te-v4-7-27ce1a5ab5c6@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v4-7-27ce1a5ab5c6@somainline.org>
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

On 27/04/2023 01:37, Marijn Suijten wrote:
> Despite downstream DTS stating otherwise, the PINGPONG block has no
> registers starting with DPU revision 7.0.0.  TEAR registers are gone
> since DPU 5.0.0 after being moved to the INTF block, and DSC registers
> are gone since 7.0.0, leaving only the dither sub-block.
> 
> A future patch, part of the DSC 1.2 series, should disable DSC functions
> on the PINGPONG block for all DPU >= 7.0.0 hardware.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>   4 files changed, 24 insertions(+), 24 deletions(-)

https://patchwork.freedesktop.org/patch/534306/?series=116327&rev=2

-- 
With best wishes
Dmitry

