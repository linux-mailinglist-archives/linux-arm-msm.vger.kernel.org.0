Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FC86049B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 16:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiJSOuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 10:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJSOtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 10:49:42 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA78D46D9D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:37:33 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id df9so11471699qvb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPmY3H6QtLbLlg+odp+7vNaKgGy+LOC9iMiVx7OeTv0=;
        b=UTo2Mku+bHBSvGX9Rhn1K+FmtvqfA82ikgEaazZhLAHC6gTMBaM4anFsntNUJQdqpo
         vdZurac673hz55Kk1pozwLsu7Cx6VySvcIEgn86CyuNMuOjinyALEa+kJgkTDPhpz4OL
         kbpZdtAGaU9gP5vyusFq2nhAJ2BZFpeHzIyDfAkcWDjORKLrVAirb3qDH2N2UR+gT0x/
         A1ycWTr9edqJZWjDgBRPSxluVjtn9hToVd+eBMqCn694hjrq7poJ8vRFftq1HWHqtP8d
         DxVeIYCaKDNJXCmFCu4vcbVy3X8VpKHBVVAFrhX8QMzbK0qHcqJEvPF73tmSCy4qkrhI
         vx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPmY3H6QtLbLlg+odp+7vNaKgGy+LOC9iMiVx7OeTv0=;
        b=LMBpeis5WMXCBZo309ONRMfXyEl6Bx5C7GKX6emt+DrwvgPtJD9CZhRq+o3tS0dWaN
         NdX1d2fo+tQxBjpad19rX6E4suTpIHhY7cbe/7ePKKOkf8FH+4rL/VQAQE3a0oH1kqZy
         /yVnuryL9a8vYNyht3YTleGtiCwPp9HW4IPuicYXCdJwIp14WeImRD8FferYUmxUh9BM
         7ZqXnzky9y9gi7QEWlTzT5GBvzSt767JKm4MyJH3A3ejHuso7LivU7Rc4JUfalMIh/7J
         oi04evYlQN/2d3IAj3263JwEtwxZekuwDOEsVZGa6M0KrBhmeQ2bhCnlqo5bq3B9E+8s
         zU9g==
X-Gm-Message-State: ACrzQf3sS9m9IaxHTvy9tnNkam9FS88ZVET3Fm7dGi37zCK+ciwEgdEx
        P9TEkI+WVxMVRvnKmqKGs2jQlw==
X-Google-Smtp-Source: AMsMyM7DGizC7izQI+CknS8C/RKhTHVdMVLEPhk4ty2YErrpM/4Ag/Sn86MY59IarB9/qg+ldnVKKg==
X-Received: by 2002:ad4:5bcc:0:b0:4b4:5029:8dd5 with SMTP id t12-20020ad45bcc000000b004b450298dd5mr6948408qvt.80.1666190252929;
        Wed, 19 Oct 2022 07:37:32 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a132700b006b61b2cb1d2sm4941248qkj.46.2022.10.19.07.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 07:37:32 -0700 (PDT)
Message-ID: <010b6de2-5df6-77c9-2f04-43f2edc89ff2@linaro.org>
Date:   Wed, 19 Oct 2022 10:37:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: PCI: qcom: Add SC8280XP/SA8540P
 interconnects
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221017112449.2146-1-johan+linaro@kernel.org>
 <20221017112449.2146-2-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017112449.2146-2-johan+linaro@kernel.org>
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

On 17/10/2022 07:24, Johan Hovold wrote:
> Add the missing SC8280XP/SA8540P "pcie-mem" and "cpu-pcie" interconnect
> paths to the bindings.
> 
> Fixes: 76d777ae045e ("dt-bindings: PCI: qcom: Add SC8280XP to binding")
> Fixes: 76c4207f4085 ("dt-bindings: PCI: qcom: Add SA8540P to binding")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 22a2aac4c23f..a55434f95edd 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -62,6 +62,12 @@ properties:
>      minItems: 3
>      maxItems: 12
>  
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2
> +
>    resets:
>      minItems: 1
>      maxItems: 12
> @@ -629,6 +635,25 @@ allOf:
>            items:
>              - const: pci # PCIe core reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-sa8540p
> +              - qcom,pcie-sc8280xp
> +    then:
> +      properties:
> +        interconnects:
> +          maxItems: 2

No need for this.

> +        interconnect-names:
> +          items:
> +            - const: pcie-mem
> +            - const: cpu-pcie
> +      required:
> +        - interconnects
> +        - interconnect-names

else:
  ??

Otherwise, you allow any names for other variants.

Best regards,
Krzysztof

