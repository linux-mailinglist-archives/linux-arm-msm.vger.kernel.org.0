Return-Path: <linux-arm-msm+bounces-3767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD4980911B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 20:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7EE11C2085B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 19:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F9F4F5F1;
	Thu,  7 Dec 2023 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFX5feVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DC2A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 11:16:27 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bf82f4409so1120725e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 11:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701976586; x=1702581386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Njx3DTvexbkSox5QqyKZyNLg2RSJfBg1X63hFLY1KM=;
        b=RFX5feVUGwwvw6KncI/OM6otptG18NUUXkWhNnzK6QIG44A9waHYmUTtutgoqeS1qD
         S2hREuw0HtX7v+sRc10pi9U7rbmxKdQ8NeWlV6sWgy1Ba+Z712nHorjj9VOrvOvLtpka
         HLVslUo3UHgFRIFvPn+Qdg6AWGBsvdqVbNf2msLP1yKFcqMdU7BEKIsus5c1UWUx3kDj
         uib01GYELW951rLfukQ6P1fry6rvq4fpYooa7gk/C7/JjYYt8fStyK8QgNMcCwQqPYXn
         DlJwYjeS74QcXZeRG8htoXWjXIvfcekYwcodpYebt2CxWUFlLrd+P6yOLex+w/GtbKoh
         dI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701976586; x=1702581386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Njx3DTvexbkSox5QqyKZyNLg2RSJfBg1X63hFLY1KM=;
        b=lMeYJODdCNm6n4rcuR4g1zsYeAdbISabH6CunyhPCXCjApvgkOduRSpKhuaiMf64jr
         VNaGE3pEuftkwn+hQF9XRNdqh0vROVrsKQA9IiIYEr946pqo73jY0ZRtq3OnRj3VoUa2
         GtTgZz/uvT7wAS0+XrdpJ+scuKn9no+BOr97QbE6sFGPYv4+4TXcZwUc9OwkMsz8AM5d
         c8DuBUfKOJLo6RjigRfrqkb7ZU4llc4MOm49QF08jVvV8uDgt+eJj6EfOWV1Hp1WV+Uy
         zLf+LTwHUYDH/ByUYSBnnxIU4JPEVeAO0uow9US6RotvVY0XPn+DaSMkoxe9aiVjADTP
         cROg==
X-Gm-Message-State: AOJu0Yx8v5oOvhqQLSx1tGuGVBfufxBZldFj8MNDHb46IbwrgbH4nPjX
	tT3XTthtcAtcQ3eIY3Zjog4hfg==
X-Google-Smtp-Source: AGHT+IGaN3FmyZNrLbkDLl2aF5fW0Mr4v/txXTd2hd8fE41nJB/ar2K2hjxM7QHkmGusyTiDEXZ88g==
X-Received: by 2002:a05:6512:4d0:b0:50b:fa6e:e386 with SMTP id w16-20020a05651204d000b0050bfa6ee386mr3129058lfq.30.1701976585818;
        Thu, 07 Dec 2023 11:16:25 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f20-20020a193814000000b0050c219545efsm23109lfa.200.2023.12.07.11.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 11:16:25 -0800 (PST)
Message-ID: <545d3ace-66e5-4470-b3a4-cbdac5ae473d@linaro.org>
Date: Thu, 7 Dec 2023 20:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
 <20231122-phy-qualcomm-edp-x1e80100-v3-2-576fc4e9559d@linaro.org>
 <b6d3928c-75ba-47a3-93fc-a60729be2e35@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b6d3928c-75ba-47a3-93fc-a60729be2e35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/7/23 17:51, Krzysztof Kozlowski wrote:

[...]

>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,x1e80100-dp-phy
>> +    then:
>> +      properties:
>> +        phy-type:
>> +          description: DP (default) or eDP type
> 
> Properties must be defined in top-level "properties:" block. In
> allOf:if:then you only disallow them for other variants.
> 
>> +          enum: [ 6, 13 ]
>> +          default: 6
> 
> Anyway, I was thinking this should be rather argument to phy-cells.
I'm not sure I'm for this, because the results would be:

--- device.dts ---
&dp_controller0 {
     phys = <&dp_phy0 PHY_EDP>;
};

&dp_controller1 {
     phys = <&dp_phy1 PHY_DP>;
};
------------------

as opposed to:

--- device.dts ---
&dp_phy0 {
     phy-type <PHY_EDP>;
};

&dp_phy1 {
     phy-type = <PHY_DP>;
};
------------------

i.e., we would be saying "this board is connected to this phy
instead" vs "this phy is of this type on this board".

While none of them really fit the "same hw, different config"
situation, I'd vote for the latter one being closer to the
truth

Konrad

