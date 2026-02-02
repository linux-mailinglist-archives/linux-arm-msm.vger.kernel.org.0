Return-Path: <linux-arm-msm+bounces-91403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LLeBEkQDgGkh1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 02:52:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8DC7CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 02:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65FEB3002E70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 01:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54681DA62E;
	Mon,  2 Feb 2026 01:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyAB+ulD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQOpT7zq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673946DCE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 01:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997121; cv=none; b=Hq7R/K9bALRutQIxyCH/pFy0VCrKYQIvUdjbhCXz8QxItDV+PimLYFmIV12WERz5j7n6IGGChT9ZQK5jNLV+YS0EujqIuF5+mCZCUntNJWLCdQzvv9+wO8Sw6KlDVwbxOzh8/yb2g7k2BcnydlamRh94/Xc6Mn/UF2HiBbfQKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997121; c=relaxed/simple;
	bh=OUeXk/oLC74yU3olSfNIan3hTNFljq6XKdlDFGyC/f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUVmH9hU7eMhPbGe0SjcvlYznc9ocHRsYuzqxqy+SpmnSd2LHjuVnjXjOq4bdR60eKbbMmYghorfSpStP9IEeuJ6fA57aPpqnNt6njcyvtEak5PXsTWQox1wuWVAyhTn+3MHO69iJRQFmcaycEgJuatQbrTBvstdisjeH83Y1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyAB+ulD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQOpT7zq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NK1Kp1191778
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 01:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awc6ByPTKsjUOKIrjmoPpQxBQbEo1ajihzngBYTJn4c=; b=pyAB+ulD58QArB9k
	iC+hwgHTEUGSD+3Pv31HBavDHegr/k1cTVsFstpiGmW3NQxh993ZGm0rRxus5RqE
	XkYF0cT3zwBkDH8b5eur7Pikh6K6Vn0ElhPDqfa3o2Dt1uVjxLMQYpRqIJ41tue/
	7XPIg3BU001C0XCTQBxtYq0IOdHnh7XRzjK0GDEDkLkZ9tlPT2z10kCbs4VoG5ia
	wx+8+ZhfOEUIiYtVJiG2eheLZXKXXg3teSI11dGeZpqyvMD3LFG4XPPd4Q6u9Laj
	P/idTfXK882n8v8ekFZk9rXWGDB/ueRcGf9W6R0WsAoykhuJRvbwhdb+LdqLw26P
	V+V2pA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4ujjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:51:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f47c0e60so108328945ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 17:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769997119; x=1770601919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awc6ByPTKsjUOKIrjmoPpQxBQbEo1ajihzngBYTJn4c=;
        b=VQOpT7zqa8Rr9y05qxkM0dRulOXHERHEBPHFYrko15x3222LkQl+gCIz3z6dp15elC
         sgEGzKo1VL4376Um09/0n1RYlmDMEwnFbZ9+bLL2E/9TIsJCysjQyeUT8nUTQvuEXA6h
         JIWzd/CsZqEriwytJwp1Hd9gn0KDex4iOi4AimxEdlT1EER9v9v5e/l4YZGxQu3UvO3l
         nNvvXwDDlNq/HioL/vLuiMVwJrvr3bIuqiiBFJuzUWDsWiohj5kNkMtc21JcHRnJMqOh
         wBNHb8JeaeEFzkL4q0VxvhFbZugJxYB7R2JI0pHuLzIwr44B4Tkn4tCz/8U8+Ob+djpy
         qt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769997119; x=1770601919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awc6ByPTKsjUOKIrjmoPpQxBQbEo1ajihzngBYTJn4c=;
        b=kRbxzz5OXZZrWoV2bs7RWHzMBupKMG53TbdiT5l9F1370MWNu4U+WwmF2ec4VUQaBk
         6bW7zFxDBANVZ6esIhhi0DIv9CyRIsqvDhTxPH8mb/Fjev18wqpMdJFiu6tUlc4nZ+rr
         eh4D6KYp5qjpwWBLkI0G2X37sxFa5e7x72+MESwAESdRRNbDW0lVsCcYKA9md4fBYHP3
         Pe7ba3cevVfNxd3lAlopgFNZ353nTSMFV1vJZuMX1Z0RP4ee1mPG8ZNaNmr2MpzSwvOD
         zTwKM5FbR4SBlM+aRSK2dkz4+tK6slMZ6Xhq7j+PUf00Di1zKLXt1YKVX+ha3rF3cFMc
         WYnA==
X-Forwarded-Encrypted: i=1; AJvYcCUyTeYu6AHa5fdVq1+LV4hALhYILF+bn8IGJ/jnO2QZePmH6jFl4M2chAbVBrODy4z8nOfF0MHcH7R679VQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnqGNQo7sPrLKm5/P8ngJ5daBPhe2lYzSBLQvwyh3SSW1iw1F
	HGE7MXRMz/tAmSTggxtWhsthOJB0Soe6OSzfezgckBlRUA2dgNEZgEbbsj0CuwFDgY13qR4Yhf7
	yVYHXrYohmQ5hoKdF+LQk1DgS10SgOdmkBLc+dV1Wfl060xVrP8lZw1HAC9nSBW7WabCm
X-Gm-Gg: AZuq6aKmUJ7qpQf40mkeKld7XWaEBdO/VB6JZMkNTCtRcG559GGFEfKvHk0XBGPYBqf
	a9eP6VYGhqxmoYxcuMAnkMnCrqjdMjFkuRAvbJ5HS4VT3N1TAFD2yWpslTz2mSh/n5xZHvEJ31Y
	qvS10Pl3m2GPNlMfbWzaCnMXRfU/bxDiB9LXmgF9I2e43quZHz3Vssfax1AmKm5Zv9DkWwf/ZZm
	nsng+QbGONJFrzeW26X3g1JE4XQtkpZ8htkN5CoDurNY+X3cV6pYfubofjms9wykX+2qMg5VzWk
	OH95NAUbkHaF84Z+VkHXwH+0wmCqF0cwDdJi8EImjBOp468wBjDy0/TJ0sBxKcGfN5e4FDsk0Xf
	gL6p5QD2sbAxckdbBi9hCR/3NdS8OurtvfRmCVUe6M8beHRrYmDU3LlqqJTw3dO2KlVwV/PrTOp
	s=
X-Received: by 2002:a17:902:ef06:b0:2a7:d93a:a3b8 with SMTP id d9443c01a7336-2a8d9919707mr107432605ad.32.1769997118984;
        Sun, 01 Feb 2026 17:51:58 -0800 (PST)
X-Received: by 2002:a17:902:ef06:b0:2a7:d93a:a3b8 with SMTP id d9443c01a7336-2a8d9919707mr107432435ad.32.1769997118523;
        Sun, 01 Feb 2026 17:51:58 -0800 (PST)
Received: from [10.133.33.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c40a8sm156484775ad.51.2026.02.01.17.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 17:51:58 -0800 (PST)
Message-ID: <e5d87fb5-ac7b-4442-9f5d-75ecf6bae657@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 09:51:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
References: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
 <5qplhwnkiwhsfr5rxzjqk4v6rtvpqkvsg7qxvrpkqd3b7vjvob@jffvv4fvvd3d>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <5qplhwnkiwhsfr5rxzjqk4v6rtvpqkvsg7qxvrpkqd3b7vjvob@jffvv4fvvd3d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MtLZZwyor10DF_i7QW3dWq2fWKosEMOt
X-Proofpoint-GUID: MtLZZwyor10DF_i7QW3dWq2fWKosEMOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAxNCBTYWx0ZWRfX7ezDM+N29bwI
 uNVrDWX0UGUYIyboewoX4+zC9svhRn0c4pFbdyr+p/KDUTF9kPruFCEhu5wFPX2q35krSxCFftk
 Ekv+6sMVAJhmthxb2i0RNvN7vmWnFIuUUXZy9F/kjlKtvUmotHYoYNPvbRn4qr2oaXaZ8Ojosye
 mqsMpwcy/XvJFbij21OpgFL9sbrgxiYBCtySRRTTS+4xgUqJmm6hn/wP/x+02oz8s4UhHlC1v1c
 a4rkkH/ONs72Gx7MKKQ302lQO/mAl4vaT7ZpJSEUWNvrs3eoNJ2yv2HBBuFiR/GM5ECZgx+0uxh
 kWj39OEcRC96q+frJtgWygCLbF1usUO4sfpngFkaZ5H/lIABqj/Wc01vce245rfX61KMcSFFpPm
 cn8QKgfXV8N5vTxIlrsxGhjUb+2MvOS5dL1NeilFnimv0rGD5fYy/vJkeCb8zVCkQ8reCVrtUUs
 aKb5qSZo2TA972rLJUw==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6980033f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kEW6tzR9zyLWOYnENaYA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_08,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91403-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAE8DC7CCD
X-Rspamd-Action: no action


On 1/31/2026 3:56 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 29, 2026 at 11:31:13PM -0800, Xin Liu wrote:
>> All the existing variants Talos boards are using Gunyah hypervisor
> Why are you mentioning Talos here?

Thank you for your reminder. My fault, will update next version.


XIN

>
>> which means that, so far, Linux-based OS could only boot in EL1 on
>> those devices.  However, it is possible for us to boot Linux at EL2
>> on these devices [1].
>>
>> When running under Gunyah, the remote processor firmware IOMMU streams
>> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
>> by the consumer of this DeviceTree. Therefore, describe the firmware
>> streams for each remote processor.
>>
>> Add remoteproc to the EL2 device trees to generate the corresponding
>> -el2.dtb files.
>>
>> [1]
>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>

