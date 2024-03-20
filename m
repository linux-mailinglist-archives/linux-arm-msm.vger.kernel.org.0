Return-Path: <linux-arm-msm+bounces-14665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1408814F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 16:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12412833F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 15:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4E852F65;
	Wed, 20 Mar 2024 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZIHFm1y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA354BFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710949994; cv=none; b=XboAKpNG5dwdLPultqXfFMWY8JRSn+k7hqZ22ud6Bv7aL/u2BBXz7yw0QX9AlmsvQIPNxkEBSpn5F1swAZ0ekd97b6naRqCYe4F4yjIdsL97HIYWGcv6Pv5u9uTCeayAUlmMksd/Rl7uSBCG884GIAXQNeiIHXIKemwoJL5j+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710949994; c=relaxed/simple;
	bh=MfcBgDfPvff0AWarnVaEuRLv0qFXgnBjoPJHUPjUFo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OehGgpGa5AiFGgWVrTh4ZehrhzZv69vsnS01q7ra08Nckk+STRDE3+nHc6YYPIxqlTwQbalYkwLJhUmTc++7Qk7xc4H3ZGuZLChb7+MipIFPMc+HZ286ql7eUw3zoOm5/yRblNwLYVCl6QOPHzAo29eAle68Siy3BixZ2fZoZ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZIHFm1y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33e162b1b71so5780464f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710949991; x=1711554791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIWKVzwazGNc+LuikEYYEkUxdrkXemxYcbgcBcqPCCc=;
        b=jZIHFm1yHz+9JOS161pahJX3TXTU9y4LsKqeLTZhAFtfIMzAUExtrf7LEKYBZOLtNU
         Zb03jRcW25WU2o9EYoeAfVXVCRrDpvFoK7UMC7DQRjuAEBoC1yhhS8ptSW77N8Sw+ANL
         FBTda9OPXSM/dfPbE2/DtCjVSdbqvJ0NWYBaV1aVHI4K/VO3n8HEqAgqnZEQgWmH2HX7
         4ZyNOfqgHf7wE08fFIqYiBtCZ5GPaLI6tI7YlvBzFx12VMfatRFuzHM/vAkIMFOb6+zV
         XqXw1yTsv4VYNUNaWLD7pxEl32UFonAiTlmIwJOwoYuXOJ0D2GEnL1Y3OJipCv5YA77D
         QgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949991; x=1711554791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIWKVzwazGNc+LuikEYYEkUxdrkXemxYcbgcBcqPCCc=;
        b=qu8W4SO3PFAaa+wNr1aJ1D1LNtXOmua0C9VrWuK/OCnv45GjTQ0cR5gzuMTh7B/1K6
         IwzgIsmCyU5vOCke1P3RZF24NrWhEmH18wGuZcve9uyGoge7Qq4+iquRuLP6v7NkHqO1
         TRjcZ0DU690tlLP+xnecznWpui6StPHqaLjKF100QzpkMUedGSZSSsOoNABYo5NusGS3
         3oSRZcqsdG+KP8G0REsazeKrfpmln1UjhZC4NksX6ueAx/Wua/2OBzsFQgKyEscCDKBm
         lDQKNLQUeCuelYPsmoMYY41w+BsD+b/ZP71DxluCCxr4yUHqNebXv3j01AnOwjqqzonZ
         WNtA==
X-Forwarded-Encrypted: i=1; AJvYcCXuP/m6v1Lqr35Fwym9RmRHxCS4E6MKS2N5vQaa6Pl47u9ygViTpyeeib6wa7gXaehSSRcsf9xhPKNDhFLIDj4Fjzh/SjX8j3TRzJl8uA==
X-Gm-Message-State: AOJu0Yzzch5Tn/l0CWEjBygJCxfCLOuUIIgGrA5ymHwj+0O89bRz0xde
	G3hkJpisKqS1t7zi+ko+CxozC3LIVRcCMm15j58IpBIBFBR2amefRLKkLY0sOoZsSDxQNQuH3yN
	+
X-Google-Smtp-Source: AGHT+IFfMuzR4KHJ23h9jEnJ0HAxseLpTPp/jJ+UgXkwTsmnSYdXQFyHKchgjH73mFjGxjSbpHvsLg==
X-Received: by 2002:adf:db4a:0:b0:33e:7831:8f69 with SMTP id f10-20020adfdb4a000000b0033e78318f69mr4517054wrj.32.1710949990870;
        Wed, 20 Mar 2024 08:53:10 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bw11-20020a0560001f8b00b0033e7a204dc7sm4401564wrb.32.2024.03.20.08.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:53:10 -0700 (PDT)
Message-ID: <059af407-8c12-4773-810e-09dc66e31d39@linaro.org>
Date: Wed, 20 Mar 2024 15:53:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: qcom: camss: Add CAMSS_8550 enum
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-2-quic_depengs@quicinc.com>
 <bef76969-17df-42d0-82aa-59a75a488cb0@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bef76969-17df-42d0-82aa-59a75a488cb0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 15:51, Krzysztof Kozlowski wrote:
> On 20/03/2024 15:11, Depeng Shao wrote:
>> From: Yongsheng Li <quic_yon@quicinc.com>
>>
>> Adds a CAMSS SoC identifier for the sm8550.
> 
> Why?
> 
>>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index ac15fe23a702..2f63206a8463 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -78,6 +78,7 @@ enum camss_version {
>>   	CAMSS_845,
>>   	CAMSS_8250,
>>   	CAMSS_8280XP,
>> +	CAMSS_8550,
>>   };
> 
> What is the point of this patch alone? What does it change? Why adding
> enum? In the next patch, are you going to add one line to some
> kerneldoc? Another patch, one function?
> 
> Best regards,
> Krzysztof
> 

Yeah true enough, you could also add this enum where you use it..

---
bod

