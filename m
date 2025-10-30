Return-Path: <linux-arm-msm+bounces-79546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CABC1DE95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 01:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 985E53BC2CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 00:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7143C883F;
	Thu, 30 Oct 2025 00:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz1nUFOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd7IddP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155084C9D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761784229; cv=none; b=HEmsQjLXy1jBbMLS0mqeGYHSF1aiRUXD/wCZ5GyBLC5M9yvIU1JabXCr7HGSNJRj7Qn96liXlN+pSG5n+R/vgdH7kqImcltGAD/iXDEohYoXIkOxC19lSI5Bb3ekTkxevRjszhru21HIGs/V8DUZc814gCSauuOMI1pUQiSmxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761784229; c=relaxed/simple;
	bh=f2jmlO24In36dj/kvUcVqHv9NeEJdFy6wH2mR5avY5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFjKoXGlJGoPNwHi9Hw2vt8TRad9iTxLkBeWBJ283gBtx2OFMaumV2lA18+aTqt0108089YPiVg4I7aFuidaki5kFZvv2XDrqm7bfaePnOJL4cYcVfGv6FDzLQRz/uhVQIVLX2ow/5XhIxLLcFf5055ijtCfJu3ryqruBdxMt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz1nUFOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd7IddP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TGHcTU4155201
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bg4GD4B5bCl/z2lBLTlw6Nv819p3I0Eq4wMDWopW18A=; b=Wz1nUFObUD9mqwkl
	wLRDy5auK2++Bw+Y/XNjqjFBfwGNpBMHWKMOVNguzhqmjlcl7PUmH47kKXiZBOHr
	7XqNv12v89HIB9YZX8mtPbjc3pwGf93Nz3LFuifqjgiUsb84TPLqJuAAsneE/5B3
	gfQQf2AnpDMBH/dNw7NiRdbdg9Y50Z7mrXurL8c1d+QJeZddghf+qeDFVM60qeMT
	MMvFs1v4EQ1rNjc3SIJU01knN9+JgNy6KQjpOfT6h+syH0Kog8qQfbo4qYG5dWFj
	x8C/nSpl10ADsnA6Ut1X4HNNwUjflkC341kTRYsm1B+fC81CUuLIC3sfOFvLlq2c
	jTsnDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0trsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:30:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290cd61855eso3374755ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761784225; x=1762389025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bg4GD4B5bCl/z2lBLTlw6Nv819p3I0Eq4wMDWopW18A=;
        b=Jd7IddP77yz/xLfa8JgewRGzgs64KMJeyD88G/+xBxZaauwnW3plgiP8BSgWJo3sli
         xyblVeO/Nd3yLOGg8+v6ELHuLZ+8FTVLm/yye1arnnBj9vx6oeBbgnf7GmsTRHb8rcpn
         wlwneG8YVGvKopvsPOCfded+84xTW8aORQvKROioBAGu0xUVFQ5lMoz2IPbxBYKdP4gQ
         GmoLEAILj+qP40S2XqX/rK9iHA4r0iUvBZWoFRBXTgv/Co1hrZDJJdmqjWJ+OyhgtryE
         eOWX8ZOZwvOyA1KfN/y8r/QDdpvu2a2dUSjkNagYcWFSa2GMGc7o5MRNKVJO2fmwizXF
         G6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761784225; x=1762389025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg4GD4B5bCl/z2lBLTlw6Nv819p3I0Eq4wMDWopW18A=;
        b=H0JuPap6+fyDL5bMXzcCfcd14SWtdAxNfa8m7IzkLlhy519+YVJUgdWOyTRJ3z/C/r
         2fsgFuF9sWO0WAcyvBbNOJAaT1U0dxXWvD06tMH3PN/RwDdx96xvToYP0WGQPZSBhLmK
         TFWFDYXv4oHH80mLQsqUwZfP6LMStBL9BjFDeittVYQEKlrbnttCnG3LIZ3nJ8f+YQp7
         In3P5pV/MRrXrzBDcoCeKne1knsD28E/wWU1y+JZ2Js4jtdwDFDFtJjjfhCGhkQfjW4p
         hFPcBeqhP6jyRqM+hVsCvwtJtCiCHIgPwALEQc01OgT1O72fITlu/F8A+t+m+a7c0rJF
         PHIw==
X-Forwarded-Encrypted: i=1; AJvYcCUQBX/VdeZL6563BWzWtG5nRVaqtznqU7orwWwjT4QRS+a8P6ignkMBe1UvelkkciBa0ZTdNHn0oIbLoxCL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1O09AMJvTpe3KnKyfc1MeF7eNuHFMRu6BWlnLirPACC65mccQ
	V+zWWz9xzl6YKtkRoFO3UJivjxR5dtaxKb7+1rU9j4dh/j1SXBT97nqFnctEEvxzml1BYDCRADM
	HCPRFKSwjQTmGYr90d2Cm/+2/ERC4N0iJIVZOMMzINQs9Bor1j+ev6Acw3wYazmPsQJmY
X-Gm-Gg: ASbGncsemJEaa+NOBHsx9i2AowetPYXO6w41zcq/+1sy0SUveT9EiSht1a1s3wP7kA3
	Acva/sb6xnettYKcmmkQYVsnWYIt/0VKGcMYgV6G2l/SARff7/wFvQnxKS7rqrK0ckOOa3tdbem
	9Lk+dQILdw+OxuOoyPO/l026onwyX41m17AfJe1A5gjHMpqmRcBjVYGUigHyGU3sqpEYPnwsH8R
	hszId9kPs12PTdPJif/Z+WVOBQt7s6NPqdbtEw8C0psLDgFKbkXWnkJX3K5CR5HvBUw2jzWoRSk
	gIwNdn/MrJosWhis+ERfEHU1pXD/ADXBpCbj1Td5TIqedhQrAUMFX1rH8MOSNJp4mw1Nc+LIYhd
	BlEwAo6jyYaIHTLfVg8fsoBX92fW/4JgZwS+WFaaK6pz5wxLHJYSH
X-Received: by 2002:a17:903:1a23:b0:240:9dd8:219b with SMTP id d9443c01a7336-294deed6937mr56766295ad.49.1761784224161;
        Wed, 29 Oct 2025 17:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbpA1sRQPQGXfu0y7Xt51AgpiXHs+MPJMCKqhhNVROmMm29cJsPfykWn0uuQiQuftFK0UPpA==
X-Received: by 2002:a17:903:1a23:b0:240:9dd8:219b with SMTP id d9443c01a7336-294deed6937mr56765575ad.49.1761784223240;
        Wed, 29 Oct 2025 17:30:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0ac07sm165638755ad.43.2025.10.29.17.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 17:30:22 -0700 (PDT)
Message-ID: <f594b22f-f9f0-466f-963f-42235424790f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 18:30:20 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] accel/qaic: Implement basic SSR handling
To: Bjorn Andersson <andersson@kernel.org>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com, ogabbay@kernel.org,
        lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Troy Hanson <quic_thanson@quicinc.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
 <20251024164630.816862-3-youssef.abdulrahman@oss.qualcomm.com>
 <club7ttb5xwffgcglsbnm62dzdnjrdutclbbfpsh2rfynrje6m@bu4bk3pd2pcv>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <club7ttb5xwffgcglsbnm62dzdnjrdutclbbfpsh2rfynrje6m@bu4bk3pd2pcv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6902b1a1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QIhr-27iAAAA:8 a=Jq3LtsnOAsMKr34-ZU8A:9 a=QEXdDO2ut3YA:10
 a=Yx1Ww8rMGscA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=pioyyrs4ZptJ924tMmac:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-GUID: 196v6D0y2jYAlbzWHBPFM4sjHvJmSHGX
X-Proofpoint-ORIG-GUID: 196v6D0y2jYAlbzWHBPFM4sjHvJmSHGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwMSBTYWx0ZWRfX7UrY6BNbU1bu
 a6QdvVDJOx0DEZCzkI6MLvrTds2T10Jp2NJ4dt7MtkhGbJe9Z1D7FTxmC/zvo6gAvMaXYzvhp5h
 wR5/HPEE26PPqrXABBXV2A1xMdWK3r9Jh/EjUT2vcml2KMfhszjsjjaBIN2ijQoK/4r7OI/u+4g
 CCi/wri/ZijCgV2STBIa0seiEIHILVG37cVW4XpmIRsELE+exDJBVGsz0Zg6QztXuh2rgB+5VJY
 6QnKwoU0fWJPmNM7FKL6T9u9SziVzunfQMY8g/lmOgSU6cP8IRyYTQjvVREBO3ZiX42pwxJuSHw
 K4tdCdwLMUK2BPtz3IF6x4VCXb0TXl5d6XoKtSnQA+i+6xDkHzveYSBrb/Lm840wRlul/q/vCG+
 DSppzGffjBEJfIILCjWJkHybh/bBiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300001

On 10/27/2025 7:59 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 06:46:29PM +0200, Youssef Samir wrote:
>> From: Jeffrey Hugo <jhugo@codeaurora.org>
>>
>> Subsystem restart (SSR) for a qaic device means that a NSP has crashed,
>> and will be restarted.  However the restart process will lose any state
>> associated with activation, so the user will need to do some recovery.
>>
>> While SSR has the provision to collect a crash dump, this patch does not
>> support it.
> 
> "does not support it", wouldn't it be better to say "patch does not
> implement this"? As I presume the code you add here will indeed support
> the addition of the coredump collection code?

Yes, this patch does not implement crashdump, that is added in the next 
patch (this one seems large enough as it is).  There is an aspect of 
support in the protocol, where the host can reject the dump.  Wording 
could be better.

> 
>>
>> Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Co-developed-by: Troy Hanson <quic_thanson@quicinc.com>
>> Signed-off-by: Troy Hanson <quic_thanson@quicinc.com>
>> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Above are the list of authors who pair-programmed this patch.
> 
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Then Jeff @ Codeaurora handled the patch.
> 
>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> 
> And now you're handling the patch.
> 
> This mostly makes sense, except that the "main" author
> jhugo@codeaurora.org never signed-off the patch when he co-authored it,
> instead he did that as quic_jhugo. Then later jhugo@codeaurora.org
> handled the patch...

No, thats the origional SOB from me @CAF that you think "handled" the 
patch. Youssef's SOB is the first "handling" one.

Please see the example in Submitting Patches -

<changelog>

Co-developed-by: First Co-Author <first@coauthor.example.org>
Signed-off-by: First Co-Author <first@coauthor.example.org>
Co-developed-by: Second Co-Author <second@coauthor.example.org>
Signed-off-by: Second Co-Author <second@coauthor.example.org>
Signed-off-by: From Author <from@author.example.org>


> 
>> ---
>>   Documentation/accel/qaic/aic100.rst |  24 ++-
>>   drivers/accel/qaic/Makefile         |   1 +
>>   drivers/accel/qaic/qaic.h           |   9 +
>>   drivers/accel/qaic/qaic_data.c      |  61 +++++-
>>   drivers/accel/qaic/qaic_drv.c       |  17 ++
>>   drivers/accel/qaic/qaic_ssr.c       | 293 ++++++++++++++++++++++++++++
>>   drivers/accel/qaic/qaic_ssr.h       |  16 ++
>>   7 files changed, 412 insertions(+), 9 deletions(-)
>>   create mode 100644 drivers/accel/qaic/qaic_ssr.c
>>   create mode 100644 drivers/accel/qaic/qaic_ssr.h
>>
>> diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
>> index 273da6192fb3..3b287c3987d2 100644
>> --- a/Documentation/accel/qaic/aic100.rst
>> +++ b/Documentation/accel/qaic/aic100.rst
>> @@ -487,8 +487,8 @@ one user crashes, the fallout of that should be limited to that workload and not
>>   impact other workloads. SSR accomplishes this.
>>   
>>   If a particular workload crashes, QSM notifies the host via the QAIC_SSR MHI
>> -channel. This notification identifies the workload by it's assigned DBC. A
>> -multi-stage recovery process is then used to cleanup both sides, and get the
>> +channel. This notification identifies the workload by its assigned DBC. A
>> +multi-stage recovery process is then used to cleanup both sides, and gets the
>>   DBC/NSPs into a working state.
>>   
>>   When SSR occurs, any state in the workload is lost. Any inputs that were in
>> @@ -496,6 +496,26 @@ process, or queued by not yet serviced, are lost. The loaded artifacts will
>>   remain in on-card DDR, but the host will need to re-activate the workload if
>>   it desires to recover the workload.
>>   
>> +When SSR occurs for a specific NSP, the assigned DBC goes through the
>> +following state transactions in order:
>> +DBC_STATE_BEFORE_SHUTDOWN
>> +	Indicates that the affected NSP was found in an unrecoverable error
>> +	condition.
>> +DBC_STATE_AFTER_SHUTDOWN
>> +	Indicates that the NSP is under reset.
>> +DBC_STATE_BEFORE_POWER_UP
>> +	Indicates that the NSP's debug information has been collected, and is
>> +	ready to be collected by the host (if desired). At that stage the NSP
>> +	is restarted by QSM.
>> +DBC_STATE_AFTER_POWER_UP
>> +	Indicates that the NSP has been restarted, fully operational and is
>> +	in idle state.
>> +
>> +SSR also has an optional crashdump collection feature. If enabled, the host can
>> +collect the memory dump for the crashed NSP and dump it to the user space via
>> +the dev_coredump subsystem. The host can also decline the crashdump collection
>> +request from the device.
>> +
>>   Reliability, Accessibility, Serviceability (RAS)
>>   ================================================
>>   
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 8f6746e5f03a..71f727b74da3 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -11,6 +11,7 @@ qaic-y := \
>>   	qaic_data.o \
>>   	qaic_drv.o \
>>   	qaic_ras.o \
>> +	qaic_ssr.o \
>>   	qaic_sysfs.o \
>>   	qaic_timesync.o \
>>   	sahara.o
>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>> index 4c2f25249e95..3bd37b494d49 100644
>> --- a/drivers/accel/qaic/qaic.h
>> +++ b/drivers/accel/qaic/qaic.h
>> @@ -21,6 +21,7 @@
>>   
>>   #define QAIC_DBC_BASE		SZ_128K
>>   #define QAIC_DBC_SIZE		SZ_4K
>> +#define SSR_DBC_SENTINEL	U32_MAX /* No ongoing SSR sentinel */
> 
> Please continue using the QAIC_ prefix.
> 
>>   
>>   #define QAIC_NO_PARTITION	-1
>>   
>> @@ -195,6 +196,12 @@ struct qaic_device {
>>   	unsigned int		ue_count;
>>   	/* Un-correctable non-fatal error count */
>>   	unsigned int		ue_nf_count;
>> +	/* MHI SSR channel device */
>> +	struct mhi_device	*ssr_ch;
>> +	/* Work queue for tasks related to MHI SSR device */
>> +	struct workqueue_struct	*ssr_wq;
>> +	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
> 
> What prevents a second NSP from sending BEFORE_SHUTDOWN while you're
> currently processing a first one?

Currently the FW is designed to handle multiple SSR events sequentially. 
  Any kind of "parallelism" is a bug

> 
> Seems like you will stop failing requests on the first one, and then as
> soon as the first one recover (if it does) its signal will mark the
> second one as done...
> 
>> +	u32			ssr_dbc;
>>   };
>>   
>>   struct qaic_drm_device {
>> @@ -338,6 +345,8 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>>   int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>   int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>   void irq_polling_work(struct work_struct *work);
>> +void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id);
>> +void dbc_exit_ssr(struct qaic_device *qdev);
> 
> qaic_ prefix please.
> 
> Interestingly enough, there's only one "irq_polling_work" in the kernel,
> but it would be nice if that could get a prefix as well (in a separate
> patch).
> 
>>   
>>   /* qaic_sysfs.c */
>>   int qaic_sysfs_init(struct qaic_drm_device *qddev);
>> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
>> index c4f117edb266..018c97e7ab72 100644
>> --- a/drivers/accel/qaic/qaic_data.c
>> +++ b/drivers/accel/qaic/qaic_data.c
>> @@ -1023,6 +1023,11 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
>>   		goto unlock_ch_srcu;
>>   	}
>>   
>> +	if (dbc->id == qdev->ssr_dbc) {
>> +		ret = -EPIPE;
>> +		goto unlock_ch_srcu;
>> +	}
>> +
>>   	ret = qaic_prepare_bo(qdev, bo, &args->hdr);
>>   	if (ret)
>>   		goto unlock_ch_srcu;
>> @@ -1356,6 +1361,11 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
>>   		goto release_ch_rcu;
>>   	}
>>   
>> +	if (dbc->id == qdev->ssr_dbc) {
>> +		ret = -EPIPE;
>> +		goto release_ch_rcu;
>> +	}
>> +
>>   	ret = mutex_lock_interruptible(&dbc->req_lock);
>>   	if (ret)
>>   		goto release_ch_rcu;
>> @@ -1709,6 +1719,11 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>>   		goto unlock_ch_srcu;
>>   	}
>>   
>> +	if (dbc->id == qdev->ssr_dbc) {
>> +		ret = -EPIPE;
>> +		goto unlock_ch_srcu;
>> +	}
>> +
>>   	obj = drm_gem_object_lookup(file_priv, args->handle);
>>   	if (!obj) {
>>   		ret = -ENOENT;
>> @@ -1729,6 +1744,9 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>>   	if (!dbc->usr)
>>   		ret = -EPERM;
>>   
>> +	if (dbc->id == qdev->ssr_dbc)
>> +		ret = -EPIPE;
>> +
>>   put_obj:
>>   	drm_gem_object_put(obj);
>>   unlock_ch_srcu:
>> @@ -1927,6 +1945,17 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
>>   	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>>   }
>>   
>> +static void sync_empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *dbc)
>> +{
>> +	empty_xfer_list(qdev, dbc);
>> +	synchronize_srcu(&dbc->ch_lock);
>> +	/*
>> +	 * Threads holding channel lock, may add more elements in the xfer_list.
>> +	 * Flush out these elements from xfer_list.
>> +	 */
>> +	empty_xfer_list(qdev, dbc);
>> +}
>> +
>>   int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
>>   {
>>   	if (!qdev->dbc[dbc_id].usr || qdev->dbc[dbc_id].usr->handle != usr->handle)
>> @@ -1955,13 +1984,7 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id)
>>   	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
>>   
>>   	dbc->usr = NULL;
>> -	empty_xfer_list(qdev, dbc);
>> -	synchronize_srcu(&dbc->ch_lock);
>> -	/*
>> -	 * Threads holding channel lock, may add more elements in the xfer_list.
>> -	 * Flush out these elements from xfer_list.
>> -	 */
>> -	empty_xfer_list(qdev, dbc);
>> +	sync_empty_xfer_list(qdev, dbc);
> 
> Why was this block moved verbatim - it's still only used here.

Readability. We've observed the compiler will inline it just fine.

> 
>>   }
>>   
>>   void release_dbc(struct qaic_device *qdev, u32 dbc_id)
>> @@ -2002,3 +2025,27 @@ void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
>>   	*head = readl(dbc->dbc_base + REQHP_OFF);
>>   	*tail = readl(dbc->dbc_base + REQTP_OFF);
>>   }
>> +
>> +/*
>> + * dbc_enter_ssr - Prepare to enter in sub system reset(SSR) for given DBC ID.
>> + *		   The device will automatically deactivate the workload as not
>> + *		   all errors can be silently recovered. The user will be
>> + *		   notified and will need to decide the required recovery
>> + *		   action to take.
>> + * @qdev: qaic device handle
>> + * @dbc_id: ID of the DBC which will enter SSR
> 
> This is almost kernel-doc, please read
> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
> and adjust accordingly.
> 
> 
> How about prefixing global functions qaic_?
> 
>> + */
>> +void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id)
>> +{
>> +	qdev->ssr_dbc = dbc_id;
>> +	release_dbc(qdev, dbc_id);
>> +}
>> +
>> +/*
>> + * dbc_exit_ssr - Prepare to exit from sub system reset(SSR) for given DBC ID
> 
> Also almost kernel-doc.
> 
> What does it mean to "exit from sub system restart"? Boot the device up
> again? Or are we saying that we're done with the restart and can start
> accepting work again?

Yes, we are done with the restart and can start accepting work again. 
Could be better stated.

> 
>> + * @qdev: qaic device handle
>> + */
>> +void dbc_exit_ssr(struct qaic_device *qdev)
>> +{
>> +	qdev->ssr_dbc = SSR_DBC_SENTINEL;
>> +}
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index a8a16f20320f..4aac8d1eba8c 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -30,6 +30,7 @@
>>   #include "qaic.h"
>>   #include "qaic_debugfs.h"
>>   #include "qaic_ras.h"
>> +#include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>>   #include "sahara.h"
>>   
>> @@ -390,6 +391,7 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
>>   	qaic_notify_reset(qdev);
>>   
>>   	/* start tearing things down */
>> +	clean_up_ssr(qdev);
>>   	for (i = 0; i < qdev->num_dbc; ++i)
>>   		release_dbc(qdev, i);
>>   }
>> @@ -439,11 +441,18 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
>>   	qdev->qts_wq = qaicm_wq_init(drm, "qaic_ts");
>>   	if (IS_ERR(qdev->qts_wq))
>>   		return NULL;
>> +	qdev->ssr_wq = qaicm_wq_init(drm, "qaic_ssr");
>> +	if (IS_ERR(qdev->ssr_wq))
>> +		return NULL;
>>   
>>   	ret = qaicm_srcu_init(drm, &qdev->dev_lock);
>>   	if (ret)
>>   		return NULL;
>>   
>> +	ret = ssr_init(qdev, drm);
>> +	if (ret)
>> +		pci_info(pdev, "QAIC SSR crashdump collection not supported.\n");
>> +
>>   	qdev->qddev = qddev;
>>   	qdev->pdev = pdev;
>>   	qddev->qdev = qdev;
>> @@ -710,9 +719,16 @@ static int __init qaic_init(void)
>>   	ret = qaic_ras_register();
>>   	if (ret)
>>   		pr_debug("qaic: qaic_ras_register failed %d\n", ret);
>> +	ret = qaic_ssr_register();
>> +	if (ret) {
>> +		pr_debug("qaic: qaic_ssr_register failed %d\n", ret);
>> +		goto free_bootlog;
>> +	}
>>   
>>   	return 0;
>>   
>> +free_bootlog:
>> +	qaic_bootlog_unregister();
>>   free_mhi:
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   free_pci:
>> @@ -738,6 +754,7 @@ static void __exit qaic_exit(void)
>>   	 * reinitializing the link_up state after the cleanup is done.
>>   	 */
>>   	link_up = true;
>> +	qaic_ssr_unregister();
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
>> new file mode 100644
>> index 000000000000..1ffb44767b3d
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_ssr.c
>> @@ -0,0 +1,293 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
>> +/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> 
> Please use the new copyright statement.

That doesn't match the specific guidence I've gotten from our legal team 
in this specific case.

> 
>> +
>> +#include <asm/byteorder.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_managed.h>
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mhi.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include "qaic.h"
>> +#include "qaic_ssr.h"
>> +
>> +#define MSG_BUF_SZ 32
> 
> This is a quite generic name, what does it actually size?
> 
>> +
>> +enum ssr_cmds {
>> +	DEBUG_TRANSFER_INFO =		BIT(0),
> 
> This isn't an "enumeration", so use #define.
> 
>> +	DEBUG_TRANSFER_INFO_RSP =	BIT(1),
>> +	MEMORY_READ =			BIT(2),
>> +	MEMORY_READ_RSP =		BIT(3),
>> +	DEBUG_TRANSFER_DONE =		BIT(4),
>> +	DEBUG_TRANSFER_DONE_RSP =	BIT(5),
>> +	SSR_EVENT =			BIT(8),
>> +	SSR_EVENT_RSP =			BIT(9),
>> +};
>> +
>> +enum ssr_events {
>> +	SSR_EVENT_NACK =	BIT(0),
> 
> Same here.
> 
>> +	BEFORE_SHUTDOWN =	BIT(1),
>> +	AFTER_SHUTDOWN =	BIT(2),
>> +	BEFORE_POWER_UP =	BIT(3),
>> +	AFTER_POWER_UP =	BIT(4),
>> +};
>> +
>> +struct _ssr_hdr {
>> +	__le32 cmd;
>> +	__le32 len;
>> +	__le32 dbc_id;
>> +};
>> +
>> +struct ssr_hdr {
>> +	u32 cmd;
>> +	u32 len;
>> +	u32 dbc_id;
>> +};
>> +
>> +struct ssr_debug_transfer_info {
> 
> This is unused.
> 
>> +	struct ssr_hdr hdr;
>> +	u32 resv;
>> +	u64 tbl_addr;
>> +	u64 tbl_len;
>> +} __packed;
>> +
>> +struct ssr_debug_transfer_info_rsp {
>> +	struct _ssr_hdr hdr;
>> +	__le32 ret;
>> +} __packed;
>> +
>> +struct ssr_memory_read {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 resv;
>> +	__le64 addr;
>> +	__le64 len;
>> +} __packed;
>> +
>> +struct ssr_memory_read_rsp {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 resv;
>> +	u8 data[];
>> +} __packed;
>> +
>> +struct ssr_debug_transfer_done {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 resv;
>> +} __packed;
>> +
>> +struct ssr_debug_transfer_done_rsp {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 ret;
>> +} __packed;
>> +
>> +struct ssr_event {
>> +	struct ssr_hdr hdr;
>> +	u32 event;
> 
> Some of these structs are expressed in little endian and some in native
> endian. I believe this relates to some of them being sent over the wire
> and some being used in the driver only.
> 
> It would be nice if there was a hint other than "does the struct have
> __leXY types" to indicate this - or at least group them accordingly.
> 
>> +} __packed;
>> +
>> +struct ssr_event_rsp {
>> +	struct _ssr_hdr hdr;
>> +	__le32 event;
>> +} __packed;
>> +
>> +struct ssr_resp {
>> +	/* Work struct to schedule work coming on QAIC_SSR channel */
> 
> Wouldn't it be cleaner to use kernel-doc style and document this above
> the struct?

It is an internal structure. What is the value in having this 
documentation end up on docs.kernel.og?

> 
>> +	struct work_struct work;
>> +	/* Root struct of device, used to access device resources */
>> +	struct qaic_device *qdev;
>> +	/* Buffer used by MHI for transfer requests */
>> +	u8 data[] __aligned(8);
>> +};
>> +
>> +void clean_up_ssr(struct qaic_device *qdev)
> 
> That's a pretty generic name for a globally accessible function.
> 
>> +{
>> +	dbc_exit_ssr(qdev);
>> +}
>> +
>> +static void ssr_worker(struct work_struct *work)
>> +{
>> +	struct ssr_resp *resp = container_of(work, struct ssr_resp, work);
>> +	struct ssr_hdr *hdr = (struct ssr_hdr *)resp->data;
>> +	struct ssr_debug_transfer_info_rsp *debug_rsp;
>> +	struct qaic_device *qdev = resp->qdev;
>> +	struct ssr_event_rsp *event_rsp;
>> +	struct dma_bridge_chan *dbc;
>> +	struct ssr_event *event;
>> +	u32 ssr_event_ack;
>> +	int ret;
>> +
>> +	le32_to_cpus(&hdr->cmd);
>> +	le32_to_cpus(&hdr->len);
>> +	le32_to_cpus(&hdr->dbc_id);
>> +
>> +	if (hdr->len > MSG_BUF_SZ)
>> +		goto out;
>> +
>> +	if (hdr->dbc_id >= qdev->num_dbc)
> 
> Isn't this bad? Does it warrant a comment? Or perhaps dev_dbg() so you
> know in testing if this ever happens?
> 
>> +		goto out;
>> +
>> +	dbc = &qdev->dbc[hdr->dbc_id];
>> +
>> +	switch (hdr->cmd) {
>> +	case DEBUG_TRANSFER_INFO:
>> +		/* Decline crash dump request from the device */
>> +		debug_rsp = kmalloc(sizeof(*debug_rsp), GFP_KERNEL);
>> +		if (!debug_rsp)
>> +			break;
>> +
>> +		debug_rsp->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_INFO_RSP);
>> +		debug_rsp->hdr.len = cpu_to_le32(sizeof(*debug_rsp));
>> +		debug_rsp->hdr.dbc_id = cpu_to_le32(event->hdr.dbc_id);
>> +		debug_rsp->ret = cpu_to_le32(1);
>> +
>> +		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
>> +				    debug_rsp, sizeof(*debug_rsp), MHI_EOT);
>> +		if (ret) {
>> +			pci_warn(qdev->pdev, "Could not send DEBUG_TRANSFER_INFO_RSP %d\n", ret);
>> +			kfree(debug_rsp);
>> +		}
>> +		return;
>> +	case SSR_EVENT:
>> +		event = (struct ssr_event *)hdr;
>> +		le32_to_cpus(&event->event);
> 
> Leftover?
> 
>> +		ssr_event_ack = event->event;
>> +
>> +		switch (event->event) {
>> +		case BEFORE_SHUTDOWN:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_SHUTDOWN);
>> +			dbc_enter_ssr(qdev, hdr->dbc_id);
>> +			break;
>> +		case AFTER_SHUTDOWN:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_SHUTDOWN);
>> +			break;
>> +		case BEFORE_POWER_UP:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_POWER_UP);
>> +			break;
>> +		case AFTER_POWER_UP:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_POWER_UP);
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +
>> +		event_rsp = kmalloc(sizeof(*event_rsp), GFP_KERNEL);
>> +		if (!event_rsp)
>> +			break;
>> +
>> +		event_rsp->hdr.cmd = cpu_to_le32(SSR_EVENT_RSP);
>> +		event_rsp->hdr.len = cpu_to_le32(sizeof(*event_rsp));
>> +		event_rsp->hdr.dbc_id = cpu_to_le32(hdr->dbc_id);
>> +		event_rsp->event = cpu_to_le32(ssr_event_ack);
>> +
>> +		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, event_rsp, sizeof(*event_rsp),
>> +				    MHI_EOT);
>> +		if (ret)
>> +			kfree(event_rsp);
>> +
>> +		if (event->event == AFTER_POWER_UP) {
>> +			dbc_exit_ssr(qdev);
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_IDLE);
>> +		}
>> +
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +out:
>> +	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp->data, MSG_BUF_SZ, MHI_EOT);
>> +	if (ret)
>> +		kfree(resp);
>> +}
>> +
>> +static int qaic_ssr_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>> +{
>> +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
>> +	struct ssr_resp *resp;
>> +	int ret;
>> +
>> +	ret = mhi_prepare_for_transfer(mhi_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	resp = kzalloc(sizeof(*resp) + MSG_BUF_SZ, GFP_KERNEL);
>> +	if (!resp) {
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	resp->qdev = qdev;
>> +	INIT_WORK(&resp->work, ssr_worker);
>> +
>> +	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, resp->data, MSG_BUF_SZ, MHI_EOT);
>> +	if (ret) {
>> +		kfree(resp);
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, qdev);
>> +	qdev->ssr_ch = mhi_dev;
>> +
>> +	return 0;
>> +}
>> +
>> +static void qaic_ssr_mhi_remove(struct mhi_device *mhi_dev)
>> +{
>> +	struct qaic_device *qdev;
>> +
>> +	qdev = dev_get_drvdata(&mhi_dev->dev);
>> +	mhi_unprepare_from_transfer(qdev->ssr_ch);
> 
> Please confirm that this will free the ssr_resp object you allocated in
> probe.

Yes.  Unprepare for transfer will cause the xfer callback to be called 
on every queued buffer, with an error code. The callback in this code 
frees the buffer in that instance.

> 
>> +	qdev->ssr_ch = NULL;
>> +}
>> +
>> +static void qaic_ssr_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>> +{
>> +	kfree(mhi_result->buf_addr);
>> +}
>> +
>> +static void qaic_ssr_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>> +{
>> +	struct ssr_resp *resp = container_of(mhi_result->buf_addr, struct ssr_resp, data);
>> +	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	if (mhi_result->transaction_status) {
>> +		kfree(resp);
>> +		return;
>> +	}
>> +	queue_work(qdev->ssr_wq, &resp->work);
>> +}
>> +
>> +static const struct mhi_device_id qaic_ssr_mhi_match_table[] = {
>> +	{ .chan = "QAIC_SSR", },
>> +	{},
>> +};
>> +
>> +static struct mhi_driver qaic_ssr_mhi_driver = {
>> +	.id_table = qaic_ssr_mhi_match_table,
>> +	.remove = qaic_ssr_mhi_remove,
>> +	.probe = qaic_ssr_mhi_probe,
>> +	.ul_xfer_cb = qaic_ssr_mhi_ul_xfer_cb,
>> +	.dl_xfer_cb = qaic_ssr_mhi_dl_xfer_cb,
>> +	.driver = {
>> +		.name = "qaic_ssr",
>> +	},
>> +};
>> +
>> +int ssr_init(struct qaic_device *qdev, struct drm_device *drm)
> 
> Same as clean_up_ssr(), other functions are prefixed "qaic_" why not
> these?
> 
> Why does this function take the drm_device?
> 
> 
>> +{
>> +	qdev->ssr_dbc = SSR_DBC_SENTINEL;
>> +	return 0;
>> +}
>> +
>> +int qaic_ssr_register(void)
>> +{
>> +	return mhi_driver_register(&qaic_ssr_mhi_driver);
>> +}
>> +
>> +void qaic_ssr_unregister(void)
>> +{
>> +	mhi_driver_unregister(&qaic_ssr_mhi_driver);
>> +}
>> diff --git a/drivers/accel/qaic/qaic_ssr.h b/drivers/accel/qaic/qaic_ssr.h
>> new file mode 100644
>> index 000000000000..7de1eb4086cd
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_ssr.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
>> + *
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> Please use the new copyright statement.
> 
>> + */
>> +
>> +#ifndef __QAIC_SSR_H__
>> +#define __QAIC_SSR_H__
>> +
>> +#include <drm/drm_device.h>
>> +
> 
> You don't need drm/drm_device.h, and I presume it doesn't give you
> struct qaic_device?
> 
> Instead just do:
> 
> struct drm_device;
> struct qaic_device;
> 
> Regards,
> Bjorn
> 
>> +int qaic_ssr_register(void);
>> +void qaic_ssr_unregister(void);
>> +void clean_up_ssr(struct qaic_device *qdev);
>> +int ssr_init(struct qaic_device *qdev, struct drm_device *drm);
>> +#endif /* __QAIC_SSR_H__ */
>> -- 
>> 2.43.0
>>
>>


