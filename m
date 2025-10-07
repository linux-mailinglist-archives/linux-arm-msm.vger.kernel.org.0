Return-Path: <linux-arm-msm+bounces-76277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050ABC2DA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 00:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB1B74F8B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 22:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA94258EEE;
	Tue,  7 Oct 2025 22:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAj2GqOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D966258CCB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875395; cv=none; b=rs3yvrjdd9u/JAC/D0PHaept7lIASODBvGNObeAoE2n2YfTmRPDNKeW6OE8nx694NNOm3IvqzmPqCltK25ztWq0/P5m9aD8SNdv7yfF7d6GAfAJqGKR0EHDQye9PiHPIq9ofmAKprAUQaNWaN6u6YkJ47R9AO2rPxiR6wkjxsng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875395; c=relaxed/simple;
	bh=pMHeIuQx2q4EHNUQvUoEFemD+88dJQKlLGcjt4nVQGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2Do61pp37C8kwqCIYLLwSChX1fxpjtpsEmYIkiwPXBBtwlEJFyPAwCToZDQ6KoeYTMhwlb4OHmqqrtXRCU/bjuevdbsuXDczGwVBQ3RYqK76xdt3aXPGvFw9G1P4fSbPRBaPIB8ZEN3ZFuDxbivBcwuxoYZsit01enPhEdm1xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAj2GqOl; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b4aed12cea3so721187666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759875390; x=1760480190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjhcAIDF8/EQN2DtNJznmQGOwXEZTQMeZUXrCuISBG4=;
        b=kAj2GqOl6HhgV5mNBcoTW4pypt842MkO02/gULfWx/Kr4vpxUhL5oxbndpxCS5B7Xq
         3nfxJgz6PJF8AAqveUym2jFM28rAAnfY0IsQDZBe1OD4jG3U16IheEvyIcu8TlYJmSnW
         dFRRaO80CQwx8ViXQeF3Z6sSFdJHZeEu86oEQhCxwDbgSpklQsUGM85rhi+oypbItX6W
         ZW4nfuq+P1KddlbJbgGvxN4Wy8UuHwk5JhhiA9a7jRK+3+xpdDrJFK+JNoQQ5tjlCWM6
         aSsdlqBL3ulipU04pkfh0axr5HCg69ZqVxnftNG/FcfiCcvFCWp+uFhhAQ/q7AaBdHcY
         67zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875390; x=1760480190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjhcAIDF8/EQN2DtNJznmQGOwXEZTQMeZUXrCuISBG4=;
        b=pl3A1swzAR2eUMm4hzAnreweMGpWpa7E8UAgAOiyBRDC2iJBz9WS1dwzq956QLKCMG
         t9hnFXiYr1Lk9WxosYQRVzr5X0+DmXsmtkK83KSAb8bc7th2dc+uWta6KBuPm1tZzUCo
         0xdffoEdpoquQAyNM9FPe4o87y0XTY/uSLn3byznB5CVcUnYZMBoJMHQJpAwE8Vh3b3T
         oho6eravaAS4t4PnjcvyV5WiZ0brses2nZWJtCsITXKmNhLU7OH0bu8S1nnaMO/pHhPC
         efXYyVsj/gNtmV0DdnZipRB/1TPbSRbC+Ql6wv1tNKsvP0QWCQ9659Qg0ardbWXUGSdA
         tE3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJxgGe/yFweZ7Yr+I/OCCBy5yFMGfNn1NHpsLsmpIh/HR5GAU/a7WHjuI729p21x+dOuAvo5YGXI8jMf1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+M+0qg17HB/qBXia45ajlLk4SJtGWX21aWE8MMuDJ6+Uujxsh
	g4VfxFq8RNzX3QW0UdDkYpvh1bm2gNGirU7btEFntqSS77UBV4/IDTyh/NrQj8bJ6ms=
X-Gm-Gg: ASbGncvVh7REDuzAwGch6Phumb0lPToSfQL0egLtALA/ovPqR2jUppwOPNOJm8O+8oE
	bqqPNfRjVSrDJqE5kq5tEIqHFhN56klKYRUaVTB3p9ObdluM3kdfJTCyTHAll9hD0092y5d3HSr
	Ptj0Q16xFwYyhTzp/DyCruRrztOefceUOx0TCPAEC8y3aBmRYIb5FxOSHZ9OEqKl9i/t871NipM
	mvBvBSIjveiwPTHvQO6/p3Au/Te35eivUmgRWxImSRv5Rj8BKCsetonZM0S+UFS++X0OwC/ilmr
	Ube7DDU3jpqFXnrMFAdzGg4OQpAwR/CUUc2JMYiQNX/kcHOVvE3Ghy1usvPigXp5nJU2uNwFFia
	AXpTGqa8T5g3dZdr+5vPqkrC3Luta5Auk9FOyUzLemju8SpNncmachBgFNvE20sKetTefNINqKk
	Rpuwim9mmDXQBikmwy
X-Google-Smtp-Source: AGHT+IGYcPbzACIE/5EMswc0+sjA3tFOGQiH/oXWXnWgAeZoMqEYeVqq1umjaIwNpexDiKcPAtxL+w==
X-Received: by 2002:a17:907:c02:b0:b2e:6b3b:fbe7 with SMTP id a640c23a62f3a-b50a73c4cd7mr128513066b.0.1759875390421;
        Tue, 07 Oct 2025 15:16:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b32bsm1530188666b.50.2025.10.07.15.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 15:16:29 -0700 (PDT)
Message-ID: <45eb9c5b-bc8e-4866-bbaf-5afaed9fda21@linaro.org>
Date: Tue, 7 Oct 2025 23:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
To: Manivannan Sadhasivam <mani@kernel.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>
 <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 22:23, Manivannan Sadhasivam wrote:
>> +void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
>> +{
>> +	kfree(ctx->metadata);
>> +	ctx->metadata = NULL;
>> +	ctx->dev = NULL;
>> +	ctx->pas_id = 0;
>> +	ctx->mem_phys = 0;
>> +	ctx->mem_size = 0;
> Why do you need to zero initialize these fields before freeing? Are they
> carrying any sensitive data that warrants zero initialization?

Mukesh, have to say I don't think adding my RB to this patch is really 
warranted.

I gave review feedback that the above looked odd.

https://lore.kernel.org/linux-arm-msm/9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org

Could you please drop my RB here, and fix the above in your next version.

Also please add me to the cc list for the whole series.

---
bod

