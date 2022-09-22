Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE385E61A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbiIVLrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbiIVLq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:46:56 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E454267
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:46:54 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id x29so10668972ljq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tTJpqulNTalAxQMSKHMc2wkq+qWBti/BYq6+1u3kzuU=;
        b=ir1pwH9bZAi5MqwskYwxYLbVt0Phuh61TYIxcCyyTviQafyO5f960A+6UDHQMLBMtf
         UrvQRaT78SaKv2Sh8gMc43zi76pVKaIjmwTD28kkRyT/d+DZ2GT84fwH5amfJD+UepdC
         dVWrrtjRNQejIsK+slKsNVbAd1XeeFNwB4VqMaiv8F+BPzTY6CGM9w4eqfG3vn1/fkJG
         LF0TTA6mkFX2isnfqrfjulGffDvlUe4J6+Q5p7/BK56DQFoPMbuWZQQYvlfvnZwilaHw
         5Z1NgQhFL7Y30PNg0kO+E3dGDumQzH7HIAHgmJ5K2R4jzrP3Qyf+1Jqy2uRZ67BUl4Fc
         +YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tTJpqulNTalAxQMSKHMc2wkq+qWBti/BYq6+1u3kzuU=;
        b=6IQHCOOOyRGPMIwdzi6flSZMXB+vQmOc32r4HECP4ieKnqWNWUMeIl7Lup+PTqcpJv
         YsJ8lThe0lFKlvzbvzoTmwG7la0jqZT+3m2zBZjQlgi4pIoalc1fcXND5tnabKF9+cgS
         PGHedA1cgEgjUpMkUphp94raHJOLpL1+MkRwxZXMZSwBM3sZWtKd86XNQwmeXXp5neX1
         AjJxdL0zWGus/MYJ3ChSZDynl+kZctBphGWJllCLRf1kbxugbRqVT67aaKl1B8gLp4AD
         FaQvcKBxSAcbT/jz0Le03HFBicYS2B6md/UsG3Pm2ZB5oxWORiVwJF9RelnltKawcdRB
         twqw==
X-Gm-Message-State: ACrzQf1EFTctrzfJT+7Ba/xY7xB6Z4SmfXRUneVqtf+bibOl+3SFvfpX
        gc8wfKaJ2oAjFlOCcXvbms1Zgg==
X-Google-Smtp-Source: AMsMyM6zDmpIODc35JEf69VpVw6lqcdRjBvTn84wI5Myzv3DwDMbgV5pMGqaNxbYsCnFXyhBuE6ymg==
X-Received: by 2002:a05:651c:c8d:b0:26c:6ec5:294 with SMTP id bz13-20020a05651c0c8d00b0026c6ec50294mr950111ljb.518.1663847212613;
        Thu, 22 Sep 2022 04:46:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a19f207000000b00494643db68fsm902789lfh.81.2022.09.22.04.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 04:46:52 -0700 (PDT)
Message-ID: <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
Date:   Thu, 22 Sep 2022 14:46:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 10:04, Krzysztof Kozlowski wrote:
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
>>
>> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
>> will be added later, once msm8998 gains interconnect support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> (...)
> 
>> -  "#interrupt-cells":
>> -    const: 1
>> -
>>     iommus:
>> -    items:
>> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
>> -
>> -  ranges: true
>> +    maxItems: 2
>>   
>>     interconnects:
>> -    items:
>> -      - description: Interconnect path from mdp0 port to the data bus
>> -      - description: Interconnect path from mdp1 port to the data bus
>> +    maxItems: 2
> 
> I think this is not equivalent now, because you have in total minItems:1
> and maxItems:2, while in past minItems was 2.

This means that I should have minItems:2, maxItems:2, which, if I got it 
right, is frowned upon. Let me doublecheck though if it works as expected.

> 
> The same might apply to iommus. clocks look good.

-- 
With best wishes
Dmitry

