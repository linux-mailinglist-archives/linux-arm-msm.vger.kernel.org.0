Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993C265AE4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 09:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjABIm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 03:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbjABImN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 03:42:13 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3523218D
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 00:42:11 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j17so31251373lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44Gg/E+60UvNm/zwJ/GwqJLenp9GbVRI1kXpTzUKZJk=;
        b=BFqeumzb49ZeMtVivm9iBOL5l7oADVEsqpP+abm4S/L7kSHd11pXNPQAmJb/v6PerF
         8PEX+9DNdoXUP3UUrEdEGRZ7B/tDxA0m+UEwuTu0lH8iyQv66HWJGXiiEamhZ4wNmAPu
         wpdCzdfs4PwiUtt7+iKmhXupaTwpB24GNdQjWyyLdwE9C9kCh1r75BRmXyaSXg4X9sbh
         RGIz2C7MeTHRqMR/owAFOgNK0X53P2LDrwZU7VHN7hH5sc+9UAiI/nzHiF+UhbJT339F
         l+0tLhYBCEfNh5DCo6T8qMmx/Vs+dVb9rCU8uOEb+1GIyZ9sam5E7ccSCBWOAt2habR6
         LsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44Gg/E+60UvNm/zwJ/GwqJLenp9GbVRI1kXpTzUKZJk=;
        b=UgwvGzLlFsjkOv1QmoswJbAx7pjthZ0JWdeUPTCFLa5I6F17qcqZsmik4HtfNqPEtS
         kKKgudQk62BiYL+QKzH97pyKsnUjYrPVigS3OFt+zj0PjcXnkiyNV0OCQm4GrT/NxjRC
         g3XO3vnTer6hDGTQIqyrRo1bJrPymRoaPBvyMIflXfUSpmTXwKAgiNmIJygDTjwFYStF
         GeG+AZebE6AORBSM5TH9JmctfKMz4VTMbvE/y8ccCaIRq/mn10E40mfwCVSoaVhzREuc
         Uk+8kQh35Gk8rMqJtbbpsy0ZCTAUpL7Pgw+uANs7CdlKXJEjtMX+iUHAMCXGxOx9amDy
         1YUA==
X-Gm-Message-State: AFqh2komV0zcDIkGTaPgd2udCN6mjDUA1AlwVUXS/21Vz7bKURtsTYQy
        jiiXu1dRgPJT0NTO7J61f4PA5A==
X-Google-Smtp-Source: AMrXdXuSYB6Ypu8VhVshvFBUv0zv6QTztaMRnbrMlzbnT36iZpGXUpCoiWEkKwO4z9aYrwQM12IEDQ==
X-Received: by 2002:a05:6512:224d:b0:4b4:b5d3:6603 with SMTP id i13-20020a056512224d00b004b4b5d36603mr18605012lfu.32.1672648930209;
        Mon, 02 Jan 2023 00:42:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bq28-20020a056512151c00b004b1a5086485sm4399091lfb.2.2023.01.02.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 00:42:09 -0800 (PST)
Message-ID: <c6671d78-33c4-226e-b0de-ea8daaab0019@linaro.org>
Date:   Mon, 2 Jan 2023 09:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 02/20] dt-bindings: thermal: tsens: support per-sensor
 calibration cells
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
 <20230101194034.831222-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230101194034.831222-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/01/2023 20:40, Dmitry Baryshkov wrote:
> Allow specifying the exact calibration mode and calibration data as nvmem
> cells, rather than specifying just a single calibration data blob.
> 
> Note, unlike the vendor kernel the calibration data uses hw_ids rather
> than software sensor indices (to match actual tsens usage in
> thermal zones).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

