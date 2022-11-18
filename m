Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E8B62F530
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241473AbiKRMln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241159AbiKRMl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:41:29 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9122A8CFD1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:41:28 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u11so6615419ljk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0FTR6z372a+SVrLNdiUVE4A/1f4Z98NLhqS2FM1hNo=;
        b=QnzB1ZH6VzQ0SLGmOAUmv3pmPocgdO13g3DtWTWwEn8nRE3cPWSWXQOxY8k83pafaf
         N31xZiPAIoZkn9fGTakPcTAn53BQjMyQ6HpL+7GvJkxiKI2g/aH4CCHwlQv/6VoK86EF
         FJ5IGH1EFa4kOtzYAAY+P5lAFl0PUoPXDPBRpU2qcdXXE8m0JWJQddbzBvdAfM9A8yYn
         OjADxR7h4ROKMVswYG3IiTU2vLOHB85tKDb51F10/h+8vxGYhi+lkUXIQFWcwOC6zv2M
         uribWNj+76MEqHaPJAcoz7KbimeKaxv8n/fdoPG64qvt22qd1kEhNBP8cl74+kY4/aaQ
         syXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0FTR6z372a+SVrLNdiUVE4A/1f4Z98NLhqS2FM1hNo=;
        b=UcsPRvkSYe0KlkEDfy6oV78MIuGW4//WhEDMvIo/EA/kd9fzrP7nio6wCiANUgxg10
         cRdCuxIfavaT1yR/HdMCPkQh6do85GPKfhhd95TduuDPB3BIoFY4Vk4rmfomjufBMZnS
         jWF+RRRBLJ+ymukcM4Rmm7w/SrPbHJzKP+fdpC5I5e5LYzpr964PdOsdzXC4fX5t19We
         I7y87TCLReCQ8Z6M8pqrcsjsQLLCtt2Xaon+l7Fm4ZNnFk9JlkLtXfXHj7R77rtzYFqX
         XMuLlxTcFpUB/1IvA5vMKIpnJOLVU4CTB8yCZDWpRbzHM9x9E+HmS13E5Fp7DUYBVZkx
         6WBg==
X-Gm-Message-State: ANoB5plL6XFhqQNhPD2V0qtJnzKIVaIuXI2HvVe+7Rw24nzxJci9cRJn
        /h2zSJ7Z8nQ+nMHBiOBZzA8lRg==
X-Google-Smtp-Source: AA0mqf7lErewth5EE2F868DAY6P5GOZSlqtM+eYuoc5OY1KVNj+hLDTJG51LiKE+OKuZfsP2eJgs5g==
X-Received: by 2002:a2e:8e6e:0:b0:277:92e:e088 with SMTP id t14-20020a2e8e6e000000b00277092ee088mr2309263ljk.140.1668775286907;
        Fri, 18 Nov 2022 04:41:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y21-20020ac24215000000b004947984b385sm644590lfh.87.2022.11.18.04.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 04:41:26 -0800 (PST)
Message-ID: <e3c8121a-5234-1051-40c7-3989189badfa@linaro.org>
Date:   Fri, 18 Nov 2022 13:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework Qualcomm SMMU
 bindings and implementation
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/11/2022 18:06, Dmitry Baryshkov wrote:
> The main goal of this patchset is to define a generic qcom,smmu-500
> binding to be used by newer Qualcomm platforms instead of defining each
> and every SoC line with no actual differences between the compats.
> 
> While preparing this change it was required to cleanup the existing
> bindings and to rework the way the arm-smmu-qcom implementation handles
> binding to IOMMU devices.
> 
> Changes since RFC v2:
>  - Dropped the dts patch, picked up by Bjorn
>  - Fixed minor nits in commit messages and in-file comments (noted by
>    Krzysztof and Richard Acayan)
> 
> Changes since RFC v1:
>  - Added the dts patch fixing order of clocks in msm8996.dtsi
>  - Fixed the DT bot errors
>  - Added separate clause for Google Cheza devices

Please continue the version numbering. RFC is also a patch and also a
version. This is v3. Your next will be v4.

Best regards,
Krzysztof

