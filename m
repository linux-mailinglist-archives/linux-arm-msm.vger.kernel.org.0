Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202805B16A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbiIHIPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbiIHIPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:15:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B17520AF
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:15:12 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x14so11086858lfu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=muuQhF45OaZyOm2z0HExOTDo4sMVAdp7hFpvyqoWEhw=;
        b=yPOvXpA1AHiFmr76cRX05B7gRZhuVGVWGDUIu//IKV6IO+JJN0vBDaIFkbdYB3GpSa
         XgcF6Gsyz8mqcdlizzur5nu+ok1MzQdN2p1+pqkbBFKnOKqLxXKcwQReZ11Vc6Fu/7+I
         qReST3geYLV3pXw8whw3+nKGQiN5SiFdfy163WLB9KfcNWaiW8Iw7D1sSQXGqd3O7vb+
         XjXqsG8IltrdpGCLSE0thqt4gq826HTFL0LF0jQQoNpMtTKsvb9zlJq2cFAU88l8Hzua
         f4XbF/DIoNB/JJQu2uaCBjLHOCsKOnXt/BJMqCokwf0umRzAuXwjlc4pcsxIEUOCwZCW
         voXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=muuQhF45OaZyOm2z0HExOTDo4sMVAdp7hFpvyqoWEhw=;
        b=gvWrJdGhbJdrKx0w/38xMQzOk56yy2+ahqXwpKEeJhM7gTEbSdSV4DzCtS94ZUfJ4o
         HqCpHC8BDDEfSTS8rLPyKQV+zJbXOo7tBU0IjyMEpA7uc9WpXwiuzCqKnNjoEeuitOVe
         ctWHX1/QeCnOlfPB+ZDrS7lVERXpXoN+zwS7Sv1W7pwPZeA+2rhXtwKk0Z614AiI/YJw
         4P2pjM4xOzX2b+2+L7xyX/RVbWLwfZQn0zZRa80xGMKJAbyYOggNQzsKncq9n9kizWrq
         +xrScjDvY7604bQBTbiRn2VvdNDiiWDhVySKZwmM50u8KLZqKLd2KKZYL1Wl//fWYIF2
         SjAw==
X-Gm-Message-State: ACgBeo39mhhZHaKoZ1l/GCgH51sq/cVODSND0dTFvJTfjNllwpt8OI6z
        aIlGkiRp5/UDbWJ7MrsoT1BT7w==
X-Google-Smtp-Source: AA6agR64n9V3ybonaiISQL54ikiAnmjYfX77MVIMYZZLkqFQRy4af8ei8POYGFVzSCQmLsWLpUbl/w==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id e9-20020a056512090900b0048b954c8e23mr2641912lft.670.1662624910531;
        Thu, 08 Sep 2022 01:15:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b0048b17852938sm58671lfr.162.2022.09.08.01.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 01:15:09 -0700 (PDT)
Message-ID: <9abc956f-17c7-60c9-4672-d62fe581f516@linaro.org>
Date:   Thu, 8 Sep 2022 10:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFT PATCH v2 02/17] dt-bindings: mfd: qcom,tcsr: add QCS404
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
 <20220817145901.865977-3-krzysztof.kozlowski@linaro.org>
 <YxmetuNRIgDhutKv@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxmetuNRIgDhutKv@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 09:50, Lee Jones wrote:
> On Wed, 17 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> Document new QCS404 TCSR compatible.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Merge conflict.  Please rebase.

I will rebase. Can you check if you pushed your tree? I see updates 3
weeks ago here:
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/


Best regards,
Krzysztof
