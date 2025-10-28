Return-Path: <linux-arm-msm+bounces-79081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A904C1290D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 02:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10314E532E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 01:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9E7242935;
	Tue, 28 Oct 2025 01:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgYyQ3em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4380155333
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761615475; cv=none; b=K9qS8Fo/qzmCQNKtw8e2NxuByTPt9kPuVRa87A9yd1nMleoq8TBDmH3z3dgMh3lghU53ek1fIxt11Y+jm/MygKQSD2Mk3IzjZWGhdz8anuBjDs8LYmHAIYiRRkU9fw7Lz1urXchmoHznHV5izWZmoZtZbI6KLmVHgJruITMfTSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761615475; c=relaxed/simple;
	bh=MNLfgHpaAp0OMGTgkqm1aB7JHtYhmZpXjyWsKKd0Jb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbFHxsgOWa+XZQpAsQyKMQRw5+w9GWXNKIUTD8E0k/hQSp1sZTIyLg3eSK9ZIJ2O5BYB3lFrbixh3OisuOXRGO1SE+MR/Jv67ta/pBvZqL3eq5Iy5BOey1Ba4bupmgcyAWdSz8wJl6fNTf0irAz0YfAm2kPgkEBYA8wcfFpvrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgYyQ3em; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RFn7DT2232655
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 01:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kkcYFdv239XurAuQWK16RSzXc9uSR2TrVqUONTo1E+Y=; b=ZgYyQ3emINn21srt
	ThBSNBeMcclusKHpHoexPMb3eoPXaSZhxRDEqDWcYnf3DhUIq1rXjsMJ9suNWOMH
	0PHqcjpBIhqiW/l6Ro3hNncHRri08RPdUiDaUZwnS7V2LC67DrTK5hEfnc9s8/CI
	bmqniLxvHFLPgYz1cJOVYEjs7tPvQJ4YO431QUhBXI/B1UaYq91nVqIj/LkEgpiN
	Ay28MRp3ANH0W8okaEWT5LKKmQ6uSikf0A8FHmLpqeSWuIHg5A43UjZoxjWhotXL
	oj062JncBf3u/kRrTV5tQvZ8WwSKjA/Cw3KmKwZ5aTPVMRw2eFj30nmZARRJe5zD
	fLIOTw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wnavw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 01:37:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-79e43c51e6fso3216605b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761615471; x=1762220271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkcYFdv239XurAuQWK16RSzXc9uSR2TrVqUONTo1E+Y=;
        b=cjNxYzwg4tTmKkrwwA0KwLlTIub/w4xiDla8U1i6dqRPuz1rtx3tCKHd6FlCbcn3SW
         py8ZbrXX8I2w+oD2DKEgXIQlhf+vRwS7mpmEzIgF5CBkOr5MqzHGfby56GXV6jRSdUnT
         glQmahKQeLBiTh3p4rWAkVrXyPXI16SrcJWVDUIGR333SFPquL2O0QsLRNLSIJ4gTROc
         rc/RaQvEkXxno2FvWQd53Yxc/mAsXkzMm03lKszOBezkKhCk2sGdwwhNMUd6uR7D2GjM
         OhkULIaGlO55CbEf+3bLG6r6gxnQTIS43yZD4hYLWTr3E8XsRT0NoYNKdcTNQqtGs63x
         Iyug==
X-Forwarded-Encrypted: i=1; AJvYcCXyEIpfHj1Fis+d1/SpP3zzz2BN++IqjBK/7gtQ/HTpzbioxKoekyZg19SrH2E6TpTlQdDo0cCtNCCd3Xsp@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpI49Jkv0UE7GRwOXytpaTqcGOrLe4KyAmsR8vdx3wDntILAN
	CiATSNJbHBkLuSHYVLmz0DvZtgg38L/WjbA/Q3+Lr5EYq9NBXiXSkQJC0UvcT+nX4Idwzf8mMlD
	ULIDzPJNuMEjyPley8bPPfkVuCLLOcal6km5+k0tDGErkukRZwGLxtbZgq2ADsNlGnlfZ
X-Gm-Gg: ASbGncvulZpg7GN9hOLupCBLqXTDn0eSWNC/r9Xdj2ApCuxm0l0fdesIH51vL9uIRRd
	Fz2xAThsIZpZ+jl9LbS+GnmH5qFe5EP0iGx/e8Ut81FMCbD1x/2ZhQWAnkJaLVCDszcMbT2fzmi
	wk9U3tF5FyewKbW/lqa/sqJIyd0ljZ9qCxoJtSptDrs1CyRD/BL4sip4SFahSaZqfr8jy+RqYeS
	QEqwj8grncTiVlpuHYx/bCQY4bJmWlf3odYTkwZkAPzCmLQ1o0lYnURkAm/y5IaXuzIcYnb39o9
	8h5L44ddq38dcd1Nqy618KgcMKQE+VZtIjUB88mfPffaoomuFk/SY6rJuuH7a4sTvEBikZRw/hd
	fM1ood0AudvUzJdzw7kq3dW93ArPN9IFvKVoQZg0v18pWvIxGpmYo
X-Received: by 2002:a05:6a00:1ad4:b0:7a2:7c48:e34a with SMTP id d2e1a72fcca58-7a442ea3e89mr1495026b3a.13.1761615471563;
        Mon, 27 Oct 2025 18:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwXWqh7EbCSdKjDTIqMe6IMuQKXRMeAHV3HeqrZw04+sbIralUpoGvEob8jqGjOgpdwAFzGw==
X-Received: by 2002:a05:6a00:1ad4:b0:7a2:7c48:e34a with SMTP id d2e1a72fcca58-7a442ea3e89mr1495000b3a.13.1761615471088;
        Mon, 27 Oct 2025 18:37:51 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408c4dfsm9638069b3a.65.2025.10.27.18.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 18:37:50 -0700 (PDT)
Message-ID: <42c0477b-87de-4b7d-930c-67ce6c9e4557@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 09:37:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
 <d71e09ff-c063-46d9-8d02-f69c18b6efe5@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d71e09ff-c063-46d9-8d02-f69c18b6efe5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=69001e70 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=otdSkCFsg5a9Z_Vg604A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -tf7Dqc10XfIUHmq5eSQEWKId65QC2hZ
X-Proofpoint-ORIG-GUID: -tf7Dqc10XfIUHmq5eSQEWKId65QC2hZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxMiBTYWx0ZWRfXygAyPZwcyRFC
 dnGTs5R5it7RoODvWGhsuOUiuXaS5wMnXhLNRE5Y58j1SUGhRWkXWUTzs5Y2vqGo8fvmwba9jrl
 keSe3I/NopF4dnDIsW9FLjkPVu4nlWchkrIKNin8s/q2ZPXFo//qOv2+Jnfbv/LZ3iLvKB+Kkju
 /gHDljI6dnPIBa4jhuN8c3bMq71abEupi23a+vZzaW46zNNO1+lHDSzPGLfBcmECoi3DatnzEq+
 MMrcnl6xN3ydjkSZrk4fwl1tu7ZN7zfI8P86Nfcz50+U7ug5kYaa3F08WdQgWSGMRHIolTaCkZY
 6Cx5g9hSru853wDxbig+S5+HgAkaUW0/pRoMSq9J2NWcvk7uVRE1XbeoIH/CWPhz4s7l76nNFzg
 LjbZOY2OHNUyo+iCqwNw1SQ5fu6W3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280012



On 10/27/2025 5:29 PM, Suzuki K Poulose wrote:
> On 27/10/2025 01:14, Jie Gan wrote:
>>
>>
>> On 8/27/2025 6:55 PM, Jie Gan wrote:
>>> Patchset 1 introduces configuration of the cross-trigger registers with
>>> appropriate values to enable proper generation of cross-trigger packets.
>>>
>>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>>> which determines the frequency of ASYNC packet generation. These packets
>>> assist userspace tools in accurately identifying each valid packet.
>>>
>>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>>> specific port, forcing the data to synchronize and be transmitted to the
>>> sink device.
>>>
>>
>> Gentle reminder.
> 
> Please could you fix the dates and version to v6.19 ?

Sure, will send a new version with fix.

Thanks,
Jie

> 
> Suzuki
> 
>>
>> Thanks,
>> Jie
>>
>>> Changes in V3:
>>> 1. Optimizing codes according to James's comment.
>>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Changes in V2:
>>> 1. Refactoring the code based on James's comment for optimization.
>>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Tao Zhang (3):
>>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>>    coresight: tpda: add sysfs node to flush specific port
>>>
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>>> devices-tpda
>>>
>>
> 


