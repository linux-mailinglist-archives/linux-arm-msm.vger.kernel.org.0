Return-Path: <linux-arm-msm+bounces-82879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEBAC7A4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 18A0A28B8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA88299950;
	Fri, 21 Nov 2025 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io0bpT/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLod4hO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBD283C87
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736638; cv=none; b=SyPVGzkC9eC9Tmg0gVzgGb2ZrOkkwcK9UWVNf2slZYyzxE5CmYSX3z5kQj2BqzYANooIVNDB0FhtEVv0PMUz4co8t+uo23U1ClJkwYEEQhiThsR+/6eOMFGgh3ihq315Do5Xiw9hzKGT9f6gunUoQ9ySgoyC26s6mQGXD6zohAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736638; c=relaxed/simple;
	bh=fTzxInQXL1PW/7RxVGDfFpO8Lq1pdHKtjsjlU6dwGtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hc5asTC/MqWwKm8ST+D7LTFwZ9//xPPqWYJgdw8/iHmIpTKYDdrB8moynb400smjdgFFdNtSZf51mTuP3nuKTum4PfjgNsfqmO1xQ8GcjDP4rITvPbW5up8XfT1Lc4wjf43NG5KGR1eSflFW9mP/9Pi/suieZRaKT/89bT035k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io0bpT/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLod4hO0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALC7jgA2841258
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=; b=Io0bpT/EpkpXSFLs
	D91WsCR6qVXIp/UbEh+epgzpRqth9vIzKDpVF4kI+bw1DeoY0rzGBSd9wltA1VfO
	O8OLJFFD6DiQHsaBDr3tlaMvNtvrjSGV+N4gD8bHLg1WfMZvseQkHFFO2hU3jD4y
	WOhU0hdEkQs07PdQj7NfpnJU/XZANUq6oW70ofjyNY9tfaq0GtswfqtQGrv6tuGO
	KPWUNqwhnbmn5b9qNQ0ycvRd33eNdoiv7HRK7MdcAxP0GCnkwXOD/EIvkim1eLzd
	93arcj2qwfEkGcsjHDpBChKRHLR4+P388Q635cOe/f+nEhbu2lnxb3TfgIaDy6rz
	iO3h0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvhupd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:50:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed5ff5e770so4303181cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763736635; x=1764341435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=;
        b=jLod4hO0Ti8EUIc6Ta9odSt6HaZQL/SFnNbXc2cNFM+kFIq9bcuO3QmAvqEYPNoJtV
         vkKdnzMG4fqhTjaHbVSV70YCr4B7yuya/JGNt4gSvg1bhx9EKUi98J2QMl73GIg6l+LK
         OzJu8E40Vf1BXyt0QypM8gsLmrNmpWu5vldNPdDMvohNVmJdcW/b/kxwmvVeJaXNBdEQ
         qOkTqdQ5Zg/7spy77D/a+cqp2xWP3VrWI2t/7uk3C282uTGyAu6f2ckPyqNxhnAihVBy
         9rBzIIH8kW8DA5OM5T7h0KLLaqkFeJrFQGO8tUnydOcqs7bzypItJZftLEwch2X/oOma
         sKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736635; x=1764341435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=;
        b=uLLlA7ihaxlb8S46FmIgUWyrmvCrj/DCeuJcv5TcAeTQUBJX1RKk1qLrr4seFelBuv
         h1ea5p0ZYubpnzHL0VfxgrSAKbgZFUiSeZ+EzkQCKaHyeBGRzG7vgbvpdHr0gwN9pmzx
         sUSUrxqxLFwgDTg4SYSql1h4l6WLfYqlGiPVZDQCD0OcfZMJVwdz04hPE4O6BQhw8ffU
         wtgxsFXaRubThQW4n/atA1H5kHSq4MYkJA8RYlQ4WNgFqmagQiQ2bvrJFruZHFQdHlVv
         Bx75vnEMuyeda4HUYvPHNV8k5Iz12qkLxh0UrdgPnwbiFBYXxx2mMG1cCvbMHkSLUbsN
         E6wg==
X-Forwarded-Encrypted: i=1; AJvYcCWFDk28pfb3b0UQJ+/yXk/+fIhoFzj/GVBvHKQo6d6TG28mKsj2VdLf3ktsWgwwtDBKZD4bh/vqNx7bNl/s@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqQQ++CzmoSq4bfzacaplXTPDb/UonA/LiHeV0kvuMUcyKaJl
	2CuSEDnfG3dPJtjAn0QEQg9Bx7BeJ51cE7gnxjVNB7hSktDGwcAkIp+DPl+pehJGr6YOZ6+hcPL
	S2/mUXgmpIuKow98sb7txDYi7Rf/yJc4+8r4mTDBOZqflrBd4F6s30mENdHiflmnShsXn
X-Gm-Gg: ASbGncsR5K99pC5HbJiEdn1qQUbjTZHBatPBl3Oq9826KBsFohQbqCdoX1FZHgyODt7
	7SG/uavHrwCyRbBBVyfmPdKzY4ADhiqMSiBfjpkn85Df0HwvwAPYNS5tvRe+KEroVMTgpM8BkCl
	aGFa7hZnvzGhx+kPuMZY4Qs0CUUVnrk0F9Iew8jFfvmIcE1dpLs6wKgCFHWFNsCaehFTPDnv1hS
	zBpg20pBguwWH0wVRnWhbZihqwIfKLOtavm/gJa2B6tyvj0KqEAsVzoMz6CEKR3GbE2Rx4TazCK
	1a8ED4VzqnkeksMXRpMJXaFnnJhA+Bmp0X5XMiUbbp9NXpeCOoUB5x6xLN59KbBFEDa/ZRiMDR/
	svP8WEGxYxu2TEiTMULVHHa9rf0HWh/q6gmjH6Q8xc/eL7aigUhjz5nxu2536CBG7UQU=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr25444391cf.1.1763736635180;
        Fri, 21 Nov 2025 06:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxj2AABKQQlV7xQ2ap9JjI3812ONi/dGdeAeCium8JGunYEAvRHgpsHbcoAjOYZET5U86ETA==
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr25444141cf.1.1763736634749;
        Fri, 21 Nov 2025 06:50:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b5a46sm4708560a12.8.2025.11.21.06.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:50:34 -0800 (PST)
Message-ID: <3abea679-fc83-4157-9d2d-587354b85c68@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:50:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: warn and fixup on sanity check instead of
 rejecting the driver
To: Val Packett <val@packett.cool>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121010756.6687-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121010756.6687-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -3zQr4VFILS_fAX5U5g-OU-ZrTCxb9RC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwOCBTYWx0ZWRfX8NlCWBZ9HVKs
 ZRdk9+GjgGujUqxLO6Wf99pMrqx/LiAPZe2ySKOX6TGj8ZiMafiTULPgMNOqagk63XMjqVWceYE
 u6g6eqY+KbJt8xw6h6A01b12qbZcEMXR7BUj2++V/ATWolv3UxHFaQGFF+t0UhXjpf+BqGvMH4N
 cX4v2IcYzjHULkaMgy6J3w9Bqe1ETpTOZ4O6wHDprJrepZfv8wEulS/B/ABuEgR8Wgmp8Cwa3F0
 25Vd6HPlcI1AdLKwZaA63kPYhJ9Rsmr06IhH0riNSwQRgXn7nzXZGoohKS5uc1MNnTUJOzPBHVZ
 Q4UNbcuIx9C3eP4jtJU+cWhkpErRnxgbwpcLXknLFCwqJZ2fZ7o7nS58jXwYS+V4A0G8Us02vwo
 FziwcXVsAM2jb/IBvhpe+3oq6QGPzg==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69207c3b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2g0XylBXbUAb_SZQJ8YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -3zQr4VFILS_fAX5U5g-OU-ZrTCxb9RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210108

On 11/21/25 2:06 AM, Val Packett wrote:
> On Device Tree platforms, the latency and target residency values come
> directly from device trees, which are numerous and weren't all written
> with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
> trips this check: exit latency 680000 > residency 600000.
> 
> Instead of harshly rejecting the entire cpuidle driver with a mysterious
> error message, print a warning and set the target residency value to be
> equal to the exit latency.
> 
> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and target residency")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

FWIW this is caused by:

--- hamoa.dtsi
cluster_c4: cpu-sleep-0 {
	compatible = "arm,idle-state";
	idle-state-name = "ret";
	arm,psci-suspend-param = <0x00000004>;
	entry-latency-us = <180>;
	exit-latency-us = <500>;
	min-residency-us = <600>;
};

which notably lacks 'wakeup-latency-us', which triggers this code path:

/*
 * If wakeup-latency-us is missing, default to entry+exit
 * latencies as defined in idle states bindings
 */
idle_state->exit_latency = entry_latency + exit_latency;

which fails this sanity check because 500+180=680 > 600

(which would have been good to note somewhere)


+Maulik can we fix up the numbers somehow?

Konrad

