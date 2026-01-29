Return-Path: <linux-arm-msm+bounces-91144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIcjI+k2e2mGCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:31:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD97DAEB47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FFE301DAD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366FB340D93;
	Thu, 29 Jan 2026 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqzbJf3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZLYBKkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9B2749ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682426; cv=none; b=XXHkp5yvUMPKMX4mhrmjJKEoy+keHLfR7bX+MJ/ubi75lpWMxw2VTX58iTFKdpeejdvuHEfgDZ5B11xNEoEMDBqjbptNKzDbO89k/pcOMNR/JP6cC6riSa9Zm8pNpTMKeuwlZCJqlu49eQc4re+fw++OBYI08GgTztMkZjWn58o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682426; c=relaxed/simple;
	bh=Hui9zb1nk+fdGdOHzvVsAdvGu5LtC8YsvDonwPjXSq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYxntI6dmeNtSJicyYqNI1Bk6zWqEVGVE/B3Itlkku1n1qiw6himjota8brZjx3Y8ZGz4Hl16LCnmlKK1XApas+5rnFeWf9GTWgxd6MFOm1iQnJ04W5KFRNC1frENbZcdiviyPvgq1HUMTAVzgnJi8+d28DTQO3A8Exe9tHOk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqzbJf3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZLYBKkQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAPrEi3642705
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poJxw3O33HGhuN9ILVRF83I2m99nsoSK8pXDKw4sctc=; b=YqzbJf3XVsErNCF9
	VBNz/ct0U2LFzE4j2NVfNJi3vOZ6st1Jo3CMmFt8e6i/yGgrwGbQePinMlmLIcPV
	d31XwpI0A0b5ocpuQeExeqdzs+PC5ob4THW0ArXYLqh0b0X2uHZR51cAGzNaF8f8
	xVzcO4pCduevy3mViJARVHFmmiZ9wYs39HmlkP45vU6cC5CwW5d5YlXgBKJiuYGv
	NJBSv/9UM5Mq1jeECQQ1mKpEmolMgQg+5xtwwZPNfYKjX99kw7y/lhnyrVAWMed+
	saV+RfxGOqSmF3940xlfohnT//8p9jpxASW0DX+8ubI217QTXm+BVVBY+ur83OdU
	8v+24Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr004m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:27:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a07fa318fdso8097965ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769682422; x=1770287222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=poJxw3O33HGhuN9ILVRF83I2m99nsoSK8pXDKw4sctc=;
        b=QZLYBKkQmRv3UU2I06YJVzHRyIRBPO8kR432cRTqSKUHTMDr4+oqdeKzVPtXBURxtt
         kjhKUj9OvU0R4b44lEp7qoJOEcyP7yejZLMwbxyh4vMG91JC2UO9dh5WLWedA2ASjlXd
         /Mi1sgaZP7o/gBlaSfzHfVWQYkObYi7cxjL7/wdJc7giGZ0d8nDa5K2kBRh6kBAfygEd
         r00bukkDYj3cvSNP3EbfYJVKSJZqrnCsE9p8CDWnGhoy9PIutdL4GYUE5EfIqu66KFJq
         tr0E2UWuA6MQuf9jFuI2oPvAXDRHQLykByBV+MuYr45fC1YKFnfPPsdmJn6rJDrTE67m
         pvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682422; x=1770287222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poJxw3O33HGhuN9ILVRF83I2m99nsoSK8pXDKw4sctc=;
        b=V25pU/2c2VZ8b3+Z/88O6u8ZUlFCkAoKFUMfLrrcNY0oimNpKtqA4jlvGl/0B7g8YR
         BhCeoiOzfuMgRN0+ILYkGUgnD7dxl0+Y1wlZqbTswVI4OsVdDK1TH25SNVInsbrokALn
         PTDDHFjrFrgBfiFgbD7LiqNRq+uEJaqa3BjG7dRH/IenHxi/prxX50iBYMnGqwP2tL1u
         G1yzM43v/3QAJUt6365cF0ZFHb/W1a5SSWmMLVJMRRGV0M7QAHvz3fpC2toJEqzCsF7Y
         kVsG6jEe1s+Qxv8WrQytIuEg7QYv3aP0ElpfLI3UMmX1l2qgddS2xjrtHK7jSun+6luA
         QCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOWi6v9s1GN4MmL8XDLWJoCdIiBIVb6Bm85uGe84bPGHGmapBOanbyMs1DHljW78xX1UInWXhBldoMHifP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+l04bCoG6ORy4lsm4oHQBOawvALp0SXmf1k2SAHzKsePnX9Vo
	GQcMEVi2dcTF3o3LwSWbdfG8zmNHepzFRqq5G4p7QAiicOxuCmOMWmquCGvlFFYw8ILKK2vrN62
	7CE3ECK6C/nhS0bStVQMEhj/5oYPCsG9PgTq/lBzB2QEAQnZPz7fanC7KXq7Ccj/IKP+s
X-Gm-Gg: AZuq6aKs/TZCFiHSqR+STp5vgMFFGImhY9CqiSrMpNBi64k8eyALXW8ugN7ZtDSJ7Cm
	ckSDmt/5/pV5AVJy3B8qhiWv88kze63v9rXoVGb3AU1mNUO4uyVnakJisWySLx7MBbRrosnc0MQ
	6ShT9qWb7Fv1P/9sBgsnJMzfvaGA2sA4z3CHMwuyCkpB/rs6Hg05WV6I2Tjlg9XttWnGHclKPa4
	hfSVVIv256zE97uj6/fCe56dNSI/qda2Ez88SPYLIEnNetmWiiqF/bU3Z+4n2m4bHKcI86MIS7D
	5nCB+XInUTwxB058X4UChGC/faf3ckG/oS6wg+NeP5ChbhnayxBPeO+1Z7zc88KNLgVmVcCxRxk
	X5iIpb2TlX06n8Mcp8JmQHMfyGk4yPniXteAdOw==
X-Received: by 2002:a17:903:2a87:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a870dd93a8mr83226745ad.41.1769682421778;
        Thu, 29 Jan 2026 02:27:01 -0800 (PST)
X-Received: by 2002:a17:903:2a87:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a870dd93a8mr83226545ad.41.1769682421301;
        Thu, 29 Jan 2026 02:27:01 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b426ae4sm45721695ad.43.2026.01.29.02.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:27:00 -0800 (PST)
Message-ID: <37e2876f-6998-4e79-8696-c7f97307a28f@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:56:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
 <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OCBTYWx0ZWRfX51Yk2K6K60IX
 I2M36J+fFtJQ5KvVYIMFsIYcOqlPCQDIW8QTT7JTJOZB6UPw147qPmHEfuRxsVXkF5YK2pghTjH
 PSXjmihhFcPEErbIJO6UVviHtb/u9wrIGbqGBDk81zXPhiggV4Qtp0pIx+MDUVKTAV1W5kWx33A
 BtEKS7uldsDwqm1WsFYYQTzLmCyA3z0leMT6OhoZIS1B9xHn5cAvMECaqqupmENGKZJ0kIY7dqL
 b1CnN/8TzHP2jdQWC5Hs+1WvXzwxpo4PxWpl32x5KygwHVUc7ai2Wp9M3e7lW5+gE4d9VSZS09d
 OyWGY9iCvrg5Hvx/jOy4K3O8TeLy1zi9XzhBfLts0C9DAW3tf9809Nkp6CG5xse9JgCrImrfPBA
 IpJGCRjpp+yOgMJVOdihbUZyOxDJDbYMrbS0LSKRNyXvexnEtw2eDuoPYcrwQ2igphkC7fsFYBr
 P8Oi33VXBgeHihPkQcw==
X-Proofpoint-ORIG-GUID: x6ta4yziuWKngGNSXm5yfrlcJ4OJ9FL0
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697b35f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XpT7ApHK0yhPgYAQ0KkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: x6ta4yziuWKngGNSXm5yfrlcJ4OJ9FL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91144-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD97DAEB47
X-Rspamd-Action: no action



On 1/6/2026 8:23 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 11:58:30AM +0530, Ekansh Gupta wrote:
>> Current FastRPC context uses a 12-bit mask:
>>   [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)
> Is it Linux-only representation or is it also used by the DSP? Will it
> work with MSM8916?
Apologies for the delay in response, had to go back to check on older DSP software.

DSP will also use this but it handled properly across platforms. DSP get PD details from PD bits
and mask it to use further for async call checks. Other than async call check, the context ID is
majorly used for book-keeping on DSP side(no functional utility).

So, it should also work on MSM8916,
>
>> This works for normal calls but fails for DSP polling mode.
>> Polling mode expects a 16-bit layout:
>>   [15:8] = context ID (8 bits)
>>   [7:5]  = reserved
>>   [4]    = async mode bit
>>   [3:0]  = PD type (4 bits)
>>
>> If async bit (bit 4) is set, DSP disables polling. With current
>> mask, odd IDs can set this bit, causing DSP to skip poll updates.
>>
>> Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
>> byte and lower byte is left for DSP flags and PD type.
>>
>> Reserved bits remain unused. This change is compatible with
>> polling mode and does not break non-polling behavior.
>>
>> Bit layout:
>>   [15:8] = CCCCCCCC (context ID)
>>   [7:5]  = xxx (reserved)
>>   [4]    = A (async mode)
>>   [3:0]  = PPPP (PD type)
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>


