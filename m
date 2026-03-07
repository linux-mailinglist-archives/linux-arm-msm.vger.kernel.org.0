Return-Path: <linux-arm-msm+bounces-95974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD9bF7cSrGkujwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:57:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1322B9ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FCC63020A7F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AF623D7FB;
	Sat,  7 Mar 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6RBtHwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZPo/3QW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC3A219A8A
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884661; cv=none; b=uHlA63P7gZbRNiLg+iuIhB6Wtenp/aV+QQrpH6SEQFEcNHgrU9qNHwq2DVbhVsSQf1/sgplJU2kdtYEe1ll9s649sGu+hdax9pDZF66sXZQsp6Q+5O7QZ6rYvsC8vL7SLERMnMpJOZ6RVJMIK8CyS0yqBwRJwLwILgncXmK6egQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884661; c=relaxed/simple;
	bh=5pZX5HpBL7EYZ1hQhXpWRN6rITw+4wfBRAuKyHZl27g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aB96JK6j+DrLI1ZPklvSPf0aEAI2epRdti5PehauzC2BK9+nLoewClEei/SbQfSVCqb4nctWLzl4doP4vCK2a8SFxKcmk6krvXtktn17ECf/BF/W1ISwa7vn3Fl+PFwCj572NqdEMXAE1lnwUxLthnvc1S9mOI7vS8V9iZQ1Uws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6RBtHwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZPo/3QW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276vM0W1978990
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwd61R1TfMTdFKQjS53bQxvqDlGw0WdXPKtnztP8qh0=; b=c6RBtHwhADDtEZhu
	pMdyPzo3Zkur0JT1QQr5WCs7yaUmfTwq6d30Ty12XyjkaWs+7asMR5snEP6WxxNe
	zqcjJDeUqxSWBFl/tjsVrj82M29eQ/lM5XxYBEdoWNEGroJPDwwxKw5o8yGgmpwj
	RYY2TfGIjrxOU9HW9zR1vaCaZqPYzyUUpimVMMjhx2JE8iiVVkC/MS508kVPrFU8
	Ym7astCyJSSKDyhPKfh3wVgoeHxUWXaXf4XJ9g/RKiH+LzAZjP5dQxonGgv7vfmC
	bwncE0wWAvvw+qlIY5wLI/EudDsnIfFWt3+jPYJQ5sNC6sO+yJ99Wm73qKWcv4m4
	5mrYHQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg0tnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:57:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a535ad7fso3113919b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772884657; x=1773489457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwd61R1TfMTdFKQjS53bQxvqDlGw0WdXPKtnztP8qh0=;
        b=bZPo/3QWgMYlI38dVorF7/AJ46IXzh+Pbsu+VqOHYKW05/fVng6I/dZ/mmOn/Vgo+b
         MprUZ5SO5drWuQiVh1jwBw9P0QqRGFos8xytM7kyD1rgamt6I/dkxzGYwcaMOtRhO3gv
         vtpYnNRESixQPE+qfcGN9iB+h83zCdOgYrmI822zCNqtFRihSUUMqkbltWTfXNorqX6h
         ostqLQx2NfpIeEbDvUOkHBUIedFgcgch4f4EL8dRmlX1O/65e9ZZLgOLcENepa1bUYs/
         nSWoqRjgqLY3/7J1T4UI7eeI00FSG8p+3nTjRCyDg5OBqXDJyjpeUlwuox3Wpc40buMv
         vClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772884657; x=1773489457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwd61R1TfMTdFKQjS53bQxvqDlGw0WdXPKtnztP8qh0=;
        b=XTlvIpn66ttgYHE0TZfExitv9MpGhJv8LjHmCiAE2yFxPrkHYK1LJjlH3sLZo73kH2
         K/N7eX6qeqVeZLcbxjnHsHkqFdF5hR9oIZodeRn2VC3a4F35ThjhwjxSwLs6ok/xzZmL
         Z69rxlhHvyc/CpfC/GFs6wbcrLWzy6HtLWiZuHFKAIt1mPWut+Fa3Kvf/U7rb5zmp2yj
         ubKZmGtyvjzKxMPSlit/ltrd60sN5vFT1GwaCaVvs7sx/zTfjjC+gRZTCGbEQ8EWfmwh
         aQes1t5846jCPI+/xAxUf8TWhdU2iGY0kdCpKLIq/d1dowtBL/C/bSCNQT1vtQca/vZs
         oxww==
X-Forwarded-Encrypted: i=1; AJvYcCUXzAwzPg5N+ffy5ZNVok+XVHsvz3F1FawCoHenWmCIWLtFAd6cFMzIwylKOZMjjGjBeszJEuN0p2AWkeO2@vger.kernel.org
X-Gm-Message-State: AOJu0YzzL9/34tG3GflfNzia1ot+BEYit0+SIj58UpWayIRTz3zqRJkI
	9ppMppfqQIrnrp5fA2rgGsI506sz1Jv4bUJAdVJIVJQO8oZolTmCM9D6x3n3J1+GBKiap1WMAeS
	vrSvszCsSuCyyi3xqcz0SqhpmndqwRHhIqAoSWWe3RvRnRPaSG694kwhET+GYj6Iv7dNUa0LUEm
	wv
X-Gm-Gg: ATEYQzxjkThNazuuFyNfL88tIJ/V2zCDO/2lqpuJ4TNJ4U+TkE43eBtXcXARaCbT45o
	owIL1A/FekGTBmU5KikjqddxaMLQwx9tTRa8Ciyf9BeBEWgjwxQhK4G/za2h0CSwRZcZGuQq5Nt
	SoHHNarncAV1Lo5UIr56JofxhriTw8HCHh//usHEOwiMHi946tfEPlXfL6w7bZdpchTUKp9skDi
	zv8uttiLEwKIZ69Be4NkHkDG3nf/WZn13SjkKy5Hbc6Qq2P84/ABMsXs6yOxVtvVSnndbiOhNFh
	QxmWHH+PxkaMLbtvgoJpV6PMmPJGPlf3DEiOvcKTTxtKRuXbapc7VgtG8OOLzmT0dDRr1c8N6rD
	GvQjqplDbleSHerCDESfKziLgxSWibf5pQx0krQOmduyf7ix2kgQqkEo=
X-Received: by 2002:a05:6a00:2e99:b0:81f:3cd5:206e with SMTP id d2e1a72fcca58-829a2dd7258mr4836215b3a.1.1772884656810;
        Sat, 07 Mar 2026 03:57:36 -0800 (PST)
X-Received: by 2002:a05:6a00:2e99:b0:81f:3cd5:206e with SMTP id d2e1a72fcca58-829a2dd7258mr4836195b3a.1.1772884656346;
        Sat, 07 Mar 2026 03:57:36 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636973sm5691101b3a.3.2026.03.07.03.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:57:36 -0800 (PST)
Message-ID: <a31f34e1-3430-4f43-a142-1edef72a91f5@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:27:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/12] drivers: soc: qcom: Move Sahara driver to
 drivers/soc/qcom directory.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-6-kishore.batta@oss.qualcomm.com>
 <6n4e6luxfu2f7taijdcdhjscfkyh47bbql6cpnx6p2wmmwmm6q@gyp7jhzhuu2v>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <6n4e6luxfu2f7taijdcdhjscfkyh47bbql6cpnx6p2wmmwmm6q@gyp7jhzhuu2v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XjvQwE3WoBylYkgAHbaeqdo8e9G10loE
X-Proofpoint-ORIG-GUID: XjvQwE3WoBylYkgAHbaeqdo8e9G10loE
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ac12b2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nskunUdVlurYmHw5EUUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDExMiBTYWx0ZWRfX8L/1VW7eHJw6
 PkedxOl8qWCNGc8a0J7CPHXHWGTMmyvZxlHpmUIh5tIRXSkwVm1HOcQir1/xni7u415l3g4wdaV
 0o3PBMCYF8O2HB5RWwTL528K9bNpT+CGTJwvaPrbIv7Bwir+MdB0aPTUaZx8VdPwn816DbaQ3op
 wor30dQqtH/eHqmCgbVjlBHWQsGHxTRWMj4eD3s2mxKM2keHEyHXt4kNbie/bz2d+wgFEN2iqBX
 ctcOKXYVO9g0HNTXuOR+lel9umPvM0Uv3kQULurhnOswqnoPIMyn9maEmo6JiOHVL9+5PjqHLxw
 p5b53nf28IpduZ/8BIfSzB76Rv+QgYJ7KGPBX3y6Edeu6G5dNSgy6C7fuUHrFg6uaXo90jwYA3e
 bcB2KpNlXbz0HfICygYppnXQo0bedP9mIKmR8fLBThKMpHEHnlxq0N0PY29bVEA9nvwTjvpi0ey
 VBamS7XWx3stgx70FSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070112
X-Rspamd-Queue-Id: AEE1322B9ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95974-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.953];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 3:42 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:19PM +0530, Kishore Batta wrote:
>> Move the Sahara protocol driver from the "drivers/accel" directory
>> to the "drivers/soc/qcom" directory. This change makes the Sahara
>> driver applicable to all Qualcomm devices, not just Qualcomm Accelerator
>> devices. It also facilitates adding support for new devices. Client drivers
>> can use the registration and deregistration functionalities of the Sahara
>> driver as needed.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/Kconfig                      |  1 +
>>   drivers/accel/qaic/Makefile                     |  4 +---
>>   drivers/accel/qaic/mhi_controller.c             |  2 +-
>>   drivers/accel/qaic/qaic_drv.c                   |  9 +--------
>>   drivers/soc/qcom/Kconfig                        |  6 ++++--
>>   drivers/soc/qcom/Makefile                       |  1 +
>>   drivers/soc/qcom/sahara/Kconfig                 | 17 +++++++++++++++++
> No other drivers under drivers/soc/qcom/ has their own directory, I'm
> not sure I see a reason for Sahara to be different.
ACK. Removed in v2.
>
>>   drivers/soc/qcom/sahara/Makefile                |  6 ++++++
>>   .../{accel/qaic => soc/qcom/sahara}/sahara.c    | 11 ++++++++---
>>   .../qcom/sahara}/sahara_image_table.c           |  7 ++++++-
>>   {drivers/accel/qaic => include/linux}/sahara.h  |  0
>>   .../linux}/sahara_image_table_ops.h             |  0
>>   12 files changed, 46 insertions(+), 18 deletions(-)
>>   create mode 100644 drivers/soc/qcom/sahara/Kconfig
>>   create mode 100644 drivers/soc/qcom/sahara/Makefile
>>   rename drivers/{accel/qaic => soc/qcom/sahara}/sahara.c (99%)
>>   rename drivers/{accel/qaic => soc/qcom/sahara}/sahara_image_table.c (94%)
>>   rename {drivers/accel/qaic => include/linux}/sahara.h (100%)
>>   rename {drivers/accel/qaic => include/linux}/sahara_image_table_ops.h (100%)
> I was going to say something about other soc drivers living in
> include/linux/soc/qcom/...
>
> But that does touch upon another topic...drivers/soc/qcom is for
> Qualcomm SoC drivers; and at least in the case of qaic, this driver
> doesn't have anything to do with Qualcomm SoCs...
>
>
> Given that this implementation only support, and is only ever going to
> be used with, MHI. Perhaps drivers/bus/mhi would be a better home?
Agreed. In v2, the sahara driver is moved under drivers/bus/mhi as its a 
protocol transported over MHI and not specific to Qualcomm SoC drivers.
>> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
>> index 5e405a19c157..5e2ac1ecede3 100644
>> --- a/drivers/accel/qaic/Kconfig
>> +++ b/drivers/accel/qaic/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>>   	depends on DRM_ACCEL
>>   	depends on PCI && HAS_IOMEM
>>   	depends on MHI_BUS
>> +	select QCOM_SAHARA_PROTOCOL
>>   	select CRC32
>>   	help
>>   	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 586a6877e568..4ad84f7e2162 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -11,8 +11,6 @@ qaic-y := \
>>   	qaic_data.o \
>>   	qaic_drv.o \
>>   	qaic_ras.o \
>> -	qaic_timesync.o \
>> -	sahara.o \
>> -	sahara_image_table.o
>> +	qaic_timesync.o
>>   
>>   qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
>> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
>> index 16c346e0e3b5..76beef6018a7 100644
>> --- a/drivers/accel/qaic/mhi_controller.c
>> +++ b/drivers/accel/qaic/mhi_controller.c
>> @@ -9,11 +9,11 @@
>>   #include <linux/mhi.h>
>>   #include <linux/moduleparam.h>
>>   #include <linux/pci.h>
>> +#include <linux/sahara_image_table_ops.h>
>>   #include <linux/sizes.h>
>>   
>>   #include "mhi_controller.h"
>>   #include "qaic.h"
>> -#include "sahara_image_table_ops.h"
>>   
>>   #define MAX_RESET_TIME_SEC 25
>>   
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index 5c4fab328003..a55e279411c3 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/msi.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/sahara.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/wait.h>
>> @@ -31,7 +32,6 @@
>>   #include "qaic_debugfs.h"
>>   #include "qaic_ras.h"
>>   #include "qaic_timesync.h"
>> -#include "sahara.h"
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> @@ -682,12 +682,6 @@ static int __init qaic_init(void)
>>   		goto free_pci;
>>   	}
>>   
>> -	ret = sahara_register();
>> -	if (ret) {
>> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>> -		goto free_mhi;
>> -	}
>> -
>>   	ret = qaic_sahara_register_image_tables();
>>   	if (ret) {
>>   		pr_debug("qaic: Image table registration failed %d\n", ret);
>> @@ -737,7 +731,6 @@ static void __exit qaic_exit(void)
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> -	sahara_unregister();
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   	pci_unregister_driver(&qaic_pci_driver);
>>   }
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 2caadbbcf830..7ea4cff9a679 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -295,8 +295,6 @@ config QCOM_PBS
>>   	  This module provides the APIs to the client drivers that wants to send the
>>   	  PBS trigger event to the PBS RAM.
>>   
>> -endmenu
>> -
>>   config QCOM_UBWC_CONFIG
>>   	tristate
>>   	help
>> @@ -304,3 +302,7 @@ config QCOM_UBWC_CONFIG
>>   	  (UBWC) engines across various IP blocks, which need to be initialized
>>   	  with coherent configuration data. This module functions as a single
>>   	  source of truth for that information.
>> +
>> +source "drivers/soc/qcom/sahara/Kconfig"
>> +
>> +endmenu
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index b7f1d2a57367..99e490e3174e 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -40,3 +40,4 @@ qcom_ice-objs			+= ice.o
>>   obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>   obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>>   obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>> +obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>> diff --git a/drivers/soc/qcom/sahara/Kconfig b/drivers/soc/qcom/sahara/Kconfig
>> new file mode 100644
>> index 000000000000..4be90959736e
>> --- /dev/null
>> +++ b/drivers/soc/qcom/sahara/Kconfig
>> @@ -0,0 +1,17 @@
>> +config QCOM_SAHARA_PROTOCOL
>> +	tristate "Qualcomm Sahara protocol"
> It's bad practice to mix "select" and human selectable options. Drop the
> "Qualcomm Sahara Protocol" and rely on the select to enable the driver.
Addressed in v2. Sahara is provided as CONFIG_MHI_SAHARA under the MHI 
subsystem and is enabled by selecting it from QAIC driver (and other 
users as needed). There is no separate human selectable + select mix for 
the same feature.
>> +	depends on MHI_BUS
>> +	select FW_LOADER_COMPRESS
>> +	select FW_LOADER_COMPRESS_XZ
>> +	select FW_LOADER_COMPRESS_ZSTD
>> +	help
>> +	  The sahara protocol is primarily designed for transferring software
>> +	  images from a host device to a target device using a simplified data
>> +	  transfer mechanism over any physical link. However, the sahara
>> +	  protocol does not support any authentication/validation of data sent
>> +	  between devices. Such mechanism is beyond the scope of protocol.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called qcom_sahara.
>> diff --git a/drivers/soc/qcom/sahara/Makefile b/drivers/soc/qcom/sahara/Makefile
>> new file mode 100644
>> index 000000000000..ad3922b30a31
>> --- /dev/null
>> +++ b/drivers/soc/qcom/sahara/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) := qcom_sahara.o
>> +
>> +qcom_sahara-y := sahara.o \
>> +		sahara_image_table.o
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> similarity index 99%
>> rename from drivers/accel/qaic/sahara.c
>> rename to drivers/soc/qcom/sahara/sahara.c
>> index 7eae329396be..5e17d71a2d34 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -9,13 +9,12 @@
> Make sure the style of the copyright comment matches the subsystem where
> you move this driver to.
ACK.
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/overflow.h>
>> +#include <linux/sahara.h>
>> +#include <linux/sahara_image_table_ops.h>
>>   #include <linux/types.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/workqueue.h>
>>   
>> -#include "sahara.h"
>> -#include "sahara_image_table_ops.h"
>> -
>>   #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>>   #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>>   #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
>> @@ -814,8 +813,14 @@ int sahara_register(void)
>>   {
>>   	return mhi_driver_register(&sahara_mhi_driver);
>>   }
>> +module_init(sahara_register);
>>   
>>   void sahara_unregister(void)
>>   {
>>   	mhi_driver_unregister(&sahara_mhi_driver);
>>   }
>> +module_exit(sahara_unregister);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Qualcomm Innovation Center, Inc");
> Skip MODULE_AUTHOR, or correct it.
Addressed in v2 by using a specific MODULE_DESCRIPTION("Qualcomm Sahara 
MHI protocol driver") and avoiding ambiguous author strings. The module 
name and description are now unique and clearly scoped.
>> +MODULE_DESCRIPTION("Sahara driver");
> There's already another driver by the name "sahara", so be more
> specific.
>
> Regards,
> Bjorn
ACK.
>> diff --git a/drivers/accel/qaic/sahara_image_table.c b/drivers/soc/qcom/sahara/sahara_image_table.c
>> similarity index 94%
>> rename from drivers/accel/qaic/sahara_image_table.c
>> rename to drivers/soc/qcom/sahara/sahara_image_table.c
>> index dd0793a33727..18f9b7a59f25 100644
>> --- a/drivers/accel/qaic/sahara_image_table.c
>> +++ b/drivers/soc/qcom/sahara/sahara_image_table.c
>> @@ -5,8 +5,8 @@
>>   #include <linux/device.h>
>>   #include <linux/list.h>
>>   #include <linux/mutex.h>
>> +#include <linux/sahara_image_table_ops.h>
>>   
>> -#include "sahara_image_table_ops.h"
>>   
>>   struct sahara_image_table_context {
>>   	struct list_head provider_list;
>> @@ -49,6 +49,7 @@ int sahara_register_image_table_provider(struct sahara_image_table_provider
>>   
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL_GPL(sahara_register_image_table_provider);
>>   
>>   /**
>>    * sahara_get_image_table - Get the image table for a given device name
>> @@ -78,6 +79,7 @@ const char * const *sahara_get_image_table(const char *dev_name)
>>   
>>   	return NULL;
>>   }
>> +EXPORT_SYMBOL_GPL(sahara_get_image_table);
>>   
>>   /**
>>    * sahara_get_image_table_size - Get the size of the image table for a given
>> @@ -109,6 +111,7 @@ size_t sahara_get_image_table_size(const char *dev_name)
>>   
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL_GPL(sahara_get_image_table_size);
>>   
>>   /**
>>    * sahara_unregister_image_table_provider - Unregister an image table provider.
>> @@ -139,6 +142,7 @@ int sahara_unregister_image_table_provider(struct sahara_image_table_provider
>>   
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL_GPL(sahara_unregister_image_table_provider);
>>   
>>   /**
>>    * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
>> @@ -171,3 +175,4 @@ char *sahara_get_fw_folder_name(const char *dev_name)
>>   
>>   	return NULL;
>>   }
>> +EXPORT_SYMBOL_GPL(sahara_get_fw_folder_name);
>> diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
>> similarity index 100%
>> rename from drivers/accel/qaic/sahara.h
>> rename to include/linux/sahara.h
>> diff --git a/drivers/accel/qaic/sahara_image_table_ops.h b/include/linux/sahara_image_table_ops.h
>> similarity index 100%
>> rename from drivers/accel/qaic/sahara_image_table_ops.h
>> rename to include/linux/sahara_image_table_ops.h
>> -- 
>> 2.34.1
>>

