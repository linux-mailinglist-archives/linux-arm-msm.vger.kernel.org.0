Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFC942C0E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 15:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhJMNFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 09:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbhJMNFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 09:05:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65173C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 06:03:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r19so11423133lfe.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xmuT9xeRK5cWZopfiSt9NYASECgS6H526juk6qVcf6Y=;
        b=bhJtNTVffPAWj3bWjiyg1XNff6CIL0ethU3UFC+Jd+DnHtjxo12nSgxlfLMmmb6CPt
         siEVuT7n0M4u8v4qcz4WNWm8Yfd/YzZeOLnsOchW4hKrVaj7R0OUhLEUfGYtuaNI02WK
         abSOrX2NC4EWixZcDM+o3bppZLQ/R7QU2Eh4UPimpYHre7QK548w506afrux9NaaCWXa
         gRzT2jeQvxsedaYFV+dsnHcOAWdO0bEKzac8MQ4PMICcz2CaRDoLX8C9cYExZ3qvOypr
         upUpsABkjHNmyEMFPmGOyJlgKdYkz6fnZ/nFlYqblT5iQrm+JhGsGcRaqlnldpcfMqWj
         dM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xmuT9xeRK5cWZopfiSt9NYASECgS6H526juk6qVcf6Y=;
        b=A0VCrSrJusXEL97t66O8baIrZ+1XcOIUvUbkBHW437sHpDXgAI6QTyWShiRLPcUi5z
         XBugks714rlXslT3+ENz+BOo4ldwU+6hrLgt1GxeyzuYXpAYyMWjP8LAzSefqgsVi+UD
         aIySnoC1Bd3cQsOj7Akr9dWCDOYzsIZnsdlEN9ix3xis6JFjyMsEizlrB/N4E0Xx7hUx
         hL5IwQcypcbgMgygoQX0H6b1I9bVkAdTyPLbxRZGzuRrzlO8E8JzIuRRaUSe/dtNdRtI
         eip9y9ii09xuH9fcHQSY7x91gC6bbnZ3H/qg/7sg6TGS309aGvw+Fy7jkF1wTI/V2LRQ
         uLiA==
X-Gm-Message-State: AOAM5309AEZQTqHEsXeOs08hbRhb+ysAHiEUEdgLQGgJgKFucBIwma6H
        hDkAjyYaI6UYqOXLQ16ZJLgBzw==
X-Google-Smtp-Source: ABdhPJzpH/vyOQKE8IJaZ0pUUxvPYUM/9nVGmH5nItOlKHI44htq3EZ0V+Qcw7jafbjgP3CLvou04g==
X-Received: by 2002:a2e:a584:: with SMTP id m4mr14952888ljp.489.1634130183009;
        Wed, 13 Oct 2021 06:03:03 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id q1sm1328352lfg.18.2021.10.13.06.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 06:03:02 -0700 (PDT)
Subject: Re: [PATCH v4 05/20] dt-bindings: qcom-bam: Add 'interconnects' &
 'interconnect-names' to optional properties
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-6-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <6d325686-461a-b321-148c-0142933a29e4@linaro.org>
Date:   Wed, 13 Oct 2021 16:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-6-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> Add new optional properties - 'interconnects' and
> 'interconnect-names' to the device-tree binding documentation for
> qcom-bam DMA IP.
> 
> These properties describe the interconnect path between bam and main
> memory and the interconnect type respectively.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> index 32b47e3b7769..602e68df971f 100644
> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> @@ -45,6 +45,14 @@ properties:
>       const: 1
>       description: The single cell represents the channel index.
>   
> +  interconnects:
> +    maxItems: 1
> +    description: |

here I have the same comment about the set literal style of the
multi-line description, which is one-line, likely the specifier
is not needed...

> +      Interconnect path between bam and main memory.
> +
> +  interconnect-names:
> +    const: memory
> +
>     qcom,ee:
>       $ref: /schemas/types.yaml#/definitions/uint32
>       description:
> 

--
Best wishes,
Vladimir
