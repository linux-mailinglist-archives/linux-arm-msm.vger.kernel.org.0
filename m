Return-Path: <linux-arm-msm+bounces-115219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hjreCoy8QmqGAQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 20:42:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BD6DE1EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 20:42:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LPCtJUpy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cpTh0FQd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115219-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115219-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F079300516D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD5D3C37B3;
	Mon, 29 Jun 2026 18:40:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552CE3B27ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 18:40:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758422; cv=none; b=tFPo5IM3GtgBGfDccvU/IpW9bb3WmzlUEWMsJf5afFCRL3ylU3FhbmTgkUkBP1R8sb6PFpX+fKbRY9jRYWzEcUiP/HPuTG4RxuiJrKqAULMFGWyRQz+SnVpPoA8Xe8RfPM+0qSb/GaIXyLrnhjK3Kb8d1O6MEZ22w+ag2d49Ay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758422; c=relaxed/simple;
	bh=q5tOmL4fQXLf6rF97LL5TTgbz0UYUqEg5tRWbsqLlfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nltqnFXcWJL8OO4BiBc6d5DJvGC5J4ugxXXBtCYnG+OMkM+zjQda3fH2i/0rN33N4S2Izc1RhGpTmX3P51+PLZ5Q49GUVNOQ14pbPY4zhTt5jC2ZJHVMhYseMtTXFytao2rCGU4ErOnVKsB0Yy/RL2b880YcNi5xBgLYBl6YvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPCtJUpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpTh0FQd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKUL13426714
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 18:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=; b=LPCtJUpylBlNWhDv
	0fxXRaARpZMPwhKF2iYU4JQJPrVJ4CHxfUSHbsGlRYH7GA8iUEc/OPHgQYnHK1fh
	6RLWWHzuDVzHZ7KFJNM8LqB6jiZm89AdLX85iQTgaCdin098Q4mfyUcJPxUuFPl3
	aSajWkgso+hCNB2cZvPakgLxy+VsKmVM1Zz0X7de3gAyD/H3UiQ+sJi4BY/5Fznb
	VcIHb6dtwr3PAdWbWjraUV704k1U5tGziQrbzycM7GloVacTvb2KplJAB9EiHT+O
	ij+6fqEX8nmmDpiFssuBthRdCrTZDcq6wGCozkeIBPl4NLFanW/DczUgf/oAfqdf
	DGm80A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdktb1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 18:40:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30cb5001ed8so3549799eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782758419; x=1783363219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=;
        b=cpTh0FQdl+gPsh2IrSXHUBpvu+zm9DPBJJ7BDu7udPKQqh25Z1WpQet9/PqKTpBYoL
         OrKT8J1p4fqlfMcev6lZBoYVOeRan/dwdsoUE+EXTGerspQ4rjSjS/+mfnA1DSwZAM2N
         5RY3W8U5cIsRtaxGB1nXrdRZYTi3GVxtLl6iDWumJb2aZDCwDYIgfQKyeeQAyOMrCS+h
         z8H7hLmYqOVnmj1fPp/extOH4pGucXye2zkqZc1ZWBSCUA4x+qM0b6Oi1n1nLh6nOQri
         CMQpu7DLlyge+tEqR+5UpTbD5ye0x3pzus5Q2iYSmMoUnB9TU5YbG7+FsySwUh6IrgAL
         /FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782758419; x=1783363219;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=;
        b=g5JNhwjDDsdNajFO+TVFVQ1L+YMbUmFcT7nEGfKaPDJsh18WHlwVJ/66SY2ik/OMly
         KJGz/vsbgx7P+JARA6V1j2L4RQ+BYX/4yHRoHtEO+N6UGLafE8SQCdpzntEkNAxjysU/
         GldeLHp0yvVt5qVV6WnspJnLAPLCYdwucBkE1GXkTEHzxgig9xrQcM6DHQlO/Wn0PckX
         9WDkrOpknrDSudph8VglDckjbGNurQYjbA3PB5i1JJsfqpdxNP0qhn1LYcbS0oRt4Ihe
         nVUJjM8qFq8GpDyldRM16QnM6IdHbKJmt+mLdxkyYPutMeY8x3Ejb5J9tPi8dysJN8qx
         444A==
X-Forwarded-Encrypted: i=1; AHgh+RpPb+tXA0Clp8AmFjPlOGXgV2M8uqZfNEN8idHxpB7X8JKC47w7rFp+VPmwqv++iTEPstGEf4zayZHhzwe/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw/mktSmGnaEQaCGJ3KBViXLwE0AVritgPITyIahvrkQo5hhL5
	FDYW/AHluMgXNHd/KRLKL3yiJp2eI6MwcBm5Dw8g1uEeFSMM1pIgeDa/nmImdafuZALhjLiESuv
	ahS3MFntoO6PjBOlcOlAAlPH//BH2mIsP7Y02yPhW3minyJu+gOXqtZLNdrHaNnZ95ZRi
X-Gm-Gg: AfdE7cmJI8nCQo2IBAfh6IJHFrGDNt+6l/SqoCTephhG7j4bdcZd/o2wK76hgvQwp9h
	UwbmCshRV+XUBwSACR9rP9klZb243k6g8xgC03net0ThzjGJhUEkXGZhE5RntSHGBN+6RTwQlbv
	iZvhVBqOLKaCG5Lza1ENqZTBgt1NDoRaxd0aXiv9bF9GqBO/dCFaIrKt4iIpx2UI5FQHdZxgHzf
	SvPUzrFKwi2ENp6aOu+mihQGxIVGrb34Bhz+ItCLCKICxUjas/2fxNdYW6QG8niHxowcvz88EWa
	rQL6sWKe9DrOqO+7q6hPk6iD2us6jmA8TeSsUMHCOyvqzwef98Dx7AXbYXJvWrVcI+K8JkAxn8O
	LFg8a9S5mtykFKMgVmXahyr49cCRfWHd6lw==
X-Received: by 2002:a05:7301:6190:20b0:30c:116b:42a9 with SMTP id 5a478bee46e88-30ee1489a13mr269165eec.26.1782758419297;
        Mon, 29 Jun 2026 11:40:19 -0700 (PDT)
X-Received: by 2002:a05:7301:6190:20b0:30c:116b:42a9 with SMTP id 5a478bee46e88-30ee1489a13mr269143eec.26.1782758418783;
        Mon, 29 Jun 2026 11:40:18 -0700 (PDT)
Received: from [10.91.118.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee316bf4dsm128143eec.17.2026.06.29.11.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:40:18 -0700 (PDT)
Message-ID: <4e438b43-33d2-4cde-a5a6-67e7f8c53787@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 00:10:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
 <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a42bc14 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=l0uZIx2wMuzZ-h4bkHoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: dpXTe7DQRkQ1MIYSPCuu2DwzJck83V_u
X-Proofpoint-ORIG-GUID: dpXTe7DQRkQ1MIYSPCuu2DwzJck83V_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE1NiBTYWx0ZWRfX/T+YS4KXPBk5
 P2wzCrxZwEU/AyaYxSHKCLINX4Dicggjlw36VJCHXtr6NBJK86dVfm5WZHH+gXjHm7JSff3O3Wf
 YYlCRTydlD1Al+56g/7SovG9tZTnXWPj0+I46MPPzJS5F6E2vRLL0PJUBmVcmtnT4iiDRgBLsJn
 uOicmQuxO/buddTYqlH3VgCG3eu2ZqQvKYbdDGS3wKyU0Rsh8FKqvpE5UqDuQRWUbzdGLviferV
 UrPe/hLFX74MeRCTpAyIGth9MMzmF5JB7sJ81zruVuy68mI5/RKerEiGCrocr7l1ffcu4M64b/L
 eaBxz2wzxkH0n5gVrqX9+TTCOYNESZOx09GFpdeT39KrqxxuR8Kh2LxbBPhJJa08sE5D/9md9Zz
 9Sbji7rnvDeLH+z4NHPfHFBmmGRFfbSf8cntHP8pT2WmlafmYXjfr8tLyPLgqR72ThUH09XySEH
 F0lFVtUGy8fSjf7YR9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE1NiBTYWx0ZWRfXzJxdP8FNv6A3
 q0FL9g+RaCrbyJFwqfNFzhaK8L7ALiZpy7FX8fLPxz3RksyPF2zw27gYaIZOKOIrdz48yq78I2R
 WgHIhx2maXA5vslOVa5wyU+t5PRTyZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-115219-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:imran.shaik@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 887BD6DE1EF

On 6/29/2026 2:16 PM, Konrad Dybcio wrote:
> On 6/28/26 8:23 PM, Akhil P Oommen wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Drop the sign-offs that don't apply (presumably applied as part
> of shuffling around the handlers of the patch in the in-flight
> tree OR missing c-d-b)

Ack. Thanks.

-Akhil.

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


