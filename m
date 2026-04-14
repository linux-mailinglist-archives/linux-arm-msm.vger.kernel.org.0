Return-Path: <linux-arm-msm+bounces-103059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBZFCzvr3WmulAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:22:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C393F68F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A33973051DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B42837E2FA;
	Tue, 14 Apr 2026 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSerxJWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8mWeFS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DD37DEA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151257; cv=none; b=kJg8DY3SUJy2TrVGRPZrYFnrKa5JQUA/2SXRbk/hXEbcVb5ClQ4OaPlCKebjYQJMLxLh0e/Swekp37s8xi7YBbCNdEdBBPRAMpItooV688uLKrX4XbzkD+LoKp7YFPpAzRyORLp0pfkLnX0vuJn9DLg6EOoCwKbFPHXrLgFhqic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151257; c=relaxed/simple;
	bh=b5DJp/E3H3aZBHV+OClUo7yKz5g6c5Vv3BkslfKGc7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4nPmhwKeYyNOFlD6u+sdXZQIbI0EkUg507+uiTjvA3qhBtIMMymMjHB1cCu/eim+C8KvdzwlueXR18p8R1B15tr+9Y9jRBStZSmdk7cB7oH89/VqmGTyhErvAVZcTRV2jOPvUM4M/pu6ZZ86vtUQjZLRVSxagxWZoGWQpN4dOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSerxJWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8mWeFS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6RQDG3505422
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwQ2Z3qO+aRCEr6sX6LgKLKYmboqyG68Eo+MG6nj30g=; b=YSerxJWNElONC3mj
	VlHTeNOzZI3+DnzfbIykKznWjY19rrOG19Xjq+k8luC3fvz+MlI2c5pmB2HTvYA/
	N5FT+MW+VuP8rhP6zGu/oNymU2kI1yfmxMnyuPK6tiGOPOYbCM0pMJOSPPUZVkXS
	7TwnqirYXe6ztduVSUlGqb7+0CLeZV+jrDX1eaMjs6huFsW1FjjqhuNmy6Z0jJBk
	zVFjgsHX3DMSSaZVtME53IB9e1FNbRtszUxaiXUu8nhxDjqfxEgQ9f/AQFki8C3z
	Jx8RY33HkXnGU/enynnfzC332XrEKPDttA5abnvcIfswxYLNtGe7rui34f7TqBaF
	iJvxcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870hh36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:20:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso10942600a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776151255; x=1776756055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwQ2Z3qO+aRCEr6sX6LgKLKYmboqyG68Eo+MG6nj30g=;
        b=B8mWeFS+Plwz60mC36Mj6JtrJFF65RtUpRksmhbGJycfUreheh42sZ1E2bZTHHpAyX
         o98LrExNZjjKOPGSmOmDn0o8EFF3BM6QjQzeOzFxi2EzMrVDwFbsNzQF22doLx+fhfSK
         I01QwdpgeBAxRpIu+vZXvuBtQ+X6GJYXvNIWwv8b+hynywTAA9v7FKnPeFzYF6+Hjgju
         nybVti0gvsfusipKpI0JdZG8TtRB4Cy0fBDVxfYlKUnTtDOjqgGsd8Ttw2hy4TjjkI9l
         Uj//ZWHINKt+zv1G7LnG1JsIJdx/za/aHAabFN1XvKeq06sOzhnK1UUVY3uFch1xMDkI
         CULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776151255; x=1776756055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwQ2Z3qO+aRCEr6sX6LgKLKYmboqyG68Eo+MG6nj30g=;
        b=TxcOBYg5eENzoqkD/+5bc3Z7jHNuoP0l1Z+A22AhPvG76Be+aRfLl0RU62Z77xGNBo
         eLdJSUWTK8i/1l4EAS16cZTpbhsAWHFmgdPf2NC0reK/KbStRLCVvDkUZvtLKjuuo/y8
         lgBTB/UK5yK3iZIHiTdZ3Qejpz159e/TzvvH0RMd9CkIwHUpg9LKYpwg764i0N5dzrCG
         wRW/EhsjMcqXOdknjTohMByKD7ZM2S7EG0lusFOdnRlK6Gfr2R9lZz2i9djZfPuwZ9GV
         c6PZBKyoFyBKN+jvGFzEq4PTjpvZ+A0jsy101Bve7eHfHDfF51gbiaReQwaQX0yNMH94
         uymw==
X-Forwarded-Encrypted: i=1; AFNElJ8sF3c5Ch2eHkxp9WIixBEH11jOaKEQi6TG6AFXphRub3Lj43k0QGHSR0X+bXlXuEpqrKAYBTlxLMmpBSIG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pxyItqLAIn6eMQD4zZ3dLYGLLTh1v/g97ldpJSpcD3NxSu5v
	0AXMGVZjDM5kL8zk9F4FNoAsEO/nRVtz6B019PcyY+uKM563nAteGE2BqTSKsm9B2DTC3a+a3Pm
	Ef0NntCW2jhkNbKHtum0+/H6aTxqf6/ElLVtNf7uJf3s6rU4Ag8zx5TbjQ7Ogl67iCMD3
X-Gm-Gg: AeBDietNHlZBx4HjKu7TayR/NBjj9V4jzAvCLj6Fvd88SR8sf8u4OuXxgevLCjqDkR5
	r/4GlXOKT07clerwww2eFlbokw2N0OZiiExRigvKtGr2iLkW9MB8/JKUWghlt64A8SxCVZZSTp1
	qxlmBYJU8fZ5H341DVQrpY5VWcE2A0Bo8lDLj1Y4YLZ3SQ+LlRJIRm6oKzRzjan8JgSaKwYgS2K
	LpdA+jf72re4MEBH2H4T35XP4KAj+xrBWsok875K5TP3jivoyr6uKqmrdGd1pIY8zI3zLQn0A6O
	Sf8tKMNZ/6f+KE61UjiFQXGRa8e7oaPkBEFB/sBuK/7hTDt0qCXVrqRSWk8BOflwkXp0UiT0geT
	fExLbLAPCCvjXv1Hlj3pWlbOKD0MigyxVLVV+/qDuOwVKBOhjelFdUA==
X-Received: by 2002:a05:6a20:a114:b0:39f:2c96:e0b8 with SMTP id adf61e73a8af0-39fe3dccf95mr17470725637.26.1776151254676;
        Tue, 14 Apr 2026 00:20:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:a114:b0:39f:2c96:e0b8 with SMTP id adf61e73a8af0-39fe3dccf95mr17470690637.26.1776151254068;
        Tue, 14 Apr 2026 00:20:54 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c330925sm15512185b3a.15.2026.04.14.00.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 00:20:53 -0700 (PDT)
Message-ID: <d4dbec5d-f7ad-d24f-dcd5-d291b572be71@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:50:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/11] media: iris: Rename clock and power domain macros
 to use vcodec prefix
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-7-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063846.fixumrttkfqwydch@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260414063846.fixumrttkfqwydch@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2NiBTYWx0ZWRfX90AOLT8YoWxc
 eCt+jaKI0MTUd4+giWfcvMFHIfNXv2DTRFQXy9Nw1IRDIJTnCwwdkbJkn8wkmL7WrHOGkJ2RJBL
 Q+rucvq0N55CxgLovn4/RC9okFtJTMDgNlX/gxtuibMx0tkvOkXrHtNgE/fceEaxZfT4Mpc1fga
 k4sVs0BfSRyJ6PglI8B8fqiA3ZQacOU6l9ExNkd/41FFoxwl2o1cDeldeAqbTk3JJqrsUMzQr8T
 GED4fRfAL+ct9FyByJK4pLqce4xGjlHbGtllHUn8WVxwkZ8aJG/422fvFAQxeTxKAHuRQF2EtXd
 0OZ7zohJC678FEbJrqRyfZJGpPfcZ9Y9f1HBLMwgfFKJPrib/YNvV6emSB/iFgbkCikG4Ez+fiE
 jsJ0wT7Gu2UwA53vt2CaI0NdlZ/PYCD89Km3YCHJQkTdAMa4Gd3aTxFyyMAKKf8fr1HhWQpa530
 pFs09IZcZ2NDne2z0ow==
X-Proofpoint-ORIG-GUID: iTzmW10cMCWbhwvGGkZctG9f9dwiisKz
X-Proofpoint-GUID: iTzmW10cMCWbhwvGGkZctG9f9dwiisKz
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddead7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZzSlGUpipctRqpDlwUAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140066
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103059-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91C393F68F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 12:08 PM, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:03AM +0530, Vishnu Reddy wrote:
>> The current clock and power domain enum names are too generic. Rename
>> them with a vcodec prefix to make the names more meaningful and to easily
>> accommodate vcodec1 enums for the secondary core in the following patches.
> patches ?
>
>> This patch only renames the macros and does not introduce any functional
>> changes.
> "this patch" or "patches" are not preferred.. write the commit text in
> imperative mood..

Ack, will correct in the next revision.

Thanks,
Vishnu Reddy
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>>   .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>>   .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 25 ++++++++--------
>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 ++++++++++---------
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 35 +++++++++++-----------
>>   8 files changed, 70 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 55ff6137d9a9..30e9d4d288c6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>>   extern const struct iris_platform_data sm8750_data;
>>   
>>   enum platform_clk_type {
>> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>> +	IRIS_AXI_VCODEC_CLK,
>>   	IRIS_CTRL_CLK,
>>   	IRIS_AHB_CLK,
>> -	IRIS_HW_CLK,
>> -	IRIS_HW_AHB_CLK,
>> -	IRIS_AXI1_CLK,
>> +	IRIS_VCODEC_CLK,
>> +	IRIS_VCODEC_AHB_CLK,
>> +	IRIS_AXI_CTRL_CLK,
>>   	IRIS_CTRL_FREERUN_CLK,
>> -	IRIS_HW_FREERUN_CLK,
>> +	IRIS_VCODEC_FREERUN_CLK,
>>   	IRIS_BSE_HW_CLK,
>>   	IRIS_VPP0_HW_CLK,
>>   	IRIS_VPP1_HW_CLK,
>> @@ -206,7 +206,7 @@ struct icc_vote_data {
>>   
>>   enum platform_pm_domain_type {
>>   	IRIS_CTRL_POWER_DOMAIN,
>> -	IRIS_HW_POWER_DOMAIN,
>> +	IRIS_VCODEC_POWER_DOMAIN,
>>   	IRIS_VPP0_HW_POWER_DOMAIN,
>>   	IRIS_VPP1_HW_POWER_DOMAIN,
>>   	IRIS_APV_HW_POWER_DOMAIN,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> index df8e6bf9430e..be6a631f8ede 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> @@ -284,9 +284,9 @@ static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>   static const char * const sm8250_opp_pd_table[] = { "mx" };
>>   
>>   static const struct platform_clk_data sm8250_clk_table[] = {
>> -	{IRIS_AXI_CLK,  "iface"        },
>> -	{IRIS_CTRL_CLK, "core"         },
>> -	{IRIS_HW_CLK,   "vcodec0_core" },
>> +	{IRIS_AXI_VCODEC_CLK,	"iface"		},
>> +	{IRIS_CTRL_CLK,		"core"		},
>> +	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
>>   };
>>   
>>   static const char * const sm8250_opp_clk_table[] = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 5da90d47f9c6..47c6b650f0b4 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -780,9 +780,9 @@ static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
>>   static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
>>   
>>   static const struct platform_clk_data sm8550_clk_table[] = {
>> -	{IRIS_AXI_CLK,  "iface"        },
>> -	{IRIS_CTRL_CLK, "core"         },
>> -	{IRIS_HW_CLK,   "vcodec0_core" },
>> +	{IRIS_AXI_VCODEC_CLK,	"iface"		},
>> +	{IRIS_CTRL_CLK,		"core"		},
>> +	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
>>   };
>>   
>>   static const char * const sm8550_opp_clk_table[] = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
>> index 0ec8f334df67..6b783e524b81 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
>> @@ -16,11 +16,11 @@ static const struct bw_info sc7280_bw_table_dec[] = {
>>   static const char * const sc7280_opp_pd_table[] = { "cx" };
>>   
>>   static const struct platform_clk_data sc7280_clk_table[] = {
>> -	{IRIS_CTRL_CLK,    "core"         },
>> -	{IRIS_AXI_CLK,     "iface"        },
>> -	{IRIS_AHB_CLK,     "bus"          },
>> -	{IRIS_HW_CLK,      "vcodec_core"  },
>> -	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
>> +	{IRIS_CTRL_CLK,		"core"		},
>> +	{IRIS_AXI_VCODEC_CLK,	"iface"		},
>> +	{IRIS_AHB_CLK,		"bus"		},
>> +	{IRIS_VCODEC_CLK,	"vcodec_core"	},
>> +	{IRIS_VCODEC_AHB_CLK,	"vcodec_bus"	},
>>   };
>>   
>>   static const char * const sc7280_opp_clk_table[] = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
>> index 719056656a5b..f843f13251c5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
>> @@ -11,12 +11,12 @@ static const char * const sm8750_clk_reset_table[] = {
>>   };
>>   
>>   static const struct platform_clk_data sm8750_clk_table[] = {
>> -	{IRIS_AXI_CLK,		"iface"			},
>> -	{IRIS_CTRL_CLK,		"core"			},
>> -	{IRIS_HW_CLK,		"vcodec0_core"		},
>> -	{IRIS_AXI1_CLK,		"iface1"		},
>> -	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
>> -	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
>> +	{IRIS_AXI_VCODEC_CLK,		"iface"			},
>> +	{IRIS_CTRL_CLK,			"core"			},
>> +	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
>> +	{IRIS_AXI_CTRL_CLK,		"iface1"		},
>> +	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
>> +	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
>>   };
>>   
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index fe4423b951b1..1f0a3a47d87f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -209,7 +209,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>>   
>>   disable_power:
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   
>>   	return 0;
>>   }
>> @@ -218,36 +218,37 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>>   {
>>   	int ret;
>>   
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core,
>> +					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>>   	if (ret)
>>   		goto err_disable_power;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
>>   	if (ret)
>>   		goto err_disable_axi_clk;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>>   	if (ret)
>>   		goto err_disable_hw_free_clk;
>>   
>> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
>>   	if (ret)
>>   		goto err_disable_hw_clk;
>>   
>>   	return 0;
>>   
>>   err_disable_hw_clk:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>>   err_disable_hw_free_clk:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>>   err_disable_axi_clk:
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   
>>   	return ret;
>>   }
>> @@ -256,8 +257,8 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>   {
>>   	iris_vpu33_power_off_hardware(core);
>>   
>> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   }
>>   
>>   const struct vpu_ops iris_vpu3_ops = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> index a8db02ce5c5e..4082d331d2f3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> @@ -27,7 +27,8 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>>   {
>>   	int ret;
>>   
>> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
>> +				      hw_mode);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -63,7 +64,7 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>>   		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
>>   					!hw_mode);
>>   restore_hw_domain_mode:
>> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
>> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
>>   
>>   	return ret;
>>   }
>> @@ -162,15 +163,15 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
>>   {
>>   	int ret;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
>>   	if (ret)
>>   		goto disable_axi_clock;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>>   	if (ret)
>>   		goto disable_hw_free_run_clock;
>>   
>> @@ -198,11 +199,11 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
>>   disable_bse_hw_clock:
>>   	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>>   disable_hw_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>>   disable_hw_free_run_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>>   disable_axi_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   
>>   	return ret;
>>   }
>> @@ -216,9 +217,9 @@ static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse
>>   		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
>>   
>>   	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   }
>>   
>>   static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>> @@ -226,7 +227,8 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>>   	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>>   	int ret;
>>   
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core,
>> +					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -278,7 +280,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>>   		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>>   						[IRIS_VPP0_HW_POWER_DOMAIN]);
>>   disable_hw_power_domain:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   
>>   	return ret;
>>   }
>> @@ -356,7 +358,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>>   		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>>   					   [IRIS_VPP0_HW_POWER_DOMAIN]);
>>   
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   }
>>   
>>   const struct vpu_ops iris_vpu4x_ops = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index bfd1e762c38e..006fd3ffc752 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -213,7 +213,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>>   disable_power:
>>   	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>>   	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>>   
>>   	return 0;
>> @@ -221,10 +221,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>>   
>>   void iris_vpu_power_off_hw(struct iris_core *core)
>>   {
>> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> -	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>>   }
>>   
>>   void iris_vpu_power_off(struct iris_core *core)
>> @@ -251,7 +251,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>>   	if (ret)
>>   		goto err_disable_power;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>>   	if (ret)
>>   		goto err_disable_power;
>>   
>> @@ -268,7 +268,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>>   err_disable_ctrl_clock:
>>   	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>>   err_disable_axi_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>   err_disable_power:
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>>   
>> @@ -279,30 +279,31 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>>   {
>>   	int ret;
>>   
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core,
>> +					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>>   	if (ret)
>>   		goto err_disable_power;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_AHB_CLK);
>>   	if (ret && ret != -ENOENT)
>>   		goto err_disable_hw_clock;
>>   
>> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
>>   	if (ret)
>>   		goto err_disable_hw_ahb_clock;
>>   
>>   	return 0;
>>   
>>   err_disable_hw_ahb_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
>>   err_disable_hw_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>>   err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>>   
>>   	return ret;
>>   }
>> @@ -362,7 +363,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
>>   disable_power:
>>   	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>>   	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>>   
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>>   
>> @@ -379,7 +380,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CTRL_CLK);
>>   	if (ret)
>>   		goto err_disable_power;
>>   
>> @@ -396,7 +397,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>>   err_disable_ctrl_free_clk:
>>   	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>>   err_disable_axi1_clk:
>> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>>   err_disable_power:
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>>   
>>
>> -- 
>> 2.34.1
>>

