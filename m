Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE1E5E5BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 09:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiIVHAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 03:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiIVHAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 03:00:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82AD3ECD3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:00:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id o2so13088215lfc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=F+tYa9zG1lEz617SbvngqftXLaVi28EmvGiziMctOWA=;
        b=GUr6AfDiziyXpZFDo1lckv4EK92Agh702QscLWhBfml0UQOwiXImKv66Kop/VDjvhm
         9TB8TccZCVqJM1aZdPGqEHy1mgB6Vmjg1FCCG2jsaKJ1tMpwnTqCaONo6iyq/TIGPHI0
         mo+gwqFa1nnoW+y30foJtznHKO3wIzYLNJolQCj/gUgfn0qTqYNPCw8UTH0bjFV+j+wK
         0j3SASt1XOVTcJ0lYZRH80faZuZuUwtWOkVFgBs/AWDyxG+G/V+rDQAxftgvR9I4jJtd
         yiFvUhS2gwMc1VuxUCyHehbYC2sHkxeB1JqxE/toCF0X+mj+wox68ZD2/EBIzC7MCHWG
         KA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=F+tYa9zG1lEz617SbvngqftXLaVi28EmvGiziMctOWA=;
        b=ienJ/5eCPDoLoXxRIq4lyyI3vUovZUOi6kG6yxvMAt7VvHX9nfLF76AuOtZ0f7k9XY
         RLOoWfapOdOn1dvxroy4/PGvIG1WJ8QuC7uVJGLri1TWVmENy9MSRVg0yrc5X3+PbgpH
         bHoKj10FHUiMlVM09AUFOvmclKBy3MWABbj1b/4shi+JiNEj5HW/jpHOKsgY0fiJbDp4
         sDUXxjwEV6edOwR5zjd4msGGCpyjgyj4gVgJTLhCR5UUSZFCrb0kft5iGEvXtc0GOn7M
         5Z/cWPNK53kYcg0ly3+0x3XNdZsH1P9DiI4Nag+vsvuKxAVWBmwYSrs93De93fz7ofXV
         K9cg==
X-Gm-Message-State: ACrzQf2s2BPoy+vAUMoKGfJynW+2yIH1v0av65nEAPx0OF9zYo87DpJM
        egIvoFXpjX3gaFZTOiyCwKrGCg==
X-Google-Smtp-Source: AMsMyM4NFnwhRolh2/Vt3iMiCzs/YdAOUEnk9u91PyaZBajjR2brSQsIVTqDWLw01sixGhZY81z05A==
X-Received: by 2002:a05:6512:3d87:b0:499:f2b6:7021 with SMTP id k7-20020a0565123d8700b00499f2b67021mr635925lfv.103.1663830015901;
        Thu, 22 Sep 2022 00:00:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e2-20020a05651236c200b00494791fbd80sm776792lfs.307.2022.09.22.00.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:00:15 -0700 (PDT)
Message-ID: <8fea89eb-ed50-2b2c-ec00-5b9fb20b7956@linaro.org>
Date:   Thu, 22 Sep 2022 09:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

