Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2586C4444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 08:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjCVHow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 03:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCVHov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 03:44:51 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00DF25E2F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 00:44:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w9so69189129edc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679471088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3dGgcVJy56CLtMNjjLfSHiR4v8AC8/EHQCvrk5cImM=;
        b=Q92NDs+Jr1AUX06FcUhFEtn78+j6vJ8Wrpk9z3vu/2gvD8oREGeNCAmWEW6ljtqtiV
         keo8FVP806i0kaVPJ97c4AxvwG2+piRPwsLPj9XNdeuvrb07O7ioXdPCVguBYwwj9dqi
         KNBYAlQaAzI76INTgaOTS6WN0uhHEU7B9qJhlisFznAMtLdX8YIyoNRvG6KGjyokaKgC
         k7QVBDTs457ZVUAeV8A4UhCqZanUxJyWXGrs+FSk66lIyba81QFwop2WEGjv0NpaeMXj
         y50BUeSWJ2085oXz7E/d9z1LNqpNHTHKIf1pSbWrmY3wmN/pYbt/+qtCRUU14q8hPVDz
         3eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679471088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3dGgcVJy56CLtMNjjLfSHiR4v8AC8/EHQCvrk5cImM=;
        b=rE1GlpUllwxROsj6rycUusbClBUjERRYfKCL3U7nah9NMGVTxx8SgBnsy7eZ/12DiR
         itPZJ4xsEovlkEWXLgJob6lMaNeNHbXmnXXMYfFX+z0zEiv3+IIlbSVs5fc8j1QP4PLv
         Z2u3hFqgdHa/4YSrl3+d1Fy1irfuFH2IKKhOLjwWtG2BGBqtPgEf5V9B7irlATSFRbET
         gjJ2VMTmnPuiB87F7mT/pCw4emWJQPd0ytP2r/cDz5GA4G4iJsynV60TD8Cg3RTqADae
         DFjpiwrNn0Qinqf21hLtWe0s9TbELP8uxPR6s8MDzbeCljul4+BZ1HRQpmCILD5u4Uef
         umnA==
X-Gm-Message-State: AO0yUKWNo0Pld28L0ohOZrTe3ygpaJ7r6OnpboYwNJxHNuoQbQN2Gd/G
        OPpIJ1+D17/tpyDt83Hcb9DRyQ==
X-Google-Smtp-Source: AK7set95apHFzo5CUdeleFgQho6O1MV6v+VQQccJNVBd2oyCWvpIun4HICXyY/p9b5uzS0geTl79IQ==
X-Received: by 2002:a17:906:1950:b0:921:54da:831c with SMTP id b16-20020a170906195000b0092154da831cmr1236868eje.31.1679471088266;
        Wed, 22 Mar 2023 00:44:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm6839389ejb.132.2023.03.22.00.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 00:44:47 -0700 (PDT)
Message-ID: <f62299b2-0140-f7a1-c307-925472e302cf@linaro.org>
Date:   Wed, 22 Mar 2023 08:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: display: msm: sm8350-mdss: Fix DSI
 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/03/2023 22:35, Konrad Dybcio wrote:
> The DSI compatible changed between patchset revisions, but that wasn't
> reflected in the bindings. Fix it.
> 
> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

