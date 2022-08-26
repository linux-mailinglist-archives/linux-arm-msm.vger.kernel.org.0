Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D135A24DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245140AbiHZJtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344056AbiHZJs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:48:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0058D7CD2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:48:56 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z20so1080925ljq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TkqTmoi1tOqF4HMRlYNheKD9nEw5Pj8tNzIuXeNE4iM=;
        b=EQFZJSsNvYyxtp06L5o2aPeIvRVgy+df9Ssuq4i0UbRzsx0gG3J3svHwlcq1PGwAi2
         mZFQbY1Ux3++T7kPhEQ9624nB9K/Fz2T6KA3OMO5pP7XWZdRncCgVt2RmvrRYRSGwX6Z
         VPQ5apGl40gAESdjsSBq5aIrqn1xoaQQ/wFCL8WnNC+u6rPD4r+JcmUCB503CajIhGKV
         k9yJqemevwFdM2hTJSrfc7xBWX32HBoqDsPGDjapISVnECAAPkTuHWH7PGUsmsqnzvLb
         u1d9ZWxbFPa7IqOxWL8YRp3S1toreSApRZb74+oIqCogDS5md9iEtlUlDYhbR1CRvuFJ
         V9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TkqTmoi1tOqF4HMRlYNheKD9nEw5Pj8tNzIuXeNE4iM=;
        b=UNLhI9dCZd4OjERqfvLoc9wKycBkYe+Smq8u12vK2a7tkv/9/kbA9wL3bTDH33u/81
         5TFK/JeoChpadpSl2Z+T22TCriw++Xhbx94H+JgywaFQYd9FwnBaDqUA5F2a1ZleZ5kj
         rxLndJEq1qur9rLD+yNdR0C7Ozavh548w00yXRKSwK/nlyeZE6usD6MAQwp/A6mzO+6b
         IvhgJnQ6NgHM2XIzlfmvtonAF11zcMN4xZdBTv43pKmgAWG1l6V4Z5JYx5Knfnoq/QKo
         zvgxIKl0z1jVKRTC006DZNjNbFBG66UOeH5GnAx1lAFHsIqxdjCggurGlsU6Ryth+nzU
         /r/w==
X-Gm-Message-State: ACgBeo2lixdOnysh0TPMeAj7uETRNRBUgq9iU4WkOBPjS7oEMzS1Sz3J
        Q6Nk+uStval4ZhS5W5iQBxn37A==
X-Google-Smtp-Source: AA6agR6jczYcy+0sMAbwo/6hLXzTNzwXZSfY4M2/FtvC1XCFcvMDBDdf92yDw7Yko9914GrpUtyU+Q==
X-Received: by 2002:a2e:9b59:0:b0:261:d61d:5f51 with SMTP id o25-20020a2e9b59000000b00261d61d5f51mr1978993ljj.418.1661507335234;
        Fri, 26 Aug 2022 02:48:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 11-20020ac25f0b000000b00492c1e36b22sm317540lfq.262.2022.08.26.02.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:48:54 -0700 (PDT)
Message-ID: <051c5463-77b5-cb29-a4d3-6b9645b365ba@linaro.org>
Date:   Fri, 26 Aug 2022 12:48:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: dpu-msm8998: add missing
 DPU opp-table
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 6e986a8f1cf1 ("dt-bindings: display: msm: Add binding for msm8998 dpu")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

