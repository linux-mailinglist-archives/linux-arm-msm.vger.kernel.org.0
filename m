Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7819F53FD25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 13:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242617AbiFGLQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 07:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242657AbiFGLP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 07:15:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40B85FA4
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 04:15:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u12so34509327eja.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4fN31emiPSLrSSZpsn7Oq3o1ezw79oaA/r4pVULki3E=;
        b=tQY36N5MGuxHc3V9UqHKQuIQQ4aHKA7oOVp5CmeU6mfN4lFe6xAQF6cnDBGT7nlERl
         wTa7UnZ6mu1DqWXYcGvbyypxI0R7TzsEwcMvyfMZwho4d49acw9GDBbI/Ib3Dp5DAhv/
         oqkSNaEGkV4YgLbLwJq3cQuvi//h1J2gZqMFgRt059TK+OAn35WnJOChAayryzg1nh23
         nEQkAP4sQ3o0UxRLEUpEuDJWdZrRj7jwl+r72lvtEXSvExcM2vvzsW+AGxWZ1OkWAOTy
         YDcaC1JYUEZH2HMLiPU+0cPodpOEdnmvJTbSDTL8nKRwGO+dguWJGv8NDn3/ncuBTPkp
         yB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4fN31emiPSLrSSZpsn7Oq3o1ezw79oaA/r4pVULki3E=;
        b=w32O+CSJ9KTHaXHeoy7NB+5rbljlGngBtFgPxojHLPbGBwCFgIykOGKjvnM8u6OkrY
         Z5X9gdanLyOT9hB/ZOCECX2NABlqYip65VAu2Gq0oYf+UCIl+3Zc6AscHCKby4NyzCAJ
         nP1NzU52HhYjLXT3CW+HowwafS3VsVzfGX7mSMD1eo2ilyWoUv0wDmxqsbuckR8uM/Z8
         wnG1jG8oXXgdB/ajW5+Hg3vXM5cJ9CE2LsMu/K60js6E6LBgXdZEqgrpA6kCoI1NdcpT
         NiwzKTvKtQ7iT+8cYM25GunxrsJHpNj2zBnO6RkXA8YMGT7xXT97PI9vAGVpIlNuyQCc
         5HZw==
X-Gm-Message-State: AOAM5318XaIgJwyLzyRBVBrLe6sZs9f8d+KOJdYZi89/jmgI55dgITBU
        D6l8dHWtXS8nKbOiSqIKB/yQQw==
X-Google-Smtp-Source: ABdhPJzSEMUZJ83C9YuQS9zQGX+1xBdQyT2SxdNEMEw0D4djkDKkCIanjUa1Ek6Lg3gxSg/s6asbZw==
X-Received: by 2002:a17:907:2cc3:b0:6f8:5a21:4d62 with SMTP id hg3-20020a1709072cc300b006f85a214d62mr27126205ejc.256.1654600553287;
        Tue, 07 Jun 2022 04:15:53 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u15-20020a05640207cf00b0042dd60352d1sm10203839edy.35.2022.06.07.04.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:15:52 -0700 (PDT)
Message-ID: <54015d41-d4eb-12ae-5bd1-00d2c3cf7814@linaro.org>
Date:   Tue, 7 Jun 2022 13:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: document qcom,msm-id and
 qcom,board-id
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Kumar Gala <galak@codeaurora.org>
References: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
 <20220529202629.47588-2-krzysztof.kozlowski@linaro.org>
 <20220605150747.GA3465286-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605150747.GA3465286-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/06/2022 17:07, Rob Herring wrote:
> On Sun, May 29, 2022 at 10:26:26PM +0200, Krzysztof Kozlowski wrote:
>> The top level qcom,msm-id and qcom,board-id properties are utilized by
>> bootloaders on Qualcomm MSM platforms to determine which device tree
>> should be used and passed to the kernel.
>>
>> The commit b32e592d3c28 ("devicetree: bindings: Document qcom board
>> compatible format") from 2015 was a consensus during discussion about
>> upstreaming qcom,msm-id and qcom,board-id fields.  There are however still
>> problems with that consensus:
>> 1. It was reached 7 years ago but it turned out its implementation did
>>    not reach all possible products.
>>
>> 2. Initially additional tool (dtbTool) was needed for parsing these
>>    fields to create a QCDT image consisting of multiple DTBs, later the
>>    bootloaders were improved and they use these qcom,msm-id and
>>    qcom,board-id properties directly.
>>
>> 3. Extracting relevant information from the board compatible requires
>>    this additional tool (dtbTool), which makes the build process more
>>    complicated and not easily reproducible (DTBs are modified after the
>>    kernel build).
>>
>> 4. Some versions of Qualcomm bootloaders expect these properties even
>>    when booting with a single DTB.  The community is stuck with these
>>    bootloaders thus they require properties in the DTBs.
>>
>> Since several upstreamed Qualcomm SoC-based boards require these
>> properties to properly boot and the properties are reportedly used by
>> bootloaders, document them.
> 
> My primary issue here is accepting this will be an endorsement for 
> other vendors doing something similar. I'm not against an ID 
> property(ies) in the root node, but would rather see something common 
> if we do anything.

Hi Rob,

A more common approach was merged back in 2015 - encoding this ID
information in the board compatibles. If I understood previous
discussion correctly, this common method was later used by Qualcomm DTB
post-processing tool. At least for some of the cases.

Other cases (several Qualcomm boards from different vendors) still use
these ID properties. It even turns out they use it differently between
vendors (e.g. Xiaomi vs OnePlus).

Important arguments for documenting these properties:
1. These ID properties are already on released boards where changing
bootloader is non-trivial or even not possible. It will not be possible
to remove these properties, without seriously affecting the community
working with them.

2. According to Konrad [1] (second paragraph), newer chipsets (starting
with sm8350 released in 2021) do not use these properties. These newer
DTS do not have them.

Considering 1+2 above, maybe let's document these properties as
compatible? Would that solve your point of "endorsement for other vendors"?

[1]
https://lore.kernel.org/all/20220522195138.35943-1-konrad.dybcio@somainline.org/


Best regards,
Krzysztof
