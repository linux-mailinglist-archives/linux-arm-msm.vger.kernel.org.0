Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDEB6668FA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 08:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbjAMHyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 02:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234842AbjAMHyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 02:54:51 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14D16878E
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 23:54:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so31946073lfv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N67jHu9VPuTFdj17UUm5v+m/LOkC9ATqB6ZFcng9mBM=;
        b=Bki18zw1En9C22F6tltWIdlUyTDANgWT8zXiUg1559uid/2tdN/7WqSaAGQfEIUfTY
         bpCF1BaNvZNMMH2tfv/nANrTrQc0klkN2ntLhDyBG6FQyeXBm2Iifvz6AEOBc6cW1sFf
         O9ddT7Z/NRiLNoUQfTN82aWWu5qAhhebJPhuvYW38I05YBON2Xd1d6C33y/shn8sdZRM
         Y/anSY0r6XtnKMUguUar+VYEpbc866d0QwLc2DgaRNZ7fYpEEUdmxlLY88VypAEu1XHF
         M2bXERmFufs57MYM7BKSKhEW5/ncEzqy1aJsGmBEbxEm1XhilojsS1YxHgRp+9HlFGxv
         NJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N67jHu9VPuTFdj17UUm5v+m/LOkC9ATqB6ZFcng9mBM=;
        b=LFO6pWB0sgNreBdwGfxlIHT76MuC1lml0amdi+YoZoB6bqCV7kkXYNbfXMfRsxBgkf
         2d5yHBIc/Y4I4fGeBqPvpSmEOPTspoUA+SUqSgFJ5cEkUltvP2C+eUUQQKyJbPXu9Dpv
         zFsuNWmX6WUCVexfeO0gAnd/lwYY1Kf+OGL3Nn5OX7G5mCC+uubOnLcG1EEhtKqjqNgZ
         pYaUc2Ly4vIhzxmi2yZBCRU0njg1iVvt6uZ1ctdIpicSplh4EdNX79UFV2ybm+C86Ng8
         +Iw8/yUlmY/qRLuQ9V8sXStht6rm5WQIhppPab/bJQFlWOwwuUvAF4DhgdkecXye20Xu
         eaXw==
X-Gm-Message-State: AFqh2kp59J8rhgbRaBnFL24x21Ru+qnG7bLFyEPJ2SueTSZTp/MBSLtQ
        BvV9GK+K4foxNzCX+tv8xPqiVA==
X-Google-Smtp-Source: AMrXdXv6pH4riHGD4hlzNNEYTm3aN2sryaYRoXVh/PWP9xQnGwYrK8GnJHedEA8Rrv00tgoxfGLv7g==
X-Received: by 2002:a05:6512:234a:b0:4cc:a19a:7a1b with SMTP id p10-20020a056512234a00b004cca19a7a1bmr2033934lfu.65.1673596488202;
        Thu, 12 Jan 2023 23:54:48 -0800 (PST)
Received: from [192.168.2.31] ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id v9-20020a05651203a900b004d01e47b7d9sm285163lfp.223.2023.01.12.23.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:54:47 -0800 (PST)
Message-ID: <edae9929-bec3-789c-8807-2209847e8156@linaro.org>
Date:   Fri, 13 Jan 2023 09:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/4] dt-bindings: display/msm: add SoC-specific compats
 to qcom,mdp5.yaml
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
 <20230112215202.GA281635-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112215202.GA281635-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2023 23:52, Rob Herring wrote:
> On Mon, Jan 09, 2023 at 07:01:50AM +0200, Dmitry Baryshkov wrote:
>> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
>> distinguishing between various platforms. For msm8998 list
>> qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
>> by either of the drivers.
> 
> 8998 is where?

Ugh, I dropped it from the patch (because of the existing 
qcom,msm8998-mdss and qcom,msm8998-dpu). I'll fix the message for the 
next iteration.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
>>   .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
>>   2 files changed, 21 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry

