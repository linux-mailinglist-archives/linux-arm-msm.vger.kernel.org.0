Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A00A5EAC7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 18:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiIZQ27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 12:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiIZQ2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 12:28:40 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39AE10D0CC
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 08:17:44 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y5so10754785wrh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=xO4khjU4+78jf2xpWOKdr7uLPN/M8XJlTiPq0JGsUEU=;
        b=whq7ccc85DgTYmP6s9w/n/+7AGuhR/C3CzhxsMckVS0NDJC2aH8TKUxA7XayhmUFSQ
         bZzdV6DAn/tgA1B6M0cpDU/5QwFr/8vio+M3edDLK7AUuEmBHGNMjItC6AqXB7CPEey/
         2QpXj048LdNjue/gAWJzHdP2AzVjzQpLXB/Mo5/C+q9Utp9k3fAh+pN9+lTN0IIRo4UJ
         h+wXbwqrTSiunnZ2odiLLoMmHakBG0vSSlh6V0mQAwc95RYZFwA1CvzGtWXBsEIcIONz
         TGecJbRv4j44++peR7wjh0YBN4WdPCWhpWb9C8d5KAGUBZxEeNNEOfvzk+4nNoaeqPB9
         BCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=xO4khjU4+78jf2xpWOKdr7uLPN/M8XJlTiPq0JGsUEU=;
        b=rfB0lgB1Sy9IAzGZHJ8Af3+LTmjkEK8O3qV+RA/ISqKuP0wwH3hxCi8hgmrhwEKGqC
         M7+6glbhdSDitKoz+JHy9F/WprCOrIHpo1En+vLfkOklKhdEulV0FZ0fnXQ3+E4C9LH9
         pP8pCViNUZiFw/wFR8uxUEg+2Pkvn4LDa3L22Oq7WyrbKVGdXYlims2g+cwEenNUuDin
         SKe7YwM7fL0EQH/DQs9O2SF691W5lbSLDKy+cXPM3rt1+UV9aAP1DHPEPHIuAkIj8Krv
         e0ZB1Q+b3SEB/8xzIxhdvXKJ3rW/yeyuq9h0WbJtI83IDm86mQ9Nba+HI+eCzGpThG8Z
         hP3g==
X-Gm-Message-State: ACrzQf1oIk0c6MdUXva87QowU9GWbm1Hnsj+nNtJTEoq96cfCaSs30LO
        vVR3m5i3zz4VFXuEk/ST9n2HSg==
X-Google-Smtp-Source: AMsMyM6up2Ozit/2+z03cRrBYJ1BFBnT49cZk9lO9N6icaZeWOxslodaMHPv9BrhhcXW5grI6X5I2Q==
X-Received: by 2002:a5d:588c:0:b0:22b:1b41:6b83 with SMTP id n12-20020a5d588c000000b0022b1b416b83mr13256254wrf.283.1664205462948;
        Mon, 26 Sep 2022 08:17:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bc13:ca44:4aa0:2ef0? ([2a01:e0a:982:cbb0:bc13:ca44:4aa0:2ef0])
        by smtp.gmail.com with ESMTPSA id v3-20020adfebc3000000b0022adf321d22sm14451956wrn.92.2022.09.26.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 08:17:41 -0700 (PDT)
Message-ID: <6bcce1f6-3eee-6fce-7a0a-44550b3dc3f8@linaro.org>
Date:   Mon, 26 Sep 2022 17:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <20220925210229.128462-2-luca@z3ntu.xyz>
 <ec8cc121-9814-cd52-fb49-c33ab1376f89@linaro.org>
 <3070538e-fa8d-4506-bbf8-c2770d092eb5@linaro.org>
 <3dda8e86-b92b-488a-5afb-0cb49e7e52ae@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <3dda8e86-b92b-488a-5afb-0cb49e7e52ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/09/2022 12:29, Krzysztof Kozlowski wrote:
> On 26/09/2022 12:04, Neil Armstrong wrote:
>> On 26/09/2022 11:22, Krzysztof Kozlowski wrote:
>>>>    		};
>>>>    
>>>> -		usb_id: misc@900 {
>>>> +		usb_id: extcon@900 {
>>>
>>> Why? extcon is Linux specific name and should not be added to DTS.
>>> Anything requires it?
>>
>> It matches the current dt bindings:
> 
> Then instead maybe let's fix it in the bindings and DTS?

Yes it would be preferable

> 
> Best regards,
> Krzysztof
> 

Neil
