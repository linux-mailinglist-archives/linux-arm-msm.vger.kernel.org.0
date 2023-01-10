Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDC0663CFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 10:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjAJJfp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 04:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbjAJJf0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 04:35:26 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71F51759B
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 01:35:24 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so9334274wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrQ+JitbOECIDmgf2/u1/1zEEDmDsSRqp9Cq/AzQXQ0=;
        b=loQjDkRBkBqAGesdAJKVwXdr1EWle0ogRikYAZFq5P406xMPLYesNPr4Up06ii/Bnt
         OLKbWAgoQkT/oCGNlKfRLsCyC8TdDClFDct/3+MraZeDWIQl+UD2j0/n9SUHjJ4OwH9A
         X2G9Q4+xkhzmauIh7+bb9GtdS6iLYGI92uIKTFLPP8Ie94Z+wyyVONQe7bfO9xueJnOF
         QZGDxsyIMnT6eM/H3WSn9k27afZYsUUFFMye9EFNPjSe0FFo+Pl+GOry5AnXtwNgy4+Q
         nxAJwP3GIJHpdADZlBglkjcJ4vs0EWrN4pFAxkFSZ+OY9SlmzrVhUcO09I+68bZYbZii
         oVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrQ+JitbOECIDmgf2/u1/1zEEDmDsSRqp9Cq/AzQXQ0=;
        b=N9G/qe6TM7exCebxzdhV9eWIhjDUY9OTOyRQpk2YuQzn76Q+JG+eJzLit61ofWYwwr
         xnc22n0FHG/lt5DzJPcHBjQzoathv6qD3aD2l9j+extLlrd7QmHNr0D3VBtsiEXKR80t
         EQgZp+xsHFcwHm2Ol7JQ96W5dwuPUCL/z04JAcGzyDe68/uVAAoRo43AC10wzS35avrz
         yciRpJ/2aFsd6AlpoCYXPahvnjD2iMpyW46ISefZXyv4NFYJsrzw1jtiIpTf+4OD5LU4
         qdV5VflAtNZVKDMyPVXa9lccfNhP63uUKzrMTOhpHXaZvwBLLRQ29iaPX2q3U5DFWqVk
         FVPA==
X-Gm-Message-State: AFqh2krgSiM8LlTIMIbLDIQq4hrVXLGqOLtb7ymhYc6QsHZ8vrBfCeXj
        cLjcqGtTXXX8siGFOoBTeTkiyQ==
X-Google-Smtp-Source: AMrXdXvQ1wW/QgFW9/7W/HyD92nstJjTjaJu9SxRjN7GNXvC97zoJ1MgYEz/Ik0g8pkZvz8vJPEB5g==
X-Received: by 2002:a05:600c:3490:b0:3d9:ed39:8999 with SMTP id a16-20020a05600c349000b003d9ed398999mr6191599wmq.35.1673343323420;
        Tue, 10 Jan 2023 01:35:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y15-20020adffa4f000000b002bbec19c8acsm5383940wrr.64.2023.01.10.01.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:35:22 -0800 (PST)
Message-ID: <92955e76-807f-3a8f-8cbd-3fafdd8f2054@linaro.org>
Date:   Tue, 10 Jan 2023 10:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 02/11] dt-bindings: remoteproc: qcom,msm8996-mss-pil:
 Update memory region
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, robin.murphy@arm.com
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, amit.pundir@linaro.org,
        regressions@leemhuis.info, sumit.semwal@linaro.org,
        will@kernel.org, catalin.marinas@arm.com
References: <20230109034843.23759-1-quic_sibis@quicinc.com>
 <20230109034843.23759-3-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109034843.23759-3-quic_sibis@quicinc.com>
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

On 09/01/2023 04:48, Sibi Sankar wrote:
> The dynamic memory region used for metadata authentication would still
> be a part of the kernel mapping and any access to this region  by the

Just one space before "by"

> application processor after assigning it to the remote Q6 will result
> in a XPU violation. This is fixed by using a no-map carveout instead.
> Update the bindings to reflect the addition of the new modem metadata
> carveout on MSM8996 (and similar) SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
> index d3d3fb2fe91d..ad1a51c23949 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
> @@ -123,6 +123,7 @@ properties:
>      items:
>        - description: MBA reserved region
>        - description: Modem reserved region
> +      - description: Metadata reserved region
>  
>    firmware-name:
>      $ref: /schemas/types.yaml#/definitions/string-array
> @@ -165,6 +166,16 @@ properties:
>        - memory-region
>      deprecated: true
>  
> +  metadata:
> +    type: object

addutionalProperties: false

> +    description:
> +      Metadata reserved region

Blank line

> +    properties:
> +      memory-region: true

Blank line

> +    required:
> +      - memory-region
> +    deprecated: true


Best regards,
Krzysztof

