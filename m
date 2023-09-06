Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A65793C37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 14:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbjIFMGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 08:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbjIFMGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 08:06:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96E5BF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 05:06:01 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso5164264a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694001960; x=1694606760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnE6ybsHsRfqbSRiCw65bve3WZBj9PBmcz+92cU9XrM=;
        b=knL5qik6NiYr5I53PINcNJvrmf7iiLLSv0ae5a6a6/7uJIe5/gQDBEKfgascIPAzSx
         9komCTibr68F1JXJ+psZdfysILGLwzED3EOaTe0qerBNWfUV5XjFGX2sIrLKUgwZj9He
         NJWSTbEqyxdXAnVGi3fg3DX+b0+1Yh9xNe67U5pic2xMKXe2wliVYUDHH9BrD5DvxJaS
         Huk/CL0yfZbRV/7w9pDlvLBOEuGkpuDnXTJc/fkWLQJB7pkMkBxpsGVo44HtZTFOKagh
         VOdVPqN0XfBuQny46QTMUSVXGPZlTmrskY8AoFiibL882yBTHscrdWhDCsChRZ7Pv7cT
         4Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001960; x=1694606760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnE6ybsHsRfqbSRiCw65bve3WZBj9PBmcz+92cU9XrM=;
        b=ORaGV+6reyEtfK/rYl8l6GyY6bNtQvLI5r+UILlSL/5VLK09rxZSA4MuEf9YArjpNA
         Y7O1j0IXmPzqKUCF97+cyRhsOzO7+/MBYFDqyy8bfl/YPVpitKOVHeczCPZjx9CL+G9I
         8brjutJUEQaawXotbSVKmbdXlPivKTq3dMOOuTVfMXc5T+QlHZejL9kQYnuWCoOst6pJ
         JiUcrNgUzot2uK+mD64sh3XGLtKLwElVDu2ZCZPMybNgwtpSdFW+/LMGU/+OcMQHSe4s
         I+6W+DoWO/gg+18Ih/7v25njg5MjTddMEu/Ee1ESV2fHO4e/FJV07hABsIvhV6kYiK0v
         267A==
X-Gm-Message-State: AOJu0YwOSq7ylrjprT+v6k4hA5FMmyHBuf7k0T3hEJwt1BGqoQVDP96c
        0wk5wELwyYAQT0qRWYFzXE5fvQ==
X-Google-Smtp-Source: AGHT+IEiAMNpbcOFOpt36HtSQySzO+1jdqRMZEEUzJ5mkpptv2P8p6BykXjwWZrtEZ0bZ119cYn5Zg==
X-Received: by 2002:a17:907:75e4:b0:9a3:c4f4:12dc with SMTP id jz4-20020a17090775e400b009a3c4f412dcmr2276409ejc.7.1694001960235;
        Wed, 06 Sep 2023 05:06:00 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906278600b00992b50fbbe9sm8950596ejc.90.2023.09.06.05.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 05:05:59 -0700 (PDT)
Message-ID: <8197d5c6-bd05-ff16-59d5-ba3eb06a5921@linaro.org>
Date:   Wed, 6 Sep 2023 14:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-mtp: use correct UFS supply
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
 <9c7fae56-85a2-4691-8192-24237761d25c@linaro.org>
 <fe346849-cd0f-aee5-9ab9-ea581025329b@linaro.org>
 <91f74079-1be3-4c66-9942-cb02c96c8848@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <91f74079-1be3-4c66-9942-cb02c96c8848@linaro.org>
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

On 06/09/2023 13:50, Konrad Dybcio wrote:
> On 6.09.2023 13:39, Krzysztof Kozlowski wrote:
>> On 06/09/2023 13:28, Konrad Dybcio wrote:
>>> On 6.09.2023 12:47, Krzysztof Kozlowski wrote:
>>>> According to schematics the VCCQ2 supply is not connected and the L3G
>>>> regulator instead powers up the controller pads (VDD_PX10).  Use correct
>>>> supply vdd-hba and drop unsupported current limit for the vdd-hba.
>>> Why is it unsupported?
>>
>> Maybe I was here not precise. I move the regulator from vccq2 to
>> vdd-hba. vccq2 has control of current in UFS core driver. Bindings also
>> allow it.
> Looks like the bindings are out of sync with the driver.
> 
> ufshcd_populate_vreg() which parses current is used for both vccq2
> and vdd-hba.

Just for convenience. The current is not used for vdd-hba. Also:

https://lore.kernel.org/all/20230906113302.201888-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

