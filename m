Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEEA669AC1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 14:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjBQNGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 08:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjBQNGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 08:06:46 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E214AFF3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 05:06:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g16so1635107lfv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvEa0mJYtd+G6bvaOGxPbkna4LTkKOOJGlw7PwM4jDk=;
        b=OutRggqL6ChRrd7U4h7FjSaKRX8WvJF/ILzuPwurg/Db6xOW3nMZZYCNIJfBd8JIux
         8zbjn89swfdF7wVtCdBXk9jnBBSKY+0gDx0/HaYI8LQ62I4G6Ousiqg5KBaOLkPRje/c
         xmL9hhjL9D9hEPMTml7RRabmctWihOc/iDi9/vi/yfbRFj7WBmwFZhEg5+UpDaYNrIp7
         qXHnjYWt0lwDte8lMI5kYdP053zXRMe8BfuLqvzE1oh3jG70fSkcdL+6V4t6lClAZCCF
         qP+LPRs85W+uYpwc5mXsNiLGEgzxpr/GVtvJIFDjCCZQDHa+OMqYZ0SvNTQWy3uS7zy6
         Hcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvEa0mJYtd+G6bvaOGxPbkna4LTkKOOJGlw7PwM4jDk=;
        b=gal9M4Mi6I8HY9+Y2mKJbsar9RzbeCwt6f10h9BshLGP2K68L5fFu1wMV4gaFVGNg6
         tE+WVmWEWUzKAG/N2VWjf4iuGZD8Pq7EueiyRIgfvoe7U6ClN3PYge3akZZSAnTuyFrG
         tfvLg5GsJwSVLAb4H8vuYr4p1Iu0P7w4qV+eErcfeDNmgNqEH6m7AVGQWg3lD2tTV1XE
         MZzu7FRQvnKMraPOE4N31ct0Hcx9Hu/P5XHUX8v6QOBGV9o4wKd1ktYGL0idnDX8InHt
         6VgXZhaa/FwBR/5L6VhEjsTsZzl9Ozze5u5JUGqatOj9xmlLxF9vcQlndsfWHBSF55I/
         VvOg==
X-Gm-Message-State: AO0yUKXK/8Milhww4MPdxVR5nNbg9BDqasrK1u2rIntuQ3f6XaqCrv0A
        1puxUKorB+Ki1sqXcgITj2Ri7wjXb+K8XUEa
X-Google-Smtp-Source: AK7set/lbeT9EHF1pBE4+EMSMKbkVmLPsQwro43XW0FTt2Afuh+Wj39B9+9Wd1kBfJ9Q0Dco/BJl4g==
X-Received: by 2002:a19:ad42:0:b0:4da:e925:c95b with SMTP id s2-20020a19ad42000000b004dae925c95bmr152872lfd.62.1676639203626;
        Fri, 17 Feb 2023 05:06:43 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id t1-20020ac25481000000b004d16263b36bsm673878lfk.111.2023.02.17.05.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 05:06:43 -0800 (PST)
Message-ID: <0d955930-df72-127a-7c53-3e3519affafa@linaro.org>
Date:   Fri, 17 Feb 2023 14:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 17.02.2023 13:24, Krzysztof Kozlowski wrote:
> On 17/02/2023 12:36, Konrad Dybcio wrote:
>>>>
>>>> compatible = "qcom,dsi-ctrl-6g-qcm2290";
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221
>>>
>>> I meant, that original commit wanted to deprecate:
>>> compatible="qcom,dsi-ctrl-6g-qcm2290";
>>> compatible="qcom,mdss-dsi-ctrl";
>>>
>> Okay, so what would be the correct resolution?
>> Drop this patch and keep 2/2?
> 
> First, it would be nice to know what was the intention of Bryan's commit?
AFAICT, it was necessary to add per-SoC compatibles to all DSI hosts
to make documenting clocks possible (they differ per-platform).

The qcm2290 deprecation came from the oddity of the compatible name
(it did not match qcom,socname-hw), but he seems to have overlooked
that (at least before my recent patchset [1]), it was necessary as it
needed to circumvent part of the driver's logic. So it was first made
up-to-speed with the rest by adding the fallback common compatible and
then (wrongly) deprecated.


Then, SM6115 DSI DTS part was added parallel to that, so he did not
update it.

With [1] its deprecation is correct and this series tries to complete
it.

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> Second, if the intention was to deprecate both of these, then this
> commit could stay with changes - make it enum for both compatibles (not
> list).
> 
> Best regards,
> Krzysztof
> 
