Return-Path: <linux-arm-msm+bounces-115820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qSQlN4z0RWpeHAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:18:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0BF6F38B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QBVz8fwm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V4WYYUfs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115820-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115820-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5322430062FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 05:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBD73033F8;
	Thu,  2 Jul 2026 05:18:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A61E1E12
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 05:17:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782969480; cv=none; b=UWH8l9274ftqCE57FzH/vBieTJ3Oq+NhRHngA8pLWXj5zSKNo5ovBSIiZbEl28ZClTV7CLt+ZNNoyx2QVuGbMAbN2hx2TFPstTpRtLZK7jSxxnUuFsYeT4Sii9pw4jJXN5VASAG5X5JRPDt3Bse26AhXitCfKOAJF78NGPerSDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782969480; c=relaxed/simple;
	bh=aOV7vNLiOQl+y8pKtkSiCVlAZpq/i22s7ATCcxe+bJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLVs6I76/KL3E3mM00evNQ3QnjhYlck/BMJ5d6FPU/LR7heH0Xgyc6jstsLts3zh3XSDcjPvfQuUt2GTLbV8sXgdC7SA/zte/f8msqHD5vzL2qD9AZhKeNEwLzsIa3f1BC6XsMO+U8xeIHzSSbItisQEFLMnC44A3FDJ0vD3vaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBVz8fwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4WYYUfs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624lXRW3485589
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 05:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FV0GRhPc4SDDznw5kUjzG36gym1AYGG0YdToHuTpp/Q=; b=QBVz8fwmADLqqJQp
	MOtDD5KbzDFYBK9ylJlksTgS1GVaPQkqtxKXnRsF0HBYhhFUODtM5yZFeu8s/MSY
	P19hYONRshLBcw9Lxg7Vbu191GDxJH2cJHdJ38dGHzo3SHQtIVmnGdfewnR9+jwR
	sr8lblmDNGEYf7HfZlMKeAkHKDsy7Zad4IpdidAePF4GXLDd8SS/CymanquzjI/F
	xjueXkdUZSwVH6ckOhVOCxx/7vkKZ4PIEo2QAV6s3Pk4Y/Yjq9SBRb7pIkWS9HZJ
	h65FDDJl0OS06I3pOY5JvmQQ0/GiN2sVVBzSK3qeFG/aMoTv76zeGrB/a5CKYEY8
	VanH8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98g2hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:17:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478947e047so1562199b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 22:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782969476; x=1783574276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FV0GRhPc4SDDznw5kUjzG36gym1AYGG0YdToHuTpp/Q=;
        b=V4WYYUfsT1T1uylPg5Cx7S+Lcl6pbr5PRcV18pqOe8Bmg57VZ6OUr5f04vFeLm44e1
         9KQptU8H08n1trkWCDCyYRPVPt6u+NgWhsqMhU46oPUeeo4RG+hoX0fXsAJLwOkwoBSk
         GqArLN/Vj8L5JeljhVzSc7EYZLBLXP8lJjQD8sus+9dpB9xsCnSOud9nnqHq2M7DuFbS
         PZLKHcuRMy1pTqlN4pBJaEeK5rhGiGXjwDlzONHgplbnZAV57KiR6644IWkW5VrpmE4e
         E2+kPSUaouyJZpXWgsilOohpTgyO22R2G5Bgmp+A5ank34Jysu+3KPHcagG+rkQtcanp
         dAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782969476; x=1783574276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV0GRhPc4SDDznw5kUjzG36gym1AYGG0YdToHuTpp/Q=;
        b=YiX6tb2xXeexD8+3yUvAxPk7dY+UKBclolT6x9LHK5J0dI77Ge0FH8YVGwRETYGFh0
         K80J3cWRmM7bqoPqUWPiSUFoAH+90y/gEgojV6GHPfXjvRolW+VdD8TO/rOVYNfSowPM
         VDdNpOzWOMAIeUn5SrKDE/oJss0zqSnvA1NuzXvU7M47zroVGd4AJ5JG3Trh2T4fqKFh
         p0f/eLBebwHMteHF26OhH4R3LobZ89NGxxj4JIQtEhjDfXnM2EyU/x360zqccN+DR6F6
         p5at2RiakW415lI4sbQ/5jZqp4dSXVdMNHQpUjzVdJto7Q924pqVHQmDSI3jXMrYl6KH
         pgfg==
X-Forwarded-Encrypted: i=1; AHgh+RpFTDTcHknR1VLvKagOxJrZfuHZD3Qu9/JeXivrawASRGjI/iLYTfmLEANy4svXM5Lhu/3JNLnBbVzA25S6@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbiB2dVKw6YDt5VD2ywEKtF1jV3Of0NN1eF1HZqgK63wtBZqN
	kYXUMbodKBY95nsGqk94zjDcUeZYXnw8xcU9oDAHWboMY85ExH17ExQBbskezsrygCxIc39k7kh
	3/ibjxhznx42cTkFfiaUy4BIN8r7fcfgTiy42H1Szasxtxeu10FAAqHjQ41jr95t/4Nvr
X-Gm-Gg: AfdE7cnq1ljpS5wXTNDjtJOR040WvHLIoh9d+WKB0fF1rQ/qzVqRSH53/e/0WGn2kR1
	SmLYs6bOn8OvwgtWbynSa74SIuOF0eAYDSVf1HndKtYlhqDlJQqLabftZtMuVpkrUUifgCHElOx
	eAB4YQ9/WGpEdmWwws81iymu5rfOdOr+ueog6iKVNfXQtPWTbrocoRBbmAou7XtTbieMrfxsaup
	eyS2ueqMy5UGuPXIjWJuC+H9Upq4FHPn9aYhE+hM2x4RoLhDEmICwIP1rdAhCxF9fB1xz+VoDnm
	4N5f/FwJqvL5cZqfHIqAnjNBYMSatePM2pWbRJgE/HdSgg9CSCMDMNm5FUanstkifmTywgtgsRE
	7qk3YXMiQt/HLyehdM8yamEjQ7dM/mhQ2LjraDDjUH+PJ
X-Received: by 2002:a05:6a00:10d3:b0:847:94ba:f432 with SMTP id d2e1a72fcca58-847c075cb87mr4559083b3a.12.1782969476492;
        Wed, 01 Jul 2026 22:17:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d3:b0:847:94ba:f432 with SMTP id d2e1a72fcca58-847c075cb87mr4559052b3a.12.1782969475972;
        Wed, 01 Jul 2026 22:17:55 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dba0asm758025b3a.7.2026.07.01.22.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 22:17:55 -0700 (PDT)
Message-ID: <3599f78b-12e7-4266-9418-461e689c5a41@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 10:47:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smsm: Increase SMSM_DEFAULT_NUM_HOSTS to 5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260611-qcom-smsm-default-num-hosts-v1-1-423b8a25945a@oss.qualcomm.com>
 <mr2staswedevbpbawd466ml2jhfzzjlubm3t54iv7d2jhlansx@on6dpsbkyltj>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <mr2staswedevbpbawd466ml2jhfzzjlubm3t54iv7d2jhlansx@on6dpsbkyltj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _i72zpIQuCtDt-vzwe1QtOuTMQX-0KDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA1MSBTYWx0ZWRfX89vkVasHc2MW
 eKl+/wKqfK6dTG9Mz37FA8dOGW0PxcfDPmd+e5P91o0N8y2ZZ42r0ea2igsNUYSKzcD19GR5eoo
 onDjMIKgg04nq3CEA98B2ew2no5Xp1uhAb1JvQxF1maQOb5iGasTU7B08oLCczcDcJyO4XH5pCH
 fFQdaSK7bwuA5d4ILPnUsrQGm5YcTbDKYQHf/uRikNCoyjHNE+WH3Q2Ow+htgNsT5G35yy361yg
 4+l1ofS3jrULGSRxHei0htlto4fXh0HaIQCITsWXCmq8SSB4T/tt1pdHegF7sFpGBUbPX0V7Auf
 lM/58/xv//LE5bF0kJosOeH8J6DpZguZI1AbgkFHIC1n0+ZStDXLokWjr9+Ng73icsFD0oZb2n8
 rWSade3FxuZud7/UZZJFriHay3Hdydn9N+qPJ83TDVNeGiK37VugkdhQtBO5oC8Gf/1DGWqlZe/
 fdRmYNPaLJ8O6xXLruw==
X-Proofpoint-GUID: _i72zpIQuCtDt-vzwe1QtOuTMQX-0KDW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA1MSBTYWx0ZWRfX4tAgyu0G5Urg
 0i+vXUbtGX07GBZAN+v9Xm4ZrfYtJ8zY5RdEMV91f6qs9t2L/r5/yzaltpz/WdR8R0ojnCvjSCG
 YaMibEMimv4S8j5FuUs+MYTJbAexvbI=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a45f485 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dhivIN8AC3q_NSABnnoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115820-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E0BF6F38B3


On 12-06-2026 01:04 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 11:26:34AM +0530, Vishnu Santhosh wrote:
>> SMEM_SMSM_SIZE_INFO (id 419) is not populated by the boot firmware on
>> Qualcomm Shikra SoC.
> Can we fix the firmware instead of hacking the driver?

Agreed. I checked with the firmware POCs, and confirmed they will populate

SMEM_SMSM_SIZE_INFO correctly at boot instead of leaving it to the driver's

compiled-in defaults for Shikra. I'm dropping this patch.

>
>> The SMSM driver falls back to
>> SMSM_DEFAULT_NUM_HOSTS when this segment is absent, which causes
>> SMEM_SMSM_CPU_INTR_MASK (id 333) to be allocated with the wrong size.
>>
>> SMEM_SMSM_CPU_INTR_MASK is sized as SMSM_DEFAULT_NUM_ENTRIES *
>> SMSM_DEFAULT_NUM_HOSTS * sizeof(u32). With SMSM_DEFAULT_NUM_ENTRIES
>> fixed at 8, the current SMSM_DEFAULT_NUM_HOSTS of 3 allocates 96
>> bytes. Qualcomm Shikra SoC modem firmware expects 160 bytes,
>> requiring SMSM_DEFAULT_NUM_HOSTS to be 5. The size mismatch causes
>> the modem to crash on boot with "smsm.c: Bad pointer from smem_alloc".
>>
>> Increase SMSM_DEFAULT_NUM_HOSTS to 5 to match the modem firmware
>> expectation and prevent the boot crash.
> What about the older platforms which might expect to have 3 hosts only?

With the firmware fix, that's no longer a concern as the existing driver 
defaults

stay untouched. Thank you for the review.

>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/smsm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
>> index 021e9d1f61dc5200514c5a239d52be97f7e82825..7d1823ab4198bbfa01cd1cf9c33999b32e2490a3 100644
>> --- a/drivers/soc/qcom/smsm.c
>> +++ b/drivers/soc/qcom/smsm.c
>> @@ -54,7 +54,7 @@
>>    * Default sizes, in case SMEM_SMSM_SIZE_INFO is not found.
>>    */
>>   #define SMSM_DEFAULT_NUM_ENTRIES	8
>> -#define SMSM_DEFAULT_NUM_HOSTS		3
>> +#define SMSM_DEFAULT_NUM_HOSTS		5
>>   
>>   struct smsm_entry;
>>   struct smsm_host;
>>
>> ---
>> base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
>> change-id: 20260527-qcom-smsm-default-num-hosts-c471f9c4311a
>>
>> Best regards,
>> -- 
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>

