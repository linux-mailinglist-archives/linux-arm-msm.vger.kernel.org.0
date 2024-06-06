Return-Path: <linux-arm-msm+bounces-21894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB58FE4A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037AA1C2626F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C2C195388;
	Thu,  6 Jun 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCQAZDRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC5195380
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671061; cv=none; b=jC4yviZARWCESZuMmwrLSeNXhQv+PVpLeKu/0DlDhMph3MQZgex+Qdmj5RXVtCA+MQIRjZgsXQHD3ZU+/CAZEUQ1SoyCMrgQ48q6Vl/RoL6H9rEATK5gsWItls6O3HLPZdm5SL3xzcMVJ7vhe6XBLHH1dD9fd2Nogx21h64v9Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671061; c=relaxed/simple;
	bh=pdegZV1es17fn1J5D8VlMEL3AsAIz+STUjzDJvWrBBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbqRgjAcnBDNreMGDOIC6xihEfdEGHA6gasNEstCwC4TRiLR4ap6eUNMp2MTLAeBGxPmZuOc8Ly+wDnJ/UEHLPbRxQaaEWp+hc0OzneTpfh2X+KLbJy1jgg0Pz4YUKxPyjrAR6OK7kE56qKC+RIObLUISUkFSXxQvvRhS4jXCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCQAZDRr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a68a288b8a4so45157866b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717671058; x=1718275858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BqMCHnOYUKiSyeeFmyyCshrgD+mltZxAnqCowQV6Uqc=;
        b=yCQAZDRrRQvP7mWTEPIEMY/tBJK0dkUTXrwN79qR9R7fnpt1P8NE9AOYa2DUvDuGYH
         jRR0zvFWTaJcywEDS46HdFYxerY/LqDI+9A0tMcND4LD+Ify2nmWG4V6thYs5ceIcV9C
         AvHmlzvCIeK6zgMuxDBTUZi0SqvSpJ0TxSiTOiKKwvvH0Y3i88QAHqUIAxVb5G7y+VVD
         CRlxS0PZVn2cIG45yLWSORDhor87D9Pr7Bo+eSGjy6RYGp+b5suzvn6033rN9uJ9TdaK
         JDk297Z1/MmrPwwK+d6ivKE/YBDeD1oKStoggCs2XVABWgez+VU8RlrVjKFvEm5MCOfF
         Turw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671058; x=1718275858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqMCHnOYUKiSyeeFmyyCshrgD+mltZxAnqCowQV6Uqc=;
        b=Bc62TjH/CBJQvhqHbbGaDt9S1Uxt44r35BU+LdAyPLDDioNcefQ4A5ia5bzygksrPg
         l8Z5At6MehpUfxV0id8sg3TLJzthggD2j5iMeGzbjhclzsu+XSeDM7UBjTa/7w+thn0n
         Rn2eP84gM3KnrmVk3AI+nu6x7OVHAKcai57LndXgF7DIxArlou5nNjYEU2xqEAWWHZk4
         vVfYlBHGn5iwIDecspbdqp3zaZkWDtX72sXQgfaefe8P+vwwYhzpplPQAVXijBv3Wguu
         KwjakKMNO/VjqRMoCO1lkx9t9cFa72PBAm234wDM/87CTrRwmFVKTh0F04M3Fy6+n3oN
         /lug==
X-Gm-Message-State: AOJu0YxrD+Ys/IlJJqpiyPgaLPesxpCT1nKCMRW4SxXhxjXK0ZeYfNC9
	jSj6EZwbyC1G41RDuzu8beM/bihzmEpBqi+83HDdVtPUdx8nWHWVzZhke2dSqpI=
X-Google-Smtp-Source: AGHT+IGC6TY2jpKwU+jcFlupY0FBJ90KzehToofeXctaFJv53eeQXcJo/6Qmf+JosXop/C5DAbpyxQ==
X-Received: by 2002:a50:d597:0:b0:572:a770:1371 with SMTP id 4fb4d7f45d1cf-57a8bcc6116mr3610017a12.42.1717671057810;
        Thu, 06 Jun 2024 03:50:57 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae20238asm883405a12.73.2024.06.06.03.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 03:50:57 -0700 (PDT)
Message-ID: <b95495d0-15c9-4fa3-a81a-9d01c1af08ba@linaro.org>
Date: Thu, 6 Jun 2024 12:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] Clean up thermal zone polling-delay
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
 <b4dba1d5-448a-4a4b-94d5-f27c6ff0010d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <b4dba1d5-448a-4a4b-94d5-f27c6ff0010d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.05.2024 2:49 PM, Bryan O'Donoghue wrote:
> On 10/05/2024 12:59, Konrad Dybcio wrote:
>> A trivial follow-up on the changes introduced in Commit 488164006a28
>> ("thermal/of: Assume polling-delay(-passive) 0 when absent").
>>
>> Should probably wait until v6.9-rc1 so that the patch in question is
>> in the base tree, otherwise TZs will fail to register.
>>
>> FWIW, Compile-tested only (except 8280).
>>
>> To: Bjorn Andersson <andersson@kernel.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: cros-qcom-dts-watchers@chromium.org
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Changes in v2:
>> - Un-drop passive delays. Whether they're useful where they're enabled
>>    is a topic for another patchset, as it requires examination on a case-
>>    -by-case basis.
>> - Better unify the style (newlines between properties)
>> - Link to v1: https://lore.kernel.org/r/20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org
> 
> So perhaps you can answer the question I have.
> 
> Right now, we have non-zero delay values, doesn't this mean the thermal framework driver has a delay between evaluating dT/dt values per
> 
> Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> 
> Your commit log implies or my reading of it is, there's no functional change because its currently driven by an IRQ but, is that actually _so_ with non-zero values in the DT?

Yes, tsens irq fires a threshold change notification down the thermal framework

Konrad

