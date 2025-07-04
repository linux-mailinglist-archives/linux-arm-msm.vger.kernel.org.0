Return-Path: <linux-arm-msm+bounces-63673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9632AF8D65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72380B46345
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1FB288CA1;
	Fri,  4 Jul 2025 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h2yq6RkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6482868B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617391; cv=none; b=DAHPWx079ZEUp8gmE5xt75SS2p+bfK8efHtHiDsx6JSi5uRDNElDbJwCOugmgUTwL6MuQbzgORq+/WCXIgvQi+PrEwA+E3mGsTUeGUNUeyw1I66qlDErgKec1scN5B3KNWNVvSPOX5LIk479Q5giS+lB4j3rxnyduzEAREQbvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617391; c=relaxed/simple;
	bh=0vKgJofS2qfVbDLeJnc2bc+mCh9FaxZgAqij7cOILPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uu33JZTNh7rjw3DgNi+MxPDglaVgj6mKBvQDnUi7NEWlpI0hRkt3Ph15XCWg+dXyV7f0mVpVlHDKqtySEB26HGli/S0hGs5fWGYsqRd7oc6+hLshZco+zGh26HTKAj0pPel8FYCryJ5W6TzJc6Yf6V4eKabfM5cTganOq5B04Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h2yq6RkE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so391053f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751617389; x=1752222189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQl9Ypa8N/fQd7fiGf/U1lVWGmgfHhe4fQnd3suQNU0=;
        b=h2yq6RkEUxLi2dNB8LeODuf5RevRCS/+2/AVSY4zW9+odjyF/zNuRi8UemXJ0m1kPl
         ZErnMrzlAMn55CkLX4o/H9LBAVQfNLf/N/NOAGEJqwar45g3T3Qx37iGYB+Lpg88lvR4
         +crA4+ugZ7LZwC1rsu9bS1EB0h2onJBuPyEdKZ5kwT7NPQ6o++B/aGXxJGe+3+6/BjDN
         ud8BhzImFmKJmokQUGIqrZ2/bZo+m71E7xrpuYtQHhjxg9n5UHLQ8SPo7PhmRSJQydhw
         ejZ5toevOBZIZC5byEuCj5qfYFtuXPf40hVLBBnZbMt0ytJxK2DyCZN0s7UUTfwMOLE5
         06dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617389; x=1752222189;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQl9Ypa8N/fQd7fiGf/U1lVWGmgfHhe4fQnd3suQNU0=;
        b=RshFuzJgvAEZz0tBKucaD8dMsVUmBpGxEN/Ogsy2J7RoW909eM5Jpyxj5odGZGL74v
         5i4DCxXnGTzFEUwq63o86qC49bvdWazr9OuTe/WqHewQsOKmU9Kdquadrtgk+IGg+iwX
         rbAftX+YafBPI+imTlRAmM/Fiz73efD2tnNJwLFJ3/UuezM4vUN+bpTl4n3RQLPJF3Xu
         OQSimLCT0hXQANVVsLCFgtFavGUPjqhVAEdQImdYMaVyg0LM1UC3TJLwoJ1q4NbELImy
         dgMGsAdARCEFG4XjhY0ea12j9wTsFRQP+PFMF+Fg15eEMoL7Qg8Fjm/ZiHj7TmG8+eGv
         Kh3w==
X-Forwarded-Encrypted: i=1; AJvYcCUBYARuqeh7gQHIdujrI51+LkV3yKAczO+1gotm/TXoCkE7icnfnOYUw0e2o1UacFGOlpcuyt03uY/8s3/R@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1AE3+NcWkd+YhU2klBsmjmA163TxJ5r0ZRzL+iUyLXMvbmky
	LpjzI8FhaY2He3ZxzSbJd6YBt6o8lt1OcUQT+urtcLonzz4Hm6OOGBmGWTcD2PsOcsA=
X-Gm-Gg: ASbGnct7TlECDD8BzfZMQqsjRZaW+v8zVR91Wu+Of1KsYgsjpPF++un7GZJwevD6mL7
	nLNCcScoOFe2byF8nsfjKsMl/vF747ArARh2KSUn/q5+B+4OvBtFeRW06F1ddcJKyCSksyMupAh
	gjCCeM+8sKKRcfzxra0Zzq3i1FpEHwYOUqHeu6Ksy6w3sdk6QX6WvmnYHbEmfT+G4GxB01DZ1GW
	KV6dAGav4FjYwRs/ZsgckMhw+vXlk1hf7iz3R6jNS/CMF+SPHAvuH7TyBwVv8nOZ2lUaw0I3X0x
	cIrU9Acvp4uVOocNivbhMMLNikNnLC9W9FYpASFzAKFTcKJGq9ZQuRlArxqJqifT+fZ/W9QMT7K
	gr8eO+MyNgGd592kADV0cKHhyS3c=
X-Google-Smtp-Source: AGHT+IHHgjaBnAo5QwMN3YDy0wbG9DnxVwT7uttl5fAV0MIC0EYWYl5on3snuz454zD1gSCLp/iWwQ==
X-Received: by 2002:a05:6000:2888:b0:3b3:bd27:f2ab with SMTP id ffacd0b85a97d-3b4964bb66fmr1281979f8f.5.1751617388607;
        Fri, 04 Jul 2025 01:23:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969f2asm49958455e9.8.2025.07.04.01.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:23:08 -0700 (PDT)
Message-ID: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Date: Fri, 4 Jul 2025 09:23:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>> I still give my RB for the series.
>>
>> To me the only question is should it be applied to sm8550 or to new SoCs
>> from now on, sa8775p, x1e and derivatives.
> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
> once we do that, we will realize that it also changes the ABI for all
> SoCs that support either Venus or Iris.

I think a dts change is a non-starter as its an ABI break.

So if ABI break is out and reworking future dts to allow for a new 
device is out, then some API change is needed to allow the driver to 
stop the kernel automatically setting up the IOMMUs, create the new 
device as a platform device not dependent on DT change and have the 
probe() of the relevant drivers setup their own IOMMU extents based on - 
probably indexes we have in the driver configuration parameters.

---
bod

