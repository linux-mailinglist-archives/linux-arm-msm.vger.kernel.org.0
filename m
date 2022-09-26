Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C252D5E9C6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbiIZItH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbiIZIsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:48:43 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4D83C169
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:48:41 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x29so6642023ljq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dyoN5NkBMjN5fTrHiRf8M9wo3Eh26rWGMliaShD1tmk=;
        b=BD+lLtFdD0rf5g+823kwux0X8eeYS3fu/0vbz9T/6UhpzaHbVqcuWAAeGRcWPCFAky
         iT0j8JWeWZABFtsd3vpFyzHCA+XDmAsL0HkwzzxNof2S7+lkwqrfEFfuWePomLnPcksc
         5eZVDgOnAl9qKB5/0A0bbJoBVFd6VUoipR7VCPjsrKFKzv9DxqyEbzcTw3PNjpjEFwHP
         XPJg0kg/7sIjPkUvzpzXVvdOhcf+D4yXlVl+olUtZE03G1qFEMYpny7w979Mr/oXBawP
         iP3MNLidJccY1p9435TeCXnR0Ggnfr+kicDYq3AjtOoXVkyPWoRl4RM5NxNe5LABysCj
         G2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dyoN5NkBMjN5fTrHiRf8M9wo3Eh26rWGMliaShD1tmk=;
        b=StodMFwsfd04qd+GnG8tzyPmP5w342PtHF506oOHtLZQuWpoMYvrTkQs5lEjzD4fUF
         YxYA/xsDaUNGI1O119oZlgNfO4WpzF7J6/OoTHQ9oW/bavXWD6GktEI5L9jjLl2LovKT
         Nxh3xyQmsepy7SgEQGyPxt9w4+vowDT04GDseHZ1CarJIRZYF23pf6gGWMlu+FAjoZ6N
         ENroT7WYLP5kHSCSqRQonzUYZ3cp0/Jyyy+TBeV/4wb4AVIVmUuMD8oSMS198eCCtHeU
         FwVufZHR00jm4kFc3DH5vY824nu6ZfK8hq3GOn0VPftFN3aZc5XLcA/0DafBzp2TlB03
         WMfw==
X-Gm-Message-State: ACrzQf3bjo5l5Tr/D0tlmK8nRZkjJ2oCA/mul5RhTkVK08Vl4kAdmXUl
        UqMYfcmCMLyAFd4KAXvSVtQ+2w==
X-Google-Smtp-Source: AMsMyM4ml1rrIAAdDcF7x3+nZ6DRH+//vOF2T83Xh1IrnMXz3AhCGH85sn5jz2z/b+RKjUe9Gnigbw==
X-Received: by 2002:a2e:90d0:0:b0:26a:cd11:cb0e with SMTP id o16-20020a2e90d0000000b0026acd11cb0emr7103228ljg.444.1664182119550;
        Mon, 26 Sep 2022 01:48:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b24-20020ac24118000000b00497a879e552sm2449550lfi.291.2022.09.26.01.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:48:39 -0700 (PDT)
Message-ID: <1841f368-e9db-1662-e950-c162a6b17f75@linaro.org>
Date:   Mon, 26 Sep 2022 10:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: dma: Make minor fixes to qcom,bam-dma
 binding doc
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, vkoul@kernel.org, agross@kernel.org,
        dmaengine@vger.kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, andersson@kernel.org
References: <20220918081119.295364-1-bhupesh.sharma@linaro.org>
 <d7507d61-9d16-c2d3-2066-5e2f9afd6eb9@linaro.org>
 <d3205b59-6b6e-2983-9e2a-39354cd1803e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d3205b59-6b6e-2983-9e2a-39354cd1803e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 21:55, Bhupesh Sharma wrote:
> 
> On 9/18/22 2:19 PM, Krzysztof Kozlowski wrote:
>> On 18/09/2022 09:11, Bhupesh Sharma wrote:
>>> As a user recently noted, the qcom,bam-dma binding document
>>> describes the BAM DMA node incorrectly.
>>
>> It's a bit confusing - what is exactly incorrectly described by binding?
>> You did not make any changes to the binding itself...
> 
> Sorry for the late reply. Your comment just skipped through my mail 
> filters :(
> 
> I understand your point. I should have made the commit message more 
> descriptive (infact now I look at it, I see some key words are actually 
> missing from the commit message).
> 
> The commit message should infact read as:
> 
> "As a user recently noted, the qcom,bam-dma binding document
> describes the BAM DMA node *in the example section* incorrectly. Fix the 

OK, now it makes sense :)


Best regards,
Krzysztof

