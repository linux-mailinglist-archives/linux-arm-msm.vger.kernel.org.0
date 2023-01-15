Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C126E66B161
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 15:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjAOOHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 09:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbjAOOHC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 09:07:02 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2974CDCE
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 06:07:01 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id br9so4123298lfb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 06:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vbj3GLgt2Eau/H2g6sLMJ/RsUpAnT1WTIdvedMs2Q3k=;
        b=c50CO4vlGc+jJwwRFGpqZX2QF2RwD/6f5cLmM7EBRgg1jL2ffIOrNUCX+DOpwd78oa
         sv0ChXhegh+zJF1rc98yPY3MzNfzuWixMtamwhv9/JA4G18o9g0gPuKc+QWFws9czhBv
         NQzeBYcQtYZAGYrWrjUC7ZYLOhlJAOmfYLrq/6csDSSTHwLMsLSu1mjEfSMShaP1k4/5
         /eT6cWYYovOiqJsWxNzt298K3ZjYHu9X6m5YMrs229ILA3AlOmQ3HnSGxLp4zrbLr/aO
         ll7FEHMJO7XlMsyDvkuO33Cg//768j6KXx/Ys9Tt0db7CeKFJhTGfZXwWPLsrhMwhn2/
         a79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbj3GLgt2Eau/H2g6sLMJ/RsUpAnT1WTIdvedMs2Q3k=;
        b=ZZjulb4tROvsnii77k7SaEl20FpRS58L9FVII6NwyXPhjSwnTSvixEsWpeMUPfKVBi
         2yB5rv7+d8syYs8AfJ6r9YR9MxSY+VvDNnUpYJwmiNtmLI0RDiuISPuNaM4QPQmMqtYp
         b7xgj4UEctvWRnomdFh5UZFts9hJJLeVecg9bE9iBwuycfU4OYcGE63QzV0k1k4bclMn
         AED4tD+ZuoHwsg99LMph+C89EwXNjsZid6OsC4yvDJx70MSptF9Hi1AGkVxhFXh6ZYuZ
         V6V8HNMLY/ElqlzflT9cEYK8H2oFso8YFPXkokE65XzaH2+0PX5gs/fXNg90LlsNHEBo
         h1YQ==
X-Gm-Message-State: AFqh2krVkEkCq/z5Km91IGwhPjOMrH4umQM5G4+NAvVO0/uH5g5GvQrD
        asKMEN2La5oaV6YuSlXkvv3ODA==
X-Google-Smtp-Source: AMrXdXs2NS+83UDo1o1DPe0ALx+qxTh0ckGNxS9ouhCBcRnwVCNRtvnz0JPN4rwKbDzZUf0VZCq/bg==
X-Received: by 2002:a05:6512:3901:b0:4a4:68b7:e71c with SMTP id a1-20020a056512390100b004a468b7e71cmr23433544lfu.6.1673791619620;
        Sun, 15 Jan 2023 06:06:59 -0800 (PST)
Received: from [192.168.2.31] ([188.170.85.102])
        by smtp.gmail.com with ESMTPSA id k42-20020a0565123daa00b004b55da01d3csm4651042lfv.191.2023.01.15.06.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:06:59 -0800 (PST)
Message-ID: <d2a61ab4-49c2-1e8c-7913-98d8fb5b008b@linaro.org>
Date:   Sun, 15 Jan 2023 16:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
 <cb3e7dfd-1844-65f9-aafd-32187047b535@quicinc.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cb3e7dfd-1844-65f9-aafd-32187047b535@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 23:43, Abhinav Kumar wrote:
> 
> 
> On 12/7/2022 6:28 AM, Dmitry Baryshkov wrote:
>> Several small corrections for the UBWC setup and related data.
>>
> 
> I am assuming this series will be dropped in favor of the RFC:
> 
> https://patchwork.freedesktop.org/series/111751/
> 
> Right?

No, they cover different topics. One covers the way the DPU handles UBWC 
setup, another one reworks MDSS.

> 
>> Dmitry Baryshkov (3):
>>    drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>>    drm/msm/dpu: correct the UBWC version on sm6115
>>    drm/msm/dpu: add missing ubwc_swizzle setting to catalog
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>

-- 
With best wishes
Dmitry

