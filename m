Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDA06D3FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 11:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjDCJJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 05:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbjDCJJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 05:09:26 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D198EC6E
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 02:09:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ew6so114357863edb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 02:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680512962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1Pie9vLpSoU3Q5Det2G8XSc6g11vynQ88xBxnFyU1o=;
        b=lLaZshO//K2mzRsps+ik6PQi8aCsNNpx5qVHs0MyrsqixikW2NaPhTg3VbY/xqph4G
         jdtFy02/fSrwtCLykKrzdqwFXHJ0+15krQDuoIk56LNiZWCmggffxgAsLJwS8mspz0mU
         QQD2vns8/DeVLSd0vdTQ4DMoQF5wc5xxeQpeDGAjdkiLY1cKb7H5Lp/gr7irePE67PEK
         VSOFkPtItTB0xAjpCBwY3AIdvOIIvNqcG1yg4KpxpRrqiNkqBCnqNdadNej0glatAjR+
         foP+CEk3JWMH8rkH24YLB1q2to1sPJCeFwhUTciYuW1RO0F18Ky1zmSSvxzJ2rohROB8
         SIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680512962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1Pie9vLpSoU3Q5Det2G8XSc6g11vynQ88xBxnFyU1o=;
        b=3VOhb7HCA5Cdw0GHwWP/pvaS9X0PRSJwwyTlxA728sF2aTwB/vyKmGoYSSfiiLd5ea
         AwkprurgxPO0nrDL90liaZwrSYflOc25QMIw2+yK1iaLPT0Ep4smBOcbDyegAqVKdXT5
         p6AAFPxudueSyaTrcayT6vMppjk7U6M9PzPgrtOxQBJgfv0iKsHXFe/7wfrokW0eFrJW
         r4P1wwYBC/2VayrUtHE6q0Q72GHUNcp+f8pDeyNQzHGEPnarodkLwyB3RNaMi3ymshnX
         mAKS/v0MXGTfPhtl60aNvmOTl0HV+qkZNlkiFPmEgml49Vu7QFKIwljkPOeesuEcC0DU
         Molg==
X-Gm-Message-State: AAQBX9eID1F+nCvAPapO7ybTEGnPWWqUIblplJupTVaQMCZoxSAMD/Em
        h6XuHuj+TYJoIjJdDrSVjkTVeA==
X-Google-Smtp-Source: AKy350aBG8Lw3tiTi4uyEzvdUWZZ8/wJbCudRE48u/GHRB7fv3HG8fwgC+JXiU5egzSazrIqYWAfCg==
X-Received: by 2002:a17:907:c248:b0:931:ce20:db8e with SMTP id tj8-20020a170907c24800b00931ce20db8emr36625621ejc.51.1680512962044;
        Mon, 03 Apr 2023 02:09:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906d18a00b00923f05b2931sm4245192ejz.118.2023.04.03.02.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:09:21 -0700 (PDT)
Message-ID: <f31cfa7d-08cf-efc1-322f-a8e4bbe76476@linaro.org>
Date:   Mon, 3 Apr 2023 11:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: pm8350b: fix thermal zone node
 name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-3-dmitry.baryshkov@linaro.org>
 <47efb05a-d1e7-a3c5-c423-4eb53fe86386@linaro.org>
 <33430a31-b9da-5f1c-bae0-9ec6f24fda99@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <33430a31-b9da-5f1c-bae0-9ec6f24fda99@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2023 13:02, Dmitry Baryshkov wrote:
> On 02/04/2023 13:34, Krzysztof Kozlowski wrote:
>> On 02/04/2023 00:07, Dmitry Baryshkov wrote:
>>> Correct the thermal zone node name to remove the clash with
>>> pm8350c.dtsi. Remove unused labels.
>>>
>>> Fixes: 5c1399299d9d ("arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config")
>>
>> Please describe the observable bug from that commit being fixed here.
>> Any future clash, which did not exist that time, is not a bug. It's future.
>>
>> Naming changes here are more a matter of style, because the old names
>> were correct according to our coding guidelines, just not precise (c
>> instead of b). But node names anyway are not important from the point of
>> view fixes and adding such tag will cause a needless backport.
> 
> It is needed. Including both pm8350c.dtsi and pm8350b.dtsi will result 
> in one thermal zone overriding another one.

I don't understand. You used future tense "will", but we talk about
past. So where is the bug in commit 5c1399299d9d?

Best regards,
Krzysztof

