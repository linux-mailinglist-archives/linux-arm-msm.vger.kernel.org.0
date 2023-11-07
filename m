Return-Path: <linux-arm-msm+bounces-119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6E7E4B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E16A61C20969
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9AA2F844;
	Tue,  7 Nov 2023 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tC06FUe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278162F840
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:43:12 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6881F10E5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:43:11 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a5f2193bso149183e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699393389; x=1699998189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AXlSZgo6Ub17duhdLAffFaCrkSr2KsSchaKezTprak=;
        b=tC06FUe8Ib+cX2F52toMEsqZ373ILnVeNLBTwu2PD63fnwJzM357XmnG1zODq0skTU
         lO/wzSOqREUJp3fq/4x6/pQ8F50biKKAy86LUhcBUJ8LhKmRALlZlSD2j5bVFHFOvrRr
         0ql/cRUPpwF6ExGg9f8d8ZrMIYDg2lvEsq+dq3SaakzCNkxWABHOet4sIVyF0NluP19I
         lCSxIaYpgzmZUUpzrgBpVPC1ekyKxsgKDp3U49JwN2OkGrnaCjuE9Hc5pQbIYdrajMDD
         d3XbHprzZW2EW35gxQWCiKlJ3K5gzIIItGpFt5VImf3bihRV2f+yxOvDXyoU2HGvHmlH
         seAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393389; x=1699998189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AXlSZgo6Ub17duhdLAffFaCrkSr2KsSchaKezTprak=;
        b=mklj6q2cy8tTvdpXH9TmdXUX2q/6mYzq0oV0weaSDuOMVhTECzufnWo6CqAvhjbIdg
         mZYQVoVFID4ILUE3zU9H7t60WWU8Igqhi0fNs8VAqdYmITeOH4qujdRuosHBwidcCLcD
         kjffGKVLzoZn8BhI5Ln8Lgkc6fzwWI3OJCfmvNfpJ4mNQHXbyooEH1+2xqAYxBgP377R
         6C27n2sA8RP4kTMqxINvRpWJFeGOgQFP+fcsEtSAm0FMEBaSjK0+osNL/WZgsbRHk4eJ
         l/Td86uDjxBrquzVRS0DAHdyCR1V45x3BZUd0eRrfgecGXGaBl66uvG/ZnkJDSQVyXMj
         H1Hg==
X-Gm-Message-State: AOJu0Yx/jZbM7lYQKUyC7hvP65w44F4LGOnq3UWdQdXplKkg+jOBbdp4
	zkq2Z7f8NK/YK6orXiml+4D7IA==
X-Google-Smtp-Source: AGHT+IHbFHwp/wiPt3tnJrzJHbNIh/1ZtBr0DHDmTnDnIKj7SfbwVlpDFFm25GM2jJqAisEvWw6Lcw==
X-Received: by 2002:a05:6512:952:b0:507:973f:a7dd with SMTP id u18-20020a056512095200b00507973fa7ddmr1203123lft.26.1699393389665;
        Tue, 07 Nov 2023 13:43:09 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k11-20020ac2456b000000b00509366f4f7esm460879lfm.121.2023.11.07.13.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:43:09 -0800 (PST)
Message-ID: <ff8532ca-fe74-4f52-bab9-b14f6a4599b1@linaro.org>
Date: Tue, 7 Nov 2023 22:43:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 two-phase MIPI CSI-2 DPHY init
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org>
 <20231105-b4-camss-sc8280xp-v3-3-4b3c372ff0f4@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231105-b4-camss-sc8280xp-v3-3-4b3c372ff0f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/23 18:45, Bryan O'Donoghue wrote:
> Add a PHY configuration sequence for the sc8280xp which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Makes it sound like the current 2ph/3ph split is rather nonsensical?

Perhaps we should restructure it to match hw revision? Especially since
one can get it from the hardware itself..

Konrad

