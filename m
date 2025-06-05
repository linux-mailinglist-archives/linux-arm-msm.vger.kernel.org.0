Return-Path: <linux-arm-msm+bounces-60306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6DACEF4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 14:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D790917111C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 12:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D061EEE0;
	Thu,  5 Jun 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COomPcny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074719BBA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126876; cv=none; b=OIq0AeXAzSfDMYY6dcHIZ+NI/GChLKVIKEYGcg9mLG+qPSQtLW/kNXdX2eoXuQ42XxoIBs8syChatYbSN5AQaTR4xq5PyYBsGMijdXFuAwioX3kzHpSSt0J62znGz/OKR7LCDzwcSjHV6KSKC5jguxxt+gR4/JdoG5GYFMKgaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126876; c=relaxed/simple;
	bh=cjbh1iJPcHo1SoPgqjrQYH/wQ/TWFV5f6hNewSpBYZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuwT6P48eWp87q1N+DdhJ/EezcLW9jGDPwo93rfc+70lCQIkfK3mDrGTE73SpmXkivqEpQNPz3yCSfBivyyc7Si2A8k6nm2TzaoMknbpuW84aGryF/LMaFvO0Z/4yFaDEdLxHgaXXGeJ35WZs3+mXsirTpRpwpiea1ERzQidH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COomPcny; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a522224582so535039f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749126873; x=1749731673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exkJCJom4RO5dcCa+OJwP+hizG0/yi1+ayoRAtNv+kQ=;
        b=COomPcny5A6K7VTC/wQpkYlI1Vk9iawGMSCH6TtUwofIa5ELpV/+mMAuQcBtY4+zeE
         5Pufd1iXSQ1G4YyhcYsvtbsw1eQ6twnprFisxnsN4zCtjLAfqV1Cz6qGpxlTsmRECNEJ
         r5Zn26cHGXiJxsZYS96yU/NCsHy3Hbes1cgZQpSvVYsrQQDm7an3xWv1gsZhi6xZ5xCX
         MO8dp5oJzbRfBsLCijhmSmDh8PV1H/55cI7lKW+Z1OcGilbcFB1sR0wWAanz0ULlwKs7
         n12FTWqw7RWUJck9R70vK3ZDjqgX2t502xjwcANIWD2bldew9LwM3ih774jGI/MryaFB
         ZIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126873; x=1749731673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exkJCJom4RO5dcCa+OJwP+hizG0/yi1+ayoRAtNv+kQ=;
        b=EM0yUinlCgTGZiqNqqtQ37PjJFJARybNbqKYBJR5n3I7Pf6fkPVPKMWs0Y5qwVnW32
         dXl1O8fcJ0x1jGX0O1LCQA4qQ9UJcLb0MOCBGdEq8TbOuwyUTICzhz75/CwRPsV/dZQM
         /9x0PG7WVR/+nhofOdxZbAihtgWaZ2FgjcXfV9efHR2gVvCwMmKbuHmBGAyF7OkdWlBA
         dGfVOGFKp3JR12KRoAkZNRrHeMRZ9z7PmxjPPtvsAN7g/3SVDY70YkOF6ydDmOzJLRNV
         5fUFLNeL9oFdsmtvHwDa7vGItyE8v8JKzbxj+8rhgEVVJRkfE9RYNO2HSOnGmgwxPElG
         0KLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSt5vXQ8XHt5MMGvRYNkwIorxjVPhYthyORtx7VArjkaTQ7gkmuR3AMVJyLFEtvzDeKzZFcMz0ENKBEx5K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+lexUBIFwaYKcQ95WdoX3pgQEspL0Zw93fMBRASodDe/pNz4c
	sPAsuCKsf+ekZImiOk4UNkfK699wOG9dwpKaiUYf6mC/MV/2qsnPgjWQHuC+d5fwMKA=
X-Gm-Gg: ASbGncvyk6g+vGiJiL9fVhtKWCQ7uBf1Ak0SiQF/oW8fWYDdxQhYtxt3C5IYYPtpG1V
	Cn8grLPcso2HGvujGD8tX0Tyabsdf8X9JrjWx8cu+pulawfupwLltEzzik/LGMjzf6wI43VTcbs
	/jFWLlJEX/BmorI0jhYDwvdnsViRon3i2lTFibatmYfzGoyXid88B3V9a9GSw+54cYs4/Oa+a/+
	QggUrjx9CHQDztYjHIb0noZ1KQ146rPkVeGB6SpYo/Zx0CYSpibcN2wf7mVyDI87nzxChfxh0Q5
	Jx3zorUEvUbQSTQa50R2xvV7dO3piIesgN8tEkUKauHFN8YpONfeN+BMW8+2rq2os/6IMdAGRi0
	H4qzEY+krurAuoFjb
X-Google-Smtp-Source: AGHT+IFay1Kv4O/AIX3uTmBLPt0/aev+6Rj7lbZSat73UDWQjBuMnLbHPYrx37RB3wdZf5F86HsTfA==
X-Received: by 2002:a5d:5f90:0:b0:3a4:d41d:8f40 with SMTP id ffacd0b85a97d-3a51dc3182amr6168249f8f.46.1749126873038;
        Thu, 05 Jun 2025 05:34:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5236d4466sm3690446f8f.100.2025.06.05.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:34:32 -0700 (PDT)
Message-ID: <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
Date: Thu, 5 Jun 2025 13:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2025 01:05, Renjiang Han wrote:
>>>
>>> Note:
>>> This series consist of DT patches and a venus driver patch. The patch
>>> 1/3, which is venus driver patch, can be picked independently without
>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>> DT patches, still depend on [1].
>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>> on QCS615 over(?)clocked.
> Agree, so we need to make sure that the driver patch is not picked after 
> the DT patch.

This statement is confusing.

1/3 states that there will be a fallback if there is no OPP table present.

Giving the code a glance, I believe that is so, freq_table should be 
used if there is no OPP specified in the DT.

I think we are having a hard time here understanding what you are saying.

My understanding:

- venus modification is standalone 1/3
   Qcs615 will fallback if no OPP is present

- dt modification 2/3 3/3 is therefore also independent of driver

---
bod

