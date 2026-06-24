Return-Path: <linux-arm-msm+bounces-114325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a/52CJe7O2rYbwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:12:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA646BD8F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:12:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iWvVR8SZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PywZ7x4j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114325-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114325-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A1D93028C33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F4628E0F;
	Wed, 24 Jun 2026 11:12:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F727732
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:12:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299539; cv=none; b=iJqPVUBaAFZhX2cQ64hxjAEBLT9f85hHntv15tzTSH5dx9TOmd9RvM10Vo4OnsoKzerWYmELdE7wgnpOQq/v+yg3QY77Smov96ZGxQ/STojrrjqg01vD77vJdqA0SpzVkl1TnRsZXTYcVq8/u05Gdwe3MQ1JdYRp6rsOaXg4EKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299539; c=relaxed/simple;
	bh=zww7f4sFzsfUZ30J7VOgNS8sQF0fjHN+eCJz+LiNUos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtTA4X5Vxb4vJfSDuFLE4ITvnToYkVtIpP1KWNCAmGfPEJge2nknw1Zga7CI5+7jiWhQfNucYc5ah5a4hUeeBhN9maZrx5j6CDoT3LK7zOumcT7qCLiuLOBqnzgr8S2EeWX4Z7WEsg4yBuBBV9pRIrq1YtVPJ52WcQDgWSQnHSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWvVR8SZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PywZ7x4j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANlsp4180521
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlkzB21BQLyGO2BKUaCWrS3HNTUhTdWcAGomTPerZl8=; b=iWvVR8SZgE1JCi+S
	d5urdJGSckjzVsGa+aw8Blmn1E6YH5FBINGp4hdv84i+sz+DoFzOOpHQuh/mlNDb
	G8/bBTppdvA9XXwbxizS+fUpLqI0uFmFXctKjlu1BadytT3BIC906f7gcMBtxKQI
	IAg5KJb+22J0FdISa6lsz8eaYpitPL2eUHZJpoEqu5MUifphEqxDj360wsUWh6/2
	OVfVlgmbWTCaae//EC/sBF2tyEoOQEtWWR9MvBCNw792KSHI8wcoCRMB2Ib2LHbr
	9jxguqn8QNQ/vcwPlH26YOh7Xzj1wdZDD6KeFK2xoQlgJ2a9f7r4BbBKnaUPMDkQ
	Qb16cg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp8wjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:12:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so8508025ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782299536; x=1782904336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlkzB21BQLyGO2BKUaCWrS3HNTUhTdWcAGomTPerZl8=;
        b=PywZ7x4jrR9Hhflgpwg4dxrCSdEIrH8rfovxxz3FI001pgDT/aOikxzFFGfgpfSOCe
         bTHg811NBgEcYC+ZdfKJaxBJmKcLMpRtP/9Vv0bjKKrqKS9pX3kdA2F7a7l7yzsxV4r6
         tpVDzWwSlQZHcTw+bOOcmQIcBQBVBC5Fk4CGGeYX85prSUY0XC6O5BB0U/LMy3GFevzC
         0fxS9k1y7kG9nziutye4i6A8njHbkeRJaPfIHHJdRkkJCHifH+Lib5LeIG792IsvTRGs
         Kh6qHH+0+fdZw8BTHzUyatBDufDu/ctklUMDSyTP2gVH2/3R0kxOmznBWFsYMek2SyJX
         6bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782299536; x=1782904336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlkzB21BQLyGO2BKUaCWrS3HNTUhTdWcAGomTPerZl8=;
        b=dOyR/dyCe6+7HGEHcxYizlCiILbzNMjBTwPYbRH/0xpgZPEjVjAycF063G+NoekA3L
         MRLyP9urA3v084J1SPE9j0aIu4Fm73B+1gmisSN3ZDWvLXPRjicP+52dB4Hd4WTtO71D
         BeYu15lrbDXZy8Qz40pRURU3RpWr6lpTkl8pxAyWqN4Q9Zuhbk1IKJJ5Cscu71PkfM39
         jMfbhRZ/JPTRoLoYWt4DiQABBGgVTqdiDF0v5otidoC08/CVSFRGjwq8eG6zIXygo5Yt
         3hX9OU60DMYzKW0JKGARwakgGGyggXn4OQXhkkfE89SexSQkLMoPe2nJ9FDq5QMTVsh4
         wryg==
X-Forwarded-Encrypted: i=1; AHgh+RrAr42yMXt7pLd0m+IMZ8jOpmnp2e3xQ7ZSagjjAn92HnMIN5ITeDTlpjNGOLHkQUVWv2mxXww8daQq050I@vger.kernel.org
X-Gm-Message-State: AOJu0YyRSw0Grjili2QUiv9OXnAdJzDzxJYpOp7dmDLzIP+5SQPHwoqT
	g0QPx2XPc/kUpqWjf+kFLpbDmGGC311OctUcsZ6W7YTa7nGErybZ8A4KpUHRLMJ+bOKt41My9jn
	SCh/05AM90dnum+vk0i1Q5aiCd+WbGQvYvVFMUPyLM7Qu1a1UwHpprNP2stdfM7IKvTba
X-Gm-Gg: AfdE7ckpOATFYxbDrtSmpfL6nItvE2PK+etGIIKHoetoXKL0bkB7v+u8e7wQgvC6rnE
	Tdmye8dWr9MqYJvk6nui+o+6i26UJPjVkqCZkClgxyI06Os+Rg/wSCrcDFYbYPUQ9lRyc/pcV/n
	ad4SADRWaQo8ho79RZfYtky558MNxXR+x55zaW1QBMwHk5TsYkvbryqJhsEeQkOj8/nxpBvyWDi
	AkMokfHErY1cbXoSwP5FYIYqcwj4doXu0HGQqxef6Myd1Ng5ypReMvkY/UhF+dzRx+1oPq2xtFg
	mAp2dMe/LdTue5T5VwlsV5r0mY4Bzmfg5EoKFVqZ0tybWd7sgc8XAUaw9Fp18szZ6AhRYxxrJyR
	6lhD+1PHKf4Bp+ya0yRxsNqh3XJPy61zJ78nmSyyE
X-Received: by 2002:a17:902:ebc3:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7c75c4046mr75507095ad.10.1782299536191;
        Wed, 24 Jun 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7c75c4046mr75506755ad.10.1782299535537;
        Wed, 24 Jun 2026 04:12:15 -0700 (PDT)
Received: from [10.217.219.124] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdc97sm160971055ad.65.2026.06.24.04.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:12:15 -0700 (PDT)
Message-ID: <9f0c465e-f9ef-4511-97dc-e3ccb0347151@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:42:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-3-782b3a0f2eef@oss.qualcomm.com>
 <q2bgzlv6o5sgdzg7jdazjd7yultfsxuyww637h5zppidd2k32c@3syfqgbx2r7n>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <q2bgzlv6o5sgdzg7jdazjd7yultfsxuyww637h5zppidd2k32c@3syfqgbx2r7n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qTZpX1JeNWAfDOpxEbLTisPgTtHu2fR_
X-Proofpoint-GUID: qTZpX1JeNWAfDOpxEbLTisPgTtHu2fR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5MyBTYWx0ZWRfX8QYows9Uhtnc
 aSumgtoyHxKWwf/MJ7mBnT9J4vZRMVUskZ+AWggTYVlJl0NEeklaJyqKR/dN4HXGJjyJ0DULrfs
 eYgyDwBADe1KUbPtY9sSQSVz9+ySQgOHNsIMgZp6tkueMsXF9YPtsxIR9hQgNienR/EUskpwA6V
 TCAQpcjCyglPGIUUq8VJhn1Hwm6CaURLOWTAPhKqLgd8MryAO8FtlsOm+sAMtTbUQ1H8hvM5KTv
 MlWVMLi85TUywBfG8EvJ6jmH6K18jfbyqTgHfVZEGwZBMqaY/4+eT/FTMwJpehq1H3j0dr/cP9l
 CL6InkMH/D6NlNHRmCSBqiearD9wYu9H7VMeam6MJX2wwgR55NFjNmzGRuOB4tIZSzJ5WfzkRKr
 NVVcMY3OAskIHOmonkNUnrq6jelxvUcSEWTXuZiofUr7vF/UUOx85S/FSb4LFk/EEebdimT2N2l
 LkgTjNb+w+GspQxuiZQ==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3bbb90 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DC1agn4tkaTvQTsFoT0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5MyBTYWx0ZWRfX1gxgNfvcbsPJ
 FQpdO20GOe7337dCfxAahuXY4BufgPOkjWqUaUgql8/NMlwUM6WalW0h7HuJGZVCq5v2pAeMVqU
 tE8lBc3C8QEFONhbvcHUmjTCFbYcv/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114325-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EA646BD8F8



On 6/23/2026 2:47 PM, Manivannan Sadhasivam wrote:
> On Mon, Jun 22, 2026 at 10:39:17AM +0530, Sumit Kumar wrote:
>> When an MHI endpoint device runs Linux, there is no firmware to implement
>> the LOOPBACK channel echo that real modem firmware provides. Without an
>> endpoint-side driver, the host loopback test has no software echo partner
>> and cannot exercise the full end-to-end MHI data path.
>>
>> Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
>> echoes received data back to the host. An ordered workqueue is used for
>> asynchronous processing to preserve packet ordering. Together with the
>> host-side loopback driver, this enables complete MHI data path validation
>> for Linux-based endpoint devices.
>>
>> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/ep/Kconfig            |   2 +
>>   drivers/bus/mhi/ep/Makefile           |   1 +
>>   drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
>>   drivers/bus/mhi/ep/clients/Makefile   |   2 +
>>   drivers/bus/mhi/ep/clients/loopback.c | 128 ++++++++++++++++++++++++++++++++++
>>   5 files changed, 149 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
>> index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
>> --- a/drivers/bus/mhi/ep/Kconfig
>> +++ b/drivers/bus/mhi/ep/Kconfig
>> @@ -8,3 +8,5 @@ config MHI_BUS_EP
>>   
>>   	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
>>   	  such as SDX55 modem connected to the host machine over PCIe.
>> +
>> +source "drivers/bus/mhi/ep/clients/Kconfig"
>> diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
>> index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
>> --- a/drivers/bus/mhi/ep/Makefile
>> +++ b/drivers/bus/mhi/ep/Makefile
>> @@ -1,2 +1,3 @@
>>   obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
>>   mhi_ep-y := main.o mmio.o ring.o sm.o
>> +obj-y += clients/
>> diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config MHI_BUS_EP_LOOPBACK
>> +	tristate "MHI Endpoint LOOPBACK client driver"
>> +	depends on MHI_BUS_EP
>> +	help
>> +	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
>> +	  channel as defined in the MHI specification. The LOOPBACK channel is
>> +	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
>> +	  where the endpoint firmware echoes back whatever the host sends.
>> +
>> +	  This driver receives data on the uplink channel and echoes it back on
>> +	  the downlink channel for testing the MHI endpoint data path.
>> +
>> +	  To compile this driver as a module, choose M here. The module
>> +	  will be called mhi_ep_loopback.
>> diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
>> +mhi_ep_loopback-y += loopback.o
>> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..05db91be6ffc5afe5a2022962410c96a7ec19962
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/loopback.c
>> @@ -0,0 +1,128 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/mhi_ep.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/string.h>
>> +
>> +struct mhi_ep_loopback {
>> +	struct workqueue_struct *loopback_wq;
> s/loopback_wq/wq
>
>> +	struct mhi_ep_device *mdev;
>> +};
>> +
>> +struct mhi_ep_loopback_work {
>> +	struct mhi_ep_device *mdev;
>> +	struct work_struct work;
>> +	void *buf;
>> +	size_t len;
>> +};
>> +
>> +static void mhi_ep_loopback_work_handler(struct work_struct *work)
>> +{
>> +	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
>> +								struct mhi_ep_loopback_work, work);
>> +	int ret;
>> +
>> +	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
>> +			       mhi_ep_lb_work->len);
>> +	if (ret) {
>> +		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
> 'Failed to queue buffer'
>
>> +		kfree(mhi_ep_lb_work->buf);
>> +	}
>> +
>> +	kfree(mhi_ep_lb_work);
>> +}
>> +
>> +static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
>> +					struct mhi_result *mhi_res)
>> +{
>> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
>> +	struct mhi_ep_loopback_work *mhi_ep_lb_work;
>> +	void *buf;
>> +
>> +	if (!mhi_ep_lb)
>> +		return;
> Hmm. This seems similar to patch 1 race condition. But we do not have a EP
> specific API to stop a channel and flush the wq like
> mhi_ep_unprepare_from_transfer(). But you should add one and call it from
> remove().
mhi_ep_driver_remove() already does this before calling mhi_drv->remove():
        mutex_lock(&mhi_chan->lock);
       mhi_chan->xfer_cb(mhi_dev, -ENOTCONN);
       mhi_chan->state = MHI_CH_STATE_DISABLED;
       mhi_chan->xfer_cb = NULL;
       mutex_unlock(&mhi_chan->lock);

So by the time mhi_ep_loopback_remove() is entered, both channels are
already stopped and xfer_cb is NULL. A mhi_ep_unprepare_from_transfer()
call from remove() would be redundant.

The race with mhi_ep_read_completion() is handled by setting
dev_set_drvdata(NULL) before destroy_workqueue(), combined with the NULL
guard in ul_callback.

Please correct me if i am missing something here.

-Sumit
>
>> +
>> +	if (!mhi_res->transaction_status) {
>> +		if (!mhi_res->bytes_xferd)
>> +			return;
>> +
>> +		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
>> +		if (!buf)
>> +			return;
> Error log?
>
>> +
>> +		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
>> +		if (!mhi_ep_lb_work) {
>> +			kfree(buf);
> Same here.
>
>> +			return;
>> +		}
>> +
>> +		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
>> +		mhi_ep_lb_work->mdev = mhi_dev;
>> +		mhi_ep_lb_work->buf = buf;
>> +		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
>> +
>> +		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
>> +	}
>> +}
>> +
>> +static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
>> +					struct mhi_result *mhi_res)
>> +{
>> +	kfree(mhi_res->buf_addr);
>> +}
>> +
>> +static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
>> +{
>> +	struct mhi_ep_loopback *mhi_ep_lb;
>> +
>> +	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
>> +	if (!mhi_ep_lb)
>> +		return -ENOMEM;
>> +
>> +	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
>> +	if (!mhi_ep_lb->loopback_wq) {
>> +		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
> nit: Remove fullstop at the end of error message.
>
>> +		return -ENOMEM;
>> +	}
>> +
>> +	mhi_ep_lb->mdev = mhi_dev;
>> +	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
>> +{
>> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	destroy_workqueue(mhi_ep_lb->loopback_wq);
>> +	dev_set_drvdata(&mhi_dev->dev, NULL);
> As mentioned above, this should be dropped if you can ensure that xfer_cb()
> won't be called.
>
> - Mani
>


