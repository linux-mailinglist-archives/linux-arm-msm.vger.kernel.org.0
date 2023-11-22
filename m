Return-Path: <linux-arm-msm+bounces-1593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFA7F51F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E1628135B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381B15D91D;
	Wed, 22 Nov 2023 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZkkrKaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B591F18D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:55:20 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-32f737deedfso78968f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700686519; x=1701291319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2t59Fa6x9+OMKFeAiyu6I2ztOlailS3HduNbUQsClFM=;
        b=FZkkrKaNeqV77kB6J8pxnhX4M4ex5iikAn9/V1Pw2CNdNGtFDyQwwd2am2jmMdSbI/
         uzzR1NOlyhflTroaYvh+urXF7uWTp3VzO+trAF3eU1PfxFexQU6Ybqn5BGV1qkVD78U1
         t7OIa1J9krn2HiYfMsbuD7Rz2CXPevTT9FVtZyaAraJi7FQD+OsU4tEFUwose/PS8FNI
         3Qj1Mo8DeKpxzhYeP/XMHI+H7dOhHEInAWhPjvY9V6mod94PfehzT80CDbT5GPT+L9LX
         9BE+e2puI2zD4LXzVcojDSluACz+xOzEzAHjWchaPvq1DKpanS57GqRLs3hnBoTiGdFy
         ZSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700686519; x=1701291319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2t59Fa6x9+OMKFeAiyu6I2ztOlailS3HduNbUQsClFM=;
        b=AJC8LVPSyy2xxeVPG3pz9WH+BeOp8bgs8pH64yri07oudzZx/llrcQ3QY+J8LMssY2
         CwagffEVAygsLCHCERk/Xp7Ph/Ts4zx7DxxVCL7pvpNS9RtrEh0J++uvaBk/8Ebck4SX
         fBvjAXbqAuJF/YtenF5o0OUjSzFXTLcVSOUgDo1xnywmrc8CONi1gSotpPCWbcKwJVyT
         LvgRTMliXP52fB/EUNbmgFZQol5q7xBzhNeY/HOG17VtqEBcYcWKfu7knicVyrIKhDlY
         z3B66DeS7d+yumZlUPh4TRjgH6Uqlke72cMA3csGa87WMle4h0xn8i87RHMJZGyKXMxP
         9Yyw==
X-Gm-Message-State: AOJu0YyxLNyC+YLakzW5nOmpEJPvvDBYHR6ddssBil/Ng/p0PFnue6qK
	boabsYHxPBIwolYT2T9QPWGuBw==
X-Google-Smtp-Source: AGHT+IG60b8OCVUD+2XdNjhRQVYCCd4GUOo68JLOTT6dW/Q7BdGxbpywm+InojqevSZW4802hYEIfg==
X-Received: by 2002:a5d:698f:0:b0:332:cae1:c610 with SMTP id g15-20020a5d698f000000b00332cae1c610mr1190003wru.23.1700686519116;
        Wed, 22 Nov 2023 12:55:19 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d6b8a000000b003258934a4bcsm306193wrx.42.2023.11.22.12.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:55:18 -0800 (PST)
Message-ID: <339c3efd-8d2b-4b71-8dc1-cdc30ab7bb8a@linaro.org>
Date: Wed, 22 Nov 2023 20:55:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-5-55eb0f35a30a@linaro.org>
 <6e66875a-5cb1-42bc-86e0-b69cf73981c0@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6e66875a-5cb1-42bc-86e0-b69cf73981c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/11/2023 19:55, Konrad Dybcio wrote:
> 
> 
> On 11/18/23 13:11, Bryan O'Donoghue wrote:
>> Right now we use fixed indexes to assign power-domains, with a
>> requirement for the TOP GDSC to come last in the list.
>>
>> Adding support for named power-domains means the declaration in the dtsi
>> can come in any order.
>>
>> After this change we continue to support the old indexing - if a SoC
>> resource declaration or the in-use dtb doesn't declare power-domain names
>> we fall back to the default legacy indexing.
>>
>>  From this point on though new SoC additions should contain named
>> power-domains, eventually we will drop support for legacy indexing.
>>
>> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> So, this commit should be a NOP within this series?
> 
> res->pd_name isn't defined anywhere afaics
> 
> Konrad

This series is mergeable though the linux-media tree standalone, yes.

Once merged, the dtsi change given in the cover letter will be submitted.

The sm8250 change is posted here : 
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v5+sm8250

---
bod

