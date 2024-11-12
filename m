Return-Path: <linux-arm-msm+bounces-37597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083A9C5681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4F0C1F23175
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E245219C8D;
	Tue, 12 Nov 2024 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+XgE4BB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700B218D92
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731410270; cv=none; b=DwkU1X10uHatoxRMLclBQXUBNBVwTDNAbe6NWlJ+mMYF8I4JLgGeeJMashP+IGCAGwde+x4z1zsm1yQidMiSyHg6rw3h6jx3sZtMgJl5U5bARS9qBnkKiXqHiEAlTuxFP4Z7PVz9mYb91/Wi+mqQQWm0E9SSEn6a4J1vXX7J8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731410270; c=relaxed/simple;
	bh=pX3ZsBEZbDSOWWHgNQFnA+7zErsVd56w2urC4gYof0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxBOiNx+7AUvUAQ1ljNzhHIh549kcMWGHLENBoIWSEwrRWB7fiRvOBoKVUJVKhSygYf+A4sB1bjrHxgVrJ21V6xqcqgb9dO8GfRYCWfyh1g/kItVD1OHFzNXZCQEaYM7cKhGfpmbfvzCMyAm/z7035zIUXkQaXQHnk20/PQqYiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+XgE4BB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43158625112so48695655e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 03:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731410267; x=1732015067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWJ4Wcr1DDF3OrOWnRqKL1IZGwMD1FboXeJ/D4aEFDY=;
        b=X+XgE4BBdIkeP6q12SpSAfL6MbJnpQPSh4EuqoJ2vQvOywfLYISd0SoCTYr3V9XwIQ
         7DvlWWt7txbdZGfMS8nu6eVQmLXrVTaoBeH/qvwizvcLNE/fswmBCXoggaqDwjRdZmON
         Hg42O2SxeDm66YNO1rpO72PqxVIUahMk1oMoc8QN423sblreUEzasMuWyJOvo/9gQUij
         +hGaKPuoNBBUOfDjcfLmyonOyPkqwhdYr3LgmgPBjZfHH1/W5eXgU6GN9htb1OyuCI/O
         W0iRjgHbNvRyi7ua6zT0uL3s6BkT/j9S1/TI7GrGvYcVjgd5eR75oMYyEsKnbbpNTls/
         Z8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731410267; x=1732015067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWJ4Wcr1DDF3OrOWnRqKL1IZGwMD1FboXeJ/D4aEFDY=;
        b=WLRqKmhacG8ZX0ICZPhjypuxenMX1v/fLCXjRSd/S+/E/8eL9iwf2IOVPJ8FWJAb4k
         lhoeh/YfmlyK+cx6t2CtVMJyOtiV/OKzrzhejeDcpknALiSIYRH7sFkSSaz54y6Z2b7R
         mG3WQisgFa2Dfjm+4R8H/My7lM81Vc2R4xXBcQCbEAmVwRzsqNCP49+Uq6o/+q+wfWcw
         1CzE7ngQwNvbwIz0kRr0zAx9tyiGIygDvMgPFx80WN8/xmIH6qDlxNWAOLTu5PG0tKap
         yupQkfNHlADjycPM1ahCdQmCIN+90OCc7SIxvi93LSNTh3YSTYLOB7/QTCPGuTj1jk9e
         t0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmpNw6QmtVpMNItKw4UztvMLtl33Wt3SX6pY+RShZcJuR+kottKzrWWWGKpqCeSQQ4VZZTZw0KF4Zh3De@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0VMpjKlPPBUoPUJkzvvGaiIcyZUhHjmtAtdz//Po0MnbBU1a
	bXR24i0pneBPQaGef7UXtzuzzSYg+C0/KTR7Baopdx3W7NfRQe6G8fD+E7CErws=
X-Google-Smtp-Source: AGHT+IHdyVKh8yiDtEYPmTAcLgcs8M/v+k6vo/2n4BcU3ilUc3c9bFTnx7DhiZaKwNyqsYQKeh+Q7A==
X-Received: by 2002:a05:600c:35d5:b0:431:5f8c:ccbd with SMTP id 5b1f17b1804b1-432b74fda62mr141755165e9.4.1731410267558;
        Tue, 12 Nov 2024 03:17:47 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053ff08sm209961455e9.10.2024.11.12.03.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 03:17:47 -0800 (PST)
Message-ID: <f6e661da-6a8f-4555-881e-264e8518f50c@linaro.org>
Date: Tue, 12 Nov 2024 11:17:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-2-8d4feedfe2bb@quicinc.com>
 <474d3c62-5747-45b9-b5c3-253607b0c17a@linaro.org>
 <9098b8ef-76e0-f976-2f4e-1c6370caf59e@quicinc.com>
 <f53a359a-cffe-4c3a-9f83-9114d666bf04@linaro.org>
 <c9783a99-724a-cdf0-7e76-7cbf2c77d63f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c9783a99-724a-cdf0-7e76-7cbf2c77d63f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 08:05, Vikash Garodia wrote:
> You did not printed the last iteration without the proposed fix. In the last
> iteration (Myword 1), it would access the data beyond allocated size of somebuf.
> So we can see how the fix protects from OOB situation.

Right but the loop _can't_ be correct. What's the point in fixing an OOB 
in a loop that doesn't work ?

This is the loop:

#define BUF_SIZE 0x20  // BUF_SIZE doesn't really matter

char somebuf[BUF_SIZE];
u32 *word = somebuf[0];
u32 words = ARRAY_SIZE(somebuf);

while (words > 1) {
     data = word + 1;  // this
     word++;           // and this
     words--;
}

On the first loop
word = somebuf[0];
data = somebuf[3];

On the second loop
word = somebuf[3]; // the same value as *data in the previous loop

and that's just broken because on the second loop *word == *data in the 
first loop !

That's what my program showed you

word 4 == 0x03020100 data=0x07060504

// word == data from previous loop
word 3 == 0x07060504 data=0x0b0a0908

// word == data from previous loop
word 2 == 0x0b0a0908 data=0x0f0e0d0c

The step size, the number of bytes this loop increments is fundamentally 
wrong because

a) Its a fixed size [1]
b) *word in loop(n+1) == *data in loop(n)

Which cannot ever parse more than one data item - in effect never loop - 
in one go.

> For the functionality part, packet from firmware would come as <prop type>
> followed by <payload for that prop> i.e
> *word = HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> *data = payload --> hence here data is pointed to next u32 to point and parse
> payload for HFI_PROPERTY_PARAM_CODEC_SUPPORTED.
> likewise for other properties in the same packet

[1]

But we've established that word increments by one word.
We wouldn't fix this loop by just making it into

while (words > 1) {
     data = word + 1;
     word = data + 1;
     words -= 2;
}

Because the consumers of the data have different step sizes, different 
number of bytes they consume for the structs they cast.

=>

case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
	parse_codecs(core, data);
	// consumes sizeof(struct hfi_codec_supported)
	struct hfi_codec_supported {
		u32 dec_codecs;
		u32 enc_codecs;
	};


case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
	parse_max_sessions(core, data);
	// consumes sizeof(struct hfi_max_sessions_supported)
	struct hfi_max_sessions_supported {
		u32 max_sessions;
	};

case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
	parse_codecs_mask(&codecs, &domain, data);
	// consumes sizeof(struct hfi_codec_mask_supported)
	struct hfi_codec_mask_supported {
         	u32 codecs;
	        u32 video_domains;
	};

case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
	parse_raw_formats(core, codecs, domain, data);
	// consumes sizeof(struct hfi_uncompressed_format_supported)
	struct hfi_uncompressed_format_supported {
		u32 buffer_type;
		u32 format_entries;
		struct hfi_uncompressed_plane_info plane_info;
	};

case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
	parse_caps(core, codecs, domain, data);
	
	struct hfi_capabilities {
		u32 num_capabilities;
		struct hfi_capability data[];
	};

	where
	hfi_platform.h:#define MAX_CAP_ENTRIES		32

I'll stop there.

This routine needs a rewrite.

---
bod

