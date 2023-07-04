Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E61A746742
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjGDCVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjGDCVB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182F9E64
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:00 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so7975052e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437258; x=1691029258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=klfY2aXQ5SRY+EH2nLYn4hgJ2S3BVEltE6iPePp7x/c=;
        b=ZZlNlmrR0EEq9soDck7ackbDwRYcWeCxZkiAGMObGJvH5FqBLMUGVvg0wC/EqPEZ2U
         DCBeSWC/EwD76vmUX8sfpbS0tzTIaDLKKOU8DUq9h5uLkM3P0x7mD3AraOlh+00DlZr5
         5JMQoHh3L/seH17W6A7m3dhPt1ZZpwgAVVySS4PdQdWU0y6A91CLC3bQ28lAV23p/rJM
         I3nbeV6nR6MssBSXtGfKTPsOI4yxVvLCi4HmwoKuJsUk5/HOtCkOqC30WhvurrzWmcxI
         IM+gnlw2GYAwgcMGyIzc9p3eBESQWvqngdVOq9ey1nI+/FI8mxF13wLJfl+enGvI6ZZB
         KIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437258; x=1691029258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=klfY2aXQ5SRY+EH2nLYn4hgJ2S3BVEltE6iPePp7x/c=;
        b=V+WPx+Dmn8C8Nk7RzwjSbqOZmF84XCmDwhtN8ZyfMizdmrvTLvb9Iu2H7IZ/8uNghu
         O4y9uG5tGks7FRTL885lEWExjhSylgU4NJ/EK1NYOJ2UTOXNeLCjpTnwZbtrjDWcpu9R
         k04OHuIkIIdfZFpPx9w64uIm+UcVzX67dbOiMOQ5ANI/FqaJ6oUQjUBncErnneUwigKe
         dhvJ0JFPvGMQen+DMzwRbx/F2ULjphu7rhB7qfV50VMC6xN/49/yQCLQ+o/zDHCz/CGe
         A8p2zPDYkegil9ngK0uGnA86p3iDKDcD2tklnCfzLldeY9ffc6on39gfbonu2oBjn+xN
         S4yA==
X-Gm-Message-State: ABy/qLZa1UpS0oUDs21j+bbSRJTpAhX652aHVA0CIn1dE5TCensDLxMy
        ULVksY/wESBp+pJMIKKb4y8+Ag==
X-Google-Smtp-Source: APBJJlEDpPTvKqBbsPzgEML0BeiZC/ghTXwHW9Ggt80VugXgDFl1ziS3kpYeV3AyXm1l1SKTC8mjOg==
X-Received: by 2002:ac2:5b44:0:b0:4f8:57b8:8efe with SMTP id i4-20020ac25b44000000b004f857b88efemr7887217lfp.55.1688437258117;
        Mon, 03 Jul 2023 19:20:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j2-20020ac253a2000000b004fb2c1e33b3sm4445283lfh.243.2023.07.03.19.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 19:20:57 -0700 (PDT)
Message-ID: <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org>
Date:   Tue, 4 Jul 2023 05:20:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
 <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/07/2023 05:01, Abhinav Kumar wrote:
> 
> 
> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
>> There is always a single MDP TOP block. Drop the mdp_count field and
>> stop declaring dpu_mdp_cfg instances as arrays.
>>
>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> The change drops mdp_count and stops using the array which is fine and I 
> will support that.
> 
> But looking at the pattern I saw while using core_revision, both 
> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from the 
> catalog in favor of using core_revision.
> 
> Hence for that, I request you not to stop passing dpu_mdss_cfg to 
> dpu_hw_mdptop_init as that has the necessary information of core_revision.

Sure, I'll restore it. Please note, however, that it might be better to 
pass struct dpu_caps instead of the full struct dpu_mdss_cfg.

> 
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 +++----------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
>>   19 files changed, 41 insertions(+), 115 deletions(-)

-- 
With best wishes
Dmitry

