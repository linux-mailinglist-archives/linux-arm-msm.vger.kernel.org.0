Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519DB4F1602
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Apr 2022 15:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353469AbiDDNio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 09:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353941AbiDDNin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 09:38:43 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BDB3DA7B
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 06:36:47 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id y16so6864799ilc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 06:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v7AXDrNkV0E+GuzQu0vkT521m8L2g3R8JZyBRpFSWSw=;
        b=UGi9dsHRnoLPuvzo1S1EvzOOZUHvSHzXBsnw16StvvXGSTaLht7DkGhbmNgritgWoy
         3S+vdPPYNI+CbTwzNjbbeE7Hw32snvtBgdJ3quDnbJxCb0KtnPvvUi8IKemKBU7+NTcn
         YDKZMZsFTdUZ44CkNQLumu4g37ihuSwyQIWPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v7AXDrNkV0E+GuzQu0vkT521m8L2g3R8JZyBRpFSWSw=;
        b=xpxf4iWq1+/Dq7/A9aFJw3OU5MFK8Q2GlwwNtVKOHJBEqF1cxD4bdxEoW2WtYHzv57
         RfOKtwqKq+1WSMx3iCDm57umJVAlTMkzjQFFu7dYwB0wDG6AbR43n9fxVdOCyvWTMlDg
         954qSMcxvGojZ3dFO5EsiKpKWv3QsAZI9PqCz83gmrDlQkE3SVWrRSJA0M/DCj9tczO+
         eBoYwVQGPT/VE49tymICKQVAMI+/p/yV/j6SUpQtqZ/ulbuEd7GHvZnx/MrqLBYVGTjn
         Jb1mBErbLwyXtc0wzOFhvmV5wiByY6Rk5LHAV/FMkoaMRhLqOLGm1cG5bcaOrwf9rhsG
         lDig==
X-Gm-Message-State: AOAM533iu37SPk/cBCatGLH+BqJgVQN7R3OB6+6gjNlZDCV+R+24M3m2
        4iHkALP91+SoclWtbTtZd2kVsQ==
X-Google-Smtp-Source: ABdhPJxKWPVlUvcgfx4SvYr7vos8yA4v2Mi7qUIHb9E64q6XZsCGDyBE3n+kdaQg4cAx6UmNyhWkjw==
X-Received: by 2002:a05:6e02:178d:b0:2ca:1ad2:c471 with SMTP id y13-20020a056e02178d00b002ca1ad2c471mr5284025ilu.311.1649079406491;
        Mon, 04 Apr 2022 06:36:46 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x8-20020a92d648000000b002ca2dc1a74esm3188537ilp.58.2022.04.04.06.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:36:46 -0700 (PDT)
Message-ID: <10d4f538-249d-f78c-b90f-298c9727d58d@ieee.org>
Date:   Mon, 4 Apr 2022 08:36:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: net: qcom,ipa: finish the qcom,smp2p
 example
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220402155551.16509-1-krzysztof.kozlowski@linaro.org>
 <20220402155551.16509-2-krzysztof.kozlowski@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20220402155551.16509-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/2/22 10:55 AM, Krzysztof Kozlowski wrote:
> The example using qcom,smp2p should have all necessary properties, to
> avoid DT schema validation warnings.

Looks good to me.  The particular values don't match any
reality, but that doesn't matter for getting the syntactic
parse to pass without error or warning.

Thanks.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index 58ecc62adfaa..dd4bb2e74880 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -182,6 +182,12 @@ examples:
>   
>           smp2p-mpss {
>                   compatible = "qcom,smp2p";
> +                interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
> +                mboxes = <&apss_shared 6>;
> +                qcom,smem = <94>, <432>;
> +                qcom,local-pid = <0>;
> +                qcom,remote-pid = <5>;
> +
>                   ipa_smp2p_out: ipa-ap-to-modem {
>                           qcom,entry-name = "ipa";
>                           #qcom,smem-state-cells = <1>;
> @@ -193,6 +199,7 @@ examples:
>                           #interrupt-cells = <2>;
>                   };
>           };
> +
>           ipa@1e40000 {
>                   compatible = "qcom,sdm845-ipa";
>   

