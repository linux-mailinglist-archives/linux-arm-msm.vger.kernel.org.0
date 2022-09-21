Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1715BF604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 08:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiIUGA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 02:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiIUGAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 02:00:55 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59B05AA2B
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 23:00:53 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id b21so4607816plz.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 23:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KTDGCxw9K/m0IE28tp7il5a/gdZmEgkpTgtAKS0w1hU=;
        b=zavTnr75v0R2Jmu8cIoC0kmMrrhsQQvbhW76Hf66/C/jT2G1mWEnnpJ839PsBq9ELp
         WFiSsmkvt/IRYSgzyhQZrWfyWDBFRYEclPg69lfizcQH8FTm6mcKCIY3RVp9ovgBAZqn
         FneLIZUucl1wT2e1UotyqMwmUJIsNdx9CU548SnPmQfYWrYCsRqzXlQlcF/r7DEd5vkh
         P++dGV1h5bDlep/rHlOeYtQc7prD+FFwcLltzSbrZL2ebtvx32c7hQVjVlxQtGgYB3sA
         fSzp8HAmHl0ezYQJtWqGLgk8IDLleBqVMVq04kaXPjLNGp5rPrbCfGRA+8rjboJj02oM
         UqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KTDGCxw9K/m0IE28tp7il5a/gdZmEgkpTgtAKS0w1hU=;
        b=pQzRgjfAkmlANiCnVEri70hwLo6z30/nQwoeklc+VpMTgbMEIhl+h3ZEOkcOA5c9CZ
         Nis9YJ6Yo4AB0xxHnnopdYGccnLgr96/BssCAo0IjmJab4+j47NOhG9g24O9mbIItAbL
         tOiRVhsuXA0dZBJlCdDSRk1lXw8LBaRVLEeV/ex4evZVb+8psKSh10aa7/qTe/lkhm5n
         qcgDD/x4x6q2VYXWOVgpGDpYGoCS5cB9gEGXlmJw5qFwudDJI3hrG9kw3lrVR78olxAf
         PZunCaghrqjQyTkLyK/226aJiwhOHFtAERVUeqV8LXI7dQKYfMH7SRfBdzn24YblWPe9
         utAQ==
X-Gm-Message-State: ACrzQf0W2zcPrBovU6ahwnnDvCPeCB7T2/cHOIw01ZgIu+r2VNzTFFUt
        Bzam5FsckwHBKPoFur/zYzornA==
X-Google-Smtp-Source: AMsMyM48UUe5Twj+PpfUDK1ckCFUCCN/BxyPPQt5HtY9M4iS4sCaXZhdfbYcbPvZflpt/9ByE6wOgA==
X-Received: by 2002:a17:902:f394:b0:176:b7b7:2 with SMTP id f20-20020a170902f39400b00176b7b70002mr3132765ple.57.1663740053290;
        Tue, 20 Sep 2022 23:00:53 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c61:8e50:8ba8:7ad7:f34c:2f5? ([2401:4900:1c61:8e50:8ba8:7ad7:f34c:2f5])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b00177efb56475sm998181pll.85.2022.09.20.23.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:00:52 -0700 (PDT)
Message-ID: <05a1447e-51b1-cd6b-36bc-98f011e786e0@linaro.org>
Date:   Wed, 21 Sep 2022 11:30:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 4/9] dt-bindings: qcom-qce: Add new SoC compatible
 strings for qcom-qce
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, andersson@kernel.org, bhupesh.linux@gmail.com,
        davem@davemloft.net, Jordan Crouse <jorcrous@amazon.com>
References: <20220920114051.1116441-1-bhupesh.sharma@linaro.org>
 <20220920114051.1116441-5-bhupesh.sharma@linaro.org>
 <0a6b443c-33b4-5fc7-5a2f-e55f5387999f@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <0a6b443c-33b4-5fc7-5a2f-e55f5387999f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/20/22 8:40 PM, Krzysztof Kozlowski wrote:
> On 20/09/2022 13:40, Bhupesh Sharma wrote:
>> Newer Qualcomm chips support newer versions of the qce crypto IP, so add
>> soc specific compatible strings for qcom-qce instead of using crypto
>> IP version specific ones.
>>
>> Keep the old strings for backward-compatibility, but mark them as
>> deprecated.
>>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>   .../devicetree/bindings/crypto/qcom-qce.yaml         | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> index 4e00e7925fed..aa2f676f5382 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> @@ -15,7 +15,15 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,crypto-v5.1
>> +    enum:
>> +      - qcom,crypto-v5.1 # Deprecated. Kept only for backward compatibility
> 
> No changes since v6.

Right. v7 is just to propose the new subset of patchsets and ordering 
(since we changed it from v5 - which was a single patchset) and get some 
early feedback and comments and get to know if the respective 
maintainers are fine with the patch ordering, cc-list etc.

I will surely include your comments in v8.

Thanks,
Bhupesh
