Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 589FD6ADD17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 12:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjCGLRD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 06:17:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjCGLQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 06:16:34 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C6677CA1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 03:14:55 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x6so12786441ljq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678187693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yT7vGhUXWJk9HYJN6I+M8kwXMyH9EI24q/vmlgWv3m8=;
        b=CR/0+YSacYaMRbzWtuZLaj7mlcFerMdCQTGypTHtRsDDH/7zP+jryAMCIGgtkZj1nB
         cp7IWqzXNdM6M0RUuwFnjx7g5YHlc6Bg6zv898iLDdEVsw837xpoJufcrRzh2KRdJoW0
         lhx+4qSdJ6+YDj8o2nMSp+dhubOcpK4u9izJvnZ1nEcqm7DY9rnMRqxQUzGrPdobjKCP
         zWWDFDIdU/6ma2QAo137K5aeIYiLvPZU2SyvRK5CeuIEWnnU41t67WruJXecCVyXSbXw
         d081WmAqY29Ia63TpYuTJ1TkoswHKWmnk3oVq4/+AnAojdz7L0jDHV31Hxtthf4HCP7T
         5CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yT7vGhUXWJk9HYJN6I+M8kwXMyH9EI24q/vmlgWv3m8=;
        b=dDS4GjxUf3NY4hgn7tRCQNmPVHbTktLsX8cjfP5+mO7MTeVerGs0XruQZKzV6y1Ide
         dty+hSk7ZvEFEumFYsb11Id336je3z27EfQFADZRIAR8Ey5rhHI15SX5Qq92qceJdjKH
         p5NVr8XFhePMAeK2EDaUjpccqKYP28PAoGHBDNiOaklN5kjO0wyBI57mti7BCRr8ifR5
         zWMzIzlrxGuD3RveLBztKixtmegA3fXaJsHn5F7JzU7qq7tTb6teOnYBLkKhJFMi8bq0
         +YhaoHnJKHkGQqkgx42cC825XZURTbpXM547jA9UOpjbxFyGZtGB/o6Q+kFrG1Ixt4oX
         bkzg==
X-Gm-Message-State: AO0yUKVtww+kB8wzSOllGkUXuv56UV4mTjaM9CLhvCqefPUGlZR9abY0
        xROkhAmAHy0PcOGqTmOS3VYklQ==
X-Google-Smtp-Source: AK7set/Wz0Rx9XUBw7YxwDmwy1KllOxzRErdeKK9Kj5JqFHHN2PNAGXEpEi5nSFHpUfQzppg5PLKFA==
X-Received: by 2002:a2e:710b:0:b0:295:a969:d225 with SMTP id m11-20020a2e710b000000b00295a969d225mr3924432ljc.1.1678187693642;
        Tue, 07 Mar 2023 03:14:53 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id 198-20020a2e05cf000000b00295a02569ebsm2167222ljf.124.2023.03.07.03.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:14:53 -0800 (PST)
Message-ID: <22970751-8bc0-9cbd-eec1-cbc92f0b4ea7@linaro.org>
Date:   Tue, 7 Mar 2023 12:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 8/9] dt-bindings: display/msm: dsi-controller-main: Add
 SM6115
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-9-konrad.dybcio@linaro.org>
 <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.03.2023 10:17, Krzysztof Kozlowski wrote:
> On 13/02/2023 13:10, Konrad Dybcio wrote:
>> Add a compatible for the DSI on SM6115.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 2494817c1bd6..f195530ae964 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -25,6 +25,7 @@ properties:
>>                - qcom,sc7280-dsi-ctrl
>>                - qcom,sdm660-dsi-ctrl
>>                - qcom,sdm845-dsi-ctrl
>> +              - qcom,sm6115-dsi-ctrl
> 
> This looks incomplete. You also need to add it to MDSS binding.
https://lore.kernel.org/linux-arm-msm/145066db-5723-6baa-237d-7c2b8fd476d9@linaro.org/

Does this.. but I guess I'll resend this as one series, as it only
makes sense.

Konrad
> 
> Best regards,
> Krzysztof
> 
