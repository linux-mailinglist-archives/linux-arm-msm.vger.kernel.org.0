Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCF56397C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 19:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiKZS7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 13:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKZS7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 13:59:10 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066D019020
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 10:59:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id d6so11511253lfs.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 10:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=er4AsguWaCVLCPaCC8qHTQyTFYIRisL3iymu/a9XzeQ=;
        b=ma5RLRn8Rh9XM0IxVM5st+yHs8WdgVUKclfDsiDkq7eCkuATcELlG4VRGdzLo6sm2G
         uFtosykVKUoP4njrClBqVsgTvm7z3pLioXR3CcH5ru/XfsSOG1REtZCqH0rHUIkgFXnk
         Tem5scUEc4VNmR+aXB6CUikIFneyL8TlYNccGnZaf140Cpi1tZKxmK+tLc4ReHPUo/nl
         NlIIjv5t+Cxbm+JJP+K9XMCESmvTeLSyjxLGRbOm0/EM6sO0gaCUEKjfCpWCb0mvvq6Q
         qgKuvev5v5fgxlKJvqQhSJY5DVYkEqPqqQwXxoGnAOIsCXNQ8iJIrIMlOiBZakoNyTxc
         h/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=er4AsguWaCVLCPaCC8qHTQyTFYIRisL3iymu/a9XzeQ=;
        b=PGwIaMTHEgXfEt8notQZncZyBA+UaWuL9C2NgF74J+sA5V/PqlN02zrccRAZjlfy3/
         wwrl095NU4oKHwvYfxuPzAi3OBsS7bVSHiwX/a3O2hdJC8noWJybNLwsUL9Ni/aUjfs9
         aZRKcge532NDQl/93IywEpqZVWAWw7D4fpxlwVRp4pNczXAV/rLmTNUJFa6GUdZdtyKU
         ndDTWK1TQCyAeaxuAZZRHEoEfAl48uF4XM2CJME+dWic55mBSZFcW7A7hkZVnIEN6SqG
         R9oetWz70huynYy4Xhp12cZwuX4L5MfbvZM2dirna+2ZV6qHEHr7qsEqmviRX33w3jAd
         qrQg==
X-Gm-Message-State: ANoB5pmYbaKhFbMTYtg3h9xGCFLbArMpE58PdajevrUp0j9Ace60/yJp
        SM7Hzon0XcHV7Y1OU9Niuba3nTbMaDOuHw==
X-Google-Smtp-Source: AA0mqf7iPaJzB/3B4H5X+5nP1/A2zhsLLWNvT+/MERr3nL41JIjU/Ao9sKFPloBHutd/jbipKRPIJQ==
X-Received: by 2002:ac2:4216:0:b0:4b4:a5b5:1a04 with SMTP id y22-20020ac24216000000b004b4a5b51a04mr14515913lfh.142.1669489148415;
        Sat, 26 Nov 2022 10:59:08 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
        by smtp.gmail.com with ESMTPSA id x41-20020a2ea9a9000000b0027781448499sm732306ljq.85.2022.11.26.10.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 10:59:08 -0800 (PST)
Message-ID: <cbc3b4a9-e199-3a72-e4d8-e65bfa9c7e43@linaro.org>
Date:   Sat, 26 Nov 2022 20:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 10/18] ARM: dts: qcom: msm8974: Add compat
 qcom,msm8974-dsi-ctrl
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-11-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for msm8974 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

