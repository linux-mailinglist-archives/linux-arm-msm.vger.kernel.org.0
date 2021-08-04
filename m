Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0693E0205
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 15:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238507AbhHDNaC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 09:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238483AbhHDNaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 09:30:00 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1AAC061798
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 06:29:47 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id f8so1657158ilr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WEEoYWeo7g/aPLJ9OiB+t88pw1GizfDuJiiyMPsrkdU=;
        b=m7yQAE095pvcZHScJ8REPAQNt1BSnerISpefviqyMC+hx6SCsIdkh3Hw2hJKQjwDMu
         oUiJSmjr7ld0OUGPOcty6+Km3mAu0n7IKkarhZu4Mioz7jAdWEo5qsrGws4WG4U+K6Zv
         DYSJbZ9rshw178PUyNYTd4DKkPnSvNr8QpWYaUKEoKFkqra4fVFLyGYL2zPuyCEEKQuK
         BRlH00huL5yNd8BXlchGvsZTr+qeakPvM+Sw627KamS+4FF9XzvDhOT9D4EabqVPRcQr
         shnlJgt62QDyfgOBxYo/XwXLEjfc7LUh1fHGlL21kX3lZce0OLLjUL7At7ymhodTSXqE
         uFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WEEoYWeo7g/aPLJ9OiB+t88pw1GizfDuJiiyMPsrkdU=;
        b=UjTdVvONlCLVfB9VxdAE3bHrHN6AM91JNF72l5nkbAzISvX7X+DVorMhUodZGXVLK3
         FGNGPjMgA/Gpi5u5FA9HFQ3GF0YSyHZ1bmtIb0QPf6vtfi3gw2GmoBTya6w3txWeGgXj
         zKM7tXsD8gGegL1S3C2Qxk5iwfETLEOVxP/wvlopm8+JKkC35uh9uAS7t+eZwseO5JAd
         Yhdubhvd7iqT7hcN7Nzb59c+t21hTOQot5S6+jE1du33lpKGhl12+nLgkjq5ciOoL2dT
         NCeMWADjlYCwZrKHyrh9DNURziyaZSiqa4BPjAB+BbOH8kMAL8bJ/lrrOLfLHtAxrQu1
         nDDA==
X-Gm-Message-State: AOAM533feIRSm7DucKd4QQtfK3h7Gu9ysMnMiJiT4RPk+DFhE5Oj0P+0
        d0RZSGSfUbK8uSgQETYyTm4djQ==
X-Google-Smtp-Source: ABdhPJzw3f3gkzpKAwQ0uyoeYmo+r5kpFcXB7aMm1k/7SkFn2k1TnTi0R22/muzrioD9WnnqHcEKcA==
X-Received: by 2002:a92:8e41:: with SMTP id k1mr1028304ilh.276.1628083786650;
        Wed, 04 Aug 2021 06:29:46 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id n10sm1069963ile.82.2021.08.04.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 06:29:46 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: net: qcom,ipa: make imem interconnect
 optional
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org
Cc:     elder@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210804131349.1179832-1-elder@linaro.org>
Message-ID: <e980c968-8365-efa7-f259-a51438d6f26d@linaro.org>
Date:   Wed, 4 Aug 2021 08:29:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804131349.1179832-1-elder@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/4/21 8:13 AM, Alex Elder wrote:
> On some newer SoCs, the interconnect between IPA and SoC internal
> memory (imem) is not used.  Update the binding to indicate that
> having just the memory and config interconnects is another allowed
> configuration.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

And now I realize I mistakenly based this on net-next/master
rather than linux-next/master.  I think I need to wait another
day or so before I can apply this to the right branch.

Sorry about that.  Please ignore/retract this, I'll send
again when I can, and will call the update "v2".

					-Alex
> ---
> Rob, Bjorn, Andy:
> 
> This was posted as part of a small series once before, and accepted
> into the net-next/master branch by David Miller:
>    https://lore.kernel.org/netdev/20210719212456.3176086-1-elder@linaro.org/
> 
> That series got reverted yesterday:
>    https://lore.kernel.org/netdev/20210802233019.800250-1-elder@linaro.org/
> 
> Now I'm posting this patch again (by itself, and a little different
> this time based on input from Rob) so that this patch can be taken
> through the Qualcomm repository.  I will be posting other updates to
> DTS files in a separate series shortly.
> 
> I didn't copy networking addressees this time...
> 
> 					-Alex
> 
>   .../devicetree/bindings/net/qcom,ipa.yaml     | 24 ++++++++++++-------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index ed88ba4b94df5..b8a0b392b24ea 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -87,16 +87,24 @@ properties:
>         - const: ipa-setup-ready
>   
>     interconnects:
> -    items:
> -      - description: Interconnect path between IPA and main memory
> -      - description: Interconnect path between IPA and internal memory
> -      - description: Interconnect path between IPA and the AP subsystem
> +    oneOf:
> +      - items:
> +          - description: Path leading to system memory
> +          - description: Path between the AP and IPA config space
> +      - items:
> +          - description: Path leading to system memory
> +          - description: Path leading to internal memory
> +          - description: Path between the AP and IPA config space
>   
>     interconnect-names:
> -    items:
> -      - const: memory
> -      - const: imem
> -      - const: config
> +    oneOf:
> +      - items:
> +          - const: memory
> +          - const: config
> +      - items:
> +          - const: memory
> +          - const: imem
> +          - const: config
>   
>     qcom,smem-states:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
> 

