Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47979727331
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 01:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbjFGXjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 19:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbjFGXjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 19:39:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8464F26A5
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 16:39:09 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1b92845e1so59430301fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686181148; x=1688773148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XONB9T8Mj7o/MLrEwoJSSBYj969JG7tPSlspH2W5BIw=;
        b=GTSY7qEdobWh7LkTRnOAImvPKZUJQfgOgETcJ+tk6DI5sF/chuwr6uFDqqlVN23O2W
         //yo7tNg480hQs0zkZINMpSZx3sk/T3RykwcV+TsgCqjcm6lxUr7OIiZgxIFpwSR5GDM
         4G0wg5Ie0zBjwOhgMcBHNt5pPR8zWZkXbyFtqUc4AfJayZmsCu3RwDeCa8spwMuwj3kd
         l7IFXSZtuqtnQi6PcQ7vFnWwXhpYhZaVzrLSjtc6apATcNyaMuyKL3dvg8eSImkt7HNR
         s3HuH1jxWmY/bYrPhnN5PoHhxg9HXsMayW/9mjwSHTu08V8Fjpsb3fvDLgVQ95kyqjtA
         HJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181148; x=1688773148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XONB9T8Mj7o/MLrEwoJSSBYj969JG7tPSlspH2W5BIw=;
        b=SXK2LyfXnbh/0tif3Kbi9HmO9sRBwOPgxw09bb0RttcF+jUoURO4c6yWGg5mj0niX8
         FQ6TnhaId581zV3xhRftxNwiHIeQriPF7v6QHm9/hNJr87XHHS4ECIcoyjpjB53kX6AV
         W1t754rhrFLyBkRdOCdyjoQUzQ+liMHOGtetqY5z9CmAweCxacodlqUpvY0ubiPUDlau
         GU9NuLvdE+THDWHTlnnz/RJRTgihwjKhV0BJ1rfvFx3J+V6FNWH/lVFDXtnHXl8Wsirl
         k4y0eC+bO7x37FkjbNgL6HLS5AbWy542hcRHmvtnOMV1b2InlCwRQheTROk1an0e04D7
         g/nw==
X-Gm-Message-State: AC+VfDw70JrjYzCr5vFJydww503ZZ5JbcJlhzrj/7vO8C/a3mhFXPGJg
        RqSg4rhS9v+0KfcUBSMMswRDvA==
X-Google-Smtp-Source: ACHHUZ5Ti07xNp1+TYebI62vHoSL/r5taUDlEmn3ZQRy27Ik7N84bpsPjsq4VfKfSjqdaopI0zXg+A==
X-Received: by 2002:a2e:730c:0:b0:2a7:7100:ff5a with SMTP id o12-20020a2e730c000000b002a77100ff5amr2976356ljc.6.1686181147775;
        Wed, 07 Jun 2023 16:39:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o15-20020a2e90cf000000b002b1b92910c8sm346ljg.86.2023.06.07.16.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:39:07 -0700 (PDT)
Message-ID: <e70b266b-85bb-f23f-dac8-47702a2aaf37@linaro.org>
Date:   Thu, 8 Jun 2023 02:39:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 00/12] SM63(50|75) DPU support
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2023 15:43, Konrad Dybcio wrote:

[skipped the changelog]

> ---
> Konrad Dybcio (12):
>        dt-bindings: display/msm: dsi-controller-main: Add SM6350
>        dt-bindings: display/msm: dsi-controller-main: Add SM6375
>        dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
>        dt-bindings: display/msm: Add SM6350 MDSS
>        dt-bindings: display/msm: Add SM6375 MDSS
>        drm/msm/dpu: Add SM6350 support
>        drm/msm: mdss: Add SM6350 support
>        drm/msm/dpu: Add SM6375 support
>        drm/msm: mdss: Add SM6375 support

Will, we have finally picked up the display related patches. Could you 
please pick up the IOMMU patches if they look fine to you.

>        iommu/arm-smmu-qcom: Sort the compatible list alphabetically
>        iommu/arm-smmu-qcom: Add SM6375 DPU compatible
>        iommu/arm-smmu-qcom: Add SM6350 DPU compatible
> 
>   .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
>   .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
>   .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 213 ++++++++++++++++++++
>   .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 215 +++++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 173 +++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 139 +++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>   drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
>   11 files changed, 790 insertions(+), 3 deletions(-)
> ---
> base-commit: 6db29e14f4fb7bce9eb5290288e71b05c2b0d118
> change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26
> 
> Best regards,

-- 
With best wishes
Dmitry

