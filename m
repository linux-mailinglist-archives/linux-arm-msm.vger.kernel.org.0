Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112827A207A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 16:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235533AbjIOOHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 10:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235522AbjIOOG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 10:06:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE381FCC
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 07:06:54 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40078c4855fso23514055e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694786813; x=1695391613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yl/JazegorBAq3D3QeTIaZj/pCc3gy7siDATi6rK1hQ=;
        b=MUvlKSdeqa169iu7XPWykJF/dV+4IyvsxTgMGvI4mHRtwBHUh4yd3G8OIEmG+PWy75
         hyGKXw+NS3SrZX7Iu+H02RssQcVLrSUswv8wFZKC/HytFZ1i1r818E0IVoiQZ1bSbN7r
         4ncWYviA8URqzaiGDWSHNl0ewf+iqtnMXJgBGhaRdDO0O3kbh5opjcUsdy24o1y/ZjQP
         Zsw3cTFzEQXoGCqz37/hqXlKZxTBLSuKre3/aSe+ysQt+NOVCCQAwtVWtzaEKnS3kkpZ
         oiaR5Rc0DUHJ9A8H0h014F3CtUKn3ZXY+xnzwT/jjGE32heTtrh5v3vVguKzTp5tHMFS
         667Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694786813; x=1695391613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yl/JazegorBAq3D3QeTIaZj/pCc3gy7siDATi6rK1hQ=;
        b=RlMlc/xb/l3U4OyNoH6QrkL2FDF8bmWI/zlLkksPSODlzZiOf7jzoesLxp+MC+Btx6
         pR6CppyR+DW+Bof7zF5i+iRMp/a2zRqmFKs9RPiu/sjVlXmVkPFBrDEr0J5k+NnLNa5N
         R1vxWmJvf9+HWE0LcgpgwnNFJsHBu1dXPyvr9Lls3gvWZqZ3uKjGEiGRbAVUqOlHHHXA
         Z1CehwL4CiR2W0Uwyj1BP+eoS/4NzN2MtwFnisjhFNobMSIUJjzXppYVG0BCthdxHzhe
         13Nx0qUJ43irhg0LymAPYibjcKriHXFlUutTY2/B5XI4YKwa6TTUUIJOo1s4kKkT3tkH
         hFgw==
X-Gm-Message-State: AOJu0Yz7db1jFwKEepGOViswRZWgsLRdOULiXucCxUdlGKWv1MqYerdT
        WyP8gqvPNbOWQZ5IKORZkOzaGg==
X-Google-Smtp-Source: AGHT+IHnY4copxmNwbUNbT26v9WbBJm6W4Q2fqQzzZzG0SlMBPMvIw3e9q6cXROeoKqWieiTWKoKVw==
X-Received: by 2002:a7b:c38c:0:b0:400:f6f2:66b9 with SMTP id s12-20020a7bc38c000000b00400f6f266b9mr1762307wmj.12.1694786813037;
        Fri, 15 Sep 2023 07:06:53 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c0b5500b003fbe791a0e8sm4744254wmr.0.2023.09.15.07.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 07:06:52 -0700 (PDT)
Message-ID: <580b4c78-406c-46c3-b70b-a1d3e0f28b9c@linaro.org>
Date:   Fri, 15 Sep 2023 15:06:51 +0100
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230915050611.30451-1-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

from the @linaro.org address

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
