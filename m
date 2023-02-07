Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5747568D2F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 10:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjBGJiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 04:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjBGJiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 04:38:23 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3414224
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 01:38:21 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id k13so5498768wrh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuiSYsVuJ6KWzk0VqpXNXr3qlVlb53sqmaalgh7FtNo=;
        b=zz4eEUXyXp2H0aRViuE3mXijAiJdHAQZPmILz7T5CcSxHWbeEN/KdjnpBnfCSJAPnO
         ARP4tk24qTN/IkYxwpbJI2CYJrPFvFQMBs4CVUva59+MDYzq3ErAw0n84vzo9qtJxG9J
         YOYmzIdzTszM9zyNLAbIpXF+EUym4/nWtyy5uDDgCf+dYZ4SeC2hIvaIMfuNn/e21Yx8
         iHeLh6Gtlqo0VffA6rdxDLoIKpeMg8YMtMRHX7g4P60r2Oc2nHC8tL/Q8+HW1V0p6twY
         oQXQyotVp9kFIkX55XyGzz0GPTtDQf4uwVmAWaG4hvudfTy//KQ8K1eN5KnUnnSSuPsi
         ph+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuiSYsVuJ6KWzk0VqpXNXr3qlVlb53sqmaalgh7FtNo=;
        b=J86Sxa6KQ01nmWes7VooNaxbjasbKNU4D8CxD+/bPAK68sS7opH5juQVIT8lBsmKRs
         wNofp/Gm+IgEy3B773XZULVQalXEg/WbR9RBkOPx3PziWEk1BZlFXGjWdZEgpE9EvxhT
         UjoZGIL+N+xQJdyMXVYK706xbr9zoEFnav0ca/kwheJuiF4fhXVMBsIThCnzzouct7hr
         je82hCIxhjdUkVDfzqJ8ouzCFtW+sU0m9oSRwUtpQ/D5kb9n26BGLrkY55zo4svleC8F
         WP9/gtdztbfEdNXuEcBIh/p/5O1S9LReZmDh/097QexKtA+G2yLEu5DhDwOd0H5Y14PO
         1PfA==
X-Gm-Message-State: AO0yUKW+0EUsG+8kSHNmQcgrKk9X0haYnNq75yL6cB+SDY+VttJccKTa
        wJdH7+WqDXJtKTYMAz9hrP6+aA==
X-Google-Smtp-Source: AK7set8Vv+Qef99D6UkExXk5sgQoTlpukBbFOSpXzD72N8Kf0GOUFW6Vea7iLLB1oG40yRytg0FGgg==
X-Received: by 2002:adf:ed11:0:b0:2bd:e8b2:4da8 with SMTP id a17-20020adfed11000000b002bde8b24da8mr2014119wro.35.1675762700152;
        Tue, 07 Feb 2023 01:38:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3? ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
        by smtp.gmail.com with ESMTPSA id l4-20020adff484000000b002c3ed120cf8sm3453169wro.61.2023.02.07.01.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:38:19 -0800 (PST)
Message-ID: <fadf8933-21a7-012a-6f0f-4941a59f5e67@linaro.org>
Date:   Tue, 7 Feb 2023 10:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: correct power
 domains
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
 <8c819cc7-5071-376d-5c1e-c06555eed539@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <8c819cc7-5071-376d-5c1e-c06555eed539@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 20:36, Krzysztof Kozlowski wrote:
> On 06/02/2023 20:33, Krzysztof Kozlowski wrote:
>> Correct CDSP and MPSS power domains to match what is used in DTS and the
>> Linux driver:
>>
>>    sm8550-mtp.dtb: remoteproc@32300000: power-domain-names: ['cx', 'mxc', 'nsp'] is too long
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> And probably:
> 
> Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")
> 
> Best regards,
> Krzysztof
> 

You were to fast, I'm preparing a serie fixing all checks on sm8550, including this one.

Since it's the same fix, with Fixes tag:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil
