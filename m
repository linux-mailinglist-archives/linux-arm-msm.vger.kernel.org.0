Return-Path: <linux-arm-msm+bounces-86571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC44CDC225
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EDBD3007ED8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEE2318143;
	Wed, 24 Dec 2025 11:28:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157052F3614;
	Wed, 24 Dec 2025 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575685; cv=none; b=QXSQBLBw9S7AovP7hwawu0CqE6AlZbpCehwIqWdk73Nk7N/sIaeYIROMX+Pps5x2rdGaGXNnYbBlExCf0J8YcSn5qunMCnwxTOpR+sOjnR1/MI8x8oQm0F05gFDDuyF2conkquRIJ1JZKi/Yq423ngg8spJd3TbiAaL8RdqB0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575685; c=relaxed/simple;
	bh=eSteoqc1FNkhUEKYz/yY36aceHjFodyu7mrVjifUAx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzeogH0OgO9ipXTjDsdy27yTS6tEDCBl3y7XbZrxLAEtzrABTbO429UI3VYBO9Oz0qPPD8OiLGTksl15j7x0zj0KEN0Su5bQ3vJC67afJhxyAdEaNwrGlju11ePnMc/+4otw7CNzzFKpE9/ysB2iQyuPawcmFLNFwjPfbb0AIo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz16t1766575566t22c6a4c2
X-QQ-Originating-IP: wwSd5kUax3h4QoW7fyib2bLZD+FaeDlt/c5SLSNA0HU=
Received: from [192.168.0.160] ( [120.40.109.156])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Dec 2025 19:26:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7734528260234887350
EX-QQ-RecipientCnt: 10
Message-ID: <0D39C7685236B803+8bd6b22f-87bc-4fa1-90a7-2f8fac557c7d@radxa.com>
Date: Wed, 24 Dec 2025 19:26:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
 <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
 <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
 <1b40552e-b292-4207-b7eb-9f50e37fd7e4@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <1b40552e-b292-4207-b7eb-9f50e37fd7e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Mn6sU2dhbGGPu9MJIEwZT5FtBd6rBQ0q9Gu/SFcIN8iYTVS2j1W6tu7j
	DqCpLanat0LrIV3nnvkFfWlXiwAGsKLLCogcktqowz8e519KHnTC1KYk4y61Nncw8jsdw8q
	xDlR91m3maDDogIzp1jDuysPDwJmqN/D0hpF0eZ9jJTcAYFHYv2bbCesC6fUY97fLuPHTCb
	gOqXHEohZp8TCJiErb2RFCSPZXZcOq8vSs1cs8nZU0ApPitWAl6rsqSgx8qE1Hqgoejc8L0
	2CJayad6SFL4rpHj+hMhI/6a8l9bL+Vq0fdhKvzzsCJoxv3UR2cTo55JSpD5/ilUH0ln/ey
	yzU7GuXrAx2+j2kb5qmumkpEtYZbiRTa+1/mFcYC3wUbvf7uAepEwn33p0FdtOnFLkH0F9k
	+QLEtwpWOKJz76yCONP7dwXAbyHJSK7aKDNiLJaRGSViwTT0E4FlTDuSRzM0fZ+kmCC0+CA
	+7QF0RNBYr61EohBCLRFmIs+mgxaeQL9OAUZVsrncclhmIE7br3fBfbr3wUYhxaaSUvhdM6
	LQKInQ5Q1nLIuqt7HuA2rrYaXQaryxJIdxTupgWc52HIP9ANOGUN3vRIx4s7T4aUIi5CnOj
	0ok2jcXoLZ4hxYlzQBjFB83i14Nn3TZ4XoREfoZizvXQWy105QikjhyYQ0PXi5eFdVBb63z
	1kciLA2CHT52hEzA/Ey7XREnUlsuPMIeHYT//j03tgVGmrruvqhzUjsphq9EG3eCGxF0/4Y
	GFnpIJvMLJu/ts/Wfm5vZqvbDNvV9LxrmUXbzcaUKOfYfqr0OsLZ6VEY0zcehS1vlXJNLPE
	+t6DkKDNwQiKoRLxzYYbtBhn7gWLOIYFtQAeXXjNvhYR1rpswYa5sniKhi+tHFUxsVHQOF1
	vWxaWuSK5WF14gxx9m+Pr9l1UwBR8sF/MmPIKJMWcIOTG7oP8UGQgpCIuwsHe7MJFqoBwhd
	dU3V45rscNtY8admUwHM3zUl69SEsWTmJvBqD6uJUdw5wI4KEhKnVyRV30iD2T3Pq7Yyzkl
	EJw31Fsg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On 2025/12/22 17:43, Konrad Dybcio wrote:
> On 12/19/25 6:12 PM, Junhao Xie wrote:
>> On 2025/12/19 20:05, Konrad Dybcio wrote:
>>> On 12/18/25 7:02 PM, Junhao Xie wrote:
>>>> Add MTD driver for accessing storage devices managed by Qualcomm's
>>>> TrustZone firmware. On some platforms, BIOS/firmware storage (typically
>>>> SPI NOR flash) is not directly accessible from the non-secure world and
>>>> all operations must go through SCM (Secure Channel Manager) calls.
>>>>
>>>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>>>> Tested-by: Xilin Wu <sophon@radxa.com>
>>>> ---
> [...]
>
>>>> +	host->buffer_size = SZ_256K;
>>> Should this just be = host->info->page_size?
>> The value of page_size is smaller than what we want for
>> buffering SCM transfers. The buffer is intended for batching
>> larger operations, so a larger fixed size is used here.
>>
>> struct qcom_scm_storage_info:
>>   total_blocks = 8192
>>   block_size = 4096
>>   page_size = 256
>>   num_physical = 0
>>   manufacturer_id = 0
>>   serial_num = 1663215
>>   fw_version = 
>>   memory_type = NOR
> I don't see how the big buffer is any useful TBF - you read into this
> buffer before outputting to *buf and copy data from *buf into the
> host_buffer instead of writing straight from the former. If anything,
> that's an unnecessary copy.

The purpose of using a larger buffer here is to reduce the number of
SCM calls rather than to avoid memcpy.

Each QCOM_SCM_STORAGE_READ/WRITE involves an SMC transition with a
relatively high fixed overhead. Issuing calls at a 4 KiB granularity
would result in many SCM calls and poor throughput. The larger buffer
allows batching multiple contiguous blocks into a single SCM
transaction, significantly reducing the number of SMCs. In comparison,
the extra memcpy cost is negligible.

I agree that the current code always bouncing through the buffer is not
ideal. In v2, I will pass aligned accesses directly to
qcom_scm_storage_send_cmd() to avoid the extra copy, and only use the
bounce buffer for unaligned or partial accesses. I will also add a
comment explaining the rationale for the buffer size.

> Konrad
>

Thanks again for the review.

Best regards,
Junhao Xie

