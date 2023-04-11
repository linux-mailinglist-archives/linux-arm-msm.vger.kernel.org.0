Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7BF6DD266
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 08:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjDKGIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 02:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjDKGIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 02:08:34 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE49F1704
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 23:08:32 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50489c7aaaeso1611699a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 23:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681193311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0wdQswGgGzo5SVYT5Df7lFHKiJvWvSUXWKfPfISDi0=;
        b=TnHyVykqJzIt+5W3SyW0V/fdq1iBvel9MqqYf9L4RHbK7kBSrxI28k7llAZj4lAy/d
         yoI8GvzlgjUOApDGR0PNuGDtEtik0eE6ABHN0s46DIwrL3sR7czI4STx3GcUo93yJEm3
         De2XCvVUQeAy8y74AHPpY0lg5d3bJ7JgRLlu55PVt7gGlw4Ih3blAZPMJ4qtP8Nw9VDq
         DvkTf7/X3dFg970rdXtcuza3xD9h6u3NUACSG8TDgnAxGpYQt/HvWy5j8qGmrhWcIiUj
         caozLg36g8wRsx7ratJXJK5BsBtF/0kpM2oAh4MvCI5BCGtFhV5lAeLhLxUmgpf8PJaH
         y3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681193311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0wdQswGgGzo5SVYT5Df7lFHKiJvWvSUXWKfPfISDi0=;
        b=T2i7/kqg6hyAxTNCx46sp/74d/QsueA34VQLHF7/AEBGxeGGtCIg1h1x5r/ZmgCOv5
         5axU6WwCUvBLinDLQYTKibBpmZCf+OHJ31iq651129gCIgXB+BrVaiEIuJLGUx58DqnT
         nPTcWEjzcJexy5/w8cOpJGOnv0DpaqGJI8fFD4usETPklHJa3P9opEOmg1is8RlDVlpE
         O7dbxCL5FlHgxW5VBVvW9e877Rkq89Tc/bdytTDiy9qCsT8xto6q3Zipl/oJSTAq/Wea
         thKaAZpOgjvgA7Nvvuv4nqGhpGF8BFxXv2EEXqwOLOV9UKMfjBktju3E27fFiBwZDCuR
         8NnA==
X-Gm-Message-State: AAQBX9djnCRofvqxkggk8kvzNYYPm0GUGd/uHOIUQfCvZwMczfsLMdh7
        I30wwKqphgc7UY/AVAWTvpB7tQ==
X-Google-Smtp-Source: AKy350apHQuaa06lXNLg6Kw+tyBrCNGRSncGSd0hCc7kJ15X8+JNj0OIO0X9fW8IdEh7f7bWj1k9Og==
X-Received: by 2002:a05:6402:1a57:b0:4fb:4fc2:e600 with SMTP id bf23-20020a0564021a5700b004fb4fc2e600mr10117998edb.42.1681193311257;
        Mon, 10 Apr 2023 23:08:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id a71-20020a509ecd000000b00501dd53dbfbsm5546829edf.75.2023.04.10.23.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 23:08:30 -0700 (PDT)
Message-ID: <ac5e196c-a8a9-f51d-4419-5692314fe5c6@linaro.org>
Date:   Tue, 11 Apr 2023 08:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 4/5] dt-bindings: mfd: qcom,spmi-pmic: Use generic ADC
 node name in examples
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20230410202917.247666-1-marijn.suijten@somainline.org>
 <20230410202917.247666-5-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410202917.247666-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/04/2023 22:29, Marijn Suijten wrote:
> Update the examples to reflect a future requirement for the generic
> `channel` node name on ADC channel nodes, while conveying the board name
> of the channel in a label instead.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

