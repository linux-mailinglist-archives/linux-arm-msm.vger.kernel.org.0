Return-Path: <linux-arm-msm+bounces-68027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5817BB1DA8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5521C18A836E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B73264A97;
	Thu,  7 Aug 2025 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgxtn1mY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364125DCE5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579250; cv=none; b=WQr0j6vjuzaHqcAEoS7AYoJeaf3osPfP6Rrk579Fj1q0ro1qmcI7Ko2oadNIxA/S176Thy9WZrEoCRcZVpca1cHOIHOZVqFf1zYt5jT+zfE3OnbKzGWJAmodahBrMbR9Jf7ejnNDr4rquDgr9cOsKewFXHablFHS+h6+Fs4AlSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579250; c=relaxed/simple;
	bh=igUCIrrVeGDZErz4UxdMxyeKYvyk5C5rg69rGcCFkFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJHs7dE0yBXXTphnixTH0QRj9krPZ+yAwWQTIB+VCZbRmSmWmNe8UJYA2u4BhTA57cMF7+dW1L0N+5ZBm+I3vlYsa3Lw7emSTryESmhUZLOqDKnm3jHwL2YWNsrOJT1ZnAH1uenhe7pbWZyIoY99+fVmN60IhOjB69HIxQA4SIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgxtn1mY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so7782255e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754579247; x=1755184047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgzYIUCs5H0EjucoUMdBhHY0eYxFj3kegJfd7p4lHyw=;
        b=jgxtn1mYLafJXNX4H96Umxia0R7Z9LwqBKvFX17OnrSb0ECn1aMJ0fMuWuT1kb2ZSi
         +B6XuanWdg2Tzc9eDvBdqJcPSwwXfR1zUP74RfRswjwH4eIeOJV1sSm6dwOKvlOV6nNX
         k48bpJaQ/CSiNTnIKJuv34An7PONJJ4Sonn0QZd9gp+UC47Rf5NYk5lxOvpSQOT+ShW6
         3xZWF5JtewtqbgfwhoG++Sdq5ztYc0Jfjcj1Q70b8J9ES0af96qAxQwqF+EfyHdfvuU6
         Tp7/UWFSGa4Lve6sab7mcogHFzC5Fd31RSlAByJiA8PdAAmrHK3tM9vf/gHEvQJCsjek
         K6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754579247; x=1755184047;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgzYIUCs5H0EjucoUMdBhHY0eYxFj3kegJfd7p4lHyw=;
        b=NpMxGsusWCPIhiE42o5NF7v6AXV0+LLuJ17C1cGmm8oeanrL0RzH0VxFco4rRc322N
         lRm00VIoR9b56+SyX6gciNMn/rPT5MzHOYU6Fw/qc5YsNUQ0bQEkAwAej/aWfFg/S+8j
         Tz0AG0REOy8pvJSeHkmaWW5ROJrTUawC7TvqaXhkEX3owPIxW0OLGWnDlLQ6f6MmTNyD
         5iQEhd/VaJD3jyienwzt/B95+GAMA+OClOBQwTTmK+5rIUdtQ3TfTxWUhJst33zvK6Xv
         Awgb11VsBSaVNf12WFF0/u4xZOx+TKvEb4IKcsK7mRcBaNF+j1E21jCYfrDDA7EQ0+mQ
         es1w==
X-Forwarded-Encrypted: i=1; AJvYcCVQfHXshBqyfJQbQRy99BHVR/Fvwg5Fa8/OmVFOSEC+aW/jobciff1FYHc2nBjOR/9UytMplgAyvtcq+Gfq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBnbJfDL8x3MRTlEL/rrffUL3r5oA0I0jg4SY0cNu+m2Gn4wM
	srIj21pUvv+Dl8RPVYBMaSrKturA6M0t7ILn4XWGPJ8B7B1m4F3ZQwzuyUYdZLDKvBI=
X-Gm-Gg: ASbGncvogKfHXUvd+U9S1o1KgNlnbMLAPJFMAQ/tQPUgLWiij+4vXZnBuE1YlWrd/F3
	Fmrs7vpLI1HrYCl7dqpQjjou+rMvssCjZAGq/CPAcGMdJY7NLdng6Y9ci+704S1wBulYdCrmGFY
	KrzhZ/jmmUDdwZKuegWrLsrTmXmegSdTFka2zSViDAESc4Yj00TMm0c6n5/BAKyz6BsbF8ag87R
	WnzRAmRBkDa8+mq4/FNFvRWkP7mvIlPGpFr8cKTVfxjU19D4KmbgT3sYXy1Vm+oO/g9rNpFGyk4
	dzEE15rQVKYSYa0Z7NBfvFhNQI9zTbMCI0zi5YszMOranzvagU7T59Fd3zKwmOARVWimzJVDRLG
	nuq4QxMaVywc3X4wEmpUbNEwX7BqhUJLGElDA0XzgRm1mZXGK1DUYyS2HC2fFrbI=
X-Google-Smtp-Source: AGHT+IHbhigFLzcg3fsj4+0TiFhPaNiMmWn7iuuNGJLANEcANPokPhbhdIImZT953oUB7uv8oVzyaQ==
X-Received: by 2002:a05:600c:3b03:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-459e70eeaffmr72328125e9.16.1754579246485;
        Thu, 07 Aug 2025 08:07:26 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm93498145e9.11.2025.08.07.08.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 08:07:26 -0700 (PDT)
Message-ID: <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
Date: Thu, 7 Aug 2025 16:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
 <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2025 15:17, Neil Armstrong wrote:
>>
>> https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13- 
>> dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
>>
>> V2 of the CSIPHY above will incorporate feedback from Neil and 
>> yourself on adding endpoint@ to the PHY however I think we need to 
>> have a conversation about standards compliance at attaching two 
>> sensors to one CSIPHY without VCs or TDM.
> 
> The PHY is able to setup 2 lanes as clock and connect 2 sensors over the 
> 5 lanes available, like for example:
> - lane0: cam0 data0
> - lane1: cam0 data1
> - lane2: cam1 data0
> - lane3: cam1 clk
> - lane4: cam0 clk
> 
> Any lane mapping is compliant. There some Meta slides about that at:
> https://www.edge-ai-vision.com/wp-content/uploads/2024/09/T2R10_Kumaran- 
> Ayyalluseshagiri-Viswanathan_Meta_2024.pdf slide 13

Hmm so that would require splitting the CSIPHY between two CSI decoders 
which I'm not sure would work on our hardware, perhaps yes, perhaps no, 
or routing both sensors into the one CSI decoder and then separating the 
data-streams either in the driver or in user-space.

For such an esoteric setup I think my initial suggestion would be to 
push it into user-space, even assuming you have gotten the PHY to 
co-operate with having two simultaneous clock lanes per the above link.

Looking at the PHY regs, I guess you can set the bits but obviously the 
analogue component of the PHY can only really operate from the one clock 
lane....

Interesting.

---
bod



