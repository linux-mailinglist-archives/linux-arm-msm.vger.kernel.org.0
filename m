Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C766CA0C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 12:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjC0KC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 06:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbjC0KC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 06:02:57 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1557130E4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:02:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o20so5408203ljp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911373;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xe59W+8n0LHdS75+2f+pme8HiqANF92L3kkD2RxU+AI=;
        b=Y+80HLDyBwwMHTJZD2gSDP306gNMFn367cv3TzftoZMdV5fccdNzZ+xMHFfFhlxnj5
         CRlXpkA67z2CjlYR86fScmYK+5bSVjRW3Mta3sCp8/XVLGei0O0rhU5D30NDqPvSWJXx
         hqlg3xcES3Fj4yxRz8Ig2RPP4FjmtF45ykD0mUAQ8kG+F/317JN3rLJ3g35Yjva3z69h
         rTWeD/6J+rPE2HDqzogvkfC3InAnvo8ZeYwR01DHb0v+jCEZIIzYjfKkUm4K6fh3CEwJ
         i6xQyvCF9+otzt7N1iKQwLZwfRv/keABmZhuf19yQNthlnFaUWzmeWpsLRDKTUPNpofa
         4ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911373;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe59W+8n0LHdS75+2f+pme8HiqANF92L3kkD2RxU+AI=;
        b=3i2kh4RUEPDdkzLzf13+oAgQk59SR8FJERgw2f16NMwy0LqEOLcMw6X7AYcbA6S1Xw
         8TWM7Z1/Y2IprD2FtHs/XOH420rD6INzIasaN3t/T2kUqFi0vaDFi9v0TA262WhKL4LU
         ifrmBpvp9pyCwNnsQcpBlxzaC2CfO/YpadZmvWWB4Y9cCAiV7BLirP7DINKw1JaykD+C
         TAAHFLl/VfgwOp53cX/LCOvrhjcizBdrAHkSfIyFOKCSIbgLNiozCMvGAOZwICFQ1PjU
         EgaYKltyF6nqQhtmybycQlFJkCnchRU3pcG5ZQDvXmoOtymePRcRYIuyaVEIG6UCcSa2
         dVCg==
X-Gm-Message-State: AAQBX9cdm/tMXx+RzUnEaZJcq/vP86zXIyDeYzNpe/JE7GvbbSuHqmzo
        xWhEQ8oyFQ9rHxN+7ZoLevxoDg==
X-Google-Smtp-Source: AKy350YaXBNZKwdUWMkwIV51zBoiqKukB1XXP3LwHXLcwQXjOA2npLp3FiGSOI9tvYIJuXjx/XtaPA==
X-Received: by 2002:a2e:9cd0:0:b0:295:ab86:336b with SMTP id g16-20020a2e9cd0000000b00295ab86336bmr3780693ljj.15.1679911373345;
        Mon, 27 Mar 2023 03:02:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c23-20020a2e9497000000b002934b9ce521sm4590526ljh.10.2023.03.27.03.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:02:53 -0700 (PDT)
Message-ID: <3d49b4b0-587c-f7e5-4122-65b3e9f11583@linaro.org>
Date:   Mon, 27 Mar 2023 13:02:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679909245.git.quic_varada@quicinc.com>
 <4a21defe3320eb11d0e43bc7f02b3168ecefd458.1679909245.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4a21defe3320eb11d0e43bc7f02b3168ecefd458.1679909245.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 27/03/2023 12:30, Varadarajan Narayanan wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>   Changes in v4:
> 	- Remove constraints not applicable to IPQ9574
>   Changes in v3:
> 	- Update other mandatory fields to accomodate IPQ9574
>   Changes in v2:
> 	- Updated sections missed in previous patch
> ---
>   .../bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 25 ++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> index e81a382..aa5b58c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>       enum:
>         - qcom,ipq6018-qmp-usb3-phy
>         - qcom,ipq8074-qmp-usb3-phy
> +      - qcom,ipq9574-qmp-usb3-phy
>         - qcom,msm8996-qmp-usb3-phy
>         - qcom,msm8998-qmp-usb3-phy
>         - qcom,qcm2290-qmp-usb3-phy
> @@ -122,8 +123,6 @@ required:
>     - clock-names
>     - resets
>     - reset-names
> -  - vdda-phy-supply
> -  - vdda-pll-supply

Same questions as for the qusb2 PHY. How is the PHY powered?

>   
>   additionalProperties: false
>   

-- 
With best wishes
Dmitry

