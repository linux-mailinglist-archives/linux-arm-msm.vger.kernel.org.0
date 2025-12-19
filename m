Return-Path: <linux-arm-msm+bounces-85939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678CCD1192
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3AAE3069CAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E652DF13E;
	Fri, 19 Dec 2025 17:14:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96051339879;
	Fri, 19 Dec 2025 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164466; cv=none; b=BK++tJAhWT8VHRIeaT7LmNPqTc0qNtoYTmvsbFPgqU3MKY2r+T6Vzf6w4qGUI02AcQnvkgYj2ArirJTjC9pIDFH6o/umB6LcuC0U0RrEaMocQIvIJIXfN54E2UJvznrZ/7D1QQ+UqJQ7sZ1kY1kdcGfRlOJSh7/guOO9wcYRyyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164466; c=relaxed/simple;
	bh=A0EJMjGT4dUwXpatngFmmpkf/mjud6WkzZReHACH4TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cI2ULeKDcgUJ0zWSDZAM3MtthHwGQh1sF9/xhljxNSNLDDrSYw8id9pMNZcZ/pi6PKYLhMh/8V9SB0vtOKA0Nc7j/6u301hx0Com6qUB9YrnMQB9dkM4WUlEZ4qfWOirWCJSkZw1YYUD5JzQ/N+Apf31zmHkuFMpvJdNyTFPfXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz14t1766164375tca03f23a
X-QQ-Originating-IP: 1NThptYv0cdjx87UuVbG5BmE8Z4pYgEZ69+woiMOAWQ=
Received: from [192.168.0.160] ( [120.40.108.137])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 Dec 2025 01:12:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17256322654305126495
EX-QQ-RecipientCnt: 11
Message-ID: <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
Date: Sat, 20 Dec 2025 01:12:53 +0800
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
 linux-mtd@lists.infradead.org, Junhao Xie <bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
 <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NJvWNRsNVoV4A8qnmFYQ7s1K9vZ+WQmXfw1K/qCNOa+0U9TzfMSefAa4
	/Z7dGGr5ocjTUyc+mgM0Hi2rAqzpoYo7ozH+VHd3ZdrAMUGqgi92VQAA6Ln/dxiiL/mPo5v
	IyFe/uqgAjJ7zQRGU49EJEfUTFRFv7JG9cQl+UOxo8dVdU3GDJMe/2mhcB9E1rInu+sRDo4
	knXcJVIiVCUCH+H2dNXjkAieVNcR5fRZKPu5gtqQPKsJIwTIpcqHAXwG+ux2/aUBqclq2X2
	7wuWozCi8xGy0wmHu884QK1VQ5bQTeZDkboe8CzBO9q4z4YjUGNpCyoLgS7pjVipQ6P730R
	twyhBllSlyYdR9NXGhh+u6MAWYNs0GzkRKWFDywBuBrynAsOVjuJNuFUUXzgtlczewp1uA1
	6HRz+Qv6BaK3woBuJ8DE4MA67bJFhzCdKPVVJ+KUYrEqF+AbBlSsGPgCYkqi1w+HjgPwNjt
	K0S5CZ/Kr0vzLPRboHHKNmvLaTYNjQ9pAYZ19yfdgNSMTYckZ+Px19LvrtS+Nkv/nUQcjsm
	F/iZhvcrBPGY9jKUcBMCU7j2slH7JH6lixeg+Ef/ysk3scwwvYpVIZ79ulzW82+VbVaxhMP
	gArp4wFJHgS8j4O7NbdFmLs+P95GjmwLvrZ3BaLXC+WTwIEFegX/TqR51FHirb/PdyOgXE4
	eH3YiP0CWmo6K5Z2wBv1kphBfHp1UrhmpG+ZCF5mKmEId10KmNwDbBrtLOpNSLZ1C2kt51I
	2I7wWTazFkPTo7Jadg0B3HsxtNNHcjFZAgkt4LuasjT3FKFZoPiTbN12ms42R6epg4fjXWe
	LGE4EWGT/p1ZvRcWRvNZd4lrxI8cEebmDXjD3P2W3Ryw4LSwRwfmflEo9BSdhLNA5jXzfhv
	LxJbx2aqqT11Dtl0hgnLcBU3xy/royoBv2sb4qSdHLOpyz8Pe+4HWKLGgikyW5NBSy4kTfB
	BKcbBJ0cDMjq02OUNu+B9uB+pmpbaqcDhU907VHwFWzybVcl+nyxP0aoMlfyu+Iov1wk=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 2025/12/19 20:05, Konrad Dybcio wrote:
> On 12/18/25 7:02 PM, Junhao Xie wrote:
>> Add MTD driver for accessing storage devices managed by Qualcomm's
>> TrustZone firmware. On some platforms, BIOS/firmware storage (typically
>> SPI NOR flash) is not directly accessible from the non-secure world and
>> all operations must go through SCM (Secure Channel Manager) calls.
>>
>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>> Tested-by: Xilin Wu <sophon@radxa.com>
>> ---
> [...]
>
>> +struct qcom_scm_storage {
>> +	struct device *dev;
>> +	struct mutex lock;	/* Protects SCM storage operations */
>> +	struct mtd_info mtd;
>> +	struct qcom_scm_storage_info info;
>> +	size_t buffer_size;
>> +	u8 *buffer;
>> +};
>> +
>> +static int qcom_scm_storage_erase(struct mtd_info *mtd,
>> +				  struct erase_info *instr)
>> +{
>> +	struct qcom_scm_storage *host =
>> +		container_of(mtd, struct qcom_scm_storage, mtd);
>> +
>> +	if (instr->addr % host->info.block_size ||
>> +	    instr->len % host->info.block_size)
> While it's the same value, it seems like mtd->erasesize would be
> "idiomatic" here

I will change to use host->mtd.erasesize here.

>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&host->lock);
>> +
>> +	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
>> +					 QCOM_SCM_STORAGE_ERASE,
>> +					 instr->addr / host->info.block_size,
>> +					 0, instr->len);
>> +}
>> +
>> +static int qcom_scm_storage_read(struct mtd_info *mtd,
>> +				 loff_t from, size_t len,
>> +				 size_t *retlen, u_char *buf)
>> +{
>> +	struct qcom_scm_storage *host =
>> +		container_of(mtd, struct qcom_scm_storage, mtd);
> Feel free to unwrap this line

I will unwrap it to a single line.

>> +	size_t block_size = host->info.block_size;
>> +	loff_t block_start, block_off, lba;
>> +	size_t chunk, to_read;
>> +	int ret = 0;
> This initialization seems unnecessary

Yes, I will remove this unnecessary initialization.

> [...]
>> +static int qcom_scm_storage_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct qcom_scm_storage *host;
>> +	int ret;
>> +
>> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +	if (!host)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, host);
>> +	host->dev = dev;
>> +
>> +	ret = devm_mutex_init(dev, &host->lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	host->buffer_size = SZ_256K;
> Should this just be = host->info->page_size?

The value of page_size is smaller than what we want for
buffering SCM transfers. The buffer is intended for batching
larger operations, so a larger fixed size is used here.

struct qcom_scm_storage_info:
  total_blocks = 8192
  block_size = 4096
  page_size = 256
  num_physical = 0
  manufacturer_id = 0
  serial_num = 1663215
  fw_version = 
  memory_type = NOR

> [...]
>
>> +	dev_info(dev, "scm storage 0x%llx registered with size %llu bytes\n",
>> +		 host->info.serial_num, host->mtd.size);
> dev_dbg()?

I will change to use dev_dbg.

> Konrad
>

Thank you for the review, I will incorporate these changes in v2.

Best regards,
Junhao Xie

