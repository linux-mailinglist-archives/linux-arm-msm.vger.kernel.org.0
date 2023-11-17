Return-Path: <linux-arm-msm+bounces-917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 343247EF058
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB976B20B1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F168F19479;
	Fri, 17 Nov 2023 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wP94JC0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FD7D59
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:28:44 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso2565598e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700216922; x=1700821722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ShhCFgXd2a+dvyNdsyEko8wz3smY5YE3Ye1PpRkAbAg=;
        b=wP94JC0JK9jqluLM6ZH/Ed/oo14Kh0wVK9CU2ZoWdEUC/9XKStHiT5WPN5dSi2JUgb
         KNa+G0gPWLJbP1IzKXXXUrirD/xHiW7D6Xcbd9CohrU9DKnmIL51dweIDdtN3sKn30R3
         F91lM9aYQ7lPlVGckQG3qqIzgbDSwwjwSB0evv/NtBo1s+WZtrmIaIkVdV9vYdo1gvNV
         KX2NOF0APy12alcQvrtunLaLhVl7DmGyNuNgHBluMOf4K3N0a6e7arEk6izYPEgQ8vUE
         tqCYSFaWbDD+FP5hrEMcMxwmOnKbIrG5jQqsxZWabo2q56iBu76DfykFV5KdwT9P+nIl
         9PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700216922; x=1700821722;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShhCFgXd2a+dvyNdsyEko8wz3smY5YE3Ye1PpRkAbAg=;
        b=JI3obchSmTRMScm3fiYSx4+olDwJ+Zg9EJo4kg7bG8I5VX5r1Q00uVEjxdm2bB7kFX
         onH8br/Pokz/NA7rRYxBGJC2/b6ydAZ1rDNWHelvt1LnFTuzt1moQ/5K3LoV8N0upBXx
         szSHfKNX2gUKCuYnp49sRaL3zGp+yPdkcWjerxD1dowAq/i0g07J4lEHAISv1PQvdF9P
         U2TGypjPXdZczNq/KtZfZDqrw3xDgPzm02KmLEovpAjwWohw1cV1vuda7Gj+v48h4i8R
         ohR/IyTofLOVLaGYnwtNbTW3S6Q+0No3LHPrsyhqlPc/3WKmY+KdoSzqJcRKTHp5MuYw
         TPwA==
X-Gm-Message-State: AOJu0YzlIvYC/xjKuR2v7XVI87qq/RyGGFtmFeDcXYMOhwMW6XikfA5q
	EhrBomAHYY2+5IIPr4nXBPkuZg==
X-Google-Smtp-Source: AGHT+IF0BZd04HLR6MOunPzO6jiedB2Bw+xOtumPjIrJ/5/oPAvhPKq1GDMGHAIBn4pDBscR/FufTQ==
X-Received: by 2002:a19:ac03:0:b0:508:1a25:a190 with SMTP id g3-20020a19ac03000000b005081a25a190mr13102253lfc.23.1700216922440;
        Fri, 17 Nov 2023 02:28:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a19ae10000000b005041a71237asm182106lfc.111.2023.11.17.02.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 02:28:41 -0800 (PST)
Message-ID: <ec50efde-f291-4d1b-a527-d64e0263beed@linaro.org>
Date: Fri, 17 Nov 2023 12:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] arm64: dts: qcom: sm8550: remove address/size-cells
 from mdss_dsi1
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, -cc=kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-6-quic_tengfan@quicinc.com>
 <a66be060-9941-4c4b-84bb-1fcc554791ce@linaro.org>
In-Reply-To: <a66be060-9941-4c4b-84bb-1fcc554791ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2023 12:24, Dmitry Baryshkov wrote:
> On 17/11/2023 12:18, Tengfei Fan wrote:
>> Address/size-cells will cause dtbs check warning, because mdss_dsi1 node
>> have not ranges and child also have not reg, so remove 
>> address/size-cells.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ---
>>   1 file changed, 3 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

On the other hand, probably no.

Panels beneath the DSI node will have single cell of address and 0 size 
cells. So these propeties are correct.

-- 
With best wishes
Dmitry


