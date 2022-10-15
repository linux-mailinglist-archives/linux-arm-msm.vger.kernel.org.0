Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14285FFACA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 17:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiJOPLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 11:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiJOPLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 11:11:44 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC64E46228
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 08:11:40 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id h24so5081850qta.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/qITi2sMe/4RHK/tzkxeucS4gyS4NVUV4PzxDYNBz4=;
        b=TdKhvKmT0bz+zXXyglbNGFgqqZtLVMqVo6HEg62mHvPHFDJsju0HoIkx6M/v2TZ6J3
         HNpr2vWla9cw/VrXcEPu8NB6BZWcwSF2M3c+jdp4gejcAHCPvutiIqGeOgwBL/Wu9Zeh
         nQc9Tzq+TUgLkrw+4LfF0ju0MOD6ftoLwNklamSKmf5qgqU4652tVym1usuSE90IBv6P
         4Jejoa6Veh1PjFYoffmxetUN3a3UWRTAc55zG0IYCuyd58GYsYfhq4tF7vNxVAg52I/M
         ndsdGV/+1PYDvA5GW2DAtvy4np3Y1zVhS1LdJhz9ZvHP4x8vX4cRN4fz+wJOM5s/3PYK
         Vtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/qITi2sMe/4RHK/tzkxeucS4gyS4NVUV4PzxDYNBz4=;
        b=SgsBt46PR1v1R3H9BiljwfR8hvPCXaLBA2blax8JeTZcgTFXDZ1AKcOhixFhMoAr4M
         T+/lX62W4Xq3LQFPyZakiZtPDmCGY2u7QlmCAzAHw7za1i2QK/zVgSK187g93g0w+1eK
         ha68a+OqENe0PFLKp9vvvHJFj4EH9LSJWtTzUpyPjMFuaFV8noBaP7Ryn7N+X5jechnp
         YGvGuA+lep55Ir7PYYF8KgMv9an31/dakLdiWu+RbppTeLZLbwOqC5z2mndPxJrdSe7C
         RbfO0SA391Ch3vvTQAYTMsXU7wvrMAtXnR5nKnN7n8tyn1Ua5Fs5chKgHJE2S3qSWCqN
         29lg==
X-Gm-Message-State: ACrzQf35zn3q97Ae/ryYKw7fesUBsqLkeyAK8TqKhKc9/wVn0WlOF/Gc
        vJnznK9kMGeRn/9ee9hyzaM1QQ==
X-Google-Smtp-Source: AMsMyM4noZrDRWTjZ8ITC7rg+4g+fK+kvDk6sWhdd4S6RC5TTMPw0t5GMfGZngMX5aiv0vQpo2Feow==
X-Received: by 2002:a05:622a:4204:b0:35c:ddac:9896 with SMTP id cp4-20020a05622a420400b0035cddac9896mr2278395qtb.478.1665846699272;
        Sat, 15 Oct 2022 08:11:39 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id m17-20020ae9e711000000b006aedb35d8a1sm4868000qka.74.2022.10.15.08.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:11:38 -0700 (PDT)
Message-ID: <0728b66f-3e1d-101a-3e82-aeb56447e1b2@linaro.org>
Date:   Sat, 15 Oct 2022 11:11:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add base QDU1000/QRU1000 DTSIs
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221014221138.7552-1-quic_molvera@quicinc.com>
 <20221014221138.7552-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221138.7552-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 18:11, Melody Olvera wrote:

(...)

> +
> +	firmware {
> +		qcom_scm {
> +			compatible = "qcom,scm-qdu100", "qcom.scm-qru1000", "qcom,scm";
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	clk_virt: interconnect-0 {
> +		compatible = "qcom,qdu1000-clk-virt", "qcom,qru1000-clk-virt";

How does this pass your dtbs_check tests?

This applies everywhere...


Best regards,
Krzysztof

