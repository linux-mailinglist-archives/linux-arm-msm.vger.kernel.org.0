Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C61E5F1B56
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiJAJbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJAJbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:31:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5892F3386D
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 02:31:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c2so3842300lfb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2IDkwXcKVh1RrSCp/Ae9caZ7+6zsWJNEEGC+RC5gb5M=;
        b=JU+TUNXYJ2ItDysz7GCmVbLuOsXh2F/Q30cyV4SmMP8RhmBtaSo6XQNJLwrs9SYnN7
         fGyKTUIQifno9sZsrP4SWRNG68rJpQno0whhXiKJ7wZRAaQxAc4LivbWv1+tU+iGs4VT
         fKqTuUFvv39wog7ft8bwFXGHGVkeYarPp2tFyH+ShUW4CrFwd+OIWxAlCQ1ngrBmH2X+
         +5FHOZUTrBZnQk3vj3t2w6/ZhkPexUNx0Xw428zg1bn1AT/u86GMjDEnSxHFs2gXOvH+
         4yDw8+BnVWmm6NOe9mpln5/4+gNpf6sjgEYOEUVi5ymjp+LMlQoBNNZruCt01pykCYFA
         T87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2IDkwXcKVh1RrSCp/Ae9caZ7+6zsWJNEEGC+RC5gb5M=;
        b=LesnxuUVnmjDUAGZS9kbZXI7AmtVIGaxtc/VJAasZ4c7q/h3UF9diY9ONGP0duK+yD
         tyb/HmHQS6ZI+59PcGJK6utl8FcnV5kFLl1x3//B8ZhoXwBA8PMywqYPInLferA4+4E5
         E7ivGpUxxGGAYPMWXBrxuFvRoLbh+WKgnpK+CAwxBFwp0kpjo1elhJes3GKIqyXUn9PN
         g5FDaDhT0rjU7WENlC82vcydpoGkctOdTRMEMqtv8iuKVwOSdnFvN6NE08kUSqwVEN9P
         1zKk8u9p1zTNF8CjHz81onoSwSAriJcAtI/7Z/wg+e31LmvYm0STmhwmkC8tif9TREUJ
         AWLQ==
X-Gm-Message-State: ACrzQf272xYWpXNb6TVwmkMVljeC0vhszmZu33dPvZUUdp9fxK7qmpHH
        VQL1V/xpLCWV5m03SZMOp4a2vCunoLTJZg==
X-Google-Smtp-Source: AMsMyM709JG3UouwX46iimgSSMVGuqysebClncGvfximstTKAUMWk+ekO+AA6gKx6rK543SofdtA6g==
X-Received: by 2002:a05:6512:139c:b0:48f:da64:d050 with SMTP id p28-20020a056512139c00b0048fda64d050mr4178806lfa.268.1664616672722;
        Sat, 01 Oct 2022 02:31:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k21-20020a05651210d500b00492f1b2ac0bsm708242lfg.101.2022.10.01.02.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:31:12 -0700 (PDT)
Message-ID: <0bf97760-09e0-e64f-3ef6-2b861131f83e@linaro.org>
Date:   Sat, 1 Oct 2022 11:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Add QDU1000/QRU1000 dt
 bindings
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221001030602.28232-1-quic_molvera@quicinc.com>
 <20221001030602.28232-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001030602.28232-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 05:06, Melody Olvera wrote:
> Add interconnect IDs for Qualcomm QDU1000 and QRU1000 platforms.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/interconnect/qcom,rpmh.yaml      |  8 ++
>  .../dt-bindings/interconnect/qcom,qdru1000.h  | 98 +++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/qcom,qdru1000.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> index a429a1ed1006..c524d92ee203 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> @@ -132,6 +132,14 @@ properties:
>        - qcom,sm8450-nsp-noc
>        - qcom,sm8450-pcie-anoc
>        - qcom,sm8450-system-noc
> +      - qcom,qdu1000-clk-virt
> +      - qcom,qdu1000-gem-noc
> +      - qcom,qdu1000-mc-virt
> +      - qcom,qdu1000-system-noc
> +      - qcom,qru1000-clk-virt
> +      - qcom,qru1000-gem-noc
> +      - qcom,qru1000-mc-virt
> +      - qcom,qru1000-system-noc

Not a correct order.

>  
>    '#interconnect-cells': true
>  
> diff --git a/include/dt-bindings/interconnect/qcom,qdru1000.h b/include/dt-bindings/interconnect/qcom,qdru1000.h
> new file mode 100644
> index 000000000000..2bdfa0c15d2c
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,qdru1000.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license.


Best regards,
Krzysztof

