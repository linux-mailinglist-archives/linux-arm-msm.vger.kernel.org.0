Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB215B40BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 22:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbiIIUbF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 16:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbiIIUaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 16:30:07 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EE82A43A
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 13:29:30 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y29so3231057ljq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=7mncvRGcLH9K5FkmOMOVFO3Rj69zLNEP9S2+OC8gmCI=;
        b=lvWyWcld2sfU8O05DsaycEYPSkOZRrbgTbt8RyraZCg91Re7sQO0u1I+IK4HMZFDZe
         l8v3boa5CHlaq4/rLeN2PTKOR9SQP91vCxNf7XoI9tPyCN+u+OZoUSeKyf3UwF1ucM73
         7CEPwpYalfNr4x6BF2Krzfa/xd+EnW4kfFYqugywqSN3/KR0wkZve4qY7EmLZE4SB/Ys
         Ty/qcPU3CdWLlOLxDuEig9712dvYYHJtEAjz/ofnE29zImBVG49ItSFUF6SlMiaKnCmd
         TZXyt126NMqmAlqHR1e7Nh08mkgqSg79M1DF5MOhL1//LkBTNTV4j+lHAqy7PsrWfU90
         TWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=7mncvRGcLH9K5FkmOMOVFO3Rj69zLNEP9S2+OC8gmCI=;
        b=vUFdh7JMQVwQwxzmsk4ydjA8UNoxlQSVk0o9Xh9ARrViRRUAsalBWaEM1TVprcOdl/
         ywe/+1Cz3rQNbTRcQ0Lzd0aJw7yydKLV1mXhXTQfg+DSqySjjxIpyOxi9srsZQZL60ng
         mE3Mi5rOBoMXZSkN7RldjfWgJ49uyDw994lPiOoixhAeJhjv0n4PjuZ46VQ95dh8Nnrq
         07V2rttjoZhpfUKAIHg5Fu+/t/S6l+R9yL5oO2ydAcyAqUqNBxrbKQZrQugnHVbg2GTp
         OulRccP7G++ybUcEnP1cAtROwJstipwMkthE07dUNQj1GU5xfSa7XFBtQCsXxaadHiZw
         7D2Q==
X-Gm-Message-State: ACgBeo06T+xsAiSfsHU9lgmYlyHxG9tzjlwFQrhTQzkmnClLFnBBXZQF
        XD+27TKu8LPIHVXaDoLpvj9Gdg==
X-Google-Smtp-Source: AA6agR7TVv6GZXR+h2N3omk/bgR55Lo5AYg+W/daJdEVtBkQ4148w0NpRInKLrdUFHL+8asR/zNYwA==
X-Received: by 2002:a05:651c:1110:b0:268:982a:8805 with SMTP id e16-20020a05651c111000b00268982a8805mr4758864ljo.394.1662755369281;
        Fri, 09 Sep 2022 13:29:29 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.228])
        by smtp.gmail.com with ESMTPSA id p11-20020ac24ecb000000b00498f1eddad0sm48339lfr.122.2022.09.09.13.29.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Sep 2022 13:29:28 -0700 (PDT)
Date:   Fri, 09 Sep 2022 23:29:23 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
User-Agent: K-9 Mail for Android
In-Reply-To: <c3b4638e-05f7-cc73-b893-422f92909f6e@linaro.org>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org> <20220909132010.3814817-2-dmitry.baryshkov@linaro.org> <d72fc00c-85ba-8b48-1fcf-42fe9e8daeee@linaro.org> <59242592-4e3d-b7c2-e0bb-b39df780c26b@linaro.org> <c3b4638e-05f7-cc73-b893-422f92909f6e@linaro.org>
Message-ID: <3ED996B7-F1BE-4AF0-AD95-500DA0B202FB@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9 September 2022 19:44:11 GMT+03:00, Krzysztof Kozlowski <krzysztof=2Ek=
ozlowski@linaro=2Eorg> wrote:
>On 09/09/2022 17:03, Dmitry Baryshkov wrote:
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 1
>>>> +          maxItems: 2
>>>> +        clock-names:
>>>> +          minItems: 1
>>>> +          items:
>>>> +            - const: slave_iface
>>>> +            - const: pxo
>>>
>>> Why pxo is optional? Commit msg does not say much here=2E
>>=20
>> It's optional as it is not present in current DT files=2E The driver wi=
ll=20
>> fallback to 'pxo_board' if the clock is not present=2E
>>=20
>>> It seems you also miss the DTS change adding the clock=2E
>>=20
>> Oh, I'll add it to v2=2E
>
>How about adding it to DTS and making it required in the bindings? I did
>not check the driver, but isn't the driver fail if clock is missing thus
>the clock is really required?

I had the impression that we cannot make a clock mandatory of it wasn't pr=
esent before=2E Please correct me if I'm wrong=2E

No, the driver will not fail=2E It will fallback to the lookup of the `pxo=
_board' clock from the system clock list=2E

--=20
With best wishes
Dmitry
