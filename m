Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78058563027
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 11:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbiGAJcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 05:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbiGAJcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 05:32:06 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17C171BE4
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 02:32:04 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o4so2350492wrh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=K/qT8HI2IqBp+p+vLx0KCA0Y3Vg7TWHkgf6rKbyd91I=;
        b=jQVIbj6sAcLvohWrMBnN1TQ54Yg3N1Kmn75Zyp2ZQZDjOPdFGLH8O78gn9hnBdbsmV
         EbWZRaO1JfZFyGeoWGpPli705Wkm1IxeXBMtI5P5rpdoQuFWrC3tGxrelAcpGnDMLunZ
         VJXmEKqzImhpLYldUHoVkn50JpEaV+/7hwkAzQhAfZLzIUg8+Qb2+ZfrkcjlX6u/0WYH
         aAl36C1f8tNFEN30xK6vYtEC2dt5EjrvFDSDJKc2leNpRR16i020X3hSzXKQSdeujVAe
         PeI6F3xmz1o8BIo/gYeSnEgupttsDP26xq6edXELpzVqmVs3vt4IPohSFqXEIIAnXvuP
         IPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K/qT8HI2IqBp+p+vLx0KCA0Y3Vg7TWHkgf6rKbyd91I=;
        b=43roWJP0BzZ5AyTl0T378ezoDw3HpkDcbejBC6PR+jASAXzWvrSACrupeh2gxHrZHb
         jkVgVmTxHPw8D5RI8VJ/JiHjBMU7yLHxrSHG3OX8fPi4u3VngtUhG+d/2Qzm4HaILyr/
         uDkMAWvstOo/VyE7JRpB5dkp8S6C3cxBJ4UjEk7W6SZcWmOADqd3UvrRtFZS1+z6ss1d
         RevliKgU+GyyZFf2cDQ8t50Gl9yu00AIIgnNzaEN+idpWJ/HPtuTBnwdniE4DYcg/046
         OcEUTxPvqSWS0LB1JHcuJ3gFSSOiKBlaFCczNuJqnDB1pkqfaD5xl0VovwrhibH+UcTw
         IDYg==
X-Gm-Message-State: AJIora97Ri+gqEhvPayZavq3PhVsMaWTyLaTpKJUKchjpsZFk2TavBh6
        NTEoHhEHyJ3XuE3+4JsH0/XoDQ==
X-Google-Smtp-Source: AGRyM1tBa9IhGYtmY3U/be2Xw3a3xwiE2Lb3fVVi0Sxl27A1vYaw0AAirK2iQMhTqdnf7O5+BVXHKA==
X-Received: by 2002:a5d:59a7:0:b0:21b:cd67:52d9 with SMTP id p7-20020a5d59a7000000b0021bcd6752d9mr13159506wrr.194.1656667923466;
        Fri, 01 Jul 2022 02:32:03 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id m21-20020a05600c4f5500b003a0502c620dsm5787744wmq.44.2022.07.01.02.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 02:32:02 -0700 (PDT)
Message-ID: <a8d688b8-95ac-1c01-222e-65a6c9f83c8a@linaro.org>
Date:   Fri, 1 Jul 2022 10:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: pinctrl: update qcom file list to include
 yaml files
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629092514.70752-1-srinivas.kandagatla@linaro.org>
 <2d63cbf2-8e59-a8db-3faf-747b92d2eb66@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <2d63cbf2-8e59-a8db-3faf-747b92d2eb66@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 01/07/2022 09:28, Krzysztof Kozlowski wrote:
> On 29/06/2022 11:25, Srinivas Kandagatla wrote:
>> Currently Qualcomm pinctrl MAINTAINERS file list does not include yaml
>> files. Include this for correctness.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c4648e86dc14..71e7725aa574 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15765,6 +15765,7 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
>>   L:	linux-arm-msm@vger.kernel.org
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/pinctrl/qcom,*.txt
>> +F:	Documentation/devicetree/bindings/pinctrl/qcom,*.yaml
> 
> Instead just:
> Documentation/devicetree/bindings/pinctrl/qcom,*
> 
Makes more sense, will do that in next spin.

--srini
>>   F:	drivers/pinctrl/qcom/
>>   
>>   PIN CONTROLLER - RENESAS
> 
> 
> Best regards,
> Krzysztof
