Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF2F6C7C07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 10:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjCXJyJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjCXJyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 05:54:08 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1133B1287D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:54:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b20so5631690edd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679651645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eS0zeaXUbMcMglpjBh8I28Q4OHtrRWXy7XcntN7bbI=;
        b=dQTQxi9QekxjzMlPQREE5MWiuLhUrLzx4PZ9YeIwpM801XjBQ4hXZdmhAlJObbUvlK
         DWHAtNG1qnvXrvmfjT8tFHDLpxGlJ5NF8kN/hrFqYmugvpBLSWLx21ZfPsSydG4YNtAg
         Rhs5sDgiXFrmq5bx3N4w8FG9PPExFaNGaFjysn5q2DEeBV9sF0qVmM25eXrYWi+rPm0t
         ijNeV7Z/A4QhFmxCOU7jvH/HPd1pdlYVJUATjxdCnYKl9mrhnH9X6aMeiD5kMxr73iF4
         kFS3ONk7+OkF45zdyFLBaNmXprvY4IS6AFbq4Iv5+xdOKEBVKUCPV2wp2QgxebB5Q2DJ
         8FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679651645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eS0zeaXUbMcMglpjBh8I28Q4OHtrRWXy7XcntN7bbI=;
        b=SMEOKNQTa5XbfgdFWP4+Nz+NQNr2EtYkL40mb2/X9pWK2en4JNWvPgDBJUhyo75MCC
         UlA7hx98vOZGNtpDP2y0l4Q6fn0lHIo8vNDUxpW+m8U8WU+iwlSeqh7aejRt9mGvR3hJ
         OkK7Qn2F7ZdpYGh1X+H6+SfisCb+6pNmNNVx2mWhlnJDKqeJJ6sWin8BS1ChpViiOMuh
         8DQZfDrgmRngafX1IPkxBsKoSkz4MVOuiJ8F/tUkWqKeAcii06cREJupZGOl8SW0SBHt
         mR2Uj0i75zbQZ45zeL5P6NsbZVIz0UdC60y7E3oqEQktcJgLrz2yjlrcFk36Z6Q1hGKh
         OHqA==
X-Gm-Message-State: AAQBX9dnrM/Lgeq9fdWK/ZQ/aeZMbsdsHVYEYgjQGRyk+UtgE2TRQGfs
        fTpnc3sIR64xy6KxrfBLqfZcJA==
X-Google-Smtp-Source: AKy350a3E8H6Jt1yWJcEBbtyGSaD0oJjSeD1G/V2IJ9Y8U0+obX35Nyf2huQ6fuRp5nSTbIVxs2ZqA==
X-Received: by 2002:a17:906:81d5:b0:93d:ae74:fa9e with SMTP id e21-20020a17090681d500b0093dae74fa9emr2096052ejx.7.1679651645565;
        Fri, 24 Mar 2023 02:54:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373? ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709062bcc00b0093034e71b94sm9910781ejg.65.2023.03.24.02.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:54:05 -0700 (PDT)
Message-ID: <d112bd06-1f9f-a21c-53dc-0d1ebe58eff6@linaro.org>
Date:   Fri, 24 Mar 2023 10:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] arm64: dts: qcom: msm8996: update QCE compatible
 according to a new scheme
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
 <20230323233735.2131020-3-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323233735.2131020-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 00:37, Vladimir Zapolskiy wrote:
> Change the old deprecated compatible name of QCE IP on MSM8996 to new ones
> based on SoC name.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4661a556772e..2ee28f9b6229 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -784,7 +784,7 @@ cryptobam: dma-controller@644000 {
>  		};
>  
>  		crypto: crypto@67a000 {
> -			compatible = "qcom,crypto-v5.4";
> +			compatible = "qcom,msm8996-qce", "qcom,ipq4019-qce", "qcom,qce";

The driver change was just merged, so this cannot go no - it will break
existing boards. Also commit msg does not explain that this requires new
driver support / is non-backportable patch etc.

Best regards,
Krzysztof

