Return-Path: <linux-arm-msm+bounces-43618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622449FE5A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B071A3A19D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 11:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AE91A76AE;
	Mon, 30 Dec 2024 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XngVvtF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E03199FB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735558370; cv=none; b=gWTjPdogBo9SlUpzTIqMXZfDzrGLibeysAySPZut0KJaxhk2sdaVFdUvzxBoNNVwFFhK2MwWXPeK2bSoLh0TxvdzjrFiVBHFXxzYlNAB25iI/RxcEQfe9rn01Vd27qgQ+RqKh3EbS5l5CXf8Pirr7x6EY1tdaCx3LTwpmjUScJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735558370; c=relaxed/simple;
	bh=bPApeIOTtR6uiKsu4DkZSlatf3itclaDHuLss/2gK8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAvUlQ2qExmZkpB1d8RFdIzgRWAX6vfP4QUj5RoOl5LLXPQZLo+6gRzoQejDF42u0k92qC4FJvTXx1eoqGNUHd/lTPnkTa/7WvD6jrrCWp51K7wzsl9bmnvF1tqwL+BMNU2mCTXcjujRD652NRxnaqVu3WOqmj84pfQYSVFzJOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XngVvtF8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363ae65100so95453735e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 03:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735558367; x=1736163167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VF/h/Z6dyR04duHdLkQFUqHe71po2e5zlM1m3LqF1Uo=;
        b=XngVvtF86+11LmSBn3tCjECRP4UAnuKhAfUIIGiSqHHpvXa/5MGMnl0yMxun4Ci8dQ
         KStyzQrsqAlJMx1/NKFeKfatNVHsn4pfFD/B80jkCKv3SRB5P0zdQuRdJVhioje9kpV7
         YymmN1Cu1anTt2T+sMQMRDvVaeYGCaUlHrck9gb0zhDGz98d14bVFI3XLbjJb31xIFzr
         hcshW7ir84zf1qhLZhFH/gKbXiNMIo1hxDYzilGtr1yWYhNAlUFqt0FcZ4kZpDNc/Sb1
         ut/5x+BPOOm/O3nyLYsXemz/xz2u+h296hyGg+Pzz/Dq0B8flJefoa7lTj2lNO7p/txX
         GkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735558367; x=1736163167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VF/h/Z6dyR04duHdLkQFUqHe71po2e5zlM1m3LqF1Uo=;
        b=GwiDST+KVrESlyJYsHcl3qLe4FsSntX1rvqTOKvPH857vFPjzrWaHsXQO2k/PNmvZs
         2wwwFDQwalHjwZlT56O4ezROvajURwvA6mjaXOBazBMl+yhCyl/FgEjWemGqoaitx/i8
         AT7JkalsNb1LICaYZT9quMOEcbe5DUh4GqGHowD7NfSkgHHF/aiC1qjiY17Mn0wyAIwa
         f9Av/AR4yhMh/HR+pDc3Bq7QmXka2O2RWdq2CYqLzYovE03Wf6luQEGuOzd0idXUn8KB
         zvwa2oW/TKhz5D3u3K8eo7886woIOMWDjMUmVLyeO3YMbxLhYGgmguAXVnzHgl/vghoe
         +aNw==
X-Forwarded-Encrypted: i=1; AJvYcCXQBbS7dlBMGpu5mFEDAbzqLgppsCy8iiGydGPNEavBiJbrkkX3lxexGsw9oxcb241ocO+LPNwJmp8bIiHC@vger.kernel.org
X-Gm-Message-State: AOJu0YyQmko0CkWXw5r93DzXgNa8hN8qao/1GK5JUAPcZFv6DKXmWumK
	9jB0yHXPjhTu2nCWP1iYRLekjNJCoSYgqD+COsIe0RdXgk3peBSIC7LzDdkLUPs=
X-Gm-Gg: ASbGnctn7y4eujpiH/ba6CbO9337dSeSci66f8GzqEZVTk7bE6xwLXTqY/wf2K4ay2i
	iPQyZ+5g8ZzUYaMeuVsHPAdNyjuiu/OcaaLo9kNk5HKUbWn7a43D73cChW8UTgHamdRbtwMPxFq
	s4FYLiyUV6vmyi/MHCnYMsOrmTwDbEmu6eKhb2tDLVjQRNBvjMdNh7cGuqkWrLWkJfnlSYOODbD
	gewmWtyFKhGZRZFo7CPDMSsltDJoXXWRCwuVJX4P2nucK0H6+hMrixMr0sjRrViUiOoLA==
X-Google-Smtp-Source: AGHT+IEReock5G/DX/5A7x8d4Y0AJaEOxEv7/nrrNTMyKpaKLnKEnGUnDoZp4D/D5JfxeNROqYz3Ew==
X-Received: by 2002:adf:b183:0:b0:38a:4184:152a with SMTP id ffacd0b85a97d-38a41841755mr11317869f8f.28.1735558367038;
        Mon, 30 Dec 2024 03:32:47 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm385513665e9.23.2024.12.30.03.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 03:32:46 -0800 (PST)
Message-ID: <cf0f4048-6d6b-43fd-a7c0-27c7b8852279@linaro.org>
Date: Mon, 30 Dec 2024 11:32:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-1-ef7e5f85f302@linaro.org>
 <504ff336-3b11-4331-b2b6-86289b17ffd3@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <504ff336-3b11-4331-b2b6-86289b17ffd3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/12/2024 13:33, Stanimir Varbanov wrote:
>> +    if (core->res->dec_nodename || core->res->enc_nodename) {
>> +        if (venus_add_dynamic_nodes(core))
> 
> It'd be good to pass the error code to the upper layer.

np

---
bod

