Return-Path: <linux-arm-msm+bounces-735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC77EC96B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 18:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3DE2814CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D729A41210;
	Wed, 15 Nov 2023 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aggNa+7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3D4175A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 17:09:14 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2DA1B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:09:12 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-32dcd3e5f3fso4392031f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700068151; x=1700672951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vDuT27fFAPAr+lXJ//e8nOJYd3xhkmGW/lepZEY6+o=;
        b=aggNa+7n1f16oteFqdkyBHgKMCfw/o8IlzawMtOm94F/PADMiE5uQOxhRqXvbutBcY
         Eumu/PyBWhA6JEPEVejDI1ytovT1Hnnim7atD1pOoRmylr2fndFycmWxL5US/Lmz0eSL
         E+EsZcs6gRAY1y9HA+pabCxPY1lUcdXAEbZMuD2oSlniQlpEa7nSZ5IHeAnge89OCrg2
         eJ6pJdXtzpv09ylD6lDm/c01+xg9N2RXC9bUSw2pzZw26yaCDzBDX/irJpty51OteV6U
         LE1Qw+MBjHhG4ZwIwSvYbeQgEqL7h/L1ergVJOrRTwtHYz6qSPz1gEDTxAZwVRrC9Aa1
         wEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068151; x=1700672951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vDuT27fFAPAr+lXJ//e8nOJYd3xhkmGW/lepZEY6+o=;
        b=UkPWrVaWlSwC52bub+y7qN0kuQ0k5HPm2gAadnVwWL3BpMwxir2YmdPiMYkdGOcLxu
         R7scDc2GDi11JgXU4lhEzgIgw0B0XOpDAUBjZEyWCigt323N8SXdpFivqQ3N+n8DJJFh
         OOqoXhhbCKv5G0bKH4Yj9c0ZsEogLKxYRJ9HxfUqQDJZBJpuYX1qQ8cHND1/G8vFkKm+
         210EWkF076os5yyekgOL/6ZiO0CNrMqKlZ8IdyA12G4zpjF4C5nJQ3xAo+UrYiHdbjP/
         WB/Ur4dUfeRU7mjlpbxulSCDk1rc+EeNSyPReBK4D7ZGhYxIm7Bfo/NRfnUAvDc1lhwZ
         rR8A==
X-Gm-Message-State: AOJu0YwOGK5eXlW2e0hqReV/cQy45Ieb3g4sk6yNymxit6uyEvdvSdVT
	3hYcpnBx/qHcHXqCNKXf+PMX5A==
X-Google-Smtp-Source: AGHT+IEUghZ831J4tzYmdf2gt2xTAlWfN6B4Wb74AMJ11f5CmNqzbTCLy3rWiJ//CiGDQFo6yuPI+w==
X-Received: by 2002:a5d:595b:0:b0:32f:7cf4:c779 with SMTP id e27-20020a5d595b000000b0032f7cf4c779mr9948351wri.23.1700068150834;
        Wed, 15 Nov 2023 09:09:10 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id r18-20020a056000015200b003258934a4bcsm11036647wrx.42.2023.11.15.09.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:09:10 -0800 (PST)
Message-ID: <bee6062d-55ad-4577-8478-d20881c5047d@linaro.org>
Date: Wed, 15 Nov 2023 17:09:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: videocc-sm8150: Update the videocc resets
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-3-quic_skakitap@quicinc.com>
 <31dac823-cc46-401e-85f8-d04544bd38c3@linaro.org>
 <2c5dae0f-5bd4-4fed-ba47-1175eba07207@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2c5dae0f-5bd4-4fed-ba47-1175eba07207@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/11/2023 16:48, Konrad Dybcio wrote:
>> +    [VIDEO_CC_INTERFACE_BCR] = { 0x9ac },
>> +    [VIDEO_CC_MVS0_BCR] = { 0x870 },
>> +    [VIDEO_CC_MVS1_BCR] = { 0x8b0 },
>> +    [VIDEO_CC_MVSC_BCR] = { 0x810 },
> FWIW this seems to be a copypaste from
> 
> https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blame/92b31370d31d22e910120f6a875bf0919b3f1773/drivers/clk/qcom/videocc-sm8150.c
> 
> so if it's an issue, it should probably be fixed downstream too

More of a question than a gotcha - 0x9ac is valid for sm8250 so curious 
to me that its a different address on sm8150.

---
bod

