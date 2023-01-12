Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE14666EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjALJvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbjALJvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:51:19 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1FC186C3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:47:05 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d30so22722451lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v52ZT5Dn8ZjNQ+4UbgMztxg/QD2KxIsCHG92el7/AjM=;
        b=luvJKwraFmhJHB1d+2LxEw5Y346BtylFim51WTbD7ApW/LV/S6rpJduYMTq+4ML4zS
         f9zERst6gicx4wbpuzC+lnUKPhF84exmx7KkKmpYG1roqam4QhINeW0XZxAWDVDNLclG
         4yNa9Th6lG2n7rGU+1oJvSKQp9orZzL9YVhrc5zfGwAHC6AFPFrX0pFzSPHU4pRFUNRU
         kj7giu96yMDMe5ohMtiw3St3DjzTWehrLpvqOBKcc41EJW0x6grf0VW4DItKVMnK9G3e
         MPvo5LHoRnuZwU9hKPAgjSc45J1iz7q/NWjBR7zc4qzTTJ7RQxwzlsUEBbtIdoOA7f9S
         claA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v52ZT5Dn8ZjNQ+4UbgMztxg/QD2KxIsCHG92el7/AjM=;
        b=i4Eq8GmjQI1PC5tyNekofwJVkbnrnbjIkpyv6YCPfg/pBjCXXHIHpJPi/Hj4XfHeaR
         ZdkI2A42ckHBERU35YXeD5QWLPr+NYRH83wAEjH5vxnOzPGk5iRXEgL3xygl4nx/oGST
         KgFuu9rf4W5k9qlorez2IC/AQaDHrM3r512sGpy2JTK86H8nYe5YHuX+zrO/aG+wyHZj
         ZHtK/zXb2RdL4oalPR9kibVLCDzx9JvGTLMawQEnRlITqDuN7fHEvzqeDEMQNnlr8aa/
         e5oFabe9tox6XFYWSNvkD5eiJkaxL2pPegeErkUszLv+QTDYuFI0o0bPyR8+IaNj7clF
         nL2w==
X-Gm-Message-State: AFqh2kpPyVK25LE1koG9ppHnT2XYD9v2QDvH/BSdKL0ZITl0TOV8BTsp
        663uFuC9h2sFlvj+Hqg2BJiNkw==
X-Google-Smtp-Source: AMrXdXu+MSa0BMhmYhMdLuvTnQMsSSFUWVCb6sQstQKV7ytM8CA8fJWoSqioWXrNywDf0MCsNPgwhg==
X-Received: by 2002:a05:6512:110c:b0:4cc:a1a1:9aaf with SMTP id l12-20020a056512110c00b004cca1a19aafmr516956lfg.23.1673516823295;
        Thu, 12 Jan 2023 01:47:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bi41-20020a0565120ea900b004cc7026d95asm3133647lfb.259.2023.01.12.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:47:02 -0800 (PST)
Message-ID: <6cccd502-3514-df72-ddea-1396ca6c5c76@linaro.org>
Date:   Thu, 12 Jan 2023 11:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a0f77ba9-5d39-7253-dc83-1b5ac0a43adf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/01/2023 10:40, Krzysztof Kozlowski wrote:
> On 11/01/2023 20:57, Dmitry Baryshkov wrote:
>> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
>> between two CPU clusters. The CBF clock should follow the CPU
>> frequencies to provide enough bandwidth between clusters. Thus a single
>> driver implements both a clock and an interconnect to set the clock
>> rate.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>> new file mode 100644
>> index 000000000000..2080e1743b2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> 
> Dual license, please.

Ack, I'll fix it for v2. Do you have any other comments for the file itself?

-- 
With best wishes
Dmitry

