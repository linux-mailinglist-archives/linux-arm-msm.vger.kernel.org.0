Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34036254C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 08:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiKKH5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 02:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbiKKH5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 02:57:49 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEB363CE2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 23:57:47 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id l8so3643368ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 23:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khPOjD4mUMV5NHzL4VRcGQmsh9Vu4A/lGNt/hPCjtoo=;
        b=aqHYQIM6ikdBrVUTEb9N6FmnUveMFh6DiXMOikH+gCFjKAnCnhvN4oSi7Jj8LFPycN
         TYXKtBvUYmdEKiLSkVi40v2+ySVbY/BcRAVXDqqSLUL0Bb/jKL8O1/2S3cHwUsiIR6QI
         0usretTVslG7YwkH4+B0a5L1vBiB8c/cOaWWhdzVGx9RLM4p08PAGB9vZDD03qobdPmU
         RLVXMt+eSXDJxBlVc+we+7MAiulDvrQpf17rekXKAP991G1FHneRbpso4yw/DUHwb9tU
         5xd6JnEY3FLD2t/ciD3j6L4Iq12cOm5KHMEJBDaZLVybyu4JpKjIjb1RrrWdQEIQlC7N
         mLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khPOjD4mUMV5NHzL4VRcGQmsh9Vu4A/lGNt/hPCjtoo=;
        b=Wd1teG9ObALa5ZjlNEQ45GpMdcb70gIqqQD41s6VBinhHfWp7wQW3QIvTEAiYXyETE
         gFdURjPrgBNm1cvlfn/KrEbzH2EwOY+OT1w4vf+D2FQiOGoHzGjebpXFRyrCJcv3h0g3
         aM7PwiGOqso8LKPWIzjtbMH2N5nqjYmdgRs104NyWVflinxMLhCGvYsSOk3PpzvcvIrt
         zUMvejn4TmzEK1EVQxLo9KyTO210j4qsqBrFVHMJeTKC6LhUSRTpvDmL7/pUJFNLZ/7/
         fBvg1U/scejX/Iaq7dgBUhV3myrt9WA3T+0VQKACzi1hGuFkaHngOyFaZKwRFRGZgnxj
         vS3A==
X-Gm-Message-State: ANoB5pkAF37N3Hk7/0WWbglPSXQgbiIiazCQ+fnMJpcU/SPlWbX+ZtAZ
        oOeyZsTzCmtX9p7GRV8gMTTRHQ==
X-Google-Smtp-Source: AA0mqf7qvX42ZyM7sLNHNY77V+MlFwLwawxEiOSkg7VRiCGvXKpBY290JkNlAYw1DIXKTj4fITwmMg==
X-Received: by 2002:a05:651c:194a:b0:277:9e5:6cc9 with SMTP id bs10-20020a05651c194a00b0027709e56cc9mr302507ljb.165.1668153466346;
        Thu, 10 Nov 2022 23:57:46 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id m21-20020a05651202f500b004b01305732bsm201219lfq.216.2022.11.10.23.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 23:57:45 -0800 (PST)
Message-ID: <5bd3ae23-0d91-514c-6f64-fc18868bb973@linaro.org>
Date:   Fri, 11 Nov 2022 08:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8450: Add Xperia 5 IV support
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20221110223929.134655-1-konrad.dybcio@linaro.org>
 <20221110223929.134655-3-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110223929.134655-3-konrad.dybcio@linaro.org>
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

On 10/11/2022 23:39, Konrad Dybcio wrote:
> Add a device tree for the Xperia 5 IV (pdx224). It's literally the 1 IV
> with a smaller body, different panel, one camera lens (not sensor afaict)
> swapped out and no 3D iToF sensor, hence the device-specific DT is tiny.
> 

Thank you for your patch. There is something to discuss/improve.

> +
> +/ {
> +	model = "Sony Xperia 5 IV";
> +	compatible = "sony,pdx224", "qcom,sm8450";
> +
> +	imx563_vdig_vreg: imx563-vdig-vreg {

Please keep consistent suffixes/prefixes for regulators. I think other
file is using "-regulator", not "-vreg",


Best regards,
Krzysztof

