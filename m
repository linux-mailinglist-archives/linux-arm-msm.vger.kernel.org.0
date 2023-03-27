Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC016CA808
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 16:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbjC0Op2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 10:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjC0Op1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 10:45:27 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F223A80
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:45:25 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id cn12so37267440edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679928324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouLLhRGSc37ctiW42nuOQEAfoH5XSsW+Yy1/AaAURCo=;
        b=Y230m/yQEmB3+efvyiaUegMpdKugAsQUwCe9outGsIqBW7gY0CHQCSMgXZsJdMjomO
         sUjCr1rzdCU4Bi3UY6uAqg9qcaQroU2bMGDmRBA6NsbqMs/vQogG0HUIPDSVPYgvhpf6
         epf+bp/dlBwmrIxqXPXKufmYkEVaarOxY5YTZUmr5xrAvwglkxlaPAfxvcOewjkO6aBy
         q2+qyzEAE4D70myY7Vnw4L/TufwzlHuC9DGIIseeZkKTsEy7hCM2ByhiOR76nhfeRffK
         FPOHkVm1ORW8bDTP1wTToCipXyu50751JAOIjId2ySlJ2johS+NvZk2cfC09+t0Jo/43
         Qj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679928324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouLLhRGSc37ctiW42nuOQEAfoH5XSsW+Yy1/AaAURCo=;
        b=QLpyLYTOb94eOJ4lPX/ZY4K4uEnPQ/IHfB6pGhB7q1IC0koUcmUE5mY0kXGBlO5G59
         MtcKW3N+pK/Oy1KqmlENcQurMRirxUfVqgclQPp1924MzdTefl/67VbDKN/8gRVPbnoC
         WkZfMh2Vzh9Acv4VOmEzLgRPSFPVH4Rwhe0IjxT9Im7DkCqeppPsCuT/Oci0Vo3UbYvK
         zQOdbOTYT1RNdCbyT+vN3ZdgO/9KSthoLrjXmjBD71jVyrhVBaBrTLtvDGcIOG1RDCl1
         pb/9e3Qa/FYtWmDohL5t+ouO1YBhc04QLmimEqWOWdkmLTfPtxfWNLu6SLfq+V+Hq4oC
         t3Sg==
X-Gm-Message-State: AAQBX9cF0ew1NaDMKcKbqBZF1tjQLdY1iSequuE5o9J5aEFmlGXg0Cj2
        xLFjl2PsyVy6WfRFM3nW5NDXsg==
X-Google-Smtp-Source: AKy350aAutV9mY4m3so3zlzmSeCW61dhmnhh2Px85UoWBO3vKsRJo8Y2J3+Hf/UMW7o0gT42z3ifig==
X-Received: by 2002:a05:6402:5163:b0:502:2440:577e with SMTP id d3-20020a056402516300b005022440577emr10573323ede.16.1679928323799;
        Mon, 27 Mar 2023 07:45:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm14886080edf.50.2023.03.27.07.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:45:23 -0700 (PDT)
Message-ID: <aaaaf2be-15dd-02d8-b815-905ba4585478@linaro.org>
Date:   Mon, 27 Mar 2023 16:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/7] dt-bindings: ufs: qcom: Add ICE phandle
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20230327134734.3256974-1-abel.vesa@linaro.org>
 <20230327134734.3256974-4-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327134734.3256974-4-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 27/03/2023 15:47, Abel Vesa wrote:
> Starting with SM8550, the ICE will have its own devicetree node
> so add the qcom,ice property to reference it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 
> The v3 (RFC) is here:
> https://lore.kernel.org/all/20230313115202.3960700-4-abel.vesa@linaro.org/
> 
> Changes since v3:
>  * dropped the "and drop core clock" part from subject line
> 
> Changes since v2:
>  * dropped all changes except the qcom,ice property
> 
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index c5a06c048389..7384300c421d 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -70,6 +70,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,ice:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Inline Crypto Engine node

Didn't we discuss to disallow the ICE IO space if this is provided? Same
for previous patch actually...

Best regards,
Krzysztof

