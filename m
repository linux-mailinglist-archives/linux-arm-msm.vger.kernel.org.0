Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC1B5E5B74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 08:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiIVGgP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 02:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiIVGgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 02:36:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C554B603F
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 23:36:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o2so13012050lfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/sdjh02mE/SwIBy9BvwTWzCrb2uaUdQhgWPujtLokpI=;
        b=jDX5A4bzS6ImCNWPXKQIbzs984rLqA8YysFxfSRnRDcn3CzqXbW4jMLq3JC4h6hBh5
         kKui7pP5Q+YbOpqzjDnCHCvQWbRnHbmNe319BJrUU6pWzZ2EZXClOjUiilupN/o7kkio
         8hXkRs5c2CnKWvPu395WLgBdFUa+LNUaOPxR5U9IrT/q3E8MJT65eDGQYlU4zGpgJuzb
         eHHODAlppEs7ve0NuXo4ULr6ao5YTUQG35eqzMxK/TGXb2nnZGVeGM/11NjoW1hMMNdw
         aSl5BAoCStMkRmz5tLZDlNn/zD6h511AmZNTURFphRtQtP4WwPFWRHAt4p+m35U1yOhy
         Qn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/sdjh02mE/SwIBy9BvwTWzCrb2uaUdQhgWPujtLokpI=;
        b=06w0c2L/zL3r99NP2q3qmldzUJNEUcgv1fYfR2H/8WZKr1i9xL4Fz9PHtHj+3phn9T
         WeuBwLWs3ceW9P+HGSTLN9shjK1uy5+duL5AGRG9uBS9rDJQCw62oE8lwPG7GTF1ych9
         44mbPU01QvH2/8nNQmvmMxrM3NCoeaibmsgiIq5pGKKU3DJ/5d9HYid+OqScDFozWCxs
         H6fAY7iLDKg2BG2paXWZGiFpIXUCZtFOHJEpCt2RdLEq7Qyh3K5Mm3guNw/S/EFSVZFp
         OpbPzD/sLodsVWJQW3+GVvZu+XPhh/Z/W79h1bHR9E89ajdI4ICOsQZ/QASbcP6CXmxI
         HpGg==
X-Gm-Message-State: ACrzQf2wT52tGBYWkSEporLODB9o5OJ7kfYGds/9BZNlBNUKrhYemORZ
        FHljfKz/06JO6DTfG8MGWKM+Zw==
X-Google-Smtp-Source: AMsMyM7eMr3Jw/nqeC8AFHLZsJf1omxJggP3TBkTPQDhdmwYiKmFT0oUiIBa+iv5nrnw7FzDDHn44A==
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id bq14-20020a056512150e00b00492d9fd9bdfmr619586lfb.583.1663828571965;
        Wed, 21 Sep 2022 23:36:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o17-20020ac24e91000000b0049964f68457sm773293lfr.262.2022.09.21.23.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:36:10 -0700 (PDT)
Message-ID: <10415506-306f-6090-feae-b255c810d462@linaro.org>
Date:   Thu, 22 Sep 2022 08:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: firmware: document Qualcomm SM6375 SCM
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220921001020.55307-1-konrad.dybcio@somainline.org>
 <95fb2bfb-6eb8-012d-88f8-c739d229ef70@linaro.org>
 <8faecd72-0cfd-18eb-d07a-53b3a23ed05a@somainline.org>
 <f997cd3d-95c6-972f-032a-7646855371e1@linaro.org>
 <df1e64e8-93e4-48e9-f49d-d85360ac006f@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df1e64e8-93e4-48e9-f49d-d85360ac006f@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 23:07, Konrad Dybcio wrote:
>>>> allOf needs to be updated.
>>> Does it? I did not define this compatible in the driver, so it does
>>> not consume any clocks.
>>
>> It's about hardware, not driver. Hardware has some clocks. If it does
>> not, then you need allOf disallowing it. Otherwise what do you expect in
>> the clock entries?
> Ok, so if I understand correctly then, all the compatibles that are in
> the long long list in /properties/compatible/enum: should also be added
> somewhere in the allOf: tree?

Yes, because the clocks must be specific/fixed.

Best regards,
Krzysztof

