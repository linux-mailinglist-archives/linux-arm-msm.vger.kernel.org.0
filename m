Return-Path: <linux-arm-msm+bounces-98466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEX8IaWtumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:50:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC212BC561
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05C21306E843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866F423536B;
	Wed, 18 Mar 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Grnww/H1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IS6sWFSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A81E89C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841546; cv=none; b=dKPvkuKcS3d6t3brAML0FNNf1zAGFCpFX09RI/NM3itlY9Gwxs/HsJw+OyPTEL8ZpQOGf82vHxi3PUV5o+oCNDJFYWcfLvtxwdhOUJf3x4MscyJClIHgkUdU/56LF350X4N1r9yg0t3LvO71lWXoTdY66xj4iqG8zPbYo8HUWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841546; c=relaxed/simple;
	bh=vDiybhOcbrJQzKU5gu+cbX+B/B1E/76NbJBI75jIVnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9KnetR2TZM08aVob7/5DiERk0JveOhqWXIJ+bSTryHU1m8IHXyP44Kg8cfwu2UdydNRdNA4JRyDn1/drBkbqsCfnzNqJVB1/MQ8jAhxS48+QZKsopxpY+G0siLBj2pthB0wyZhG/WjSrO31VqBeDP3UP3XxhDjOShfMdyyv4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Grnww/H1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IS6sWFSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8JP1I2789430
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=; b=Grnww/H1VtULtmxg
	iVerOEpO9Nd7mgpJBoM8enQ0tYbZj35J/cusj5heEXUHi0TZOEwWajUk7Up4fx2p
	NdXKFs2aJRd10gk8hiOv0zSO7FVSXZDaRCKmcHMTRojU5juLpgO6ZtKkyqQwMsb/
	DN5YvaEv3/qt9wG7ixd7r2CRQrRpmNOh/SioxrMmgLDSCLvRdBh+zdM3pQj2J8N8
	ED6ldAuLFMGiWb7TccOtUPK6JEjLAoydOOAaOHGC8A1M37Skr737ELTJ/vvhbVCy
	9msBV0Cjh/xo2VFN6tx/H1P+IaoQOpXnj2mm9j+dLk2hGSX1sgSDCs8s36P+fTon
	DgQ7Vg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2rnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:45:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so49864468a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841543; x=1774446343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=;
        b=IS6sWFSy52jx/vdPchubpR4pzSE+/9hfbW1TwMhclgYy1vQTcSfx2uaVE4D6rMY9pj
         hscyjZZ6vTWMNBciyAtOKLta5fWl3JU7V6oiUXNdEAZAlnaipCZnnX4Cck3Tdh3kovt5
         Pz6czINIn701QS1vRU9+csE9XAlmCHadwOoT1N9Xv0aySIHH/M/qFCsnUEu1KY2sPlzs
         WZ+lVSqt9dYpxkuY+pCEAJRlzHJIctvuv7tdnD2xr3kQ78/j2dif2500/RXl4BrTqhAo
         Ls3n2oviRtNBIGldkC47LJS0l/Pbdn7yk9ivo0/5wrZh3Y0YAj2S8lMaAPeyAJru95DO
         UfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841543; x=1774446343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=;
        b=XtMuyfyfjcQg/QJmMAbaAKVKKWMoNlbfX2cFZohZ+lIkE8UgRxtot2b5Szb3VCt763
         2wyhcpFYJ+5nS1BohgssDwrLaBVsQPkft1FSCzuv9C1X2o0Wz4nd7dpOgVn6xrnlJ2Je
         gBPfl4R8KlQJsaRT/lz0mWGVYLnYeOJMHBYm0ZNVYXzsUdPWn5jI+mNOFdGeC1XUcjAS
         Ber6zi4Kvd+Pio6x6/iqJFtEEAXtn6nmvUErS4Fj/KG83TX7oxuRFD7yrGMMI/mwG6jm
         Wmz2f4BCYp80L+PTlu0SKyh7fjHaV7QSL40rhtb5nSU/MmRhtwt7/FgH2LFLTHR/RTQk
         oKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGgJ6QRITXtbVgGESjFBFHq+/k5tr8S9Jjlki3a+5vfuvsRwNHXb37o8jW+YHq1x0ktjOjGkgc5Vk/NXti@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQ506qyAVOokiikZdMXvUdrunFREk2shPFKmfKMoF3+eKMMlM
	srgrPO/HBOEpyU3O1KrZ9GQJovEwXkozWObU0o4ZF7ZLndnaM6dUcM9UdwEfZYI+qJi6W5QPJV7
	5Shcsffd0EUeKr1CgZ2v+9uLkNUy1I5Q6gpR8/7W/PnOeZzpsbu4dWdl66xjIRYqRT1tG
X-Gm-Gg: ATEYQzwy9QIS2vNAXZg+rOgHIebURV/dRO2u+zzdhrLsAQaN/b2OjnM91FHzqlaocPb
	Aua95WXdatzjp6gPDSNz0JuTTm6Rb9R3e6FZcx+oN1veut7ie1Qn8A79WlObHhnv223SoHDl5Le
	J7PjinrZpaOqjuC9bsQgWKeUwthhQvwr4iaSL3uxpI3hpTpyQlkccsnMiXcrW2ojxO+AOa8+2xh
	93V7mFvC/Ot4mV/oyAijZfFxqoRU1nyO9D8jiMf1KZCMuCHoZ9TJG2q0R8NPiSzeGHvhkB+6s4z
	I9i/XqqtB+1vkZ0rsdKjD6+uFwHRX/Fjn/qWixF+s+/CUsEwBSZNFwihlUGFs/PDuLcbyzXUM6z
	RJRaydK1v8hUWQRQFvoOhcxNFzuqCdyrizS+0mx433hV2eff+Vb8/K0l7zz8EYfutQXUzp/xFNr
	eY77Klceq/VYY=
X-Received: by 2002:a17:90b:2791:b0:359:8c9a:fde9 with SMTP id 98e67ed59e1d1-35bb9e7d3eamr3682387a91.11.1773841543069;
        Wed, 18 Mar 2026 06:45:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2791:b0:359:8c9a:fde9 with SMTP id 98e67ed59e1d1-35bb9e7d3eamr3682329a91.11.1773841542094;
        Wed, 18 Mar 2026 06:45:42 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcb8b9sm8649822a91.13.2026.03.18.06.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:45:41 -0700 (PDT)
Message-ID: <929d0ce6-e414-4d6c-b5e5-7a38e480acbd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:45:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69baac88 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wg8t7fkb2t0BE43u6skA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: O187tvh17sfyxsZWsrcr0nZky6KVmSI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX0EFePfbUoGS+
 P9wbBbSj+GhwRoX/Pj6OQkDLhs3dT/H1mPyZ7b5+x72WoHnuY0Pu3zJ7NtnoBJvOYaHHeMmDEJM
 KrCftjA/HAyyHi/6tIVqxWeoa87iNrZcS7EIQENPI+Ll8CzzrNjtjlTHtFfCs52HG8BfclNfZrR
 lZp2Oo3CQFLHCMowPupS9WyNkqNiuLcBzOHepY8rkBoQqzKiI27p1oLWTEAALkl3590MtmVKiBI
 1Lg45oJZV9tNuM4yjc0wNLaFURMcbHB9ZgGKNju4K1OPopZAaMRqpX1ZRnZENXhM+KHfHlwCPyG
 ZPzUT2SkNEsrbAEabUXMzESuDWmtRF57hU2fJ40Z1sby3zHr816xgajs2SlvarPG5xKGLBS/nS7
 wWK0abb0sjnSr/o+Ju0EWVFcClKgPTTNSMH2dM7/pwe3ebAx4epkvToSzPaBn8OENitsnxuSX4Z
 trgBA0bX+gLez25DjZA==
X-Proofpoint-GUID: O187tvh17sfyxsZWsrcr0nZky6KVmSI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98466-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBC212BC561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
>   drivers/hwtracing/qcom/tgu.h                  |  27 +++
>   3 files changed, 170 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index a1dfcd366d92..18930743c99f 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 14d6ad410d89..85fe1140eab5 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -18,8 +18,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   				    int step_index, int operation_index,
>   				    int reg_index)
>   {
> -	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
> -		step_index * (drvdata->num_reg) + reg_index;
> +	switch (operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return operation_index * (drvdata->num_step) *
> +			(drvdata->num_reg) +
> +			step_index * (drvdata->num_reg) + reg_index;
> +	case TGU_CONDITION_DECODE:
> +		return step_index * (drvdata->num_condition_decode) +
> +			reg_index;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
> +				int ops, int reg)
> +{
> +	int result = calculate_array_location(drvdata, step, ops, reg);
> +
> +	if (result == -EINVAL)
> +		dev_err(drvdata->dev, "check arrary location - Fail\n");
> +
> +	return result;
>   }
>   
>   static ssize_t tgu_dataset_show(struct device *dev,
> @@ -30,12 +55,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   			container_of(attr, struct tgu_attribute, attr);
>   	int index;
>   
> -	index = calculate_array_location(drvdata, tgu_attr->step_index,
> -					 tgu_attr->operation_index,
> -					 tgu_attr->reg_num);
> -
> -	return sysfs_emit(buf, "0x%x\n",
> -			  drvdata->value_table->priority[index]);
> +	index = check_array_location(drvdata, tgu_attr->step_index,
> +			tgu_attr->operation_index, tgu_attr->reg_num);
> +
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->priority[index]);
> +	case TGU_CONDITION_DECODE:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_decode[index]);
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
>   }
>   
>   static ssize_t tgu_dataset_store(struct device *dev,
> @@ -54,13 +93,31 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		return ret;
>   
>   	guard(spinlock)(&tgu_drvdata->lock);
> -	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
>   					 tgu_attr->operation_index,
>   					 tgu_attr->reg_num);
>   
> -	tgu_drvdata->value_table->priority[index] = val;
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		tgu_drvdata->value_table->priority[index] = val;
> +		ret = size;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		tgu_drvdata->value_table->condition_decode[index] = val;
> +		ret = size;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
>   
> -	return size;
> +	return ret;
>   }
>   
>   static umode_t tgu_node_visible(struct kobject *kobject,
> @@ -77,13 +134,26 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   	if (tgu_attr->step_index >= drvdata->num_step)
>   		return SYSFS_GROUP_INVISIBLE;
>   
> -	if (tgu_attr->reg_num >= drvdata->num_reg)
> -		return 0;
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		if (tgu_attr->reg_num < drvdata->num_reg)
> +			return attr->mode;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		if (tgu_attr->reg_num < drvdata->num_condition_decode)
> +			return attr->mode;
> +		break;
> +	default:
> +		break;
> +	}
>   
> -	return attr->mode;
> +	return 0;
>   }
>   
> -static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
>   	int i, j, k, index;
>   
> @@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   	for (i = 0; i < drvdata->num_step; i++) {
>   		for (j = 0; j < MAX_PRIORITY; j++) {
>   			for (k = 0; k < drvdata->num_reg; k++) {
> -				index = calculate_array_location(
> +				index = check_array_location(
>   							drvdata, i, j, k);
> +				if (index == -EINVAL)
> +					goto exit;
>   
>   				writel(drvdata->value_table->priority[index],
>   					drvdata->base +
> @@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   			}
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_DECODE, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_decode[index],
> +				drvdata->base + CONDITION_DECODE_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
> +exit:
>   	TGU_LOCK(drvdata->base);
> +	return index >= 0 ? 0 : -EINVAL;
>   }
>   
>   static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> @@ -131,18 +217,28 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
>   	drvdata->num_step = TGU_DEVID_STEPS(devid);
>   }
>   
> +static void tgu_set_conditions(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>   
>   	guard(spinlock)(&drvdata->lock);
>   	if (drvdata->enabled)
>   		return -EBUSY;
>   
> -	tgu_write_all_hw_regs(drvdata);
> -	drvdata->enabled = true;
> +	ret = tgu_write_all_hw_regs(drvdata);
> +	if (!ret)
> +		drvdata->enabled = true;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void tgu_do_disable(struct tgu_drvdata *drvdata)
> @@ -252,6 +348,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -259,8 +363,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority;
> -	size_t priority_size;
> +	unsigned int *priority, *condition;
> +	size_t priority_size, condition_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -278,6 +382,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -300,6 +405,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->priority = priority;
>   
> +	condition_size = drvdata->num_condition_decode * drvdata->num_step;
> +
> +	condition = devm_kcalloc(dev, condition_size,
> +				sizeof(*(drvdata->value_table->condition_decode)),
> +				GFP_KERNEL);
> +	if (!condition)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_decode = condition;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index df570c89ffd7..987ea07bd618 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -16,6 +16,8 @@
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
>   #define TGU_DEVID_STEPS(devid_val) \
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +#define TGU_DEVID_CONDITIONS(devid_val) \
> +	((int)FIELD_GET(GENMASK(2, 0), devid_val))
>   #define TGU_BITS_PER_SIGNAL 4
>   #define LENGTH_REGISTER 32
>   
> @@ -49,6 +51,7 @@
>    */
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
> +#define CONDITION_DECODE_OFFSET 0x0050
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -57,6 +60,9 @@
>   	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>   	 REG_OFFSET * reg + STEP_OFFSET * step)
>   
> +#define CONDITION_DECODE_STEP(step, decode) \
> +	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -68,6 +74,8 @@
>   #define STEP_PRIORITY(step_index, reg_num, priority)                     \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>   			reg_num)
> +#define STEP_DECODE(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -91,6 +99,14 @@
>   	 NULL                   \
>   	}
>   
> +#define STEP_DECODE_LIST(n) \
> +	{STEP_DECODE(n, 0), \
> +	 STEP_DECODE(n, 1), \
> +	 STEP_DECODE(n, 2), \
> +	 STEP_DECODE(n, 3), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -98,11 +114,19 @@
>   		.name = "step" #step "_priority" #priority \
>   	})
>   
> +#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_decode" \
> +	})
> +
>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
> +	TGU_CONDITION_DECODE,
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -117,6 +141,7 @@ struct tgu_attribute {
>   
>   struct value_table {
>   	unsigned int *priority;
> +	unsigned int *condition_decode;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -146,6 +171,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @value_table: Store given value based on relevant parameters
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
> + * @num_condition_decode: Maximum number of condition_decode
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -160,6 +186,7 @@ struct tgu_drvdata {
>   	struct value_table *value_table;
>   	int num_reg;
>   	int num_step;
> +	int num_condition_decode;
>   };
>   
>   #endif


