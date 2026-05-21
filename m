Return-Path: <linux-arm-msm+bounces-109016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EICMjDfDmoVCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:32:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B55A3599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44BC23081036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A3E351C14;
	Thu, 21 May 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmAyb/uN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSBWd5tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC09394EA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358578; cv=none; b=dU1D1oSmIoDMGQlLImOjGFEFfXfvAayaOWtMigeNOfLBTxRUoac37PSOs8GOHDVTFpWPMyp5ujyAKenHCOabxwSWyS8OvZoBZBrtNQaU6FelLDmi17BpnTVlYDfKybLgrYuiveXgAOLR3/22P9DZkT7hm0juZ5r7OKoBXZJScdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358578; c=relaxed/simple;
	bh=w13oUWNYxjzA/ZqcnguND5E56A+PwLmpIwmDZAlMrcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8YY63PNc+7JTTM/LfYPlPViOjeSbuTEs1ZzwTl6a9MPf8RlkzQ6q4TPYWiFfgyVIvIbgJGHrZ4TIagpCtE7Fd8ypjehlRe9RB/hccWnNwRvig7X9KGkGQEi2yy8NRLWTue/IpQE8aVNXPHcfjld+QfZapJ2Zx7+/FE5Jg9lxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmAyb/uN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSBWd5tb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99sxa3451575
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojpN5O8pxFmzH9Ay6O9RehDva/HvmD7as/QChKxFYI4=; b=fmAyb/uNmVuLCXfK
	qerTvjwByfpoeBwJ7jY372IF8757ZRGvWhyLhHt2ymMhJzV79HM5PkcKgAdh7NTN
	0gjAkOQDyVCAdS2thYGUYrp3rrHQxDP4jVLuirD2qZM/d3/486ywl+unZVrqDNd+
	YMsmWF+NmfUhDf7eJEFHN2erjgpKkkne4wb5OIzqpCd8yskhNWC//bvDuo6L4ibs
	qsNdtyUSqSVfM4NksXODu84ZblRJqYINyy80REUAaTMdoz/T+mrZKe3xUXQB3tH2
	LZAevybC/UH2iTpRptiyTjv2o0NUv+UBwNqPbIzkq16Q/htNY9riptSt6CKBRhRA
	e08CjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8auf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:16:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cd650fc2so273031cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358575; x=1779963375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojpN5O8pxFmzH9Ay6O9RehDva/HvmD7as/QChKxFYI4=;
        b=fSBWd5tbq0QnQP2CoQj05PzNaCq0obvcAnYZ6iv8AKau3rqdmsN6qbqJvZ44Cv0kDQ
         b3C+lXP5dfuRslOt+J+t4mgPlReLWO3KlKp/Zn003C+FxX19PAwnydg6Y8Ds3Nt9+/3+
         WFQxIA3F3LvabkENmjBCG37m1cfdn4ZDigiExguWsNOGTA/2wGuRFxDRhEC9cLVI/xg8
         ZcCm6ipMLdhi41M2ZLrKmtTEZ1I2MgSCcRJa5qPcSEZmYxlYHIIu/yv+6Hjcyw2k4wxw
         x8/OvrM7MzecewiTy0V1yDrr39aMoIypUzu3Odja9XQEDcbyxgZ0nYhF8A5C2l4RWayS
         veLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358575; x=1779963375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojpN5O8pxFmzH9Ay6O9RehDva/HvmD7as/QChKxFYI4=;
        b=K2+v4a88tggFKSpEbNo4eCzncAjn8dwa31CUJETQYsNEf71h+n3rtbsWgR0djL+BZo
         0z3XzS2wpgV+Wj8daPYiObI4gyJy4bJQwgcF8EfAa4hoIS9ZnXYqm2pvSZYMWluF/PjD
         wOe59HhbFN9Ze6LE4mT2+r7M/vPKVOAZkq3Qo8KBbISTADrN1F0fxMmn40L14m/Cq64n
         MNhHw/4YF1QBCQ9ubE6cvuM5+9UaFfkFUNOjCwDstdYmJ/WtfcyihHoML8acYsV3MGUV
         CC9f5qllMBA/mH0nCAs6RTuMTWKRMaGLf7ExAKBMa4GBAaRR/iggZ637SICBpzeEHP2T
         Xp+w==
X-Gm-Message-State: AOJu0YyQNCWlsxa9SXOE4OJhRGki/qTko4qAFIkrF5LUDALCrdmzziT4
	6CJ/rXZwT3TOkIbTS7VBoj9bKt1tWjFZK3SDGhpzTtOzf5XyplSNeWSvC3DGflfZx+gaNv9ebAN
	6PBxESBiB/7317Iu+GEYtaIulL8OrF+CpqF+ZwrgxmNlYkz61KL/ZC0YvGzx3/Vd0Kauz
X-Gm-Gg: Acq92OF9Hu1nDKPaMHpIP00PXYT3Cpw0Hkk1qrjdH1xBxtM8E21ikmjruNpDF/OSUV9
	N1DArtzWlcSCHgJ1350paOiPjAg8su3ibgKxNwaQ+c8fuozx9KOchAIYGx4LHjykTRmu7JEuQv2
	rkr0UIp6/3ZWUa7QtNyvNHVNlJIYqmZbpkQbha9ItoLRuvQqnHgQzRAiDJq4oYTa+YXabd43lGl
	VYxKV963DiA0UE0VSDrwAYN4Fc7RbkMG91Ceb8Skp5fGfvDW58jBwUOago8fvVuDIoe8jAifoPR
	pksDsqMDwtg/3Fjc54THdywycBUq9heepQZy+/AaEjk9wUqg5PT4bsioqeirZHYvVjT/tJVnger
	MDUPXjtA+bJX+DdzBWEFx5BvHYWRmEp+ZW5xCUtxUNJRrFPz64f2OxepyLakAM/GjhmLCmeKJNu
	gD5VI=
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18949671cf.3.1779358575238;
        Thu, 21 May 2026 03:16:15 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18949361cf.3.1779358574792;
        Thu, 21 May 2026 03:16:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410e22sm27141166b.38.2026.05.21.03.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:16:13 -0700 (PDT)
Message-ID: <efdb6359-a6de-4ee5-986b-cdb73b980d26@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519171442.1582987-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VnC3cy6q4QJjUJU8vwelzswHoC40ItNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMSBTYWx0ZWRfX3iAP9IZAbPHm
 LoSXpEz3KMEAsgsaPAxnkH9En0F2g5FznO688k5T+UyEGzsSSvQm4hkPiFKk2PmM3Ff43+Grgrp
 VNqT8igCKAPzaJu6iGUIeckyd3dm+Vp3JQS8JFqAly36buU7ywQdnsSrV3WzL/7iczcyWQgwYZa
 /mJPdWNIPGnqxXFSPAc2lFQuW2xXoWXy4+OPid84RrHmxtYlu6zpzT2X7t2LhXpi6+K35TMPkmp
 /XEd0iwByk0xk/sKcJDop5E+kGYXu8buL6Q5C8HKJkQmwS0VKV84+0w+XXntwQ/wRHg1No97lwX
 vZwKPsB7+mjza4Kn9Q15ETTaGBwVSZ1g4moSdvB+Ac3B2ZFoyH4ByIxkgPitpRXwphsGUBoxbdC
 18bcAjyTFlgcdKtRLnlzbM+vo/NNA39k9hm+nAyCdxmVWiVIqmpjd4oF1fg1lyWmO/HaMaIeag1
 gaBxwja9SEcQIi1SrmQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0edb6f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eJDSHYLt-8gXCFyzMoYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: VnC3cy6q4QJjUJU8vwelzswHoC40ItNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-109016-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD8B55A3599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

