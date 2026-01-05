Return-Path: <linux-arm-msm+bounces-87375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA0CF21B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 07:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EF1B3009484
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 06:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26902BF3E2;
	Mon,  5 Jan 2026 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2F1stD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcIUjAma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6A7221290
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767596354; cv=none; b=KPIRz0iT63nWCEQBzW2zublQ4r4TjtPHkyNK89gRMTBQ9BFpLzC0S7njrJld1yoI/ethBRv1KOxEB+pzVIU+N6ovdLSyN7R49x0ojZnlKmk4mru32dyDbAhhyeraNhcCd8sCDroXSQldt95UZq7F/mrlaN+fCX5FLRbZ2uteLdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767596354; c=relaxed/simple;
	bh=9tg6cmKni91qJeyOldDk53vFd5fa/7dVnS38WnIDGlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AR5Kf7icA6/h9BoBocH37ETtzvk/1smD99I0Z1WEwv1/6hwDY4Qvkj5rk98sb4C5tp2HqoMEgp6DphWlz8Xhj2wLHtgFgznIJDxV+lGLOikwiRlPek4rfMc23pGA6NYbwZWt0mxklGk2qBswQOHZ3qSHp6YHeugYbYKpI5Yh6Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2F1stD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcIUjAma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MnZKu3862012
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 06:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tg6cmKni91qJeyOldDk53vFd5fa/7dVnS38WnIDGlA=; b=m2F1stD0/By+ujgp
	+1atQorc9QlE33XuZYONDgdHpdciwjEhMShzJH7wtGOJzncDChbQAqXWLWpXC6mz
	d9MAFs7ywFlBjfXLRmdIJYvPwQGTzqklrWwKE6ohB/+ppn3+G10qlZ1F9t4yQh7B
	8n+8Nf2vo0bRNN5vrVTsm9BScAMkJ37FY337bntaOMyyzBKWxS3ACGh5N67LGdKn
	tDSgRpV1vp16mHUnpjZwfbxGaU/lx8uRHVxEM+LHFTCozUi08Lxc+NmfaAReNEuP
	OuXxga02CYodVdQDs1eW01FpA0THvwAdLOBThOtYxBVPmF682GHdNHQjbzJu4yGs
	gXdS5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0h0aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:59:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f26fc6476so237362515ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 22:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767596351; x=1768201151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tg6cmKni91qJeyOldDk53vFd5fa/7dVnS38WnIDGlA=;
        b=hcIUjAmadqkIkxRushwP3VY1raWj2BC33yNo0dFwYVvMidP3sJPopjwjT6NhZH/vMb
         3mtgnZABmwi4DiMq8KdVzcYPEx0ZSMXssnBamTjII/IL8Ri527ZHA6LEzl6D2tYqbcqN
         Bc6eV3Ri09se1vtAxuwNaEOJjNcUyDw5GmOIXB5+O80cQF0Si28qbf5jSAod7nRTV8dZ
         D4XG/YLYxiHAM0KUhaMuK2HByKhn8YyF8wjoPRGbDOsEqEaUOf4p5TOl6WdOsXet6J+0
         dImanIiT9xsO0gfBboGRIwGjWiSvYENHJ6jUCG58bjSlkwnMbXXqe0O0TttzR9v2izwm
         CDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767596351; x=1768201151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tg6cmKni91qJeyOldDk53vFd5fa/7dVnS38WnIDGlA=;
        b=axSQrzeBj5nG5U8HZLmKGTBX8VxtzDRxfNxjnMfdQpHeINX8II/6nGdp310CfLIb6Q
         sVD+2w4wblYZNS6FaTzWIGEow/CcmzbS18cYaG3hd0yzsmeaAKUjFmRuDQz4mrBKF40V
         PovQadj/GSF16LguGEXTQjsZzzudplacvpX3MKgWFwM5J4nDUisDvpElbuU1ObnMDFqY
         FlIBxplNTPIImfixkAw5j5rNpij0FYvLCBc/yE6/C8LraPNAGvAg1EwECEY+k75n0soQ
         8XfJm3xlaPxKh2lWoB9rIZNMEJ8qyVq1LTUTX6rrRtw2o4p256UCe4ALbynxabXG96+S
         Q4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW/7ePMMmsyCXuJYwkRO38TlFxuJALRIJZINHqX+yN8O6gKDhLN3wNhoKwPwwV1caZbcS1CSDHIAM3OUX8e@vger.kernel.org
X-Gm-Message-State: AOJu0YyVqr5fsfVo5ACV96Fvw5vimfIzUNEbFjfVctaPXdrbodltA+Wr
	iKTtK9hY8YoS8+FVtDG1O6GyNBGQ5Pmy/bzXfEkiOXXYaBd46Zs+iHLz7Ad/GULdtqZsVYkFk7a
	CkaTb6MNwbLM/4jg8iT4rMOY+lSwaxr2Bpb+reC23AXC/HdPhJRqvOvhWnjbYIqiOIdFp
X-Gm-Gg: AY/fxX4uMovH8epI9q0FUfTJECctTiay6Cb3lPOM5wMudXJNOxOIC7CFYLzkOCprd3x
	rwYA2wwWLptG2vmf2g5jCWMc0e03IgYSt+8Iz0MVd4RG92jZ8i400mo7K0GQ1ZAuyah3DUQMVSS
	DGnlPYWj35Cxzy5XNW+PrIhGS8Kytxmof9gkChwYYKsrsVlQf1Fq6/m3/skydM4wQuH2yiknp8v
	W25haZ+WOUJANSP2V42chuJXhvaNO0QoHth9N7BaoVgPgdET19rOX2WtsbN7bOTkaXOkCkgFq4c
	S46OktnHYrDXn2CQHsyhSNpBvKo//ekK5sUHfHXSxJa9s9550wqO2PfSFT1tYKeLf3n4jAngIHb
	91FbUYDuWp03lHxbPOaKh0YO+T+n5hSR6vp8TWFCq+6ZtcbMxSyFcYpflCizQV9t37i7X/ns0mr
	1dgBAwmWYaZKqRhGwHQiT5ofAPAww=
X-Received: by 2002:a17:903:24d:b0:29b:5c78:8bea with SMTP id d9443c01a7336-2a2f2836c2fmr461162195ad.33.1767596350865;
        Sun, 04 Jan 2026 22:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy6WPBIrh6wcO/7G4RNW3FnXx5uWBjdvCAxC7e7PK5eXaK1UAHb7zE2ir/D7QOj7klabh3MA==
X-Received: by 2002:a17:903:24d:b0:29b:5c78:8bea with SMTP id d9443c01a7336-2a2f2836c2fmr461161905ad.33.1767596350339;
        Sun, 04 Jan 2026 22:59:10 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d87fsm435726525ad.46.2026.01.04.22.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 22:59:09 -0800 (PST)
Message-ID: <aa62b769-4be2-4e6b-b2ca-52104391a757@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 12:29:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Update max interrupts lines
 to 16
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com
References: <20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com>
 <20260102-fiery-simple-emu-be34ee@quoll>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260102-fiery-simple-emu-be34ee@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b613f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=i01SU5i697ricP_RhYIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA2MiBTYWx0ZWRfX1S0+rV6rXG02
 ILWak6N2SqXZXjeAdSDv3KquX4pjzpvdXcqIvWOURAuHuRTRyOhWsuo9k33QuLLqdn4T5FRRz+B
 Urg3MDQwBWkQXv2BHj+IqdhhrP4wH/98nwoFKdr846RQmpiouoxh4DnrlmKa2QcQQsCIgPYLwHO
 CUDCYtrHnGQyRcxC9oQWe3dwVoCDDs5LvN1zQ618S5rTU3WTwP32R8UrgYF9nuJEv59NNsiEgbz
 YzO2EKeLhZU4ds43ZkWAiwd1UQVTDnNIsuFeg92PEcbX/JRhve81qjlNTvdJL1Hf1KYXaedCC3y
 u5nFxjfP0VTLpTd0azYkxsgq9qcuUVlepqyF60PQlzqykeUV2eqZh6XuzcdFoWsiw17uWZ0Qtkt
 4MyGPTTnonvlMDcy7X/aK9pW8/60Yzcygd6YNhjkjWsj37Y31iDKjYjOj4GvVrFhYLLqkItf4Dx
 kxXDE1nszSjxvj/737g==
X-Proofpoint-GUID: UxR0pjRy2E2QSJ0qBteJ4HrluwP034qs
X-Proofpoint-ORIG-GUID: UxR0pjRy2E2QSJ0qBteJ4HrluwP034qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050062

On 1/2/2026 5:57 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 07:01:14PM +0530, Pankaj Patil wrote:
>> Update interrupt maxItems to 16 from 13 per GPI instance to support
>> Glymur, Qualcomm's latest gen SoC
> This has to be added with the compatible.
>
> Best regards,
> Krzysztof
>
@Vinod can take a call on squashing, the glymur bindings
have been applied to vkoul/dmaengine next tree.
Let me know if I should resend.
Lore Link- https://lore.kernel.org/all/176648931260.697163.17256012300799003526.b4-ty@kernel.org/
SHA- b729eed5b74eeda36d51d6499f1a06ecc974f31a


