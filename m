Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DD165BF7E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 13:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237486AbjACL6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 06:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237465AbjACL6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 06:58:51 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2319DF028
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 03:58:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so20394010wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 03:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTCK4kqx0yo2vSFlr2pS80UP/uLi/qs8RdexE7wfxfs=;
        b=kPbRMQTVMRm3LifJRWy3KFiBom6bV151qVPTnMQq7PV7oObj0ojABNqndAeLDWVgXY
         u9KEwqxnyEfbMkNAtTUECiG6Eppch8WfNj9TOYp3902NaU8Qr0FYwq+WHDVAlAGjVK7+
         X+qhYL/enODBlEJvJy2VzgYCKAwTrz2Ff0/noK6HLDJjW9vozTgKBk2PO2SrihO3vqox
         Z+q9w1Pexq1OTDei0tAwqhEQ6N7X45o/afYkBrWj9sYbourBMx3kNLn/WzK/4gekwVBX
         YMdfZ++zn1T58MOTfk6FONe+ocOFXs3mjKMFa96hza0Bg2V3Sehj/6YqDVlPwhD3K1x0
         GCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTCK4kqx0yo2vSFlr2pS80UP/uLi/qs8RdexE7wfxfs=;
        b=Jf2JqS9yPH+bboYK5YcOt2lpROsCCHM8l06dWSJZwXi8Eai+v16WzP2g/SHpYAu4f7
         /TxvjepyUA4lvEjuGf/tyBFfHRMONZAaLBhIRQTMUtfP/eZ5qo2yV/43gnebOp/12d15
         E5/kLFAp2hPeI1QZjkwxJiiZIEkxp3OrzloUq/i9OtyiH3KWSYp7AIq83iOt3jg1CHc1
         vlXxw5Fm8nqtDzNdwwwq4swaDAXeRR5VtJT3Azfi90qgjY+4lCUyUFdAsBW7A1l3GIIi
         LAJwMA5o3q88EvAzjxTPWyS431mNk70pYj55scLD3VQ6WI8WfBh5A47CrBCENP1/HJq1
         /1pQ==
X-Gm-Message-State: AFqh2kr7rKYydzrdiwaPUUvdovYi0sG/Adl6ZjaRCUjuAbZiiMkhG/0Z
        WE1P8Bk6AIt/0mc1Ezb+r//mvQ==
X-Google-Smtp-Source: AMrXdXuKr0rmfohTZsjHKDyPzZZ4WsGRHtJ1MCg2QaTNm/rJTd2pfnIoxjueWRWrxp5ZOhbiJa7dog==
X-Received: by 2002:a05:600c:3209:b0:3cf:5fd2:87a0 with SMTP id r9-20020a05600c320900b003cf5fd287a0mr30227794wmp.40.1672747128768;
        Tue, 03 Jan 2023 03:58:48 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ay39-20020a05600c1e2700b003cfa80443a0sm41811547wmb.35.2023.01.03.03.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:58:48 -0800 (PST)
Message-ID: <36e8c1fd-9321-4c9f-4d2b-b52b600c77f1@linaro.org>
Date:   Tue, 3 Jan 2023 11:58:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/7] dt-bindings: nvmem: Add compatible for SM8150
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-2-konrad.dybcio@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221213002423.259039-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/12/2022 00:24, Konrad Dybcio wrote:
> Docuemnt the QFPROM on SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)

Applied thanks,

--srini
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index ca744f5890ff..a1305fd68f67 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -30,6 +30,7 @@ properties:
>             - qcom,sdm845-qfprom
>             - qcom,sm6115-qfprom
>             - qcom,sm6350-qfprom
> +          - qcom,sm8150-qfprom
>         - const: qcom,qfprom
>   
>     reg:
