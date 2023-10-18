Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8B17CE8A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 22:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbjJRUUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 16:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjJRUUp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 16:20:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14F6A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 13:20:43 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c3e23a818bso854671fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697660441; x=1698265241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQKss7gP05u0WG9WVmMnpWQKE2m5h/QydzbHUfL2Pls=;
        b=x1eSkTWD7V0o2mLTvhTJ5LGBZtpJlV1LLeYZHjmEOZ4i0BcYHCUDhIBSo9LF6/upBv
         z7uK51nhywU+4Uf4GJ2JZbbDfTcsujdgcvVfccashHNLoPCTeZU00jkvQlBqcuPc/I2S
         TLxF4PajRs9xLwGvegFjk/mkmV9eOFYco2W6ChgqqRoQYoG5MLp4ACnWLqsPoh/abjMb
         aRDcVnuaP01VG8gMBuge/34RV3Ep0RF+TlSF1leXww1v+myAXI7yYQIswmh1Ar1thHGx
         335k5/B9DHnNsGS/gn67aJXTthAyUcyvRh0kOiFEKZ0YENpm5zLYNrsI/YlrAa+C9Bng
         x/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697660441; x=1698265241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQKss7gP05u0WG9WVmMnpWQKE2m5h/QydzbHUfL2Pls=;
        b=dMRd7SbK/BNcwHDbRo+3YqczjqH8JU3YxgH1hmfWgAhPKpzh96LxvrGoZ5PsOmAA9G
         v2NS+CdfBwadYWN1PpsMYd/UychUrxR9SYENbvU1U665IlFBfFRHjsHjErEcCMsszOOS
         7J1cWx+fSVJb08NoUeLnRhOR06gxS8ch5u4p+t6vBwaeRw/HLYl53zJE3YUEUcgw0/GM
         59+J4hTXjPd4sjv0VKItBRkKsTvwL6LPdiBfXUdUPbjmg0917Uq0Il9RuXLe5SuNSE1e
         rCaShrfsRO0eZTCB2r00st2isDmTlC+yEQNdZ15ho0XfGRCfKn8lJsAhIxqREP22321F
         b9Vg==
X-Gm-Message-State: AOJu0YzcH/2UaGcDpUO6VucJleNHKfR0d3VedKl0f0JerKodjNXJnsrx
        JZg4PaP+PQsDsGMVoiy8ecYIdA==
X-Google-Smtp-Source: AGHT+IFeDKwEwJ3M5ZLG1RKyvsLBfGrzubtGFe+FHVuwHAAM5yqRBP1MtToK7ZstjT0d4wYbYT5nYA==
X-Received: by 2002:a2e:a414:0:b0:2c1:86da:3f61 with SMTP id p20-20020a2ea414000000b002c186da3f61mr2349795ljn.9.1697660440730;
        Wed, 18 Oct 2023 13:20:40 -0700 (PDT)
Received: from [172.30.205.86] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002bcda31af28sm833526ljn.42.2023.10.18.13.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 13:20:40 -0700 (PDT)
Message-ID: <11b5db69-49f5-4d7b-81c9-687d66a5cb0d@linaro.org>
Date:   Wed, 18 Oct 2023 22:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc7280: Fix up GPU SIDs
Content-Language: en-US
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-5-7af6937ac0a3@linaro.org>
 <opqdrmyj3y64nqqqmakjydn5rkspizufyeavm7ec7c7ufqz4wk@ey2a7bq3shfj>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <opqdrmyj3y64nqqqmakjydn5rkspizufyeavm7ec7c7ufqz4wk@ey2a7bq3shfj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 22:22, Akhil P Oommen wrote:
> On Tue, Sep 26, 2023 at 08:24:40PM +0200, Konrad Dybcio wrote:
>>
>> GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
>> On platforms that support it (in firmware), it is necessary to
>> describe that link, or Adreno register access will hang the board.
>>
>> Add that and fix up the SMR mask of SID 0, which seems to have been
>> copypasted from another SoC.
>>
>> Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index c38ddf267ef5..0d96d1454c49 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2603,7 +2603,8 @@ gpu: gpu@3d00000 {
>>   				    "cx_mem",
>>   				    "cx_dbgc";
>>   			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> -			iommus = <&adreno_smmu 0 0x401>;
>> +			iommus = <&adreno_smmu 0 0x400>,
>> +				 <&adreno_smmu 1 0x400>;
> Aren't both functionally same? 401 works fine on sc7280. You might be
> having issue due to Qcom TZ policies on your platform. I am okay with the change, but can
> you please reword the commit text?
Hm, looking at what the SMR registers represent, it looks like
they should do the same thing and it may indeed be down to the
TZ being picky.. I'll rephrase.

Konrad
