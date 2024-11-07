Return-Path: <linux-arm-msm+bounces-37233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 880339C054B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1AA282AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F8820F5C5;
	Thu,  7 Nov 2024 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5hSW08C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C58E209F4B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981277; cv=none; b=edRRyjRHf4XSZl/ddxdpqiLZfa2J/5CjNOsPZFjhtGCxNJ+GSTOZCjcJZXRX5jpBeSgvza15JiKwXl4fwxNpzHD/DRbojVZlSQbgU7AX6K3c4Fl2UnX8pupiMF6Royb0JUsvsqWI3eIRPiCw6RSeb+OBOAzSR/7va8iVFGXjBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981277; c=relaxed/simple;
	bh=rKbiX0VIxrlLI+Q9P5b/AZEQ9UB2kI1F2AvhStrh5jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUg65Y5nffcpMelyctKPYhHbNwB+vn0KCq9t/wm62jnHT9PBLqfUCIyxHZwuyJfWYyPWWvCpi9kQd0xhdWlHUFAXtZYU1q1Rw4EjLU33IYnv0YwPSUu1hIcbuDOThV7rOxJO1/r9OGS6JP6PYrTmxV+lj1Lo8xUW0SQGjG/6NN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5hSW08C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so7821095e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 04:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730981274; x=1731586074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAbn1Ykfp9his+u2uJIIvTrMc5YEiO1rQix+MP16MdI=;
        b=V5hSW08CxTRHpnGrMua0u5xJDFUFtemXuMEYbZH5EB+KgW/WyULtQJZ1pKTPyQ4E4Y
         +ztffunDMug5OBAntPcVllbVTn1JRARdi19QA5+Fm791IqtEprATHEjwMSH8qzXr+0i0
         dEQ+RYHV+pUb+bWcOVffw6/fTpfixk05vlrEwmk7LDLXa5Q2C51OjxNze6KBJmNNJzE/
         iw6xBWXN8IgXG+f6ePYDdIow6qmNmTFSXSYFKxPPDE69OirLDvx3bs5dNMaOl2cUx9QI
         kj6Fk/SYo4P8WuPpDp4bG8C7pPajSQI3+aernUbSEV13rR+iu3wYuIS/ICTEKzyGYIKd
         vzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730981274; x=1731586074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAbn1Ykfp9his+u2uJIIvTrMc5YEiO1rQix+MP16MdI=;
        b=R00DlTtH+eVjv9aLDlvUiDUK6D+6NamkcBbl+ZuH+1W56G9JvUIht49Hy0YADuPWMI
         9mrWi7WgNQla+/DDQM+hug1Yb3DPN12EdNQ1OsFGaJWGU2zwu2NseJOXzvMfXXSKL7AL
         JSeb9zhKC6cnM4HlUsaApmEacUlaKfpomI7TNm3A/2B2gtmO2Qa0yYtA91vNOFsEA6oE
         ZuCEN+R0NenEh31WYCw/jmgd3pl8+75BwYputMEgUSwS/Vux3tXiyqxcU3slz3EwvPCq
         zEThkI/6Fifa6kIYsVRtEz9md1+o4F+JYgR5biPWs+zA95nwu9LX6n7WF90BdWiiEuyg
         Q+uw==
X-Forwarded-Encrypted: i=1; AJvYcCUDbPHetZKUg8WvyRhLZ495AQHXj+wf5MtkGBkeFvDE9NQrFJkB5qDoC5w5Azrflne56Z9ZJeW3IFKK5Mak@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgtxPW07ghPJqpA+lATMqVbihf6v+FoGeKvKal8SbVrRASCwM
	MEleRul7ctcYGAOmfOQxovHLGzX2Hbm0Tpe7NwUd6SKyYhGzTYWDobsFo8C6VIU=
X-Google-Smtp-Source: AGHT+IHC6ikPOTItf1oVoB8X5+KaaDLzrKVpzqSOI+8Bg2xedEwzv5KM2i7ux46gHe49N/Qx305z0A==
X-Received: by 2002:a5d:6508:0:b0:37d:5084:b667 with SMTP id ffacd0b85a97d-380611593b8mr27756363f8f.33.1730981274007;
        Thu, 07 Nov 2024 04:07:54 -0800 (PST)
Received: from [172.16.24.72] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9719easm1599755f8f.9.2024.11.07.04.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:07:53 -0800 (PST)
Message-ID: <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
Date: Thu, 7 Nov 2024 12:07:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2024 10:41, Dmitry Baryshkov wrote:
>> init_codecs() parses the payload received from firmware and . I don't think we
>> can control this part when we have something like this from a malicious firmware
>> payload
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> ...
>> Limiting it to second iteration would restrict the functionality when property
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.
> If you can have a malicious firmware (which is owned and signed by
> Qualcomm / OEM), then you have to be careful and skip duplicates. So
> instead of just adding new cap to core->caps, you have to go through
> that array, check that you are not adding a duplicate (and report a
> [Firmware Bug] for duplicates), check that there is an empty slot, etc.
> 
> Just ignoring the "extra" entries is not enough.

+1

This is a more rational argument. If you get a second message, you 
should surely reinit the whole array i.e. update the array with the new 
list, as opposed to throwing away the second message because it 
over-indexes your local storage..

---
bod

