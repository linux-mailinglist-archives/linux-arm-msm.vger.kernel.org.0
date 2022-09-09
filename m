Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4C55B31CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 10:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiIIIeM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 04:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbiIIIeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 04:34:11 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694C412A324
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 01:34:10 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id l12so958313ljg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GhuZE0UNBi8kX4BsTrV5f7Dbqipm2ZQg6A6+Dv8U8ug=;
        b=sFrdtPsbZ2J+0sOzysaj2EegZ/+pQlwhHsN9wUY/S4dJ5BRVYVIMmLeewBqCgHmcEt
         L2I+sLQMqD1WIFHsI7oJs+UwYqtQ10j8KAvzf2wNuWp3wubkRG79DC2WQfIhextmZ1xV
         QIewhRhNAj2zLXOYjAC3CbuPharTR+9IgXek7hSPj4KfRxxl/i6TiAkDW/b/jO/eVcvC
         vvPwDjEjNd4i6cGA4FhUP92BtgHZo3TxQTZCGgZObZphvS7a/+3or3ta0ubeWHUgSjRM
         x46FZCJg6WMjnpBhNVyJsgRgVbHrQg2QKccwyqpgQujCqG6vmRpMGeXtu29MKCVK2EYP
         SpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GhuZE0UNBi8kX4BsTrV5f7Dbqipm2ZQg6A6+Dv8U8ug=;
        b=Z47SyBTHBKSnw2qyX/mqtt3Wk2Q4c9cwr9DO4e7qXZJuQDaXegcmZVoBj6Yapl6ldQ
         UNkEakv/GWvoOo4ABaIuVS/G+mY+4PrFV+bQouDy3yhLx6pK2ScWlqUp8AES4HOo6W+0
         RlZmfL9lNGGR/bynLsG2pKRdlvsBidxG5swSR1MDqUbzB0vUpqkRjgFccPM02cqkMHjk
         g+UWBaZxnBsa3ZIltk4yvrtNDovA6lj1HtnyOhMx31MirfD57Qgr0Nr8xf1O1mdrT0pI
         fz6JdUi+OjoHZEqLB2+JEnDOEl6hJWLJqeM3VcPXlbBQ3KZlvxjvIfhWkLswz6GNoWHA
         CMsw==
X-Gm-Message-State: ACgBeo2KPjvjn5AjMfHsw8a46/bi8y2oRfvOR4L9fuYaMSBR6Son0aUJ
        xIIqSa5zaMA3/nwLGk2/j5/YKQ==
X-Google-Smtp-Source: AA6agR66EW4UmxcTCGM+cVfjkM40+nz2dHEvq45jSqhRckZV7LTmoog5wolrJk+2MzbFOxwOumorYw==
X-Received: by 2002:a2e:8711:0:b0:264:8da5:7a52 with SMTP id m17-20020a2e8711000000b002648da57a52mr3411127lji.173.1662712448818;
        Fri, 09 Sep 2022 01:34:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g15-20020a2eb0cf000000b0026af5e69177sm193847ljl.80.2022.09.09.01.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:34:08 -0700 (PDT)
Message-ID: <ace096c1-65e2-35a8-8a13-cd6f9921cbaf@linaro.org>
Date:   Fri, 9 Sep 2022 10:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
 <20220908182433.466908-3-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908182433.466908-3-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 20:24, Stephan Gerhold wrote:
> qcom,q6v5.txt covers multiple SoCs with quite different binding
> requirements. Converting this into one DT schema would require
> several if statements, making the DT schema overall harder to
> read and understand.
> 
> To avoid this, follow the example of SC7180/SC7280 and split
> "qcom,msm8916-mss-pil" (and the equivalent deprecated "qcom,q6v5-pil"
> compatible) into a separate DT schema. The schema is somewhat based
> on the one for SC7180/SC7280 but adjusted for the old platforms.
> 
> Compared to the old plain text bindings, add missing documentation for
> the "bam-dmux" subnode and recommend one particular approach to specify
> the MBA/MPSS "memory-region" (the other one is marked as deprecated).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> "dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC" [1] should be
> applied additionally to avoid a dtbs_check warning related to fastrpc in
> msm8916.dtsi.
> 
> Changes in v4: Add "unevaluatedProperties: false" to smd-edge
> Changes in v3: None
> Changes in v2:
>   - Add blank lines between top-level properties
>   - Drop "deprecated" in "oneOf" list, it is not clear if this is valid
>     and it should be redundant since the properties itself are already
>     marked as "deprecated"
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20220908181432.458900-1-stephan.gerhold@kernkonzept.com/


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
