Return-Path: <linux-arm-msm+bounces-64897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE1B04D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 02:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C427E4A1D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 00:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E75F199FBA;
	Tue, 15 Jul 2025 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKWnFbnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5DD157493
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752540072; cv=none; b=KBDCJYyjI2xVA376i3DJDA0NqYpWA3qeBIc3+hqTb8Brn84p7UsxUYb18/dVAjj9MjolZ0HhnHKzFzqVZ+MGS6e2NJem9Vzk5FrJq0CjJfW/SV3VYyTu8ZAFpjDeBEhQUmF9OULSnO38rSKVY7IncxqsYo3hMYPcZQSkgFT3fmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752540072; c=relaxed/simple;
	bh=/fpeOpzdtrvMaMBvHjLFsNU8U+wmDzW4BOVzVwKT8Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJwbat8RcQ/rk0zuaiow6HemlRrQ39D0m9UGkiNyBdHDv95/2Q+vL1/F7E9n0EE/n5zRGoWpWmyLKzSb61E7rN1vh169IBLkQ/Vs+34DfoO+Sk/dibsAy2CkpvSgNcyEhE04NfrgnmMq3K4aUYP30hQ8lb0azzfdqlXoj6p8Ubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKWnFbnW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EIfqrB000703
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wODJleHZ+bVcBgLQTtzGXHzrVqiJgA68FlyszfYFYek=; b=FKWnFbnWGotIx8hu
	v6oXPGBfNGvBWCFQ0pFVoR8JL3g2qXR8CaoqHR8FF/guH4VNKz9xeLtxnmCjtn94
	eBG5GCYHF6lCt2IWX1rZZH7XiHBsym1PO+TLGOQEZqmXqcGNUNiBnjo4hJKVBNo8
	MQJANvaMixLhfBCf/+XEttcHmpb+dKvHUFloIi9aAAKRlDqrCGwsm5iOzaONXBWe
	+V3NWd/o4UNMuFzRh1E+R/nCI8FyRamHq2rqgEjavuAq0X3HuIPKXuvHSIqe/q9k
	TF2gyBByfsJsE+gBE/7Y7IUP3D8rAd4RkqIl4viv+7PwrH/4y/jiarkMwKkIAbk+
	m6pkEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbe92q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:41:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2349fe994a9so43567825ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752540069; x=1753144869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wODJleHZ+bVcBgLQTtzGXHzrVqiJgA68FlyszfYFYek=;
        b=crAewqPWpxs882OaMYFZ2vYDO+ijFLPOfFgxPKt8NeRL73yjdiq1xQ/v0Q46sJc7wz
         t2/noR7w3QBQijTmQ87Mmo0NUPZRAAIJwifDwsMa3CKfNNT7K26P/AtCDXFHMzADKc5R
         e2DP4kLv602ilhI69sTKU+67C4HesTTMFlAeYgYjHcrE2FtgRVD69byZh3MSrXDPH6y4
         pew4W2OHJuS+FHsD34mDGyUKUEeIJnJ8eTnpt7IMjCisGwcz0hgZbv4Cai5sNpCG5Hnn
         +6mdPIIepduwRKQ35j3T4gq/V6RWgt78m9r1eQLKfFeKJWgghdSRUUtkujIflo6/B1ow
         rW3w==
X-Forwarded-Encrypted: i=1; AJvYcCXH/+b+o6U36QqqiC5reGlg6WoK38cjCnMSLL04trDQykUUAL9r/rXWBKjADhC0c3xukejpWfVCBu1bMTDq@vger.kernel.org
X-Gm-Message-State: AOJu0YyIPT8Yj+D2i+Gkpr2WF80R1KibNHRCPHqeB5s1smxZZnlz0ZcU
	lxTyIgoluGd5cV8lYRGFC6pCsXa2C1/0CE+vKWCPBAS31HduAdjI41OrdMVnihtI0qm0GcRfq/J
	E4IC676BsJZtYUsNqky3D+TpaL34QMdQTimrk/yutGbMVwxNQc+3fxX00i9pvSAJnOR1VG1msyo
	tL/aM=
X-Gm-Gg: ASbGnct4r4BY0tYcAOASddBaxU+1At67PKcevHa9iCd68mT74ntalTdcL/qjEflL0mj
	rqWgCiAxs0AI1HOY66L1aaGxW/mrGjIm8hkRqkBqJawrebBp3VkOPXh9YcpUEura1lzYvlNNtus
	uGbKzIW2h9JKVNgW/ggZhqa8zQYfa+Wk/DNGDvj0ekIJOgGoS4wJIZCIjEmIxK5OCyLcLqJOoJ3
	NELRBqmLvMuE688Zb1MwLUyALOVjn4hSgxFoBYgS3lc2w1cDVN8EUNxTuFqJ+CyYQ8bDeu3Hh+X
	6VHSEOZbICK5+hVbaFo0KKlBul/8YlEJ6y+MwAMZG6QDiIRmOQ3PsEZ5/NZa1nHw1dA7poqhpef
	W/kdAwKPy/FD8k0KZcFQ7FQTQ
X-Received: by 2002:a17:902:ef48:b0:23d:dd04:28d4 with SMTP id d9443c01a7336-23dee2a0946mr248519815ad.43.1752540068862;
        Mon, 14 Jul 2025 17:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdmamRBVee1XJcy8VnXWvKBcAqzZnAQTh81D4R2wPJZjMPo/wxYIsxmLIYNDX5XWYHIlCWPw==
X-Received: by 2002:a17:902:ef48:b0:23d:dd04:28d4 with SMTP id d9443c01a7336-23dee2a0946mr248519485ad.43.1752540068456;
        Mon, 14 Jul 2025 17:41:08 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4343e48sm98825605ad.190.2025.07.14.17.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 17:41:07 -0700 (PDT)
Message-ID: <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 08:41:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwMyBTYWx0ZWRfXzI4eZVcjtR+E
 e0AszYKVBjjsoaoWND7nkW49FA1bXorXDA1/BlSvm+GuVxc4u4o67PNlyunaRmnZk3HeEkAIrD7
 ZammIodpb1s0FoUKb6gosSEFufYXCRzvE4x30zFGOn4du6QK4jOYXAmMy7sRZTSM9CbLLUVlDaP
 5Rl99BkSLnL8/MLYr/yI0tWcpNFdFHCHkZMXKJdZyCBknnLeWUZSZhIhcnVhkmv18uue2Hr44Na
 IB1kr2k6OkSQh43U5GFrRZBW7m16zfVvL/MHtoZ7K1nRKhtck9FWTpSxN4WNOcjjVPSfPMwRSw0
 gkOKFhu4c7LdRoiFUfAhF9QsUP510f2mkGHdinPFfIzBXff+xZFL38ty2xp+16ZTyIL2R/N9ofW
 +9yK9nVGt5TNIucX7vxfmyW/dg9V04TatHkwpOtDBI4GqqMEznuyF2pVpDzKz5aRwAlFfVZj
X-Proofpoint-GUID: jPeHAMqjmElxAyxRTPuk3eJc7_KYyNnZ
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6875a3a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fSwdLtKwHKkDrnzOdDIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jPeHAMqjmElxAyxRTPuk3eJc7_KYyNnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=934 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150003



On 6/24/2025 5:59 PM, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.

Gentle ping.

Hi Suzuki, Mike, James, Rob

Can you plz help to review the patch from Coresight view?

Thanks,
Jie

> 
> Changes in V2:
> 1. Add Krzysztof's R-B tag for dt-binding patch.
> 2. Add Konrad's Acked-by tag for dt patch.
> 3. Rebased on tag next-20250623.
> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/
> 
> Jie Gan (2):
>    dt-bindings: arm: add CTCU device for QCS8300
>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> 


