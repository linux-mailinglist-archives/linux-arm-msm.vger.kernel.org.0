Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA43640543
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 11:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbiLBKxX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 05:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbiLBKw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 05:52:59 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E8DD3A26
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 02:52:17 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f21so5943854lfm.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 02:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WV3hu6UK29+s0ALK9dx8GPMaHWMWWZBkgAQWdnJIgM=;
        b=qXvw2WdO15cC5leZhy1ybNVXkWVe6yyrSIT3B7vV+oNDpLWW7rHGoZO74d4/yPFjWn
         HWnN92NNeps3n0HOytoZyceBIkCtYCtK3M8ktz9uWVmJAz9LIOERMQQGmJOfKt7B8pnv
         eahhmYz9ien371VQ7Pyu+unTgNOOXCs6VUPAmgWfd95nSHu1NNj0XMMx8VXqDknU6D+B
         GcGA+/LkFkXbqHKiPg5BgOwPyTffmmL+oKOZPRLUDrn1ZV+eMntHUEnf0fAL9aOFRARL
         y35WWukKWJmN5dLBXuzvgXCx1QGNehCzzT4ydwlvews9GFTtMIyo/XntCGhv8UdIuAH8
         SGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WV3hu6UK29+s0ALK9dx8GPMaHWMWWZBkgAQWdnJIgM=;
        b=LWHxE6e7zBHf9OPSlcF/qVH1J8gOkaH/e1hrJfoRCcreXoGX+BbVH+Lu6JWcllfiYf
         pQy0UudB3sThoAIquspEwoLzUDrFsRpNnebR9R4skyh7TjPn9N7po+UaAGPUZdA93Q7z
         gZpwkS4z+80AG+6iVn0ogS1m8BVmQv9CP1RMh2jWz5O1wB45+B37ea7GiLnMkjUTmvgB
         WZQJ2F6gPGm0kYYo+aY7+dBnq+MVWprrnk7/vFLH6V1gP4FIFeXw7eMy/HFPK2L2tMxs
         LoKwlUxqEZGvASzQjgoZJJ8U1v5jDwNKX/ZCWi+EXt+OA4HMrPZQOOZKIpAycoTBrNzW
         4KgQ==
X-Gm-Message-State: ANoB5pmm+516MSdSa7QIHWhGdmLoSRWMPAWDZYVJFBuPwa98/wBcqp8F
        5ANxYzNAIEXPpY04nIans1Prbg==
X-Google-Smtp-Source: AA0mqf41H5eGnGIB9G1oi4r1GojwonsUxZ5eSSh4/4tBP7XCusdlnst0g4hA1FRPNHRCYdlo/dGfew==
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id c6-20020a056512074600b004a24f74f47cmr22895346lfs.367.1669978324002;
        Fri, 02 Dec 2022 02:52:04 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.2.neoplus.adsl.tpnet.pl. [95.49.125.2])
        by smtp.gmail.com with ESMTPSA id v1-20020a197401000000b0049876c1bb24sm972082lfe.225.2022.12.02.02.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:52:03 -0800 (PST)
Message-ID: <c168cf10-8bcf-2dc8-29ca-d94e448a7c65@linaro.org>
Date:   Fri, 2 Dec 2022 11:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: sm6115: Add smmu fallback to
 qcom generic compatible
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-13-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130200950.144618-13-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.11.2022 21:09, Adam Skladowski wrote:
> Add fallback to generic qcom mmu-500 implementation.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 38b903592a57..572bf04adf90 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -1233,7 +1233,7 @@ dispcc: clock-controller@5f00000 {
>  		};
>  
>  		apps_smmu: iommu@c600000 {
> -			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
> +			compatible = "qcom,sm6115-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
>  			#iommu-cells = <2>;
>  			#global-interrupts = <1>;
