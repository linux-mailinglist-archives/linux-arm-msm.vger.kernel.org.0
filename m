Return-Path: <linux-arm-msm+bounces-58047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60DAB8255
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824208C36BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC723297B85;
	Thu, 15 May 2025 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXVcYSgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADFC295DB5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300682; cv=none; b=lZT/2YzHSYoMtXZ8t/tP+YjTyX9ILkB0PfBfcFq/BQtaRO1wcYARA9cBCEelyS1TsSqQsgg0RVJSDTKfcFi8FjaA1NAjF3PRlNab8p9yzsSvh83EWxmbu1IIKCQ6jjTvL2NSM+6zzSPBQiM+oFk/EEpFszuedHp7zsW9UXKc4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300682; c=relaxed/simple;
	bh=8zcNjwiFRLKaPrPVLng4LwX9rlSdrAZKS1atkz9us1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSrAWoQUb0h65e4AuXSQOJiF8iYMQhLLNIupR/AnCvJpYbCE1zPPAcLh8L11xd76v4E2fYWtRv9m+tMTSqeN79MT8Gpubz4p6Im/VNP7XnjpiUkXCP+hz22yzCtXtq6ynq3wnHNMlCF9exMCvzzMjVIhESkTfXX/38zxtsNK78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXVcYSgJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b9625735so395983f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300678; x=1747905478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLrR8mHQGmvxeQeb5j9NGPnWZ8Fk0hzXNuQW+AS8WFM=;
        b=IXVcYSgJZD3KNEt9Ew02/SkavanJezK8GTn3ZtaWl7vfUL4yDGFoAjeYZBUDFkzCFn
         dLdkNBpnI6zAeMinvHx+ynADPoArSNCzPEw1Bys41pl/zXGJQq5JyT55HpwDY5KEbiPM
         CcEHcTEs0cOHqCr1AaM76DRY+uyRTEErYYakAcsEB2LnRogSvMcCq+tuoVdoPDMNymv9
         EKeGXSs5TSzsGdAcCCZp+LRd+QK9VuqYgLaoR/eWLgXo6PKr1DZktHrrWHbmGuS7aXdQ
         kQ2fZXfGu1cvd8ubanWObZwfAzelc/z2OdoNl3PD0ubtVkdVvNAKY/73x8JOPHCuI1B5
         SEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300678; x=1747905478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLrR8mHQGmvxeQeb5j9NGPnWZ8Fk0hzXNuQW+AS8WFM=;
        b=VwBseWtcZQizcWr88ba90zESLbrNJqhH6NcV0IITL/rwfcC+e7d4yR1dYU/iuGn/3I
         ZHVQfXP2gUR+D4c56uPo8p5UkXbrgtwAgoSGC7R9HbH/rrT/T+4zgBS301vX7MFt7Ojv
         +8x7WZEGOFLKzeNu8JA5Pyos0rxhH0lNc0eNlArrYW3qHiAjnATEsSBFLUIW9AQmE9Cb
         PmzJlwi7bebJffdODzLNtIs1a1WW9htIGbwB9Uxkl6VwheqXlW1LWOT7e0mx1PmSBkxK
         Wcpn9QnjOzibYJU4EHCwyp8i6qKssKq6SU/G+T79T2Nrl3gtQk5cPp/1cm0mEsJOePiW
         ceRw==
X-Forwarded-Encrypted: i=1; AJvYcCWGDP6r7tBgTy0H6Zra8AwhzfJnv+82lONGJMeFeAtwbtBnr07SINh4n1UpvCUS8BiWLIafa0wat++n+YV1@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDm4Lj/+pI24aNK4WrXhSJWTsYqzMnRAinsB6FlcHR5joi7TR
	8t3ZX7SZ7PMQZLK3sSDz3asdcU0O7zAC54tPeV7SQpTtM4fj5u4HaYY1LX/cg8+bp7JfcTXa14j
	CXE0dDQ==
X-Gm-Gg: ASbGncuKGmdbPCS/KRWj4LK3JKIv4oppsQwdVhyfTlBUdIinL9V83cfz7z7zl6nmfXP
	7MFeiD/UAHBfZuVoVH8s1WLqPhZyqoTOQBLZecCzQvNfVrDuOGlIAsGPhPG958x70PE5PtrioZh
	ZPs7AhzprBylxyn8G94z1sOMtjDAVU6ZlVplja00Ly30jitdrQx9QN9Ivy7+FSg2mioUndQBLMB
	XmlX5Uzr4mPQUgLKQJGdG5dzKZN/CcRiD/HAFPObsdlrMoINkBN0V0ArQfMBZdQDe4/Vr/RZJeP
	k1ecdAGcAaRAVKItwHcImRB+qJ8fOdFM+Onn32kKlGxUjCbQ84tscuw6HKVVOXpBgQfKQFUa2gU
	1Gt1sNbvYzXAx
X-Google-Smtp-Source: AGHT+IEyl2cADjc4pCZLS+AWesmuE8OPCQz2l8i9+TTobDiHqJnfqSO9Vlc3hMTrq4JKo0wCFTDDrw==
X-Received: by 2002:adf:e390:0:b0:3a3:592d:2a20 with SMTP id ffacd0b85a97d-3a3592d2d69mr615905f8f.54.1747300677691;
        Thu, 15 May 2025 02:17:57 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d21esm22438155f8f.99.2025.05.15.02.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:17:57 -0700 (PDT)
Message-ID: <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
Date: Thu, 15 May 2025 10:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 14:38, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Currently, Time-Of-Check to Time-Of-Use (TOCTOU) issue happens when
> handling packets from firmware via shared memory.
> 
> The problematic code pattern:
> 
> u32 dwords = *rd_ptr >> 2;
> if (!dwords || (dwords << 2) >  IFACEQ_VAR_HUGE_PKT_SIZE))
>     return -EINVAL;
> 
> memcpy(pkt, rd_ptr, dwords << 2);
> 
> Here, *rd_ptr is used to determine the size of the packet and is
> validated. However, since rd_ptr points to firmware-controlled memory,
> the firmware could change the contents (e.g., embedded header fields
> like pkt->hdr.size) after the size was validated but before or during
> the memcpy() call.
> 
> This opens up a race window where a malicious or buggy firmware could
> inject inconsistent or malicious data, potentially leading to
> information leaks, driver crashes, or undefined behavior.
> 
> Fix this by rechecking the packet size field from shared memory
> immediately before the memcpy() to ensure it has not beenn altered.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea8799507f9b83f1529e70061ea89a9cc5c8..163c8d16530bc44a84b2b21076e6189d476fe360 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -295,6 +295,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   	new_rd_idx = rd_idx + dwords;
>   	if (((dwords << 2) <= IFACEQ_VAR_HUGE_PKT_SIZE) && rd_idx <= qsize) {
>   		if (new_rd_idx < qsize) {
> +			if ((*rd_ptr >> 2) != dwords)
> +				return -EINVAL;
> +
>   			memcpy(pkt, rd_ptr, dwords << 2);
>   		} else {
>   			size_t len;
> 

Here's how this code fragment looks after the change, I'll add two "}" 
for readability and annotate

dwords = *rd_ptr >> 2; // read the value here
if (!dwords)
        return -EINVAL;

new_rd_idx = rd_idx + dwords;

// validate the size against a maximum value
// this step is correct
if (((dwords << 2) <= IFACEQ_VAR_HUGE_PKT_SIZE) && rd_idx <= qsize) {
         if (new_rd_idx < qsize) {
                 // Re-read the value because firmware
                 // might have changed the value
                 if ((*rd_ptr >> 2) != dwords)
                         return -EINVAL;

                 // now trust dwords
                 memcpy(pkt, rd_ptr, dwords << 2);
         }
}

But this is all wrong.

There is no atomicity on the APSS side between the first verification of 
dwords size and the mempcpy() the commit log itself shows that the 
firmware is free-running with respect to the instruction pipeline of the 
APSS, it is an AMP problem.

Adding another check of the dwords side right before the memcpy() 
doesn't address the problem which the commit log describes as the 
firmware updating the length field of a header in shared memory.

There are perhaps 10 assembly instructions between the first check and 
the procedure prologue of the memcpy();

Adding another length check right before the memcpy() simply reduces the 
number of CPU instructions - the effective window that the firmware can 
update that header still.

if ((*rd_ptr >> 2) != dwords) // conditional branch operation

memcpy(pkt, rd_ptr, dwords << 2);

Begins with a procedure prologue - setting up the call stack - and then 
is a series of fetch/stores to copy data from here to there

The memcpy() itself by its nature it not atomic on the front-side-bus of 
the APSS to shared DRAM with the firmware.

On a CPU and SoC architecture level this fix just doesn't work.

To be honest we are already doing the right thing in this routine.

1. Reading the value from the packet header.
2. Validating the given size against the maximum size
3. Rejecting the memcpy() if the given size _at_the_time_we_read_ is too
    large.

The alternative to guarantee would be something like

asm("bus master asserts bus lock to PAGE/PAGES involved");
dwords = *rd_ptr;
if (dwords > MAX_VALUE)
     return -EFIRMWARE_BUG;
memcpy(dst, src, dwords >> 2);

asm("bus master unlocks memory");

Lets say we make the change proposed in this patch, here is how it breaks:

if ((*rd_ptr >> 2) != dwords)
     return -EINVAL;

// now trust dwords
memcpy(pkt, rd_ptr, dwords << 2);


objdump 
qlt-kernel/build/x1e80100-crd_qlt_integration/drivers/media/platform/qcom/venus/venus-core.o 
--disassemble=venus_read_queue.isra.0

5c48:	540000c9 	b.ls	5c60 <venus_read_queue.isra.0+0x110>  // b.plast
5c4c:	2a0303e2 	mov	w2, w3
5c50:	aa0703e0 	mov	x0, x7
5c54:	94000000 	bl	0 <memcpy>
5c58:	52800000 	mov	w0, #0x0

Your conditional jump is @ 0x5c48 your call to memcpy @ 0x5c54

Between 0x5c48 and 0x5c54 the firmware can update the value _again_
Indeed the firmware can update the value up until the time we complete 
reading the bit of the pkt header in memcpy() so an additional few 
instructions for sure.

You could make some type of argument to re-verify the content of the pkt 
_after_ the memcpy()

But the only verification that makes any sense _before_ the memcpy() is 
to verify the length at the point you _read_ - subsequent to the 
latching operation - were we fetch the length value from DRAM into our 
CPU cache, operating stack and/or local registers.

Once that data is fetched within the cache/stack/registers of the 
CPU/APSS that is the relevant value.

For the fix you have here to work you need this

5c48:   MAGICOP         memorybuslock
5c48:	540000c9 	b.ls	5c60 <venus_read_queue.isra.0+0x110>  // b.plast
5c4c:	2a0303e2 	mov	w2, w3
5c50:	aa0703e0 	mov	x0, x7
5c54:	94000000 	bl	0 <memcpy>
5c58:	52800000 	mov	w0, #0x0
5c5c:   MAGICUNOP       memorybusunlock

Because the firmware is free-running - with respect to the instruction 
pipeline of the above assembly.

If you really want to verify the data is still valid - it should be done 
_after_ the memcpy();

But even then I'd say to you, why verify _after_ the memcpy() - and what 
happens on the instruction directly _after_ the verification - is the 
data considered more valid now ?

i.e. this:

memcpy(pkt, rd_ptr, dwords << 2);

if ((*rd_ptr >> 2) != dwords)
     return -EINVAL;

doesn't have the above described architectural race condition but it 
doesn't make the data any more trustworthy - because it doesn't have 
atomicity

memcpy(pkt, rd_ptr, dwords << 2);

if ((*rd_ptr >> 2) != dwords)
     return -EINVAL;

dev_info(dev, "The value of *rd_ptr %lu!=%lu can be different now\n",
          *rd_ptr >> 2, dwords);

Sorry this patch just can't work. It's a very hard NAK from me.

---
bod

