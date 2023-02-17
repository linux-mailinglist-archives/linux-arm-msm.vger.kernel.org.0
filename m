Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6007969B4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjBQVYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjBQVYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:24:39 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336625BD8B
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:24:37 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k14-20020a05600c1c8e00b003e22107b7ccso5856wms.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i99jD1tlOm2J+DaW0h6qwAWv/L8x6GC6XmOgvZVvFkg=;
        b=P4w7/wTCAaJZbUMoUy6T0Bm9u/G07nwRjiDAqAfkDP+ELzlrstGe6/FfGCOYa+sQsl
         A/D1An0YMCwegS9JEhZMHfVmFJV41dAjQR0EnBSLeK8GlxXvkTAhMfzeCWPOlwXFkWus
         GcsuN8w8+h4YcA24+hXZ8TFUVnxkwGQf368nonUkNkJxOV9BrCiKQ54YaCd0MHekT9L2
         0YRig4wE3PbTHXqs8ZN99+LL1s5LEKULExv1buN5YUOGohp7pGb2vz13ieTPpMpVr0VD
         ATdPI3c7WZs0EyDxZJRu/EKqIc9W0wyHxr+L2m9MMXU+nN2rVFlvAD4YsFmEUdNhskAf
         jYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i99jD1tlOm2J+DaW0h6qwAWv/L8x6GC6XmOgvZVvFkg=;
        b=hQie0zzCOs5DyFEE+6byRvvEBCZT0gWoMUjN8KHl7YLCY21pqtlF3HHZl0gKftkyH2
         A2xEgYMhrgru778qrFny9drp6zAgUJUh+yOHs2wQe15z7SE0rcvjETaqttzVPzAcdkpr
         Jcugje0LA6IQ6b5aoFzmqUC0v2YJLvzB1VF89J4wLGmoOQU/hdo5xeUxGNaST11PTYa+
         SMkfRZkSq/55Zs7nCBP8zFn+v6QPivfobXSLf/laULgCDnSXZ+bRZK+RgCz7q0BytaQk
         L3Rcf8/JVkaWKXooEh1MLp27tc9mlUCwOPAU/lK3AWiwaVRuUQZxCeCIMy27zHo7pJ4G
         WbWg==
X-Gm-Message-State: AO0yUKX8vkXXEs0+9aHVayidi3OJ0yhmB5IPNEH+NxJRiXHCbiDWqIpE
        c0h5Gsw2OwFDs2B2XqQobPB12w==
X-Google-Smtp-Source: AK7set+Xc51wFSpAOQt9chC3jAJ9CBbqWhtN3Jab8NU4rTVA1dGR+XeDIG7qIaGN1P/mLOMJ4aQRYw==
X-Received: by 2002:a05:600c:908:b0:3e2:5c3:bcfc with SMTP id m8-20020a05600c090800b003e205c3bcfcmr1283074wmp.18.1676669075673;
        Fri, 17 Feb 2023 13:24:35 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003dc42d48defsm6015281wmd.6.2023.02.17.13.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:24:35 -0800 (PST)
Message-ID: <4faf391d-f606-2da2-86ce-02b9c97fdbb5@linaro.org>
Date:   Fri, 17 Feb 2023 21:24:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
 <76de00dc-f128-e609-7f0c-b53161036b97@linaro.org>
 <0b3e8c81-b0fb-651b-8688-872f03c68d8f@nexus-software.ie>
 <0989eef7-cd0e-324c-eef9-aa8500197b91@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0989eef7-cd0e-324c-eef9-aa8500197b91@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2023 21:23, Konrad Dybcio wrote:
> 
> 
> On 17.02.2023 22:20, Bryan O'Donoghue wrote:
>> On 17/02/2023 21:16, Konrad Dybcio wrote:
>>> Correct, but QCM2290 is not supported upstream yet.
>>>
>>> SM6115 (a different SoC) however is, but it used the qcm2290 compatible
>>> as it was a convenient hack to get the DSI host ID recognized based on
>>> the (identical-to-qcm2290) base register without additional driver changes.
>>> We're now trying to untangle that mess..
>>
>> Gand so what we want documented is:
>>
>> compatible = "qcom,qcs2290-dsi-ctrl", qcom,mdss-dsi-ctrl";
> qcm* yes, this became documented with your original cleanup
> 
>> compatible = "qcom,sm6115-dsi-ctrl", qcom,mdss-dsi-ctrl";
> and yes this became documented (well, in the DSI binding) in
> my other patch series and is finished being documented in this one
> 
>>
>> with the old compatible = "qcom,dsi-ctrl-6g-qcm2290"; clanger continuing to be deprecated.
> correct, we still have to note it but keep it deprecated
> 
> Konrad
>>
>> ---
>> bod

Cool.

That maps to my understanding & the intention of the deprecation.

---
bod
