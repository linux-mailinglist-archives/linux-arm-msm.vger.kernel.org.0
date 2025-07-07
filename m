Return-Path: <linux-arm-msm+bounces-63907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB61AFAFB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 762784A0242
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256FB2918D5;
	Mon,  7 Jul 2025 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wahg4mq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE728FA84
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880602; cv=none; b=b0tgu/2up7SzL0f9rnwOrN/L1lZHzU7LurFgaOercUc8NGWi42wCKydueqFyPa8g7vgJ00fBUjUGcYaW7mzBPAmGXtgq/DkRzx6NcbVpJj6NqnlEMziQHjAPsZ5qep+CfEiAylXzIU6HeOBKFVl6HcbMmYQ9dsZng/jpsdUsLiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880602; c=relaxed/simple;
	bh=Tcz/ZSON6tyal3jWImYScvZPwBqGMsZpcQToQ5CN7DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlxqkVxPnplaGyRVd3GdomMBArPHZCDVfl7nGbbuxTbIr+mzsyT0owJb2L5Hwj1Mw3DBsHHnVzD2/XHPP2JY+HhdIlBYV6K7T7CW3FF2O3ZN7l4XFgBDF6FvZ34R/Pfd318CytZcvhBdG7M4J/UiUW/bmAETyRbgSvTjnZZElhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wahg4mq8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1723344f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751880598; x=1752485398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IG5Dp7YEckX2tzrC76ZgnO2aWG2ab/HrAoOTloA/d6s=;
        b=wahg4mq8wZ3AoWxrd8aqF0xLGbOmgqzToBp7PaAZi/yW4e07Ky64sXpFueo7mF9ptp
         n66O2IBKAUiSNnA1HaBPThAiSQn4nxrCedyHkzoMNUSLn8lS5g9aEpJFGwSnbm/EAv9P
         yKEzOSugrv28+S8KJOefZwfvVrKwtUqZdsKjvjkMvEfYhmSl1d1ltM2kSYkZ570zF0OL
         zNqLrAMw28uXZWhtnEO6Ryn0vMF4hDPT1lEWVWkEktAObBtdfyRLHgPIWEwbKpx2twNC
         AzXEMz28dnVkZGBysQKzw1nwMMd4X4/WEZNLEKchGonDEgihp18q3qcF32toZzeBMEfw
         3www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880598; x=1752485398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IG5Dp7YEckX2tzrC76ZgnO2aWG2ab/HrAoOTloA/d6s=;
        b=CUrf+aziWL1gL2SmUAu6ExWKnqrQjspR/7gSmO7G0CQOm4s8UL2lj/o15k7T5RQtRc
         GJXplZz5tLOVMIE+S7PWswnQ+7q1lBNE8mN4NmenB7fbTMOEmEuWITVE2YtaipXZaA3U
         wVj9MZT5Cwa5fQYDXttjhY0SiyUgX6sNlAINcc95XxCslTYQ2II0qQJREXDhzOU1khus
         EZvWgKPmfEfBiJkPloGfPoSiCo9iTmlBC1F31u3fG5AE0WRNb/9Y2NwYoeStdFGlvfke
         gCLCdNq66J3NXtOus7+Ys2d3Y7EUVLTRx1e95OltNAvUVtpezO9QzzBMK+tSMKLAn1Zy
         tNgw==
X-Forwarded-Encrypted: i=1; AJvYcCUUQxPNt7vEVe5VjlkryQbHJE6FUj2P44wgTpk4+eBkU0rJIV87+3VG5LAA1YAlMQG4U8IIgL5mfIlZX8FB@vger.kernel.org
X-Gm-Message-State: AOJu0YzMwOqaB9SMcywOEXgEnfoeZVy96kXEawz2ZOsSdXTBvKf0R+LU
	+B3IgmdnrZGwi0x1LTsBazL/HRGEpZcCSRfqp0idRiJ5mOupRV4CdTO+NqP4Pr31lmh9rM4oEyY
	gaYC4kDY=
X-Gm-Gg: ASbGnctlgKNcDJ69PiOINdMqw4STFuRzE1oXoj5GijSoqbs6bXdSU9Ul2f/PMzTiXT1
	GOH7nMAutiSGqNP/a88XeNYzEgo3FM15VYq1rQUKcA9RM3dbuCU2OFe8zvZH1R4K6R1et6IW7L+
	GBad26v95Jiqpa1Hrr4ZA6313GtnAcfDP11ip2AJPOXmyUQZTMKOENDee+xJexqw7mkPRDHr2Cz
	gO/QYgg+enZ5dxJ5nUlXIx+vDWn9RvLEtVW6ateNUinoh/YVQihWbc5/p05wrIVP+o59Lb7jiIq
	5qykoh12hq6RXlhSp+YjtYtxhcTi86dEDBrgmsLXt4BQif2hq74lpXV7rGYX92rtwEZLgUYDTos
	qrI5AdKcPW3yxtiP0grpdF+Q14AP7myJEpoYf+w==
X-Google-Smtp-Source: AGHT+IH6vBe89bzij44XDEItcxOcNLjzsQbkPRwS+ZfcpIFZigGMShngtte+AasQfadHQ7sAC2jgvw==
X-Received: by 2002:a05:6000:430a:b0:3a6:d403:6e75 with SMTP id ffacd0b85a97d-3b49a9fed4emr4082140f8f.4.1751880598209;
        Mon, 07 Jul 2025 02:29:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b46d4c8619sm9520972f8f.0.2025.07.07.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:29:57 -0700 (PDT)
Message-ID: <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
Date: Mon, 7 Jul 2025 10:29:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
 quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com> <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aGuS1X+RfX38krpf@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2025 10:26, Jorge Ramirez wrote:
>>>> +    maxItems: 5
>>> 2 should be good to support non secure usecases. 5 not needed.
>> ok
> isnt it better to just leave 5 here - thinking of the future support for
> secure buffers - and just update the dts?

It should describe the real capabilities of the hardware, not the 
expected use-cases.

---
bod

