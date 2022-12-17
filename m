Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A90064F8AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 11:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiLQKa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 05:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiLQKa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 05:30:56 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4F01FE
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 02:30:55 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b3so7159111lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 02:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1SvXii5PTAZCHNkSSTga63MoYXczONoXbYkDQKcWaQ=;
        b=yEBK/Ucd7z3O9HbtmCv9oKUqtlU4RvOoLWuuaanK4MeNdJZHIPfLj7Y8YDhxF2ZQs3
         KIJOmYfPS6S0ZDyzyFDPl94C1GI8OpSvSiy3bSfPVvhD7rPvvnqteclSggoIAcKujvc6
         ugEfYrhKDUr8ImX9UBnBPIi2ksm2y4h1f6F8yfFgdmavsnvV98i/8jNo+lZlmJdm0AsZ
         nacbITE+rluFBe7Z7tmaB4E7fjmg3oBAEopYKpnr+azs4PJHn67OGmW3eZoIdVNrUB9S
         MbLhzZ4Uu0f+7mGgsWFxxDqaWoBmkW1f1CTcLrQmMqa0B9X/JRcud12DvURS5+Z9UDJc
         vN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1SvXii5PTAZCHNkSSTga63MoYXczONoXbYkDQKcWaQ=;
        b=eBu9Bx+v1fBoncTjrDQIgiJ/j3C+S09kO/rgZvyVlVz3Sia+46E9Dbg456i9PMdxG4
         hnfjVl4ghgVOMGPIaV+4XNgvfp0fZA3jmhnihpp5clNgLIcFfPhGpyJhPD+e11sSMYpG
         zNTcZ9zV36IntUUg77SdY3BCKZ3D7RhArOxD/GUwtvs22mAlDrTw9F664x8CmKb5UZre
         F0ORPssT4MUuOBOnBZBwiwS17lZDhLseRk3Re72D2pxzJJ4pmjzHbr761xdmsSeNo1XS
         7j0D3TqiwIpMb8ZZ3eA8WGNUguCnBbPWdIKv1gQn7xF4Vw8BFbLBJYlhhQ6iyuF0ExIl
         hfsg==
X-Gm-Message-State: ANoB5pnE8Edh22XeqwLpY/XER6i32sF2s/ygNMJYRZtswEbI2zQb8ORG
        YleZyzidxEa+EgEbNDmrYY4KQCgic1vVZ6BR
X-Google-Smtp-Source: AA0mqf4qAO0/khCt8VR3woObARs2bY3GIkrQzRqH6+psQH8v/PfdhcjDGbOyZHL4t+PMLhL08mgwJQ==
X-Received: by 2002:ac2:5a43:0:b0:4b5:90c5:281c with SMTP id r3-20020ac25a43000000b004b590c5281cmr9616250lfn.19.1671273053858;
        Sat, 17 Dec 2022 02:30:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 14-20020ac25f4e000000b004b591c33b99sm477968lfz.13.2022.12.17.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:30:53 -0800 (PST)
Message-ID: <bf9ad239-e490-4258-b58f-2c43bffc5139@linaro.org>
Date:   Sat, 17 Dec 2022 11:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
 <20221217003349.546852-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221217003349.546852-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/12/2022 01:33, Dmitry Baryshkov wrote:
> Add bindings for the PM8450 PMIC (qcom,pm8450). No driver changes are
> necessary, since the PMIC is handled by the generic qcom,spmi-pmic
> entry.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

