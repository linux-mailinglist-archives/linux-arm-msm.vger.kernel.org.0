Return-Path: <linux-arm-msm+bounces-116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509AB7E4ABB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 802DE1C209DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A1B2A1D3;
	Tue,  7 Nov 2023 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FszHCSVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E032A1D2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:32:55 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F36F10C9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:32:54 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c5056059e0so88866301fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699392772; x=1699997572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKkRos3AxLhlHLKkODxjEWuIyo1+V0s7ezJV36Xh+VA=;
        b=FszHCSVehccjmoZ4pEk0GUp9P8KZfEHu3AxgAZ5GWlDoc8QgsO8K6wYBZsLSMMywh/
         zVdencD07EqwuYSmw/sXUjDpxSa39oUEHV9Hat0FZbY5WxaoT3Rcw42BbcnmTB3DATyL
         ibgU/UjG1MGbZDfXH7w51WuJU2p8m2I4NeCIBni5BUrTCF5a2NkzabTBtb02zIjRAkjI
         qjyhyZbQEh0zPkNk0G2NK0Az1Yp9D+4HlDKy+T/VurLK0UevFGXYNUWUARjxW2qXQLlz
         9TQ8WrmmsiKPSPSRboOfyKwRj7Q6T2Ih6KTHMTA2KlqMSHeZxXeV4Dd4qhOgjMGwenUh
         sGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392772; x=1699997572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKkRos3AxLhlHLKkODxjEWuIyo1+V0s7ezJV36Xh+VA=;
        b=daTz4TFoM5x5JTxvRQJNcuL9IjnNHc1+nlyRTCBfTWI3rXKNVyFF4GN0fYHE7gviQF
         MdSCCkBaj8XW6ROvF59Zuj79ddvWgzFvrnr7jZoflvX7O/IK+IhV4NTxxU5U5P6J5YSc
         OgJB9nA4CRSDS0emA9Ck8W/KwEJdv9rMkl+zY+64qpIVughAx4KI0wDealfD1hAp3XC2
         Bj43H7PZkt7oDehW76XNRdcLhR/1L8GZlEl7FCSHI3hirjsYArvmrKP2bqsyP8gF/vpz
         fagbqrtueX6ZmTy6NTqtZT0YqctbRbJg4wwDW0Vwu52PHS6cfPbyb7FXHj5YvtnnvTUp
         CHAA==
X-Gm-Message-State: AOJu0YycIBT2Fl9i+1ZP4j5P1AqU7otlZ5HSFznVk5oxvF9YfkYGhTwn
	9T3opMAC4861uA2GAoIilO4eEg==
X-Google-Smtp-Source: AGHT+IGwYIGt9B8zSOa/PbmGSb6wiXglnteks8C5u7N6FQhpALXFUimVeS/glybjViPVk1eEEX9IQw==
X-Received: by 2002:a05:651c:1065:b0:2c5:25f3:8e1c with SMTP id y5-20020a05651c106500b002c525f38e1cmr146186ljm.21.1699392772585;
        Tue, 07 Nov 2023 13:32:52 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t4-20020a05651c148400b002b6daa3fa2csm1607587lje.69.2023.11.07.13.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:32:52 -0800 (PST)
Message-ID: <45fa235c-c09b-4ded-abc8-ac1d9835890d@linaro.org>
Date: Tue, 7 Nov 2023 22:32:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: Add reg bus and rotator
 interconnects
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
 <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
 <aaacd997-4b85-4086-982a-c992ad52831a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aaacd997-4b85-4086-982a-c992ad52831a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/6/23 16:45, Neil Armstrong wrote:
> Hi,
> 
> On 28/09/2023 13:35, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
>> other connection paths:
>> - a path that connects rotator block to the DDR.
>> - a path that needs to be handled to ensure MDSS register access
>>    functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
>>    interconnect.
>>
>> Describe these paths bindings to allow using them in device trees and in
>> the driver
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index f69196e4cc76..6b4ce08a60dc 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -66,12 +66,14 @@ properties:
>>       items:
>>         - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>>         - description: Interconnect path from mdp1 port to the data bus
>> +      - description: Interconnect path from CPU to the reg bus
>>     interconnect-names:
>>       minItems: 1
>>       items:
>>         - const: mdp0-mem
>>         - const: mdp1-mem
>> +      - const: cpu-cfg
>>     resets:
>>       items:
> 
> This is not enough, on sm8450 this still appears with patch applied:
> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnects: [[182, 14, 0, 30, 3, 0], [182, 14, 0, 30, 3, 0], [53, 2, 3, 183, 14, 3]] is too long
>          from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
>          from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
I assume this is with the path actually added in the dt, and
not just with this patch applied?

I guess increasing the numbers from the getgo would probably
be good idea too :)

Konrad

