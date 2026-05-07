Return-Path: <linux-arm-msm+bounces-106387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AMUBpSQ/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB94E90F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0375F300C588
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CE53F54BC;
	Thu,  7 May 2026 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaFb/BRj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F325HGPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85516388E49
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159326; cv=none; b=d5dDBzADfH23u0uYiWk3+42VGwwU5aEPXApdPMRa3a2KAk20UDv0xsha5S+Mep1lD2ojXA+fybiYZqIzWoo5doAjrOxMLnoGiIIl9YZpBBtmfCBdte7X402LWJ9q1h0CYXoiE2VH78hQ0kRyz6nHPGmYMRm7I997QIMOFOcPftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159326; c=relaxed/simple;
	bh=z1P5WsyXK6IhfDSWv0FPs0A/+0AfVva7UCu27PBtqpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUARkSOvahltwAOPire1KZ3GtHA4HW92YiolqBJYQ9ZXPTv9wZGZx/7dBJUU3f9GfFnzAubgSvUT5ftk92gdzuVLJeiSR0MO1obUpjKMpOVEcPWqAlHpfzvFtHDkzCZHLXRah8X95TbXbh4S4E5drEw3Z9kWBTSB5h+xLPcu4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaFb/BRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F325HGPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BkQi33924169
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=; b=gaFb/BRj2AgHG5au
	7YG/MuLJ+Hydf4rkgKkafbnOv/ItWnWGrV35tuOpvnyTkiDXkRogiSBsb6taHbwg
	cilXcEjwlA5Ot0s3qq7TmReROKiGJydiZZtZG18pZ/vGMnc0cmVnBRF//qJm55EY
	Xiv8R/NprSeESrWBJhIfx/XMKrEN7zL12cOlZ7fIPZlizu3WTXKPLCNW0NGvWEOJ
	AXi1I6Gx0dvl0gc3BmvDf8zTPDGr843lDQAycWAzTsRhOeMBWFihpuN/AIk9uoLr
	3wdBGOT4Hkib5L187wxYWy+jiPR8KU5S5vfSfxFq1jf1BqX5TLp/8BLxvdGu3Rag
	sMUzew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88b6da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:08:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so15847735ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159321; x=1778764121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=;
        b=F325HGPlUBeK69Ybf20ncipOXpZUNXKMHiMctA8Hhs9MYEwOXIv2WuFzbWfIPCAmuK
         7FME6tjDDmU3FsqGWnqOEGoGslbnu+NizBTvFMLq2rm0YcC9xYv5p7bUT1Ozb5v9Q03W
         lF6wg+OLtTVwD70+idgcWADTurxdzIMa0mQw7S/3+7maOkt/WP1l7pJd/QVvTqpo7eCd
         D38zAUAprf2sCNEZ5dvfX+IeWOX/WMvHCxIZsRngGJnHpMq+zuigdoo7mB0z+bCJJvPe
         xhnPdUxeAKWgsNLXTk58BmTr0ZK/ny1yMflqvXOUnNN5uPZ9DoX/vofFHarEDbmiOf+Q
         FiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159321; x=1778764121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=;
        b=CcygDn/ZqtGKaoDw9vViNPWHShg16ivVIi+d1uifB5dtZnKQ9i3Wq/qByRGdTzEt5b
         P/Zgs27o9/xSHVArKgjtow6fKkjgBtpRazzJS084z9xKpUhdFevQNSFP9Sot6+DyCPov
         9DOXVJO5iY87EKaECAuNbnXIQtkqFH02F7x8StpL6Did+oo8uRgBh1L8yROL8r2zyg9v
         lkin0XyyJvGLefJ8denY2V3aGoOlG7c5bnDvczt4COM472uSAxIhFBWhwYAFFUrEOos7
         zM197tNJjU5562V5mC84B4q9HgsPT5hMh36ScVJNrsXXZlxrR1Hj2U9oEjK8GMYNxdcY
         VhBg==
X-Forwarded-Encrypted: i=1; AFNElJ9qZYpyIHW6bL3NTFXpo7SFn5Xi/vmEX4C3YxlAeSBTXXVCzyx1yy7tPRp7j1qaU47A7iEApEQcuQ6mxhxl@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsrA/OJGUqAQWP7IioaA5vYpi7jSnqQ34KH3q+F7ahE3kEDfd
	Ontox1Rm7qHeAHuNcGdNoZxf2ERgm97SBE4xoouQvxwBAiC90b1JOgxJ0xea/YN+RTBvPbklCKT
	OGUcLNntRyxEGfk6kElZeJ4XEacg9amskddTb1n9bU5tZBN7MNCUe5EBxQTfIUb2oeLHT
X-Gm-Gg: AeBDietGonguI33UTSE/I8o8TbGiDxQs928wwMWj+mK5Q4qRp2vVf0QfQDRdy7kj4WZ
	Pc9HISymz/ZxvkpUYidkrTS7r3lGqTOXWxfYC5A7xVAnU59J+DFSHHDLnF5bonxp2mlguN1uMXI
	BSUfNAO5UAjMc7EcsuUG7rPeqShs1TeWeWjOaDW9NVq7Ks+iFHzEcOPFCUdraRUrxrozZIZjD1j
	dmBDKf41wGwJoSt5sfLjZyzNlbkFRqowXYo0vR3KowWJ/nFuiaXLMB1IcSlQTIC9Lt3xZlQHMvx
	ww38aKhrMep0thhvwb8K0cem+Di/oVeRGPlVFcuzE5R2xS0WcxcD2ZxdeYTb2nQsskCNzgZJpiG
	2a3DpkdA1xyebNSw/TY7nLee0LbdLpW51lFvW43EQZsVQ9vZ5+BCaVaQxPEhRP1J5NM4=
X-Received: by 2002:a17:903:3850:b0:2ba:b738:bc2 with SMTP id d9443c01a7336-2bab7381ebdmr38992975ad.27.1778159320946;
        Thu, 07 May 2026 06:08:40 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2ba:b738:bc2 with SMTP id d9443c01a7336-2bab7381ebdmr38992545ad.27.1778159320449;
        Thu, 07 May 2026 06:08:40 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef91fsm26732425ad.65.2026.05.07.06.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:08:39 -0700 (PDT)
Message-ID: <51c9cecc-4724-4d00-8112-175997916bc3@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:38:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] media: iris: Introduce interrupt_init as a vpu_op
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZnqRtkfesZwQahk3_Z7pO4rdDQKEltNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfXy4vOV8CRy1iK
 xBtKNw9VE62onhBQhEX+6uHC4YHu+O1pU+IHQJRl6PlBKtHzmuiDLCfe7/bAOcuaeuYZek31JgD
 sNrGVs36dfqlMimDgifYI7jKhX8N0ltQGzaVV+IcMfiD1tufPp2L2FsIIfTCJcrgzRVVQIRZjGS
 061eeWAy6KBUnRQWrDH+91PRIrVsyxohkeK2QfcnbjjciJBq2QLXMjxqi2jdkmP16SO9aIlZPSu
 DSccRPH6Q2wJeH71s/89vpsfCi/KAm608m5UKDUJd3hPB98xrjIzRrnKbSkFopNXeJBc+mIdIeg
 Ix12vVdfwejyc2vU6NTdGN3d9xsr+Hg+W5qe2pl5VUpm8aaNCLXeuY+bOf/0ngnNIAYNT7ubhZi
 b0wyT3ayifOGegPfEoSza9fjZyr28tmfSeZqqvlZ57sxmGGWiYw7jTkdy7SEbAXYUgTu4ReAkxS
 GcGWKrl3D+f+0RBK4ww==
X-Proofpoint-GUID: ZnqRtkfesZwQahk3_Z7pO4rdDQKEltNy
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc8ed9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7rbqPpcrvv9w7tgh1RYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131
X-Rspamd-Queue-Id: 9FFB94E90F0
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106387-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The interrupt_init sequence is currently shared across all supported
> devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
> 
> Move interrupt_init into a vpu_op to allow per-device customization.
> 
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
>   5 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

