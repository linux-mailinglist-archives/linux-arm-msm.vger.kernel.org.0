Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB5B68DCFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 16:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjBGP10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 10:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjBGP1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 10:27:25 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04701C592
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 07:27:22 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ud5so44050333ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 07:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMQJ/M1Q2nvChk2Ny36EReTBD9rLHa0fXryg1T6cnSs=;
        b=qPz9ZOKomPDlWlpdZtYvkEaWEdiQh6WP1rtaHIF6L2itugID2Eh8iDZnrBObXefyh3
         aPzzxXxKbh8tRsqmApKRE2YGbZ7KdOFU+suxYagHPL6W3GHb8KQx741yr6A0welQoXoq
         dCmI192BDdcaIBMloCn2fUG9I8sTddl5krCAikEfbqN4iOXv/4SezbPkK2Dr3FgCqcoH
         H6qfprENl94FkLpvUvO+hmVRp7EOcxDP+IOVY2GG4HKHzsJpHtQkramcSRlIn9lf6eWr
         LzvqPs9s4xXEkfLVnYn/Mz98u+9wmIIRccoNXV8YJD0yZEmUOXLHwL6m2OlxCmJX1Ke/
         mFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMQJ/M1Q2nvChk2Ny36EReTBD9rLHa0fXryg1T6cnSs=;
        b=I00B5s7wwUxkEvJUSfNNODYuSQrppIup2ezBI6uop0vkU+eXgeMBcISIR6yxIWpUBC
         Cy1akeZyYF7ZmHPzMQ/tZWiBYxhbLEyNxkEsXVYh+dP8WMVvOtO8v7AbAdrmVhPx3d8N
         Jn1p31O/+HK9qBpr1TS0MRapuhMxW74n8InsmKTeQJ4DykfygCbZgL5wkBGjGI5zyxhz
         g6/tyzGTPzcxeGmYVJNNxXe16IZBc7GHzb35ctAXprjYoCkz23wNIrSf2fSBJr1nlCYg
         d7gjnJaSaF4XMA3Dho9OK57ugGGe7xVXNxMw0ZoMzPvJSDU/ckFYHSLOaAAhdT1/LDvs
         3GpA==
X-Gm-Message-State: AO0yUKXmTp6norr0e3G6S69QHm+TK11KgmVxgqaAjWsGjxIjOsDBSrKP
        qHdpVhsy9RcqsNcELUQ/F8UAyA==
X-Google-Smtp-Source: AK7set+RHdPVmS1IDz/HBvQqKkgitlTJqDiZH8F6izfjOiJN7vAGqja/pDFklu1JntBWHPPCwCmoxg==
X-Received: by 2002:a17:906:3e92:b0:878:4a5e:3a56 with SMTP id a18-20020a1709063e9200b008784a5e3a56mr2985735ejj.15.1675783641582;
        Tue, 07 Feb 2023 07:27:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q19-20020a17090622d300b0088a2397cb2csm7076696eja.143.2023.02.07.07.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 07:27:21 -0800 (PST)
Message-ID: <88c31e71-55b6-a20d-1fcf-07804eace54b@linaro.org>
Date:   Tue, 7 Feb 2023 17:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: dma: qcom,bam-dma: add optional memory
 interconnect properties
Content-Language: en-GB
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207-topic-sm8550-upstream-bam-dma-bindings-fix-v1-1-57dba71e8727@linaro.org>
 <a188a52e-6327-f0ea-a54e-a23b88bca82f@linaro.org>
 <a8112f61-f8d3-c1e0-9549-a9036a7e7894@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a8112f61-f8d3-c1e0-9549-a9036a7e7894@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 15:35, Neil Armstrong wrote:
> On 07/02/2023 11:32, Dmitry Baryshkov wrote:
>> On 07/02/2023 12:03, Neil Armstrong wrote:
>>> Recents SoCs like the SM8450 or SM8550 requires memory interconnect
>>> in order to have functional DMA.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>
>> I suspect this will not work without a change for a driver.
>>
> 
> I had the impression single interconnect entries would be taken in account
> by the platform core, but it doesn't seem to be the case, anyway I can;t 
> find
> any code doing that.

Probably you mixed interconnects and power-domains here.

> I'll resend with a driver change.

Thanks!

-- 
With best wishes
Dmitry

