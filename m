Return-Path: <linux-arm-msm+bounces-44353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF75A05954
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B050165B2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0201F76CD;
	Wed,  8 Jan 2025 11:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwUMXpXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845E1F76D0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334777; cv=none; b=WQ49YslhJ90JRjrNFOCEbwhPpWDNfDw7RNTxyYIy88uoqVaE2W+DIW7JpsaVnR9TuBHI4mSchcQznFG2ofd4VwCsZB+HMdWvpCzqsGSvvl+Vxbb6iYe0cJ0/Ra1M3dbi5zM4uWAJU7x8ySEPBU44TWMjCCh4NlsU0fgifbASM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334777; c=relaxed/simple;
	bh=HZCEetwRael+dNFw4oLqL99vRLgbXiFXWkjfYlHHQBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk5Oozlq4fmp/+RUog3ewsZ3HsWrH9sD+KLXlcB550ZKaZ5BtkJmGRXpXd9sxglbl7X2TBRRHlEsvaZAhp+wUoV4ksJFbZx0KiJmIGj6A2SPMH7DyRJHecXf5maTbdpRyqaLmGOqBoJgFh9m3GUoQawcVUWMezeUf15fK22W6nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YwUMXpXy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862c78536bso825782f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 03:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736334773; x=1736939573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E8p18qN2yYH0mtoCqB/wWFUlUmYpYcguuGr2FBn7gA0=;
        b=YwUMXpXyMvzRZtUaTIGmbuuWDF5maSDs/iuvFJvWRgTihmoOA5zUhQM3wj5QasxNRx
         361iTuh7piJZksNc+nVQHJi6Gr5sP0TOQrtYh2+YgfYqdXli3M1aQC54JM10Q5kYZahs
         HSq27GebHa++gdH2oHf74ELY7ik2IX+nUu/f6gvVYOXggToMsQef8kI2x/OVADeqi58a
         4ZL3aZfIkm+p9h7alUH1CFyemwZWAJVcu1xdMbO/wIDpeeGQXdpIDGGS+2r4VeiCcd8Y
         HiGnEb7pU6ogINRhkU9aiptMBq3FjU1BNiFvt4WBPCxl4ZmCF5Gx6gE13sv7YkSxj4bd
         RyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334773; x=1736939573;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8p18qN2yYH0mtoCqB/wWFUlUmYpYcguuGr2FBn7gA0=;
        b=JYaMXuk5B4bgPndHMtEULX29QvjLCScpoiOm89rDWqLD09yoK1goUBXy0UttIoSyY0
         xYtMu3SepzlNQB0jx9MO7Uo//FctHhWeAk0X1c7mv6HP3Ps1H5IaiIYDpHnsiOAhH7G4
         bVe32Fe44LVJcoumWiKhVBg35XdgCrJVdJBvdh9jgPnx0zrQKCfGwzXrmTxzVuTx1ykm
         VWlcbyUxWiDra9eJQLQbDoLWzOJVL8pvrEOHsWLJohQ+aAcCpUOWkWYSFkwNJYMY5o4J
         ijARJgA5B57lmo9D3TEe1dyIHtx+0RFUnjNQobYTWg5w34ORhWcU3+XhBfoNxYPRoZr7
         pWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7K0oE69Kdyfz92rQe9egXEItG9YXm1xvscgddxgjh10yZOJaHXiru3OX7a+UlazlhqXrKQLiqKUHDy3Qi@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGcj2ht0KhlcgdCQmm11QRYVtYqfNkcrOt7fYikK6VpnjfaQI
	t59pScYf7NxOkZESZRf4j0lycVjxdFPaHabcMDhfJaX5BHXQ9dursBhkTSoiJUM=
X-Gm-Gg: ASbGncvEVJUNvVbyeydztgit9d/TbXMSaBFJZHytz0HVOFFz7Vs7Fw7laWZ13CG+H42
	ziKYHclBBBUAooZYiWOVzGhDO0+SwYGpQA8MpnGBFQYhDWhQ+pONA8jM8k8CbRlfEBli3hq/JLz
	jkvjPA9uyXlTikbtw7Jc3quGDmXIhTGob1TF/FPw+6QibAejSCk/NV1JXsLcAaMkMwcLfzQUjYE
	7DwzSJPIZh3paGGLMJmqA+p439W1D7c9YaIU0536SUyo7/aZ6boLDOTUDclGvMnEuB27Bf2hLsl
X-Google-Smtp-Source: AGHT+IEM8rCW3UPYD3EciO4Pw5JPCX65SyzCXXRo5TKTJ3xOV+GtrweZsjR4+WVhxiNLpjsRHOd46A==
X-Received: by 2002:a05:6000:2ad:b0:385:e374:bd4 with SMTP id ffacd0b85a97d-38a872c7de7mr811485f8f.3.1736334773568;
        Wed, 08 Jan 2025 03:12:53 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e96365sm17090145e9.43.2025.01.08.03.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:12:52 -0800 (PST)
Message-ID: <b0db7570-5606-401f-bf1a-dd1076d2dc52@linaro.org>
Date: Wed, 8 Jan 2025 12:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Handle various probe ordering
 for qcom_scm_assign_mem()
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>,
 Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
 <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-3-9061013c8d92@linaro.org>
 <o5oz3scbvsvutv43uqgh74xzfxituzieaa57o6mzomdyr3qixo@2j4ogsbu255o>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <o5oz3scbvsvutv43uqgh74xzfxituzieaa57o6mzomdyr3qixo@2j4ogsbu255o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2025 01:42, Bjorn Andersson wrote:
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 5d91b8e22844608f35432f1ba9c08d477d4ff762..93212c8f20ad65ecc44804b00f4b93e3eaaf8d95 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -1075,6 +1075,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>>  	int ret, i, b;
>>  	u64 srcvm_bits = *srcvm;
>>  
>> +	if (!qcom_scm_is_available())
>> +		return -EPROBE_DEFER;
> 
> This API is generally called from places other than probe, making the
> return of EPROBE_DEFER undesirable. While not pretty, a client depending
> on the scm driver to be probed is expected to call
> qcom_scm_is_available().
> 
> qcom_rmtfs_mem_probe() does this right before calling
> qcom_scm_assign_mem(), am I misunderstanding the case you're describing?

I tried to reproduce my NULL ptr but now I cannot and indeed if every
path is protected with qcom_scm_is_available() everything should be fine.

Let's skip this patch then.

Best regards,
Krzysztof

