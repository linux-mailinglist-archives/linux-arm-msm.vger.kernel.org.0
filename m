Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F104350E2BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 16:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbiDYOOa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 10:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234033AbiDYOO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 10:14:29 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF6D5DE45
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 07:11:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gh6so5818652ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hbNq8UvBnN7+r4Fd2yWxDnQ9hsYwZngmugC9ubWuoPM=;
        b=tM68+Ax+c59zekowsoZDmmi4d+26x0+qsaJ+zYByavNorx6Uq9ihBhPkrjYGueEand
         YbXMfFOq9veOveoLIodGDVBpDL1InoOVXLlB8n5GOcTVlN9jC6FG1YQZh2/AsoDVpHhU
         LOvw3okgzu+aa3brpJxC5a0sT1LJNVySGwT9X+9k5Y1Le8GmmHJffJzjJGI+71L0fUKp
         30LTUUICVyXh6EQIQCXxjCo7jmuq9Ih2n0+QDYhTQnxbyCLpwLvoi2qo6RZKN+pw622R
         ecGpGQTPbtkRYZ5tEOZDOKQeO7pDs+IsKLr9KoUveEgJOmQ2iFaN+/l1etXZPfS874bu
         zGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hbNq8UvBnN7+r4Fd2yWxDnQ9hsYwZngmugC9ubWuoPM=;
        b=c1q+HEkKNH56qd7+rhLKncvyvqtA3WD1KT0DDAAumsClyUsHpFpbjyCDUrU0S1Bm4s
         0W+KwUysSJl+ZiqLcrOb7TV/A6++4xijErk9srpUqga2M1fq7mzhZKQazA4gwhGEFrfE
         NLf79+gvXomB5Wrz5N17RH2m+WoqTmVa2iOrjU+ZAwKEleZcsINp0gjd03pz5/vzJykG
         uKKqOURkmhHX2eTAzdgVA8j/QrIZGawJvu8i2bVJCTABi7jlCPGg0TBsJIcSdjxn05c/
         HL93lAP0rirXp/xxsrtajekICznuCUjG2lY3n+8F/Ib0yasqh95iBWbZh5r+ZJ3gisBd
         tRDA==
X-Gm-Message-State: AOAM530iOOKnCnYl0rjI+DvtpJCCiYJUu9ySCin18UI3cf5liJDSkFvB
        uTPb8+MrxPIRutEQSGKI4+h7kQ==
X-Google-Smtp-Source: ABdhPJxbhn3boE1o3X/8j8VbZQ/AXjtkDwzYBO0vBbDatkzQ9OM04+IR/v3GrPVceJO4HphUCbP7IQ==
X-Received: by 2002:a17:907:6d08:b0:6f3:9c6a:d82f with SMTP id sa8-20020a1709076d0800b006f39c6ad82fmr3326924ejc.632.1650895883017;
        Mon, 25 Apr 2022 07:11:23 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f1-20020a056402194100b00416b174987asm4775820edz.35.2022.04.25.07.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 07:11:22 -0700 (PDT)
Message-ID: <6ce4f8a6-42c0-2f49-bd19-744d8cca716b@linaro.org>
Date:   Mon, 25 Apr 2022 16:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: qcom-ipcc: add missing
 compatible for SM8450
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220425134717.55418-1-david@ixit.cz>
 <6f72be3c-c907-bc7a-6b64-6becfc76934e@linaro.org>
 <33da014b-bfb0-a39f-aba7-f469fcb5cfbb@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <33da014b-bfb0-a39f-aba7-f469fcb5cfbb@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2022 16:05, David Heidelberg wrote:
> On 25/04/2022 15:51, Krzysztof Kozlowski wrote:
>> On 25/04/2022 15:47, David Heidelberg wrote:
>>> Adds forgotten compatible and update SPDX header.
>> You need to explain what is this "forgotten compatible". It's to vague.
> Forgotten by someone who implemented it in driver. Hope that clarify it 
> for you and possibly other readers. Btw. qcom,*sm8450* compatibles are 
> widely used and fact that `make dtbs_check` noticed it missing here 
> isn't suprising..

This has to be in the commit msg, that you document compatibles already
being used. "forgotten" does not explain that.

>>
>> The SPDX update lacks answer to "why". There is no reason to do it, so
>> please explain why it is needed.
> 
> Please read https://spdx.org/licenses/GPL-2.0.html (red colored text).

The kernel lists it as valid SPDX and we did not deprecate it. For the
kernel it is still considered valid.

Feel free to propose otherwise but then you need to explain it in commit
msg and update LICENSES/preferred/GPL-2.0.

> 
> I personally encountered situation, where usage GPL license without 
> specific `-only` or `-or-later` caused unnecessary confusion and 
> uncertainty.

Could be, I am not arguing with it. Yet kernel explicitly makes it a
valid SPDX.

Best regards,
Krzysztof
