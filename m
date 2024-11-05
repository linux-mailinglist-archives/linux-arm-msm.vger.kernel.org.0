Return-Path: <linux-arm-msm+bounces-37047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AD9BCB69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA0628115D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EDD1D45F0;
	Tue,  5 Nov 2024 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCrfsbXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986D1D45EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Nov 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805324; cv=none; b=YwQYSuM4X+1zCgVT0sfU3I8h12iiqWJExBCroUTl93TQBNem4sQ5MGKAIpAZLd3ieUuZfjreE31+MP3LoqnqkLMhXh7mLDWrPGNe/2Oo3gKsOxRMtyoxwNBl3v4+3g5AMVx8wWcYGXOm86Uj+k/Wxvp1Ox70rcFITQ5XCU+bXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805324; c=relaxed/simple;
	bh=k1//woTIU/hrkn6HxpkQgKFs3K74L+BoMNL8LPeXwjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSvIFMTklAcYLXsMOfI0GEjIFEef2lNZONfYooNlNjfHnWMOdTmbuvaOt3e7JV+rOZir8b/HYl1ihFXhOU/K6C0y59kNcB0ZjlXzOYf9G+C2ctuZslDxZ83xFZOmFA+DKg3xJ7XVUNu4+z/P0V12jkSkulU+Nn72t6nT2wcUtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCrfsbXo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so47058425e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730805320; x=1731410120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAUW7RPOeXwiKeLMnI883KAxUeeVxpO3A/xF2LaW6Sw=;
        b=yCrfsbXoGEKGgxBeD3lEMN+OLnck8CJ6LyLPV6RG2HBe5AMaGWpghxI9yDtZS+CYcq
         UG+qDTqK+vVBFzRO16CxKVdccznERUxkPYqjhZuz9NJZhk4gE+N/5XtCiDk0/j+78uV2
         NOSJYVXiI35jf+xMiF8LcVR+1lm6Bsr6rhF6gIeXbeLvVWelFaLmMPoYSchYFOe7B0lP
         DY5vta7VGoROpKS6r9Pb5Xsd9m9haErHcVcnmI+VB584F/+9JocIBf7/iJFPHfcPl9UJ
         7qKI2nBMt3QtZfznIFW5nDht8sOpqQJGUD7WBkqPNN93mZaddovbfPgCLp9WAHbvNbFG
         ckkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805320; x=1731410120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAUW7RPOeXwiKeLMnI883KAxUeeVxpO3A/xF2LaW6Sw=;
        b=A65j2X4CpI2zYBe21J2CD0kwYkJ+jQXv/csDUvat9orANsxHOcY0vA5Kc7k7IgtT36
         HoAyHu0oVo9D1w5MDawHweA4dJCY9oUnmLEQzSFHKeXfP8USBp6T3YjCgBya9rORFwVi
         PWv8ovHCMElgabEOoFZ+fvPYyMCBfz46yj9bBZxGdFw5zFBcIt1m/yNhKWfhL/brAZIi
         aV24rUNzBO0dIn2GZTiU8RoWoAT2nAK0MxHwg/vGduxsX2T9KkyX/1op/KQTfwY5nnzM
         7OvHG81RhB2IT5SBJghxnAuHXu6wnQO9lrxgSGSeiNqahgsP3k08iFSLkMN9MhlCPuKN
         Ud+w==
X-Forwarded-Encrypted: i=1; AJvYcCWBOHmLGY0ap39SFWviwMq0Z3q5W69CnGE7zujelCPqgfxFZEItskQsIB2oRKTUpIcmhc/4l0YeiziO+Tt0@vger.kernel.org
X-Gm-Message-State: AOJu0YwLrd4SX9ialM6QdHXfZdnp4+/0qZwU0GuizzsSRiHMendTLS4u
	K/sP8TrXvyTw250ywNQLqLs2Q6p2HTSiDyljBw9b0/j8WsEOgB3vpTHCVH4OURE=
X-Google-Smtp-Source: AGHT+IFxj5fSafC8gyEjZqCHdS86tjb6pALa9TeX7VspQtKSyrZ7noAYA8Z/wRxw84X9ChaBBEOulg==
X-Received: by 2002:a05:600c:3054:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-4328327ec3cmr113149925e9.23.1730805320278;
        Tue, 05 Nov 2024 03:15:20 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947c26sm218210655e9.26.2024.11.05.03.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:15:19 -0800 (PST)
Message-ID: <474d3c62-5747-45b9-b5c3-253607b0c17a@linaro.org>
Date: Tue, 5 Nov 2024 11:15:19 +0000
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-2-8d4feedfe2bb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-venus_oob-v1-2-8d4feedfe2bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 08:54, Vikash Garodia wrote:
> words_count denotes the number of words in total payload, while data
> points to payload of various property within it. When words_count
> reaches last word, data can access memory beyond the total payload.
> Avoid this case by not allowing the loop for the last word count.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 27d0172294d5154f4839e8cef172f9a619dfa305..20d9ea3626e9c4468d5f7dbd678743135f027c86 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -303,7 +303,7 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>   		memset(core->caps, 0, sizeof(core->caps));
>   	}
>   
> -	while (words_count) {
> +	while (words_count > 1) {
>   		data = word + 1;
>   
>   		switch (*word) {
> 

How is it the right thing to do to _not_ process the last u32 ?

How does this overrun ? while (words_count) should be fine because it 
decrements at the bottom of the loop...

assuming your buffer is word aligned obvs

=>

#include <stdio.h>
#include <stdint.h>

char somebuf[64];

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
         uint32_t *my_word = (uint32_t*)buf;

         printf("Size %d word_count %d\n", size, word_count);

         while(word_count) {
                 printf("Myword %d == 0x%08x\n", word_count, *my_word);
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
10 = 10
11 = 11
12 = 12
13 = 13
14 = 14
15 = 15
16 = 16
17 = 17
18 = 18
19 = 19
1a = 1a
1b = 1b
1c = 1c
1d = 1d
1e = 1e
1f = 1f
20 = 20
21 = 21
22 = 22
23 = 23
24 = 24
25 = 25
26 = 26
27 = 27
28 = 28
29 = 29
2a = 2a
2b = 2b
2c = 2c
2d = 2d
2e = 2e
2f = 2f
30 = 30
31 = 31
32 = 32
33 = 33
34 = 34
35 = 35
36 = 36
37 = 37
38 = 38
39 = 39
3a = 3a
3b = 3b
3c = 3c
3d = 3d
3e = 3e
3f = 3f
Size 64 word_count 16
Myword 16 == 0x03020100
Myword 15 == 0x07060504
Myword 14 == 0x0b0a0908
Myword 13 == 0x0f0e0d0c
Myword 12 == 0x13121110
Myword 11 == 0x17161514
Myword 10 == 0x1b1a1918
Myword 9 == 0x1f1e1d1c
Myword 8 == 0x23222120
Myword 7 == 0x27262524
Myword 6 == 0x2b2a2928
Myword 5 == 0x2f2e2d2c
Myword 4 == 0x33323130
Myword 3 == 0x37363534
Myword 2 == 0x3b3a3938
Myword 1 == 0x3f3e3d3c

---
bod

