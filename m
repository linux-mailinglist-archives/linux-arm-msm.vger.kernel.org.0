Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA0C55AC64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 22:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbiFYUKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 16:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbiFYUKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 16:10:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E763413E9E
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 13:10:03 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eo8so7911694edb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/TRe8PPkrucrwsyUREwEITQi4+bjFLceMfzbAkZcbG0=;
        b=CiU3XSV8upO14tCMCu3rQbOwKOED4tVHC7pKd8jZ7viQJDc9p8EbazI9ZG423jeGjq
         qiiT9TCnQYAMtmzmipG2bK9sYDXRG/qv+BWcKlR2NpZEwBSdq8fezAEgf4Xok3QQQRx3
         1lgk3AR9pxIwRBuyu8QMlEfPXJBDQD2io48ZeSCrF3OK53y6dmAB+Hb4ksYCyA7EvZEC
         0HRYEXCGMP2wGJfFknw8cTJsgScOL51Ly3J7wBdWhR58YCe3saopw49P1JbJL2guD43J
         6+QTZ6r1KCXqReHxj933InUTEznT7K/j27y5dLVak7JlYr1eINE6SjdXvdFYL2k/7t20
         H53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/TRe8PPkrucrwsyUREwEITQi4+bjFLceMfzbAkZcbG0=;
        b=cT1sUQJQW87BeXS6pl0NXIratos9BKSRrjDR2Yij2TevcXIgAoCTeCP97t4VK6LIJb
         ZDiEzWgfQo2V9RZ0Gzp8lbySt3ae0L55ry1GP7FiePEv8CmIXqsK36839BKuC5WXH+tj
         ePlpITka4IKGD9xSnEG0sOfmLjabVfRM50zvyM89PC9nQy2Nld25ULJUQsBgx1cGAzXM
         dEledx9XVAOvsT2+8RcZ9+DNzpyfqcXa63xEdtx6HbbTJgD35GXfIcvlCPuohsBhKFY0
         PkBvN2hTHYWmYo763iT2ePAj2F4Btt0V0M0hWdsaMKShcfb5OR+YvsOCAYXr5UgY0xNG
         OhHA==
X-Gm-Message-State: AJIora+j2LECjJxmT68vIhp32T00qXYtP1xx6knR/MVKaN13Cachq4Da
        TWWrq/SXzY9ILPnF+O7yU906MA==
X-Google-Smtp-Source: AGRyM1unaOf6CkbSeUN2QjTDqVjdaybkJc2p/Cqy8w+rraAvjGRsT2ODM6UG09B7qmtVXEKEbMwBEg==
X-Received: by 2002:a05:6402:13cc:b0:435:557e:6325 with SMTP id a12-20020a05640213cc00b00435557e6325mr6735502edx.83.1656187801802;
        Sat, 25 Jun 2022 13:10:01 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709061b5700b0070e3f58ed5csm3001017ejg.48.2022.06.25.13.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:10:01 -0700 (PDT)
Message-ID: <46ec1f38-dcbe-f87c-4f37-999d24eec522@linaro.org>
Date:   Sat, 25 Jun 2022 22:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: firmware: qcom-scm: convert to dtschema
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>,
        David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220623182542.1116677-1-robimarko@gmail.com>
 <26cdc24c-e0e8-1059-f6ca-11c08615eeca@linaro.org>
 <CAOX2RU7aEaBt_PYS2UA6BES+dJgx4n2QPHJ6yWYWZuTt2SLXoA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOX2RU7aEaBt_PYS2UA6BES+dJgx4n2QPHJ6yWYWZuTt2SLXoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/06/2022 10:50, Robert Marko wrote:
> On Fri, 24 Jun 2022 at 11:52, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 23/06/2022 20:25, Robert Marko wrote:
>>> Convert bindings for Qualcomm SCM to dtschema.
>>>
>>> SoC compatibles that were used, but not documented were added.
>>>
>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>
>> This was already submitted:
>> https://lore.kernel.org/all/20211218194038.26913-1-david@ixit.cz/
> 
> Hi Krzysztof,
> I was not aware there was already a version sent, just used linux-next
> as the base


lore and "dfn" keyword. Several people are working on Qualcomm bindings,
so that's the only way to check it.

> and it wasn't there so I assumed, will search through the archives next time.
> 
> Anyway, that attempt looks abandoned.

Let's give few days to David to respond and to re-submit. If he does, I
am for FIFO approach. If David does not resubmits, then check the review
he got to be sure there is no need for same feedback.


Best regards,
Krzysztof
