Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2596A705265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjEPPje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbjEPPjd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:39:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBA89037
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:39:21 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso25268759a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684251558; x=1686843558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G37gzrMu4TqK3kGvjNsx+P6G+3xLLe+mvP0p2BsUJuc=;
        b=UM7HBXtYHBlkNTuMj+HwCqBEVIyYYw2iT0ZXMJPPtDZ4GC1nYgOwmR5hE4JfQHT4aW
         LM3O/XRIzhTxU03zYp91oljWmDr+e6TktfwkvH2QwtRrSzj671cRJgloCRm2zwVynyEH
         MQuspYnJC5C5RdUCduxTS+GzOnq6TIN9y+NAJY8gdhGUbQnbWz8GLNomXL+g0pamOzLO
         a2q3kJZuiTNqlHtfcPURNK/IVTFWKuXDYWNqmvMw7yOWasfCHXM2qnz0q3ixkxsBkACj
         o3+pFhC/S53Dh06C7TYzmZGclLU7z6G/0D58FGQxByubjEY6Dcwfti4mLAKhcOIncd2a
         gpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684251558; x=1686843558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G37gzrMu4TqK3kGvjNsx+P6G+3xLLe+mvP0p2BsUJuc=;
        b=WLTgluEvtZ6OBZtd/i9fF376SM+rphhOODaS/P1paSRY3fYqwjctZmHKs49CjSKcaN
         kDhZytVD3awrZNCduwg+zzLxV9ldZTA1TJVY7HOUTnoA2KoAVW2+cugyMjRyt6iivmHb
         g1TEgCnclQQECnWUnzlP+4rnfP0NSyKRZ3OHv/obzkJDT2m544nlDnK8n6Ru8bGcvE2O
         EGIoC5tncJaSnxC4P7hND2CiqoVoU6MsoKIhxv+kcFujzxjO//PilRGDjhAN1XS/nxYN
         8gl+HRXaQT9c2B4vsZIhTXfSRNKhtjbrDt/l5IL2QTZnP8QMAZC3qaSKfFQp8TFgDoff
         ONDw==
X-Gm-Message-State: AC+VfDxSNOr0pJMMhFaIFpZ9kdaxEpiqDN397/fyF2uO+Jya3PQoQLUc
        5XTA2VoikW6fkOsvVeWj3yHhPgekKVb1MvAzpnQ=
X-Google-Smtp-Source: ACHHUZ6trXVDo9j17RfS2X15UIE+hBBVGAWrNQuzSGoEqtYQTusV9ZiU/sOkVMj+eabrQgFBtQNjiA==
X-Received: by 2002:a17:906:974e:b0:96a:4c61:3c87 with SMTP id o14-20020a170906974e00b0096a4c613c87mr18849630ejy.71.1684251558104;
        Tue, 16 May 2023 08:39:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id gv15-20020a1709072bcf00b0095337c5da35sm11348656ejc.15.2023.05.16.08.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 08:39:17 -0700 (PDT)
Message-ID: <c01536f1-0efc-da3c-5465-bee120b62bdb@linaro.org>
Date:   Tue, 16 May 2023 17:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-qrd: add display and panel
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>
References: <20230516151708.213744-1-krzysztof.kozlowski@linaro.org>
 <ecfe4f62-9c54-df5e-cd5d-e7a956510696@linaro.org>
 <8b670310-47b3-c301-99ae-84ccb704d733@linaro.org>
 <2bc16f9a-e150-b3d0-6d72-a2ff0a4d05ae@linaro.org>
 <f790b655-4192-bcad-07af-814a359a351a@linaro.org>
 <894282af-fdfa-d476-fe9a-677db6483501@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <894282af-fdfa-d476-fe9a-677db6483501@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 17:36, Konrad Dybcio wrote:
>>>> But don't we want to disable both when display is not used (not connected)?
>>> The MDSS bus device only has a 0x1000 slice of the 0x90000-long "full MDSS",
>>> the rest is probed with MDP/DPU. It also calls of_something_populate that
>>> make DSI, DSIPHY and DP/HDMI probe. But all of them ultimately need a graph
>>> handle to MDP.
>>>
>>> If we have a display (of any kind), MDP has to be enabled (or the display
>>> engine will not have a way to be programmed).
>>>
>>> If we don't, enabling MDSS makes no sense as all of the hardware will be
>>> shut down right after probing.
>>>
>>> So I'd say either both or none.
>>
>> Yes, so the current state - both disabled - is matching it.
> Right, but what i was trying to say is that if we leave MDP without
> any status properties, it will follow MDSS.

Ah, I missed that it is MDSS child, so indeed there is no point to have
it explicitly disabled. I'll fix it.

Best regards,
Krzysztof

