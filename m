Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E375B6B1B6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 07:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCIG1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 01:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCIG1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 01:27:21 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C591C5B1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 22:27:20 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id u9so2926786edd.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 22:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678343238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGFQnDrQBIiVyn9kddrJO7rpyZ4MXu5CWKlUhDi2u0g=;
        b=aj3BzEBY4Uo21mdLrBRWNwMs3LGQRkDqO+fzc+cnzpiVqpAiwAtLEYiFi9umdikWLg
         bcvsa5AfXPqH9TV9SvMagFF2U80bRbR145ok4KqF2ze2wM2VdkgpY7LCMTBr8Fmrj5V9
         qxQrwkRGdpGJuqDqpl9d8stLfoqTBj6l5xqJe27LCulHCwzSM7kz6lAsPJB7evhQ3zQH
         NpcPz1NJsMcdxBiwVNZt7jwoBEr+ERZrLlv8Zof7QBPL/N7hNC28jAbbismfS7AASssB
         MdX6H8quM7BCUkkcAi9jGnkmZ9HGIUfYEmO4rzqgT1MPdTb1EERt0k/zR66BTrAkwqdS
         +PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678343238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGFQnDrQBIiVyn9kddrJO7rpyZ4MXu5CWKlUhDi2u0g=;
        b=eSd9xNKzAltgIhv6c9aQPDbfd/JHDhKbIEVLg472d53gYxt02V2QxoM9zDD8fKmat9
         0xiQmDx2iiVZVRd0Pc7bf67fc36fomiwDkPN3d30Ly5h2uLVVmb3WtKI+rX1X7rZSqIF
         KiWgZabh7TheFFk+OnWRH7mA5ZqCdIG/IL7Yl0dak5pGOWIA1t+I/RQQAio38eYisg84
         z4vwOq7s/+4DxBpvW6hgtkzPPgnMPXMx7deuZFrK+/Z3UdlcwejJSgCIHpaBEzM1N0QG
         Tgvc/e36soMKUX96cmCZTHgmg6XSHtMzzivwuCW9LSxVlv05OrMWq8NLXBFmxJaRoYXY
         kNYQ==
X-Gm-Message-State: AO0yUKVcer8rqSTb5RoCZ/tQHMmhr3CohW7Qlngv9eW0ze1A4SCkyQ5f
        zjKD1biVBJqNARh8Qpvw4M9vLQ==
X-Google-Smtp-Source: AK7set9bprPmsq40zKSYFropkIOReUtzA33UKmaaS4PewfQrVtMYpRPcJQQxlSLJMr7PhtmXPVmd3A==
X-Received: by 2002:aa7:c245:0:b0:4ac:c44e:a493 with SMTP id y5-20020aa7c245000000b004acc44ea493mr19500817edo.2.1678343238615;
        Wed, 08 Mar 2023 22:27:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id kq17-20020a170906abd100b008e82cb55195sm8325008ejb.203.2023.03.08.22.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:27:18 -0800 (PST)
Message-ID: <bce148d7-7e22-dda7-820d-5d940f313add@linaro.org>
Date:   Thu, 9 Mar 2023 07:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: bring back
 firmware-name
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230305125917.209262-1-krzysztof.kozlowski@linaro.org>
 <20230308224848.GA3947747-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308224848.GA3947747-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:48, Rob Herring wrote:
> On Sun, Mar 05, 2023 at 01:59:17PM +0100, Krzysztof Kozlowski wrote:
>> The firmware-name property was moved from common qcom,pas-common.yaml
>> binding to each device-specific schema, but the qcom,adsp.yaml was not
>> updated.
>>
>> Fixes: cee616c68846 ("dt-bindings: remoteproc: qcom: adsp: move memory-region and firmware-name out of pas-common")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> index 643ee787a81f..828dfebaef6a 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> @@ -44,6 +44,10 @@ properties:
>>      maxItems: 1
>>      description: Reference to the reserved-memory for the Hexagon core
>>  
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
> 
> We need to stop redefining the type for 'firmware-name'. I'm adding it 
> to dtschema, so here just put 'maxItems: 1'. 

Oh, yes! But maybe we should add string pattern to "-name" in general?
Just like we have for "-names"?



Best regards,
Krzysztof

