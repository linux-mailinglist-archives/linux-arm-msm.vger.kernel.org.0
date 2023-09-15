Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90A87A2078
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 16:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235521AbjIOOGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 10:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235522AbjIOOGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 10:06:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A81B2703
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 07:06:29 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31c65820134so1903249f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1694786787; x=1695391587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPevAndR5O5sCcx9pba9haiqxJsLFJCPMkDHTjt52FA=;
        b=d7EmdtcCJZJyLWB2bpOoXrMme4pPeOmWr8T7flrEqgvAD9OFn6hH7RqjijMH2jFnja
         hC1OxaTrOOQ+0FScoHgLYAhyZCz2oZ8dXd26azjmPPLxOXaThs94qfPYMZ/OGvKcfsO4
         2C0x46sE8/yZeEjPO6q1fMw8rfVHS8q6+oJAOAp8v+kafpx4CGI3LLvYrSQmVrkMcbOX
         t2Aia1zEWLjfaGhnHNnzDXDPEY02aL/A+TpW8078sC/cE4XwviiqO09WOfd3JhpcPM7s
         aXdEDCEqPk2NmoJ6ALXfbNIFGEck//O0KqCm5JHUbrZmSGr5JzgYNglYVy8ZEXpbys6a
         2YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694786787; x=1695391587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPevAndR5O5sCcx9pba9haiqxJsLFJCPMkDHTjt52FA=;
        b=Gq3qqWfxxu4R9QqWGupD8g27mVgEnOMi/sNk8nERfK4OgxPpZURBY5Z7Yr3mrQBy0g
         lhtVk/tHNx81ouw2BRAFoXJ+CP0AOtyGAFLHNDl7i8rQYiTCfxrBOCzXxufYVmWk/qvO
         DlV01cHgG+1fHIxYna3b8oLLtKAJ2aTkrnmdCGwDVtkx/A+n/zT4Q+Q+RXePAOOlVMmk
         XilQQaHt4bX0V3l0PFp3RpY/kkCvBytx4UujexY5XL6RCPPG9wrwtVCmXdNuHcpYlbQv
         F91kdCPvEXKB5D02yIZco5AvcjGlWiKSWWgmdw5vV7LC+IB/N7fnJFXuq/I6B7xxC1JB
         AujA==
X-Gm-Message-State: AOJu0YxtH3GfeB9SkXj60lLNrTxfARohMYxsNyyXcQpGieORCOG+8oHi
        xcctOid6Jd7kd3pavsGWn53IXw==
X-Google-Smtp-Source: AGHT+IE3Y60M6BMBEYiLzY3nM0JE0QTdwH9vEXe7+QkZgpY6vw67h9HdUCejeQHspU4fiIHRLlzWTA==
X-Received: by 2002:a5d:5745:0:b0:319:6caa:ada2 with SMTP id q5-20020a5d5745000000b003196caaada2mr1387654wrw.47.1694786787382;
        Fri, 15 Sep 2023 07:06:27 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z8-20020a056000110800b0031f3ad17b2csm4521042wrw.52.2023.09.15.07.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 07:06:26 -0700 (PDT)
Message-ID: <845b7356-98e7-4d12-9a09-969930c6f9ef@nexus-software.ie>
Date:   Fri, 15 Sep 2023 15:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Fix iommu local address range
Content-Language: en-US
To:     Gaurav Kohli <quic_gkohli@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        devicetree@vger.kernel.org
References: <20230915050611.30451-1-quic_gkohli@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230915050611.30451-1-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2023 06:06, Gaurav Kohli wrote:
> Fix the apps iommu local address space range as per data sheet.
> 
> Fixes: 327c0f5f2510 ("arm64: dts: qcom: msm8916: Sort nodes")
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 33fb65d73104..3c934363368c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1813,7 +1813,7 @@
>   			#size-cells = <1>;
>   			#iommu-cells = <1>;
>   			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> -			ranges = <0 0x01e20000 0x40000>;
> +			ranges = <0 0x01e20000 0x20000>;
>   			reg = <0x01ef0000 0x3000>;
>   			clocks = <&gcc GCC_SMMU_CFG_CLK>,
>   				 <&gcc GCC_APSS_TCU_CLK>;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
