Return-Path: <linux-arm-msm+bounces-37499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35A9C49EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B855A2821DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 23:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1021BF300;
	Mon, 11 Nov 2024 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Widrqhln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34C1BD9EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731368644; cv=none; b=bjDfKAVIk4oDWlQFOfAQMHMyxmI32VD5G2DYdPynB33PnmSBHYghIZdqQwIHJ+qTklQpMLwz3a0TPC4vEaBy+tBnV76RDjwz3MD0jgLEf8E1q9pggjfcCRP2Vu3XkFS9hHf2c0Sq5TvSO+uZPKJFn3TRR4an+y9FsSK0LTgkBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731368644; c=relaxed/simple;
	bh=IFT/Yb6NdAhPBVq6gOe4jQLjWkYaLGDzpKUR78mMEEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkG+HTolv7Zwo5Nncdmhk3jqjZ4d6einNpHSPsDraT4pw3gKuPtzjpRD44+ut7CXK4LzOCiS9ZOMyRjNnbEo5p85idpn/YM6CmiAAnoTQTLUebG2XgjUwS7N81EFSPz+QYQevCjMgokSbpb5Aio+cuZ+8fyBeoSY/u9/ivil1Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Widrqhln; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d41894a32so2909707f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731368641; x=1731973441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqC4TXV7suFywiwgTXhC5Lq4ofqSxO0KBS5fX9i6WgU=;
        b=Widrqhln5GrPviczKAswEXJPSF1ykXjRXGfc35aO4X0W9NSHWKlHGvWzzy7NuTNssj
         RdVe2KX7aP9qJQsORK1f7nrERkVAgGp8FW7FlIsLo40jzrCqJGlHDIpucmDiBDBkEvaP
         edI2m2cSUlO1UgzlmvVAeIyfQdlql05DzAdEGvdw452HabyYgURVHgohWtPxlOAKz5b5
         4EdcHVlgq2AVM2UxJpmKVtqunA8Juz6W9GLFLAy2vAaBpOVjRQzl+2nRQ8/zaL4y8WxM
         hmIFrM03eNOXFtszPbSTD4JcXT/AnByPZiFYKthyKY+zx8fk9eCO7kpd9ZC6jN/zQOZ6
         dWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731368641; x=1731973441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqC4TXV7suFywiwgTXhC5Lq4ofqSxO0KBS5fX9i6WgU=;
        b=CAnioXRzBDvxjRPr9X8KQy3U6tPdspQmY2sVZoaInudBb9NChhaAubxOI0jNUy2/Lj
         6nIM91UlCb5xocELZP+LZeEA49y24mJPC3xxHwfpzpHKrYXZCGvskujupxSoMIg29up7
         dBBYwdAtV0N1KY+fB7MtmmCTG8Dr2JO5Gbg6gkrXPjsUfrZvz4Iin8hzek1YgSp+HEEO
         zWj0mHEfv+3jLceGYBrGEWQVKKgPsu/Xy5HeF1WjgZO3I+P+ZzDmbMEtVGDSkUtqwd9y
         xHHtPK4v9eSv1ORnbyAC8qLjLML/TD2h3/wjOdmhyVTtNdAacGVRL5H1I7+orZUVQZrg
         qnwA==
X-Forwarded-Encrypted: i=1; AJvYcCVPpEGkPSfQPoY7/pdVFFCcyIiMWjHuQntmy6B7PUJuOAHoWg+8VhVTtii1XE6usJlBv2VPYgaoLi1dfqug@vger.kernel.org
X-Gm-Message-State: AOJu0YySKJMF22bPZn9KGz8/7Y2gkg/CdNgJUKgi7zsru6Ln241+FvOV
	ST/FM8PhK5Tns7C3QCzBrhpfCqXaT/iuzlJqY5PDrPfgQvj9MpIGUpdkNlimjiA=
X-Google-Smtp-Source: AGHT+IEB5saSqqoJLuDwBVnz+ZS72aj4/icyfO87zqTaLLZ3aGZNL4TF7WIe7H0gB/j3ULsfB2LzeA==
X-Received: by 2002:a5d:59a7:0:b0:37d:2d6f:3284 with SMTP id ffacd0b85a97d-381f1a6ca9bmr12994361f8f.9.1731368641480;
        Mon, 11 Nov 2024 15:44:01 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda051c6sm13804156f8f.99.2024.11.11.15.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 15:44:00 -0800 (PST)
Message-ID: <f53a359a-cffe-4c3a-9f83-9114d666bf04@linaro.org>
Date: Mon, 11 Nov 2024 23:43:58 +0000
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9098b8ef-76e0-f976-2f4e-1c6370caf59e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/2024 14:36, Vikash Garodia wrote:
>> int hfi_parser(void *buf, int size)
>> {
>>          int word_count = size >> 2;
>>          uint32_t*my_word = (uint32_t*)buf;
> Make this as below and it should lead to OOB
> uint32_t*my_word = (uint32_t*)buf + 1
> 
> Regards,
> Vikash

How does this code make sense ?


         while (words_count) {
                 data = word + 1;

                 switch (*word) {
                 case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
                         parse_codecs(core, data);
                         init_codecs(core);
                         break;
                 case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
                         parse_max_sessions(core, data);
                         break;
                 case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
                         parse_codecs_mask(&codecs, &domain, data);
                         break;
                 case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
                         parse_raw_formats(core, codecs, domain, data);
                         break;
                 case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
                         parse_caps(core, codecs, domain, data);
                         break;
                 case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
                         parse_profile_level(core, codecs, domain, data);
                         break;
                 case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
                         parse_alloc_mode(core, codecs, domain, data);
                         break;
                 default:
                         break;
                 }

                 word++;
                 words_count--;
         }


word[] = { 0, 1, 2, 3 };

words_count = 4;

while(words_count);

	data = word + 1;

	switch(*word) {
	case WHATEVER:
		do_something(param, data);
	}

	word++;
	words_count--;
}

// iteration 0
data = 1;
*word = 0;

// iteration 1
data = 2;
*word = 1;

????

How can the step size of word be correct ?

Do we ever actually process more than one pair here ?

#include <stdio.h>
#include <stdint.h>

char somebuf[16];

void init(char *buf, int len)
{
         int i;
         char c = 0;

         for (i = 0; i < len; i++)
                 buf[i] = c++;
}

int hfi_parser(void *buf, int size)
{
         int word_count = size >> 2;
         uint32_t *my_word = (uint32_t*)buf, *data;

         printf("Size %d word_count %d\n", size, word_count);

         while (word_count > 1) {
                 data = my_word + 1;
                 printf("Myword %d == 0x%08x data=0x%08x\n", word_count, 
*my_word, *data);
                 my_word++;
                 word_count--;
         }
}

int main(int argc, char *argv[])
{
         int i;

         init(somebuf, sizeof(somebuf));
         for (i = 0; i < sizeof(somebuf); i++)
                 printf("%x = %x\n", i, somebuf[i]);

         hfi_parser(somebuf, sizeof(somebuf));

         return 0;
}

0 = 0
1 = 1
2 = 2
3 = 3
4 = 4
5 = 5
6 = 6
7 = 7
8 = 8
9 = 9
a = a
b = b
c = c
d = d
e = e
f = f
Size 16 word_count 4
Myword 4 == 0x03020100 data=0x07060504
Myword 3 == 0x07060504 data=0x0b0a0908
Myword 2 == 0x0b0a0908 data=0x0f0e0d0c

---
bod

