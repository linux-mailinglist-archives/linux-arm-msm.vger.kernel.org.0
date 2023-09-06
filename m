Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442D87938BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbjIFJqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbjIFJqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:46:18 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AE619BD
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:45:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a5e37a39ecso487187266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693993546; x=1694598346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpgKjQLhOQ93Wk8rdTGVlihCINH4WJbFyOVsX4wLTx8=;
        b=SsIBq7X+nrJ55cfpq3O5UJYzXrYF6dVNqgMAp42TpsB7BuocDsgtBar0qh8i1U0p6B
         BliGSosFN+lV0qU2WHlPfgde4s3e3N8peniWd1YwbRO5nJK8ubFVGuwt5FJ9obf26ljG
         962dqbCJ2OiKGSrcHBt7oUkz9rh+wDLpsaMZ1Sg12bXB+qomPOvvJgAzlBsyx8EgtYeK
         rlr3X2eAXtmtC6dDU8POIi7yTt2g4vn5GZSrCMnpuaSZKMy65Gmk6fNnY6pkLoUHj/Sm
         t2HBaTOOT+qlTA5l6SS4rOOvAk9b7QQazwHLsZAjfnTl+XsEDaSXdFFBTuW2oijGY6ie
         3dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693993546; x=1694598346;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpgKjQLhOQ93Wk8rdTGVlihCINH4WJbFyOVsX4wLTx8=;
        b=Y0Xb4MxQvdIppaYiynDf6xlCjH21Df730CRAkgZ8hWy2CYDHjPftJ1DtegLaPo/gtV
         pqa6FSQXu5BbYPBH/wZ9EJbmFgseQWDQxIsnIVi26N2Hrm7RznGipniIKR0iKLWT8nRT
         MFxOZe6Zx1tRPOfkmeRIGnlbzshUPz84RSsfOBrKW9GxIc8ri8MzT23yVGrJoTJwDg0h
         7DAPEhRXFTwQLpAsdzDtS4c4zuLBygXZPneNcUU5L/d8fJSfP+DYB5tfgf67LVXbrNU9
         VQqlA5nRNQEDbjuMycVK6lx9C5t9glrYvTyi/OtYh/sbOGqS7ImKCGEUHgCS+UGRG90T
         mONA==
X-Gm-Message-State: AOJu0YwoVQuhDD08APAz88kljP3LqLSKWOJo87SlObgUwl5K87V4aNwQ
        kOXsKKij58PEQRTQ6aGSFGzPwA==
X-Google-Smtp-Source: AGHT+IHRBvxtxu53EdnqFdbHNayPQhFkJ6q8Z6Kw0L8S6AN2KG2r9bjbPVlc5WA2xA7hzGpBGtDTIw==
X-Received: by 2002:a17:907:a0c6:b0:9a2:86a:f9b7 with SMTP id hw6-20020a170907a0c600b009a2086af9b7mr1651504ejc.59.1693993545643;
        Wed, 06 Sep 2023 02:45:45 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id pk28-20020a170906d7bc00b009a1c05bd672sm8757855ejb.127.2023.09.06.02.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:45:45 -0700 (PDT)
Message-ID: <2104ccc8-8d71-f867-f3e1-2d4d02acb8ca@linaro.org>
Date:   Wed, 6 Sep 2023 11:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 01/12] arm64: dts: qcom: sm6125-sprout: drop incorrect UFS
 phy max current
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
 <20230905161920.252013-2-krzysztof.kozlowski@linaro.org>
 <e5c218a6-5b71-4887-b79a-9fd2dfb85009@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e5c218a6-5b71-4887-b79a-9fd2dfb85009@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 11:40, Konrad Dybcio wrote:
> On 5.09.2023 18:19, Krzysztof Kozlowski wrote:
>> Neither bindings nor UFS phy driver use properties like
>> 'vdda-phy-max-microamp' and 'vdda-pll-max-microamp':
>>
>>   sm6125-xiaomi-laurel-sprout.dtb: phy@4807000: 'vdda-phy-max-microamp', 'vdda-pll-max-microamp' do not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> ufshcd_populate_vreg uses this, but looks like nobody added it
> to bindings.

That's UFS controller, not phy. I do not see any usage of it in the phy.

Best regards,
Krzysztof

