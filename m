Return-Path: <linux-arm-msm+bounces-23565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E069691231E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9491F2362C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875D6172BDA;
	Fri, 21 Jun 2024 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVHr/P6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2F172BA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968585; cv=none; b=nLH2slY5hzzZJyY6Kaa7gs5gDfdeqcQae6mzYoytrUAnhjbQX+eMYxr9wkM7CGkEoebmc6sUuHDEMZuaQTbEUvzaeyeQYU5FUR0MyBpsa3cBNtYtzDEOnmM1fkjaPJdWqqgpidIeDOa7yJ4CwHqtRscGUWGxP9q1kzNXlN5QoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968585; c=relaxed/simple;
	bh=BshDJQdhNhXf11L2xygSIbCgPvzBsBsrcg9+j+hrxIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zot/Oojb7jKKFMWbLpFJ7fRq5HXEXyCO6qW4OYb4qBpjxfLKRrUemeShJm04r0DgXpwf7IJl6bHtVRkUFvAx4lnIaztDvNTx+/UWJnLbOnTJP0tXnq78z4hDum/0u2JmlO2lsnrqz+ZZIcxjm0AphEdbBRUDZK4+VhiypspfXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVHr/P6n; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217d808034so18156525e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 04:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718968581; x=1719573381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPEEtZOHgOmd9n8/jwJKYJBhpCqajSuBe3eF47dbP/M=;
        b=lVHr/P6n6fNHFm3wxISbNYNWoUzEx+8rlKIn5YEaROvaHCPfUB4jNSK5xX2y5mlfUB
         elqOmknRLYmDRLqZj9ww/pkGCj6z3xySNh4O57402tgDRn/J3HFW7wHwBuqpG9GEQczF
         VQ7vSnBbXAvMW3VOSjoN45ZlnAwTPRSWUmEikeqx7/iW5xWSeE1r8lpdPHKq8ndntmuE
         N4QD9RqkJawT90arooRZmLKlr88wzHNCIatJLAcP6OKfB/2dqx6EkoR4QiRhw2afmX99
         0ceKGb0iKiafSr4IwW6Yzv2bOj/NheeuxDPDWMx+9jEsCoqvf2YzxTdf//xAjcwB9KXl
         H8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718968581; x=1719573381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPEEtZOHgOmd9n8/jwJKYJBhpCqajSuBe3eF47dbP/M=;
        b=e2F+kLtoOkJqiwX+sXlW+F/JAzDJzmEpUVPyzV4oXPPO4CshFbrKie31l3cPW1VUo0
         8rwlvesqg2Zxmhi3i01HiTQn8J6xFC5lRDT/YKtLjfpI+SVhkjIDZcwWWmrYVeTXdYfA
         kXxv+I5Xa6wiHJ7EqkO0WERNfHZUb8V4LkZqvkoA7hg+5dR4mgH2m4ES04SqiVmsxq12
         iGl5xm/ddoaCac7o6PHMF8iJ4COMEP2mx7ZBBXGwW2/NS429fTQ5US8ZPjTNu3hjk5tq
         ZmW/4SyrNXjmTKFhoSfyE33JCDDC8Ws4N3qGilYvK1Lpqq9ZP+UHLMFBjGvUmeWDSQu3
         uIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3yK8Gj/gI2eqoxd0G3FADywGykddm6q+ckZ7nSl+qBOdZGvXGbv61uXfFktsJpYe5iKnNSOlQRTB+QjvbBsHCjOVeu86tRurMHykWdQ==
X-Gm-Message-State: AOJu0YyIR2gHvSiEuGlmqn7PjOyToEwVLSxftBB3PJgmNYPu84rI4TbH
	0ycXixwC8htwyyhHtwuPktvQHiGp9LgVw9sW8LEIJGjsLSKjcHdq4otizfvIIr0=
X-Google-Smtp-Source: AGHT+IGELu0uHxfAlwboPDwjRtRyDqLbieRNBQ+AhZbFVs2b5uEh5KXbhEXjKnW5TwDgBrj6qXfxtQ==
X-Received: by 2002:a05:600c:2e54:b0:424:6c83:a78e with SMTP id 5b1f17b1804b1-4247529c9e0mr50294075e9.40.1718968581086;
        Fri, 21 Jun 2024 04:16:21 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a8d8esm23675535e9.12.2024.06.21.04.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 04:16:20 -0700 (PDT)
Message-ID: <be3d384f-82e2-4849-b3c4-070de8d08ba0@linaro.org>
Date: Fri, 21 Jun 2024 12:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: qcom: camss: Add CAMSS_SC7180 enum
To: Krzysztof Kozlowski <krzk@kernel.org>, gchan9527@gmail.com,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-2-14937929f30e@gmail.com>
 <f835bd3c-82a7-4798-ac49-cf0d0014d70c@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f835bd3c-82a7-4798-ac49-cf0d0014d70c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2024 11:03, Krzysztof Kozlowski wrote:
> On 21/06/2024 11:40, George Chan via B4 Relay wrote:
>> From: George Chan <gchan9527@gmail.com>
>>
>> Adds a CAMSS SoC identifier for the SC7180.
>>
>> Signed-off-by: George Chan <gchan9527@gmail.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index ac15fe23a702..5e750c481b74 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -76,6 +76,7 @@ enum camss_version {
>>   	CAMSS_8x96,
>>   	CAMSS_660,
>>   	CAMSS_845,
>> +	CAMSS_7180,
> 
> This patch on its own makes no sense. Squash it with patch adding 7180.
> 
> Best regards,
> Krzysztof
> 

Agreed you can put it into the PHY init sequence in patch #3

---
bod

