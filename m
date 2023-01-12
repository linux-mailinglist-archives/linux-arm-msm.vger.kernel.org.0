Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4CA66715F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 12:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbjALL4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 06:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjALLzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 06:55:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E8313CF5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 03:47:02 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hw16so32241874ejc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 03:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGzW9qZAMmN/tdzXE4FhYbEHcPw2BPw4NCydtP4EU0w=;
        b=XaLu2HmBDvDPgdtpjyDbPohywbzh0GFCxW5YovIUzapa+l0Fp0Vfs9alrzQMkzrwRR
         HWaxpDMUeQsZGkCCKjSNW5KXwZskSF75U28X6UmODYV61tr09qFGC50JCFSVdu19YpZS
         LQHB1iKZxIwL3gx15FHXrq3oiERlOPMDfTby4tn+vQDZIGhOALCweZMuASjqNTfyg+AV
         XLbr7jMLBaTyYI0kvsroppJMkLFRHnPLYYnBx/pHlQ6ifSn9hiReYHHj9slSzYuLWGC2
         bZAGCs5A1B6wAmRpzkhjTGjYYKUzVF1heoaWEjbv2+ybR2ERX05VlwPA2VsRW4Tm6xBX
         hekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGzW9qZAMmN/tdzXE4FhYbEHcPw2BPw4NCydtP4EU0w=;
        b=Kf1aEppoD9agudpbk8Z05r+RwLeCHa5tZWF3rTBLb9k+2IZMi+FHywO/8V5O6KaI4q
         VaHfcRkP1uGG23IbNbLacyKk2EyENhr9pX9QHfiknT8U46T3bmDehPAWVSqhGfePDhdk
         p33ndSrcBZcP9IahAFUiqUlnjjlVca3Ura/GeOJO4L1ODhtCSkNwPLPNycWc7p4yYpxR
         YzZq3NGGmeNCm9jA2KRLMj13LmgxKzMJcB0axf2NACRBiMba9ECz7v4ap5egxIhyy7tE
         6z6LMl6EbPSzx9Wzv6f7gISW+bvG+SZgC0TcZ3zzvzilScyHW+QIHj496QwuVL9ndBtl
         b6gQ==
X-Gm-Message-State: AFqh2krSd35DPQDWC+TQ6vOAaG2/nGsv5myteHFSigpA6qlM9cDjXbYE
        baHY+MLDR/2bqFUwF8qavnE0vJdSplglM5P0
X-Google-Smtp-Source: AMrXdXvqJlbOHNjFyRPqs9jJrJ++oOLs5Q0r93Y05LLCG2Jre98CkWLV5dXmR9PphMfYaxDGQ2AUQg==
X-Received: by 2002:a17:907:6f13:b0:819:2756:e090 with SMTP id sy19-20020a1709076f1300b008192756e090mr60800322ejc.50.1673524020590;
        Thu, 12 Jan 2023 03:47:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c6-20020a056402100600b0046b471596e6sm7083713edu.57.2023.01.12.03.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 03:47:00 -0800 (PST)
Message-ID: <10707618-2f82-8ecc-067b-ff839e0dad30@linaro.org>
Date:   Thu, 12 Jan 2023 12:46:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
 <a0f77ba9-5d39-7253-dc83-1b5ac0a43adf@linaro.org>
 <6cccd502-3514-df72-ddea-1396ca6c5c76@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6cccd502-3514-df72-ddea-1396ca6c5c76@linaro.org>
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

On 12/01/2023 10:47, Dmitry Baryshkov wrote:
> On 12/01/2023 10:40, Krzysztof Kozlowski wrote:
>> On 11/01/2023 20:57, Dmitry Baryshkov wrote:
>>> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
>>> between two CPU clusters. The CBF clock should follow the CPU
>>> frequencies to provide enough bandwidth between clusters. Thus a single
>>> driver implements both a clock and an interconnect to set the clock
>>> rate.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
>>>   1 file changed, 53 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>> new file mode 100644
>>> index 000000000000..2080e1743b2e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>> @@ -0,0 +1,53 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>
>> Dual license, please.
> 
> Ack, I'll fix it for v2. Do you have any other comments for the file itself?

No, rest look good.

Best regards,
Krzysztof

