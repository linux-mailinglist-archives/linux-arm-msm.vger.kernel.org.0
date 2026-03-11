Return-Path: <linux-arm-msm+bounces-96866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCIMDYr5sGkRpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:11:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F625C429
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D78F311D08A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01344327BFA;
	Wed, 11 Mar 2026 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoG6iY+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVPmSIQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C524886E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205811; cv=none; b=nc1c4qb28c6doh/U6AiJq124X7z0X2t4kvtWCrZnU1x5YrSXk+/T1zSW5zVs2jDr25HuXJQH0sm51PqH0rd9AypCBdis2JJRq/xsmtZbjc+mw56bt6kKVXhfs0tBvYvGiY+bweWp2lwOvADdjjH3+XpTLJO57RHppa4ixa8LO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205811; c=relaxed/simple;
	bh=td6gJ6eXpvP/Kx00f50jNWJIpNLaYr5gEHKsNbia0hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxlD7ZUfmgrefxdB3CmTseqD2TuHA70GKB3hfdWjdLMnT5RuZNuidF6CizCMImu92pCgtGbebjM1TgS2+ICU22jmY3nQ1Aa/hGo8thJVkzdNPQqKz5v7Fro4nGsDhxLPtqwaBIGG+x0a3lpnghQAJJ9Vang/ujHosamuqovRiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoG6iY+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVPmSIQK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3wLv3303868
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2vxDD57Naur3Mm4cBUoFi+QY13c6vSbwvJCxcHx9nA=; b=EoG6iY+s6kF3enB6
	VNo6aNw2J+u3bgdlrpea3Vy180/YApnT3vkb0ug7oCxrruveWn5SpfDgDzguEsTi
	/SQNCiMT9XyNYyGM0PgX2X4f0M4x/nE9EYqsNH+iFqlI0isrt4NMGm7cIHn3XGJI
	H9QL/LR/FVshPYqXa01yL6dzB56mGm1sjwjBf8yVekhypx2SzFd7SRH7OcwfMKB+
	IVPguu13peaEK7jzbXn0uhXI69PN9ml2l9H6EYY9loiqxIPHy6kHjR6lJDeRglBQ
	LF/vPGHQduEdCLpQWMHwj3kSEHg+txaeVxlFaA1LR1H68serBXbIY5mq5xiNAP63
	U9uRtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf3qax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:10:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso13566457a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205808; x=1773810608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2vxDD57Naur3Mm4cBUoFi+QY13c6vSbwvJCxcHx9nA=;
        b=bVPmSIQK/Dez31iW07y/iJoZoPNY/QsQt4/7aISFDaSmXteFs1i6VrCzDmhBzkjyDG
         B2/PcspiIQ/MQrhztmxsVV49JFfilBiY1UWzcATKAhbkAOeJk5zWkx6SaNp+RMD1L2fK
         mUr2+eK/UGL5EZBdVwL4AMMaCZzfsaFPIFbSx9i2DjAs0dkWwvfq5sBqntEj8zWiTBPn
         eJejucRPUwEy6TkJAWbP/xRCNp857G0HIrhbxTWtF6GP4+QFKa+eWTZKIn7QSv99OvG4
         kvYFmeUY4Z47ItY2BYpSRWApqNiHQqLft/RImlD3gpL3nfkJp59Dpk5TVZM/stScmILD
         cQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205808; x=1773810608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2vxDD57Naur3Mm4cBUoFi+QY13c6vSbwvJCxcHx9nA=;
        b=KOHnJ8i20W6A7uvOcrHAspetSVREwC2243l2uVUyWfHA6F53KcoGQiroNKJngDDNRP
         Nxg3uOucnIFu3mF5FTHVcmky7cML6NXPDsUoSkT45ArgduG/DLYXier/XavMgGd2azzo
         GR6ON5OXmNjIyRyXtPzmv8JZv/ciCfYZNC75AnFf/7izP97USFcXyWT3dKZYWT+GeOae
         vvnmoc1s2w4URX8SkMcfuIfzaYJMVw9Y2Ojc8WYRxUfd9y+Pdjegy8ig3+5UBPc2ZhW/
         aniyiSyXWbQKG0fb2X/ygsvhxnCE3asrHSGnInd4ggLadw1ZTluD5QT5zmM89U7s1XDH
         6bpw==
X-Forwarded-Encrypted: i=1; AJvYcCVnLMAAFNJyv2eBMoVaBpjLlVnHoi0EtbfLNnKdma4FgbKpUZv/i/XO3CzPrPi1gW+GXYsqi9/Tj/oBmMdv@vger.kernel.org
X-Gm-Message-State: AOJu0YyWt298VxNAuIEZPU27yvvhts0aG0a5lpEHK7AgDjDKxSOSAyPM
	RAUB18708rGvFb7WlAWnEKTuktQngmSiJesIcepMjISM+4PFlEKM+WwMSmx3PwXEbF28qj7tUXg
	mjq6IVximkgvrs7dfcadG/OMSc2SARrgbrJBJYuqS+4DeNXX6cT0h5uiJVLIFMp5FAIh4
X-Gm-Gg: ATEYQzzGRJagDHslF/NdLFIUSv6SzqoQOF1lA+Eq+oleaPtXnvjCpemSxzCh96QX90Q
	Tp/WItCkvkffECj8J61AUsGfOi+4WYx1BMiFz57Oy6Q99ft26Oa1KR+1azkkkucPQP1YRtEpjxC
	cSB3caJmKrGwmAyBw1v0EaXVl9X+uwwuV4nmXXi7s0CNcl4hliSAPMr8wsAyRgiu6err0AZ5ntM
	FixgcTE2GENJrvqFzyamqrq5oWwNseNq67M9rLO5+7SPulN0ZLFCc8vAP4D7+6cJ0axAY3nhkl3
	scXWqnScalbmF/P3RuuQy5UBKkAkQ0c52J00/26LcQHi7tBYosCUjBod3vVvGuna6qdPvoipT7I
	EZMwtB4RtfD1akq1r1Ijx+5FKHybh5KVQf8hrunzGgHkSyMvTYlnxgQ==
X-Received: by 2002:a17:903:41c3:b0:2ae:7f3a:b213 with SMTP id d9443c01a7336-2aeae8ad04bmr13377195ad.47.1773205808346;
        Tue, 10 Mar 2026 22:10:08 -0700 (PDT)
X-Received: by 2002:a17:903:41c3:b0:2ae:7f3a:b213 with SMTP id d9443c01a7336-2aeae8ad04bmr13376965ad.47.1773205807850;
        Tue, 10 Mar 2026 22:10:07 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22287dsm9501685ad.12.2026.03.10.22.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 22:10:07 -0700 (PDT)
Message-ID: <23d6a9d2-7102-78d2-053d-037227edcd69@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:39:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
 <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
 <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ECgNUr1ikDzCN-Nj7XwRHTVMVms8Da35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfXw8eAmtUx65DL
 XTlw5jsBd9sbfGxgNgCogoOd+2H/jvcWQDqdFHo+PAdBOWdL8V07V0fuiQ0WesKFHXFqq8PbqtS
 O7r9Ps1r7jH1Luai7z1169vAXp1weHRzRmLs0Uui7VEuQxz+GTGCs/RBV8dmWNgSPrJGoj2ijO8
 scPREQvLPm38X0aGQvL9wkqZ5kiIDz6wvOZZicdGsKDcwOqwMFjPZ/XxpYIumOUNs5RzeJo0Pk7
 g8+auTO8sNHjJNZ3lXkh68rHGkahvaZlsWHi3viA+fTZV1i8GPl6a1mTUhD7lRX/wuYvxoJR3Is
 HniLWKxjPvj30fIainGg9oM4aVvjTZkgfRnYTLEIRalNMnguoIpMrUi0i4bOb8yu+bNtLpZyoa7
 S9SgGiiyzO5VXqOROK27tetxwk3DO7Nnsdd2b/JLEPt9ft6vhTa64AA1rj7MS9kVds6eG7S/0+D
 cdUe1iJToA1yD+/Jecw==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0f931 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=eRBfbRx1O6b1X7uP3MjCRw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=720-SxrjJScskddFLLkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ECgNUr1ikDzCN-Nj7XwRHTVMVms8Da35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110041
X-Rspamd-Queue-Id: D16F625C429
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96866-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/11/2026 5:53 AM, Dmitry Baryshkov wrote:
> On Fri, Mar 06, 2026 at 04:28:48PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index a936ab2aedaf..be3449861993 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
>>>  	IRIS_APV_HW_POWER_DOMAIN,
>>>  };
>>>  
>>> -struct iris_platform_data {
>>> +struct iris_firmware_data {
>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>> +
>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>
>> Makes sense to split firmware-related data out of iris_platform_data into a
>> dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
>> should be in iris_platform_data since it describes the VPU’s buffer
>> requirements independent of whether the SoC runs gen1/gen2 HFI firmware.
> 
> Not really... Your patchset to bringup Gen2 on Kodiak points out that
> this callback depends on the firmware: we currently use
> iris_vpu_buf_size() for Gen1, your patch have used iris_vpu33_buf_size()
> with an explicit comment that it requires a bigger buffer.

Agreed. However, that case is somewhat unique because the firmware code
changed significantly between the Gen1 and Gen2 releases. In general, the
buffer size is determined primarily by the VPU architecture, as well as by
the features being supported—especially when specific features require
updated buffer allocations.

Thanks,
Dikshita

> 
> 

