Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6215527E4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 09:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238280AbiEPHLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 03:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240973AbiEPHLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 03:11:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91AABBF
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 00:11:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so24254537lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A8n5NqBF8eiI63GzxK/IUYJgZos9yERKjGW1rbv7zxg=;
        b=emeGxsdreO/uEDfJ4oREHvWiB12JVp56nF0pafJi3R9OKjRFf2JGCvNtfVjFxlSdpY
         pE232FlSiaJXMlwIjhLHfDgbXNQFXJBDEtt9uEwYdSItjeo2eYQUW6cxmRpo5ifiWnrY
         Knhs9/RWgMbkNqHlNBXD7+TBKVdc/cASl5GCqMlWWB83McSh2XS8JEFgRmPfk4ux1+Zx
         GH47Ouv11aJ0TtJC5sHg7pIqM+92i7U8bvTubpXcFoCQyaU+yY0VypcEmnu3q8z19B57
         zS8Ml7S9/64EwVYJ2Hq880C76u11jin8rKOhlzqct+N8WkpeZsa6d7RfgiecsTag6cmR
         iTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A8n5NqBF8eiI63GzxK/IUYJgZos9yERKjGW1rbv7zxg=;
        b=pZK0tszMa1mTLJN4A21wFFnMHkE9TQGuEI6zsanMXIexj7aKTjgZ41Gu5nZQudjBMM
         4NZ80cBySfjrHwcPpvb/sPbgKwRrlySd8krBjCUkbsLQrZs3ccEJLocWjREnGhGEU+E0
         cjIFCbU9UO30ZuI+wi1Y3N+vkyBomSnonLUf0yV33PVKO6lFuWLRMEX4dawaCOU3vOWq
         29AUPMfQ4Hc2h4yRf7u84oL8+vDk1oW43yII69Cl0Bkqa6X5K6cXnuuCFTGsYRiIPkPG
         m7vm/c+1WR95BfqmKceoXMQ2p7CAx7HkcjUhNR2jTw1UZ8shrKvBVtguj1SnQ7/jl9YE
         xYNw==
X-Gm-Message-State: AOAM533gA8iqPKrCyAsN+5Ej3YUU9DGR6prF0KTa06VTb6Zrlmvnsztk
        yhbnPuN2Kzbg7gX6uihMDjHP4A==
X-Google-Smtp-Source: ABdhPJzGJNyk3ngpENl93DzIF49UfQH5FyPJS9+J6d9kc/q8lHaBvK24mhQHZKq9hsJOS1mW5yonAQ==
X-Received: by 2002:a19:4343:0:b0:474:d7a:634d with SMTP id m3-20020a194343000000b004740d7a634dmr12034699lfj.168.1652685073277;
        Mon, 16 May 2022 00:11:13 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u26-20020ac248ba000000b0047255d21202sm1216927lfg.305.2022.05.16.00.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 00:11:12 -0700 (PDT)
Message-ID: <8b47e106-a567-8d8f-ddd9-34b71211002e@linaro.org>
Date:   Mon, 16 May 2022 09:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add compatible for
 SC8280XP USB3 UNI phy
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220513225348.1671639-1-bjorn.andersson@linaro.org>
 <20220513225348.1671639-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513225348.1671639-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2022 00:53, Bjorn Andersson wrote:
> The SC8280XP platform has a pair of 5nm USB3 UNI phys, add a compatible
> for these.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 8b850c5ab116..0a9ee5b7600d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -33,6 +33,7 @@ properties:
>        - qcom,sc8180x-qmp-ufs-phy
>        - qcom,sc8180x-qmp-usb3-phy
>        - qcom,sc8280xp-qmp-ufs-phy
> +      - qcom,sc8280xp-qmp-usb3-uni-phy

What about the clocks/resets/supplies in allOf:if:then?


Best regards,
Krzysztof
