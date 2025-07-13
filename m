Return-Path: <linux-arm-msm+bounces-64716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D7B0307F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 11:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E0917EFDB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7FB223DFA;
	Sun, 13 Jul 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jbdo54Pn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134F1DF26B
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752399574; cv=none; b=E7cok86jPlUntPnc9E7PoFt3piPfYp3cdFpthG09DqyldlBshCXQ7iQqjWh/mRvUX6nmQBkwEdpNoip3XbSHZa5vsOq5mDAig6nuEkHL8Kuzu4YUKoSvBYRrqiUmI2RmumNK9oDmV+30QBCre6MqDY1B7JvnNRSyEhrwCyzkE1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752399574; c=relaxed/simple;
	bh=xy7Z4dB0SZnUO/TJyQTV/ZIHJ+YGQLSRSuzFwWuOJJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc2Rput/6gqrzM7FSoVKWyOi6YOjuC0NSIjZ44imOw5BdGjuDP06iIrXQpZJn5Vj7B0XbVQqcSJv4w5XNAyIDyJuwGVcyDi1ytaTsKC0vI+lXeas+XzTuZUUrFzHXYqteHlPY5IVCfM2AbWZ5pQc9qvNxyEyHwZphOMBodlON2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jbdo54Pn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-456127b9958so419585e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752399571; x=1753004371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o2imWwtvIFUM/l/O0s1JDHC2tQgH1ev1xHjGwkKxShY=;
        b=Jbdo54Pngeo10Ji66h1B1wVrgQL6HY4ooPttvsz1tfFCZfNlkx2qtKdazgDbJzO0b7
         1o7X9Ght+A2DZciIQW4VOk9pD1MmZoNR8zS9J7JykZlnWZ6F3QmpDBUsjWERBHhT+ZZP
         Oe1mPWfV6wO3q0Qrfm0lPeJdiHfoRS+DOCcsVOlxjQbaNOLwYUJ3oLTNlA0tgDrO0JSa
         AYQMxRN7MWk0/93pKh0t/d1FWAAluCRpmHyMdjb7tD4Ts4uehDgVyUk7oMYyO3cXCo6P
         2K/A5GSGwaYRa/f1BxdozI+hlR+X020WgstXKvfo21WOo58LVCj9sJ/1wzNmHcApw9Do
         UK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752399571; x=1753004371;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2imWwtvIFUM/l/O0s1JDHC2tQgH1ev1xHjGwkKxShY=;
        b=JORY58dPo2PVELB+dhGTfRAlQbazOt0jFjHpVGCOVhwtMu7MuXebCHbV198bO88LvQ
         ObBIrs8NOQmW1Sn+NtYYHp/8hh2zid6mYEVXHtZtQ6yf/i3YBE71DXA2ych2l+84GE37
         pv77EJFSDStZntJ+2ZTfb2VIwyFoYc173Fjt/u/No7Q5gs4WAVVXvPyG1Fq1m9eJH5XV
         VtxKGKOIzYVYXFSgbywFEabxzzzMYj+xLL/UW0FkZoFUzEq2oVhPxyY9wUaSnHyfOQAV
         blcXe9uwXsEI15LuCrx2qV++fZETst/YEBh/OIK/2TGfqrTMPqQ5qaMqD3EMx8LljoMa
         nPkw==
X-Gm-Message-State: AOJu0YxPzf8n1bkrro1aRTZku6JVmRxyKZKro5y3gZbK8QDZ18E+EOKE
	eeeaFVy0J4TYs4JodplckarX8D0giG8tnLrr7I2tno9QkJkNR3wxmQsFwKgncim+GO8=
X-Gm-Gg: ASbGnct48NDsNhJo+Xmkdcw6In87pRhz9YFp8KnKtmB1CLSImBrM21JxSTGDeUt7O3f
	jOib0UnucPuKICphPDK/SxopYAZiBC4lAt9OX0x+MI3cdrNcDTZofn+GtMKYAwonbdRupIaoiKb
	QRYdf0nqQBNVP4rc79oPas3tdPOU9dYRU1+p/HN2TFP5ozUSWe3i5qk9JQ9PYguRO/56OUimCFz
	i/isUcsM3oBrOxiidaMIn8Uwg3lWVBypGDxLe5swJb9551TXzBhKxImnClbVNZRlrXJo1V3vtRx
	xQGgk0j6qZ6U1n6/seAJ6clXWZUcRQaV0nOcHQiY1Pbv3f23htm3ymnr8GgLzjDNWP4cndFg3Gu
	tPcU/Ux0vxiBBRGPVGGICAtYdi1vVXyM/eTz7rEHw1A==
X-Google-Smtp-Source: AGHT+IF6ORHe5JEYvPXdztAskmBBiLT4qYNeI+0/ouz0maJY1w1XXjzWo2XIGtoP1NknXRfYW7HoCw==
X-Received: by 2002:a05:600c:8888:b0:442:e0e0:24d with SMTP id 5b1f17b1804b1-455e7b68d69mr20701065e9.7.1752399571488;
        Sun, 13 Jul 2025 02:39:31 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f222e4f4sm58198895e9.10.2025.07.13.02.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:39:30 -0700 (PDT)
Message-ID: <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
Date: Sun, 13 Jul 2025 11:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
 <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
 <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
 <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2025 11:14, Bryan O'Donoghue wrote:
> On 13/07/2025 09:20, Krzysztof Kozlowski wrote:
>> On 13/07/2025 10:18, Krzysztof Kozlowski wrote:
>>> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
>>>> We currently do not have an upstream user of the x1e CAMSS schema which
>>>
>>> On first glance there is, in Linus tree:
>>>
>>> git grep qcom,x1e80100-camss
>>> drivers/media/platform/qcom/camss/camss.c
>>>
>>> If this wasn't released mention it.
>> ... and then this should be marked as fixes and picked up fast, because
>> you have only like 2 weeks to fix it.
>>
>> Best regards,
>> Krzysztof
> 
> I thought schema changes were acceptable so long as we haven't applied 
> dts, which we haven't done yet.


Accepted DTS is just one story, but following your argumentation that
docs do not define ABI break, then accepted DTS also does not matter,
because it is always in the kernel sources synced with the ABI.
Following your argument about "accepted DTS", what is different between:
1. accepted DTS, then changed DT binding and changed DTS,
2. not accepted DTS and changed DT binding?

Why can't you accept DTS and then change it?

Lack of in-kernel DTS is a good argument in your case, but you must
mention ALL OTHER USERS:
1. All drivers in Linux
2. All other upstream projects, BSD, U-boot, everywhere upstream
3. ... all possible other users of the ABI, so out of tree DTS and out
of tree kernel folks. This one is close to impossible to prove...
Luckily we assume this point does not apply here at all. No one out of
upstream trees uses these new bindings.

Best regards,
Krzysztof

