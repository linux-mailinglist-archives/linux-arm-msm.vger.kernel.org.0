Return-Path: <linux-arm-msm+bounces-64929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E91DB05214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76F8560E6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 06:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F5726E6EA;
	Tue, 15 Jul 2025 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFQf0uOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182525CC7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561889; cv=none; b=LaJi1DdISFMxYqXbSiMEN/wKvSAH7oTQ9Sh4PXYzy880z3dO+aoSh9dUSCT27KZhY/+6gyBM5wM3A+SCSEy3H+vv1J7V83NOCQHqZts8uZZKAvx2QyMHMOKy/H1v7TGmNcIzR6bl0dR+joSl8srVe3xZArfxQ6t08cTHKmM1rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561889; c=relaxed/simple;
	bh=R/9lqfE5mzB7t5nTZk7gl/4huV9onD2mkEXutUdkvJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kc3cU34GA+EDA26UkgvbgUNOFbZqrzY7TFIEQejWVDYLei8koZxrVbtxuRMC8UrFM2I0ULfihssCR+QFQwIc3TLrGi4HjcFcbW247D/wSZNQOBnS5q+m20JmQVZjt+gwxRdFzUAqZfdbraIANYwrM9iYXSWV5E8Y4uHNm+VI/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFQf0uOE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so499628f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561885; x=1753166685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ig/rHW7suI4HX7zb1V3+gnBiDUNJyG608kAWJVhPdJc=;
        b=lFQf0uOE29EkDzRg4v1TuOjNxjXQM7FaAiFwUjl4kqRc6KCj5GcNRY8ZixlJQvwBQj
         2woXfgML7NsaF2LeojmtBEyDWAIPVnQ9NUx5ORPfOBodPInCnRrm+khOvNikPV2JsAMY
         lxxso1GzX6C3Aas+y2v1potII0B/PmCGwFkqF0HEg66Tw3QFJjL9sm4TMD05//En4S5h
         A6osPHKZWcYDseR0yc9JaIfGbYaxIkNlejEqwlHBkdax+ZNMmyEFR1lguJ80aIjx7Coj
         Ly2b0uZv/qXZR56S3Ud8yzZLAPOBjaMmOLjbrcwNz35UHTqHgX2/jAEy6qPu4CHuGy6g
         LrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561885; x=1753166685;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ig/rHW7suI4HX7zb1V3+gnBiDUNJyG608kAWJVhPdJc=;
        b=dwM0MFCebD8fgmn4i3+vWBGuYAzGfjjTGOhIoXbe9i6+EIqgV43bw2BXVuV9tG9HY5
         DkjMhoIlwhAYzD0YV6I6CegN79iADnWTSVoW93bBAdBNCUQlSX3zdSfLgPYsGrwnBRCQ
         5IF1iZeOzQT/yRF0s6ycOJJjhRrWSQ1/AsoFlsH9zTt/3z8N4dMKVWJN9KHGs+81yzan
         A9GG3W9jSWWI+BNNM4kb+3yBL5A7u37MNCJRW+yUQENWw6iNMHnnmH+ZNF9oKBeY3PfQ
         DvLOjL278tsx8WEarO9jW5jhd9970JHEUtuvX67igF7sZ/J9Vp56HFTVkQunckt+4Fhf
         Qncg==
X-Forwarded-Encrypted: i=1; AJvYcCU+0huJvw/8GFJLZ2h0igJKqvSAnGW7+ONaiCnCbryAiiX4MVisIygzsl5A/8ozT0oBatJCsZa1e04HVMpA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/ssC+j0ftjpi7e0cnew03zT9406bte5hl7HZpczt1jGo5jq3
	htn+vH5CKIy2c3dJ3pPCDXW5gPnVtTIckv2AMj/OKl50V+TPQiLsFf0BGxMjv6c5IR8=
X-Gm-Gg: ASbGncvgIYf7Dm/Fjl7FwVykPdojkC7eE1v82tq6Jtxdkn4n1lr36i4AVRrxWa+3T64
	TdOGoqoOkjljwM0094DCX5ZTzcTtoBnTYr5Xqa2GyKj8xMt8tCY25pgFTsn/0vYS3dVb3SUSNKe
	moppNSNdGZTW9+7Ql00t/HMJ1RRhBne7mWdOdvwEX9VqV4yZXPxAR1iRR00K9BuGqcs+wYJw+9e
	cclbAzMX4L1yL/UUaKNeRGgmsipzvuqLueGlpQTnpSAD1BXR6L26pNWh0G3mnxbggwEl2XhzdJu
	wEKS1AVQHY29uuxM0fZ/udB6wdTXeGY7g1FVSNvuFK2H9ASs1PyBw24ytJdT26Xy5tL2feGZ70B
	u/r5MOho3BCJhqsP9+3I6X0UnrUvvz9cBQBqHeAs3KA==
X-Google-Smtp-Source: AGHT+IE4JpMnkWKgqq2q8I05VmCT/NPVZVUKz5H2a4yK1ZgVEja7568Iz0K3v1/RVrSCTQYtYxMCUw==
X-Received: by 2002:a05:600c:3512:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-45629123a98mr1762745e9.2.1752561884848;
        Mon, 14 Jul 2025 23:44:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm14599412f8f.38.2025.07.14.23.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:44:44 -0700 (PDT)
Message-ID: <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
Date: Tue, 15 Jul 2025 08:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
To: Vikash Garodia <quic_vgarodia@quicinc.com>, bryan.odonoghue@linaro.org,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 07:51, Vikash Garodia wrote:
> 
> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>> in pull requests like [1]), so he is de facto the maintainer responsible
>> for the code.  Reflect this actual state my changing his entry from
>> reviewer to maintainer and moving the entry to alphabetical position by
>> first name.
> 
> NAK.
> 
> The roles and responsibilities are well agreed by media maintainer(Hans), with
> Bryan part of that discussion, w.r.t code contributions to iris and sending
> patches to media tree. The only reason Bryan post the patches is that Hans wants
> single PR for patches across Qualcomm media drivers (Camss/Videoss)

That's the maintainer role, so Bryan is the maintainer. I am documenting
actual status and your NAK is naking what? That Bryan cannot handle patches?

Sorry, this is already happening.

Your push back here is odd, impolite and really disappointing. You
actually should be happy that person outside wants to care about this
driver...

> Hi Hans,
> 
> Incase you would like to split sending PRs, as the contributions for Venus/Iris
> would be significantly higher, let us know, we can pick that up separately.

Considering quality of the code you sent as Iris upstreaming, you are
not there yet.

https://lore.kernel.org/all/1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com/

Please learn, read how the process works, what is the responsibility of
maintainers first.


Best regards,
Krzysztof

