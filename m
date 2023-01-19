Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17E967329A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 08:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjASHj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 02:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjASHjm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 02:39:42 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18B84687
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 23:39:40 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so2951217wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 23:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XOqMBPf6wiOYpq42Y7vvNbvEHVfamUmViAnQdTcUnGg=;
        b=tv/mH1UJvXzxAbv6ZPc9KMTXNvWLoYO5uSrBdgj9jfOhJTpBXPD+0c3/kgrRv/naa2
         5iCQl26NSQ3eH/V44N1RfcNV5mKW+NX4ZcNBTZTgDIXCt7r28z/grzeB7Fzru7X/oAHD
         eJBQufWsXW6XxbpRoT3o4hJiMUBOmrRql+WNWsIUzcqhC9axcCB+i9xwC1hQBAFavaQj
         Azrgn7mp+DUdkgGjaU87ljwX0BnBDwYV6KWidP+d5u5Gyfp/0mtSocf31OBPkuFEbyMU
         Y+BeyI6N8vrzNjbkQzxJlhlBl3YWKqmWa2I/O4qD5hjF+4M+ciO7Pt/9UJOOdjCuPH77
         gMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOqMBPf6wiOYpq42Y7vvNbvEHVfamUmViAnQdTcUnGg=;
        b=68USkVx6kbjqqCvYYNNVKJQAI58MZf7LNZ4D5JN6kfwjjWQORaOvvTS2s5Xpvpnfv2
         dEdo21/5FZDZcg4aTSFpqIOF4INZ2rN12xdoiH8IFD7jREPia61YWCNpkZeOwj75VPyZ
         m4J9trWWtmZW3DWi1z7nSgsaUDG6ndXXeJUFI3YZe00g5Bmea7VeCPjFKKfweY9zKwXl
         ToOKgqxVBy5kI+LMUdBPVymY66hS1BmueumiNSMqdy48dY/u9gpzdvuBSslGaSeFD8jf
         DcVFvQb0VRBpO1PCRaDNnUbEKTxbzoas82pBv2nUuqejeqmNa3RDA9FUpV32MjsV8pWc
         nVeA==
X-Gm-Message-State: AFqh2kr9G2BqW3tJn1lS5rRv8UZsEGVW7/G0In0cH0pmn4K4LiekUYNS
        miWo8ZUWfXvggyhIfzo/TA/aJw==
X-Google-Smtp-Source: AMrXdXsLa136dUX8LJKmaxPMIl3hWRQ+ADsEngQaV8UyI/bzAEKD6aaJugxecTle6AogEUDWgkx67w==
X-Received: by 2002:a05:600c:4fcb:b0:3db:1919:41b5 with SMTP id o11-20020a05600c4fcb00b003db191941b5mr3514893wmq.21.1674113979165;
        Wed, 18 Jan 2023 23:39:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003d35acb0fd7sm4182561wmo.34.2023.01.18.23.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:39:38 -0800 (PST)
Message-ID: <6793b9f0-18ba-56af-2e4d-202ad52b0951@linaro.org>
Date:   Thu, 19 Jan 2023 08:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 2/5] dt-bindings: remoteproc: qcom: adsp: document
 sm8550 adsp, cdsp & mpss compatible
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-0-54154c08c0b7@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v4-2-54154c08c0b7@linaro.org>
 <167407681596.873892.9837637729592866883.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167407681596.873892.9837637729592866883.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 22:21, Rob Herring wrote:
> 
> On Wed, 18 Jan 2023 17:22:40 +0100, Neil Armstrong wrote:
>> This documents the compatible for the component used to boot the
>> aDSP, cDSP and MPSS on the SM8550 SoC.
>>
>> The SM8550 boot process on SM8550 now requires a secondary "Devicetree"
>> firmware to be passed along the main Firmware, and the cDSP a new power
>> domain named "NSP".
>>
>> A third memory domain for the DSM memory zone is also needed for the MPSS
>> PAS bindings.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 178 +++++++++++++++++++++
>>  1 file changed, 178 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/remoteproc/qcom,pas-common.yaml

That's ok, expected. There was a dependency.

Best regards,
Krzysztof

