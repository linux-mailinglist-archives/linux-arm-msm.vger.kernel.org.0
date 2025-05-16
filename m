Return-Path: <linux-arm-msm+bounces-58192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B8AB99EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B34D3BD4B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 10:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70683213E8E;
	Fri, 16 May 2025 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6P3fYOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54581C862B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390554; cv=none; b=GyLhyVB57DkNl3TwZY9Womyle9OcqmxGdgi5McrXOpFWxIxS5s9IcG7bxolBK9u89zS3SthHIbHsWgBsG0zPCcbk/ZCskNH/9xl/GfXaQ1+EDnUFtf28u0vYES6ZJcFhReyxSQwn0LJXz0sOS0Yc8pN1Sn6zTyklKZHloCDFlOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390554; c=relaxed/simple;
	bh=QA7w+JQP1X41RoztXYe1wBWPs6Q/cQ0RamgdfI5nt5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g24YxxI/gmQtL3o5IZ7jurmv4SndkRQMDTXsNZN1ZShhuvVE705gyxXJW5Fh54WNh43kNAZm9T6tYYjuEzBprkIezO/OpjgVXQExmF9xmZURJaEZ2A6PaLFt6Cym4oq8S/CF3swVF+HlM4KFAYcBYYShPiMAHMYMUWGtHfjuzEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6P3fYOj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso926324f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747390551; x=1747995351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hf9JUffKXEnurX0H5ucC/QRAQlUyAYzPYXVgjENoyR8=;
        b=m6P3fYOjAN/nQnftkKb8T75OTFJiTS65g7wnxVMaA0W1tdE800dH4ZB7OnvDEiTSMr
         S11aPrC0kfEZqCEE+3KvIvnB9h/WwW8xdZaTNzcschMm0ji48CjSMJhM6slZtJDpxCT9
         qvUQrb6tc5T/qP3AYrCtCTfrjbY07XPs9LmdwCnNjGKZGS6eD8enAafOkqVQx5aXFPue
         MbYrcLFkP/HlcqOiiWKqYLZCoNNn3DWeJT5cPyvkBNSK4k0C2uEQtLo8EtiFl4n2lEq/
         m6UfwWA4bsHOCsIsoqossIoIZ9jT24YZtMBVC6RNUfWGv46kdvkhJyhCYTrE55dAKP8C
         nf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390551; x=1747995351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hf9JUffKXEnurX0H5ucC/QRAQlUyAYzPYXVgjENoyR8=;
        b=gOsiiure+63dOuHMDECetF7naebzwcCjUNHaxUEfs5hwH3DlZu4l1ROXk3vTpMwcb2
         X+9JNvl053p6PFHSS568vwWK18z80wNrkK39mibm9I/e6z4/fS2kTRIK09oRFl7Od6tA
         zbuBwvQviawNvfBhF3Vi+LOYIvaEBn5Voa1y8N/WtaqxRAkYxGjRtEZI1ioJ6UiQe5kJ
         JIDiLTS7w1cvvTtCfVYhsd7kEe085TV9oDwlmKJsWDtBj5A3VL577Wfc+M48u49//JLC
         8dBraYatuR3aaymWuVnaiqAgEw6l2aEAiLnVnAtptALWAX1BYNcNDwuroZMB2W+Fhis/
         4xJw==
X-Gm-Message-State: AOJu0YyY9u21Xq+KVMfpXG18SJwRR+E5KnGR4xORMUy2ZZIzJnVy9Bg4
	qU5HmjzabEBZkNwfnFO4PpCY6MkPEwsV1drTZNI68/KhCk+Ro7+YjBPwpSADKqxlB1uoWba2+v1
	JqnQE/jf4ZQ==
X-Gm-Gg: ASbGncu0YLCiXQXTsOYW+CbLP+G2l/qH3Hhn69VoiljSfantx3zyxpEdrg+6Bu//346
	OLKSxx5oVzRLghD9y5qT7S5rxL+zoD0SQMgPAoOdEYHiXSsPi6iQRXJ++sYABcH4p5zdyGnvkQ4
	1BglorPIw9AXrz7Lc6LOBEivMtGplAOBQkHy08Sb1BZv2wjH8R3vqmS5XRhQlUgKWj9CMyfErFC
	i2gD7r5SUOQzX4pRI7uGga9wMXREAGFWS1Tcx6I0GeoMYuacm8g7RltDKpCV37Jm1Chi8+hhnr7
	8ql/x1JSq/HQDdRMRAKAk4fc2ct0QAedNMowzHO70GxNYkumr+KZzHNJilGFzEdN3PTLKzADPQV
	M9vjoVcYZrRwc
X-Google-Smtp-Source: AGHT+IFhNRLORL0s3WapKxF1HYgMEShdvKo3BGr0+F77ZeAxJEMvDNCLG/bxou1DJVtfsgYa4Ni5yg==
X-Received: by 2002:a5d:4e0d:0:b0:3a3:6434:5d34 with SMTP id ffacd0b85a97d-3a364345dc6mr22238f8f.17.1747390550909;
        Fri, 16 May 2025 03:15:50 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3622b8a3esm1222224f8f.14.2025.05.16.03.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 03:15:50 -0700 (PDT)
Message-ID: <36f02ed8-b440-4760-8d08-b633406ce92a@linaro.org>
Date: Fri, 16 May 2025 11:15:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
 <wOxjiEBKO2XU-PikPlT8IMpSGOrP4ocgZEIj_zNhLzzBjySkhGQzupjmJAFhUHcnknLKSASwk33LjBI6WrZ9vg==@protonmail.internalid>
 <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
 <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
 <db059233-523d-420b-81a7-73b02beef4d1@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <db059233-523d-420b-81a7-73b02beef4d1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/05/2025 08:34, Wenmeng Liu wrote:
>> This should be 689 yes
>>
>> ---
>> bod
> 
> Hi Bryan,Konrad,
> 
> I confirmed that the value is 688 instead of 689. The documentation 
> incorrectly listed it as 689. To CC linux-media, I have resent the patch:
> https://lore.kernel.org/linux-arm-msm/20250516072707.388332-1- 
> quic_wenmliu@quicinc.com/

Do you mean the documentation in the kernel or the documentation inside 
of qcom ?

I checked the internal silicon definition, I think Konrad did also.

Which documentation do you mean here ?

---
bod

