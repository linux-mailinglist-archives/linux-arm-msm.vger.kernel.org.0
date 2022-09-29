Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED7E5EEF8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 09:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbiI2HrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 03:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235341AbiI2HrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 03:47:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E893139F67
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 00:47:05 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o2so993309lfc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dnITc0xpMXEA7t4sgElLx+4qVX7nYEDyilpbd4CXC9k=;
        b=uGcDNVPXkiKp0/IY8guVgHnvizB80zoouBV1zI+CcewxalPdMXFlJWZKjDLFmQe8Ew
         8a5qUQegbDboAzpjvI3sllEEUmzijzphlGkf9tzBFw7rPk5N0XHAkhtsteKz4MtOrTp4
         le0qhM/SdCBr1jBpyYtpJtlhGyUxyp9AjxBZn6+DSMHcZrOWmwaMFTZ00rpxU2OHaVIv
         0yGJ6ByVRnvFZCyVMhhF2Yo+keJdb73RddGy8Ew5bqE38IEAkzeNckD8p2dK5JgF9ZPg
         XDxlZWK5CXmuzsn5dxrPDGsVedmSNrRP0NgwyxeuXG7Xd0/v8no08f1Nbfg43NQqmx12
         8Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dnITc0xpMXEA7t4sgElLx+4qVX7nYEDyilpbd4CXC9k=;
        b=mtxTJCKHd+R3wsteymeujRVWAPNfpWJKYs8FXy9wRZ+uMoSRjnZbv05+/xP69YrttI
         YAoINSd87aqkgWgGDCjlKBB7ekmKjgmB9rw//kiRyjjBjgf8yZL9Rb7qg6xxuNMwQWaH
         blF9pqhpwrv6kqowY9ynICSh1RylEa/V9UIckXNo+4zt7XQk+kymjzylPyxUgRccanEQ
         MKT8JYquhjhWsc1tyfOO44ue0Gt4nNx9/PGXvnHjDx/N+3JQbpzSFg15aoa5mu5RGg+A
         +p04TbHS/R6FfubFS/01l7U6DpT2TjpTvFjAVSeZIj2T5J5lVybz22qhAeHE143x5KNb
         rtNw==
X-Gm-Message-State: ACrzQf3BTPcIJD3SiMztWvxS8PkTTiaiWRIsiqsSVPwBMRyb20wmXU1e
        nmacEgr6VO3NGG/1rKAQpZ/MkA==
X-Google-Smtp-Source: AMsMyM4hj4TmCFv/FCH2LyFkLclQe3iKtiAqO9DG8bMvZXl/z5OzzjZ3a0sVROUTS4OrTteQNvmhnQ==
X-Received: by 2002:a05:6512:535:b0:498:30c7:1e13 with SMTP id o21-20020a056512053500b0049830c71e13mr745638lfc.264.1664437623342;
        Thu, 29 Sep 2022 00:47:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 145-20020a2e0997000000b0026befa96249sm631817ljj.8.2022.09.29.00.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 00:47:02 -0700 (PDT)
Message-ID: <96e091f5-c593-2868-4472-267f57695997@linaro.org>
Date:   Thu, 29 Sep 2022 09:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: qcom: gpi: add fallback
 compatible
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20220923210934.280034-1-mailingradian@gmail.com>
 <20220923210934.280034-2-mailingradian@gmail.com>
 <7b066e11-6e5c-c6d9-c8ed-9feccaec4c0c@linaro.org> <YzVLtvPk6YiDfBtb@matsya>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzVLtvPk6YiDfBtb@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 09:39, Vinod Koul wrote:
> On 23-09-22, 23:26, Krzysztof Kozlowski wrote:
>> On 23/09/2022 23:09, Richard Acayan wrote:
>>> The drivers are transitioning from matching against lists of specific
>>> compatible strings to matching against smaller lists of more generic
>>> compatible strings. Add a fallback compatible string in the schema to
>>> support this change.
>>
>> Thanks for the patch. I wished we discussed it a bit more. :)
>> qcom,gpi-dma does not look like specific enough to be correct fallback,
>> at least not for all of the devices. I propose either a IP block version
>> (which is tricky without access to documentation) or just one of the SoC
> 
> You should have access :-)

But Richard and many other community members do not...

> 
>> IP blocks.
> 
> So knowing this IP we have two versions, one was initial sdm845 that
> should be the base compatible. Then second should be sm8350 which was
> the version we need ee_offset to be added, so these two can be the base
> ones for future...
> 
> My 0.02

Or just use SoC versions, not IP block versions :)

Best regards,
Krzysztof

