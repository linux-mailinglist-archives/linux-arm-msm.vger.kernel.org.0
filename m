Return-Path: <linux-arm-msm+bounces-56349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270FAA5943
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 03:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D77053BD9D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 01:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469011EEA3B;
	Thu,  1 May 2025 01:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U06sw7QC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7480B12E7E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746062108; cv=none; b=b8OJc0NBG3z1P3Py/zu/reO3DDKPbBc11Nof67iVPwBz/1L5H1n/D6wTNdmUKqtpzOxCyp6rxrcdmpXrUD5bmU/bXOrt3IuDwJYsGbyAnVWq7b7v7ygQRBiF4ir7f0pAIx1N78NjYrBWtj6QsMaP0qDc0r2UUbH1UpCr3KaJ4aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746062108; c=relaxed/simple;
	bh=ywSIwL4X4PiO46fJeYKVtqD1FlF4P6XlRIo807NL+LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZRAEF7f22B8bY9b1TpgJFCTH9xikPkVQS/MR7wYt3n0JUwKNruOO6N0lXWgBCsJP6awIHPTkmPMqStOFPOqzy1HWNkPeJtAGEmknWZNFqtp0wkTOehFTTeDpq8I2c8tBl83fuB92qmagtVdDBgPNndlrrI69f2WlIqVgpJ0F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U06sw7QC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c266c1389so323632f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 18:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746062104; x=1746666904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p565K2Tscj5dN7OaQ3H/wX4KTJvoaNhcwUqyXzV+hJo=;
        b=U06sw7QCq4BuHGXotQldc3KzZk60XA49qndNNF9h5TYwG00/yh6803Nt/kqfGO0cp+
         xxYTmpmVkSdMt1zRCWGCYCSKCcGIuZEUb38AOrNZUxqASip1CHOfpfd1PPatxxT8pj07
         8ffesOmbryUp8CXt3tMTyzxPxkXAXDjKAvrw04DNut1Ud5gBs+RkJdRYx6a2oooWMKHQ
         tTeBxaEAJHOCUcTIO3TMcsKkQ1CZ4zbgEsYQQt2tWpp4Wqx2n0ZtO4TC6JgQE4tHfkMd
         G3OW4pXHmSk/UtSInzjpVo5ClmJqiV+zsO5PibvQWvjmGLF5osAaQJ5LC+Ak04NV+KYV
         udBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746062104; x=1746666904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p565K2Tscj5dN7OaQ3H/wX4KTJvoaNhcwUqyXzV+hJo=;
        b=qaDng5t+M8eKFZiPldDlOEgr+ZzyPiSzUUQchmRsl5mzmq5O2PtBmw5VKoW/esaKhi
         rB6HFh5FOWQhDDvdJV+7NZTM3ujh2+ySMdsUzghTWtPAsLVIZJwkm0uzy91i+fzO1Olx
         lRJPVPpn3ATZfNOHKV92UDy9h/xPXRma76tQG0GD2/lZ4+ltEY9V+atEgSTGt3gjqBta
         ZdBipz1ICTrGUR0xAVGdrlpQrimH5lHmyIKnrqtUatRXtUSnugXtdSB6gPgVcNE0IG6R
         rWgrqgAKU5JermI3RaRbQh9aQCV8g/pN9Bp66MRqziAHCZY60h5C0JPFWnISU5MPXmU4
         tq+g==
X-Gm-Message-State: AOJu0YxgPUrZ5RIfl8s1KFEcSduNrVK4A3lH/BMEQl/UdGzwtoPBhT5U
	CsNkqBF3aljKbHYmAcPgIouXh+5cbD1IkX+lbJPvxQaK9Lf4mxmoT0MvkyR+J4s=
X-Gm-Gg: ASbGncu8wvq9g4dBc5mMvEGBLD9ZhE86KpwzKl3FztNx3HReM08CUkKw2Y3rYG6toHz
	jzWSuOscQ7eVTcInca7EbCL3whW2J/NSFBBa3h0QYFAzerTmG0twxBqLqDNx+lPZEdv7EJxkSf5
	t0PcJL7qvJ2BtxiA38RX5JSvaAnto5dt1pFXj9ObVMIhjahsC/ApSwp5aqjdZDQks+Yih8OxBiG
	9xpvpkNxzAfIJRKXAQp/mKAjOX/2zWpW+vB1f/wl5Vmizp1PldTLHOt84eleRjJaLdVhuRAMBGf
	aoQSGxgmCWFl4MwO/EC56SQLgbWempdk61kteyqndPiGVYipt0tDrdw5SvaRGexqlWg1vmnPjg9
	80/H8IA==
X-Google-Smtp-Source: AGHT+IGw0DQYAnAOxEpiixNvXozVZ/EZXnSgb2BFqQ2gm4zWs385rrcA0j76FBVCrJDetKCzw7puaw==
X-Received: by 2002:a05:6000:1ac6:b0:390:f738:246b with SMTP id ffacd0b85a97d-3a09404c7ddmr351517f8f.15.1746062103842;
        Wed, 30 Apr 2025 18:15:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccb8e1sm18588910f8f.59.2025.04.30.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 18:15:02 -0700 (PDT)
Message-ID: <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
Date: Thu, 1 May 2025 02:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
 <wOxjiEBKO2XU-PikPlT8IMpSGOrP4ocgZEIj_zNhLzzBjySkhGQzupjmJAFhUHcnknLKSASwk33LjBI6WrZ9vg==@protonmail.internalid>
 <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 12:11, Konrad Dybcio wrote:
> On 4/15/25 9:38 AM, Wenmeng Liu wrote:
>> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
>> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
>>
>> SM8550 provides
>> - 3 x VFE, 3 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 8 x CSI PHY
>>
>> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
> 
> [...]
> 
>> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> 
> It *may* be 689 instead but I'm not 100% sure
> 
> Otherwise the numbers look good
> 
> Bryan, Vlad, please also take a look
> 
> Konrad
> 

+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
This should be 689 yes

---
bod

