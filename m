Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164646E4B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 16:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDQOSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 10:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjDQOR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 10:17:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5911B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:17:32 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id dx24so20517697ejb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681741050; x=1684333050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjLQZkxTBlX3f7nO48hxD2oULveWu8viYEgFU3xZb9g=;
        b=EXnrC+sI+XdHwyMZvAyllL/QfV5LjpTKCH8KkvPigJb8znAO8K7jst5GMPEgHFYJgr
         NlYeXVV3QtwCp/NRQqikPY/Zhx6Cea/mF2V+YEvsajc6NYVpTB1GICpday6vnypDOISL
         8F+2Oqyptl/mgaFrrBU6ffKE5zG6++sRYS2OdGbJKlVxzxJCpSZklwwCJgtisyRX86lA
         /0uYnysLB/J4rqNLhFQKUiaZaPM1tlft26x95S2/JF6zuBW44RpF8uth45q9+UpySANy
         2dTMwxOD7qfFykJyvAkgXdGQ8oUVQV1WvQ1g7kW3CGw7TnGWUNHCU+8flrOD79G0iLlP
         1H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681741050; x=1684333050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjLQZkxTBlX3f7nO48hxD2oULveWu8viYEgFU3xZb9g=;
        b=WOLTqWop6gFiCjkznBZULcMYlycm/gLvLG4Hlu7A4e38V35sWBWCnfQY9F1OMi+RW4
         66PhQpk4SWTSRYIsw6s0QxF8mTY+IMckaYKHHz0sqJrHdtuwvQ3kP1hlRw+KdCyZV2ko
         ccJXMwGtltUKQTbdEgBxOzIWYadgGP/k3UzMZ09q9+umhZXx9iauSnwmq5F34KRfHLIk
         pPmuMKvfYb/XfG3cmrfOBgX1BlWV4Kx4ISSkjnpsln3VqPhtB/K3xrTJo1nbCCEJBDm1
         HXE7GhgpmKA76Gns+CFAX/KrVeyhjct3xc+PNGDtgIab1fIGUqvU9WcJG4w6ksmw9nLy
         DLBQ==
X-Gm-Message-State: AAQBX9e/H8HPGll7Q75Tbd+MlcnmPZvAyMDDfqDEY3eGybxA9gc0ujvJ
        RK0g88/I3KKqEZFYRuoM99sE9kFZhL8tzxWyYPliNw==
X-Google-Smtp-Source: AKy350avq0En6hyn+CrauNxNAjPy1OIlwA9w0VURk4/I8g8MYDsSly0AxL//OId7TWoI3VYYpljnLw==
X-Received: by 2002:a17:906:8604:b0:94e:f176:43cc with SMTP id o4-20020a170906860400b0094ef17643ccmr7963783ejx.39.1681741050708;
        Mon, 17 Apr 2023 07:17:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511? ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id bn3-20020a170906c0c300b0094e93ec20adsm6657072ejb.106.2023.04.17.07.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:17:30 -0700 (PDT)
Message-ID: <a4eeeaa2-51b6-76da-8e4a-517db64a3173@linaro.org>
Date:   Mon, 17 Apr 2023 16:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Patrick Lai <quic_plai@quicinc.com>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
 <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
 <7c7afc80-713f-1949-4feb-f5f2d192569c@linaro.org>
 <9156affd-7f08-282b-ee65-ae82f4d94cbc@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9156affd-7f08-282b-ee65-ae82f4d94cbc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 13:12, Srinivas Kandagatla wrote:

>>>> +  qcom,ports-sinterval:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>
>>> Should this not be ref: /schemas/types.yaml#/definitions/uint16-array ?
>>
>> Same answer as for Rob:
>>
>> Because I am afraid it will grow in next version to 24 or 32 bits. I can
>> change easily maximum, but if I put here uint16-array, all DTS will have
>> /bytes 16/ annotation.
>>
> As per MiPi Specs the sample Interval is an integer in the range 2 to 
> 65535. I don't see a value in making this u32, other than adding some 
> confusion by deviating from specs.

Hm, in such case I'll make it uint16.

Best regards,
Krzysztof

