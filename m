Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70A5554C47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 16:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358004AbiFVOL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 10:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357785AbiFVOLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 10:11:20 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C43A38D8F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 07:11:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z7so24069398edm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ey/PVhwFwmiflue8IgUrnjeGcTu1hXobwGVShAy1U7w=;
        b=W4mGxtxM07vPcfChT1Jr5zDHmnoyhEApT+6vyFDC8SQe4e/OPByREImABdaprqHhvj
         0NbnKhIu4a/FK1pFD94PnIdY2OkJvunjWIcwazj240hTyVCd6ycBp0TjL0OGXemU1+hr
         B0QL061gPqnTqioy5uovxhBjLGiP+HVtIKfyCY2ZYmyOCpRL33GliU5i+YvysfnPX3lv
         cbuI1bUKsnW0r6Xtr04Mlh0aTG8M1rNja3baFbDpaZM464JnuLYd6fTDfXwprobxOqPm
         PoqqyIhxiwvTf0tT7pUz+rXTwjS6TLj4nacUYpTCno0w0ALQyiq/AykUIgN2D8WdWq5r
         B4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ey/PVhwFwmiflue8IgUrnjeGcTu1hXobwGVShAy1U7w=;
        b=F07umzKBN4VBHqnNAMoHl+qfZgx2ZnQ7hfeOYslh+FcE0h6M+HQRByWIlCLKAct9Zq
         Aqc159R/BY3XyQ5I9JU+bXegHiR5ygXVWq326Af6yPHnLPkJoD5pzY/Bj/k8b6+PbD7s
         j3bFjvAJ/x6Z9sA2SY+sWEvJYo+98YVB9F3BLbqaaaY1D/pm3nFIFq5fInf0Q8nhd2ai
         XzC8FEVX/psTjJeqcWb+vKJS2fnZQMESgMaafcVhpwizGRBxAFREEqdLgkxul+O3b/KK
         uN5OuxDDGylLb6eAkio952azQkV3U1/mrJ54maT93rjoBsinp/x5CKOfXma3cuWlRdde
         Tkig==
X-Gm-Message-State: AJIora/U9CnQMQgowETuqUs3Hc1KAtAAXgGhVIRfRufaiTiSdphWSWw5
        /2wZ7mqf9D4meNJ/H8/hvvwbzQ==
X-Google-Smtp-Source: AGRyM1uipKL7b2qeDL98PtiWayOnowqzPfHC4FvtEQXBTcro7rvWkk6yotJcjdLfzp0jeQdrVw/kXQ==
X-Received: by 2002:a05:6402:430e:b0:435:9e41:6858 with SMTP id m14-20020a056402430e00b004359e416858mr4401131edc.69.1655907076865;
        Wed, 22 Jun 2022 07:11:16 -0700 (PDT)
Received: from [192.168.0.225] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f5-20020a50fe05000000b004356afc7009sm11254538edt.59.2022.06.22.07.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:11:16 -0700 (PDT)
Message-ID: <f7e066d0-3493-f531-3357-10dca20e1f95@linaro.org>
Date:   Wed, 22 Jun 2022 16:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add SA8540P and ADP
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220622041224.627803-1-bjorn.andersson@linaro.org>
 <20220622041224.627803-6-bjorn.andersson@linaro.org>
 <8fc661d7-6f75-59d8-fa19-76193ed2f4fe@somainline.org>
 <YrMc0Y7PIDQpP2xw@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrMc0Y7PIDQpP2xw@hovoldconsulting.com>
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

On 22/06/2022 15:44, Johan Hovold wrote:
> On Wed, Jun 22, 2022 at 02:37:02PM +0200, Konrad Dybcio wrote:
>> On 22.06.2022 06:12, Bjorn Andersson wrote:
> 
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
>>> @@ -0,0 +1,427 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2022, Linaro Limited
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>> Can be moved to SoC dtsi.
> 
> No, the SoC dtsi does not use any defines from that header file.

Even if the DTSI used these constants, it is a good practice to include
headers in each file using them. The same as we always do for C code.

Best regards,
Krzysztof
