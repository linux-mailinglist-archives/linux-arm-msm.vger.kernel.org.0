Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736FC436C42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 22:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbhJUUhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 16:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbhJUUhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 16:37:32 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496BFC061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 13:35:16 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id b188so2592900iof.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Wg0Jus9TL4rCInXKPmpU7yOccL+OmPZ9RnN1FPY/86c=;
        b=akrkvWstL+3WOecYTO0PLNiiDc0WcMR8iMjDJN29uVq6E7oe5C07mh6zjJq8DsaaUh
         7ysysm8AJ978/Upa9Ap1QP7OMZECXUUuffq4VEXB8nEOHpVx4cIOialsQo4mAiikBXyc
         HpqxRb9EMBOT+q2fVDVEHkLwDk0qrrGI324DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wg0Jus9TL4rCInXKPmpU7yOccL+OmPZ9RnN1FPY/86c=;
        b=dhunFVCPQkEU+VCtKoIWDtXne8A9a0djN6Y+7KZuIZsnHJIVTpN8mnJ7RWSuVuGDrA
         9cLQvy2uGI5yJL/wFFxQb78g1ySOQ11U1SXUYbflhtxzCpFgg/5h7SHNT40BScuA/xUd
         /psEKFatiEud/ZQr6t2Q9r+vFM/ZO+R8w704NEIexC8neQfBVvQI5ZiyIo/loA+PeJ8M
         ptJWOlUqMhxUzpXnP/M+yfSZ2wIudPxZ8lF+dVnyyfsECqDJ7xGr+ow940XCgbq5iGda
         eTStMrC/m3EJDGOqeOTVQry5EFOLxsL5G8QR+gIM6w0s3adF6VR30SAEH7HVfkSjWrSk
         388Q==
X-Gm-Message-State: AOAM533z3N1FDbGZZSmmQ+d03UWmFguW0ZPW09F+8m9nAntndDOycDxC
        EDKlwUH2RICW1bumw0cX3NQu3W2knaOlEA==
X-Google-Smtp-Source: ABdhPJxUpkvVKJYdnJ8nWqoBfp2mW3VqpjVlNca8iPS3DV7G82q7NyyNf02/PAqc1mnDNnnBbp4A5Q==
X-Received: by 2002:a5d:9d82:: with SMTP id ay2mr5527961iob.128.1634848515695;
        Thu, 21 Oct 2021 13:35:15 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id e11sm829754ils.34.2021.10.21.13.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 13:35:15 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: describe IPA v4.5
 interconnects
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211020225435.274628-1-david@ixit.cz>
From:   Alex Elder <elder@ieee.org>
Message-ID: <05b2cc69-d8a4-750d-d98d-db8580546a15@ieee.org>
Date:   Thu, 21 Oct 2021 15:35:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211020225435.274628-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/20/21 5:54 PM, David Heidelberg wrote:
> IPA v4.5 interconnects was missing from dt-schema, which was trigering
> warnings while validation.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Can you please tell me a command to use to trigger
the warnings you are seeing?  I don't see an error
when building "dtbs" or doing "dt_binding_check".

Thanks.

					-Alex

> ---
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index b8a0b392b24e..a2835ed52076 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -95,6 +95,11 @@ properties:
>             - description: Path leading to system memory
>             - description: Path leading to internal memory
>             - description: Path between the AP and IPA config space
> +      - items: # IPA v4.5
> +          - description: Path leading to system memory region A
> +          - description: Path leading to system memory region B
> +          - description: Path leading to internal memory
> +          - description: Path between the AP and IPA config space
>   
>     interconnect-names:
>       oneOf:
> @@ -105,6 +110,11 @@ properties:
>             - const: memory
>             - const: imem
>             - const: config
> +      - items: # IPA v4.5
> +          - const: memory-a
> +          - const: memory-b
> +          - const: imem
> +          - const: config
>   
>     qcom,smem-states:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
> 

