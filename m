Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75475568E42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbiGFPu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbiGFPuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:50:40 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683402AC51
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:46:46 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s14so19000559ljs.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xn1I8bjV+RlJzEspA44PeNwzgMS+NkPzrECsX/hzxxg=;
        b=FwUVWm8Oh1uiIdO5anRZpl+MjgDD/uMdrPsmsw/RMPc1F3mMG5lEqUhD155Ul6uxGf
         z+PakeZK1lUXOQ0uO43QlnHJuPWDf8Ao6cR+NJCGHXLie+SHIowoT3yo4EVqORUj8Ohi
         x26TloYV1bgQtTp7sYjtgIIKg9utwyXWzK8XiEt43P6f/9JTokXFneYwYRZlJR4c+qRQ
         wP+mWBp8Jd9se/fnb7X6POgATSWs01zqrxxNdmoS28kNcu1oSlWLq6dII3Y7N4e8++j6
         nEK4RXDYQVWH8OGtvPasr+H5+KtZMJx5Uqj6gHhh0Bsn0W+WGoERrKH1I3dLj+uV37j6
         KgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xn1I8bjV+RlJzEspA44PeNwzgMS+NkPzrECsX/hzxxg=;
        b=FdZ8wEb6y4zRKGRd8gd5K7n+r972YBglnvd2xjtzt62ZENIwmPrt3kUn1MpI7ET5Vf
         3F3SbgwtkkCKhOoucBjb05uDFNucrxqLv6DG3GnZQeKIxOMyg43+YuYe7IRj8hw6SknS
         uP/1M+M53vCBkmMOfAPSSid3Z1wgczqr0Sdm9Btaq9lLsPSvQ2b61aUzHkKBdPp4qgNb
         flvDUM7k+lp5VKJoxuRSegGIr8sv735mko9WofHjNj2cSyZlGXfMdLwJMUYoSBpEhetM
         cfDqDwT0MAsllg2xGJ9szA/waCibNnEj0hnRCRBHAI1ZWIAg4p3kMZa3LOWck18eKpVp
         CuQg==
X-Gm-Message-State: AJIora+rP39OjJ4K+QynmMZXde0qMh3CocrOswFg+kcOpX3joojIadjg
        VUPb2VZv6/v/fR0OncDEOO6Q6Q==
X-Google-Smtp-Source: AGRyM1vs88TB8B6mXGQSMvuM1u4Ah9asL6Qs2+9vR6BHwC6N/8LHVDKikeIbBY/FLgfAqb5NQxc0jw==
X-Received: by 2002:a2e:9808:0:b0:25a:a30c:e5cb with SMTP id a8-20020a2e9808000000b0025aa30ce5cbmr24296595ljj.312.1657122404816;
        Wed, 06 Jul 2022 08:46:44 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a22-20020a05651c211600b0025a65b784b6sm6233022ljq.33.2022.07.06.08.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:46:44 -0700 (PDT)
Message-ID: <793e34c4-cdfb-8629-3af6-6829aecf4fce@linaro.org>
Date:   Wed, 6 Jul 2022 17:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dt-bindings: display/msm/gpu: allow specifying
 several IOMMU nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 16:52, Dmitry Baryshkov wrote:
> Different platforms require different amounts of IOMMUs. The APQ8064
> uses 64 IOMMU instances for GPU, adjust the schema accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
