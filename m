Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A257A2124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 16:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbjIOOgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 10:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235633AbjIOOgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 10:36:10 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555D8E7E
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 07:36:05 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so2742270a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694788564; x=1695393364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAvGmJTVcQM4dBrUXCFEudkQdh/D9l4aPxU7aH2nmgE=;
        b=kUuctP2qvtoQICxjozKgw8FlHEobuf3APDDZ4t0UTY3d0HGz219CIXJM819lQirsNY
         hpVHzYAlPzkq5kLWPpwy6GgzgE3gR9rvW0edu8vyRHw8MfE2Y9GXmI3HQ0QOj8Vb2BHT
         wTZHayL8K2NbFNcsu9luMu8+gkDyVmwH2bPBZjyxjaXr0IqW6GS0R4U77G0Hnjnsev3Z
         3bd3a51ur2ElmPQWUY1xHNDZ6LxWJSwqzJCdJ8NIri3F1nHmLQLw/WoTbpMQyg2QZ1r9
         nVpG+z9QW6kzwufEAABuJN25sWLmHGGKuPSBh0OoN5vN1z1VJM6fikcJB/ElUNx+TXyz
         NEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694788564; x=1695393364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAvGmJTVcQM4dBrUXCFEudkQdh/D9l4aPxU7aH2nmgE=;
        b=PcFUErVknmZBeo/FfMF5rwBPeOgwHej73vQ6mOyr1sjPbhkfFRk/JbHWuwd6IB5fHM
         1xyaXwpLgEXcahl68Frwsq1dQOeywch6ZmyWCeJDbAj30PD9LATjo97WZSjaxjfRI0Es
         9Trh5F2kJB4MONKf4OEKJMJRBWy37PuyJbB6aP4KscFEdJ0lTh02Hoo8064KlaVjVCbh
         wY8kFuTkRpqGXCfkUycNwpb9FM9SH5I9gABqzmHMQ56PiE8C123ddks4+823Vr9ezbhy
         KYsA+Q3usSnO25DqJeiDlxm9YQUa4+tlQdT6y8a328dThQxDB8xaIUvOjRR4zIDSuRtO
         QhJg==
X-Gm-Message-State: AOJu0YxKWIzznUEhTMPOzRzpArkjuPUbd25DicMgkbzIhkU4DRLsOCMV
        jRksenVwYDDcCDR6kdm1qCApyA==
X-Google-Smtp-Source: AGHT+IGH7y3nXhcPVkWx5YaNGUnl4h5tWx4kIWnrs4vdde3oMQNNo94h8zM9WorG6dmSHew8I/h3xw==
X-Received: by 2002:a05:6402:344e:b0:526:d6d2:aeb5 with SMTP id l14-20020a056402344e00b00526d6d2aeb5mr1463916edc.9.1694788563759;
        Fri, 15 Sep 2023 07:36:03 -0700 (PDT)
Received: from [192.168.37.232] (178235177024.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.24])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b005272523b162sm2338622edw.69.2023.09.15.07.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 07:36:03 -0700 (PDT)
Message-ID: <5f637667-cbd0-41ce-bed2-46182535b0f6@linaro.org>
Date:   Fri, 15 Sep 2023 16:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916: Fix iommu local address
 range
Content-Language: en-US
To:     Gaurav Kohli <quic_gkohli@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@quicinc.com
References: <20230915143304.477-1-quic_gkohli@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230915143304.477-1-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.09.2023 16:33, Gaurav Kohli wrote:
> Fix the apps iommu local address space range as per data sheet.
> 
> Fixes: 6a6729f38436 ("arm64: dts: qcom: msm8916: Add IOMMU support")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
> Changes since v0:
> -Update Fixes tag.
Versions start from 1.

When resending new revisions, it's expected you provide
a link to the previous submission.

Other than that:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 33fb65d73104..3c934363368c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1813,7 +1813,7 @@
>  			#size-cells = <1>;
>  			#iommu-cells = <1>;
>  			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> -			ranges = <0 0x01e20000 0x40000>;
> +			ranges = <0 0x01e20000 0x20000>;
>  			reg = <0x01ef0000 0x3000>;
>  			clocks = <&gcc GCC_SMMU_CFG_CLK>,
>  				 <&gcc GCC_APSS_TCU_CLK>;
