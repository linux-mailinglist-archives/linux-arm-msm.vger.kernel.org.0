Return-Path: <linux-arm-msm+bounces-67209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6BB16B70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 07:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3700E1893779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 05:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C13B23D2A2;
	Thu, 31 Jul 2025 05:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLURZnli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14C23D2A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 05:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753938429; cv=none; b=ibhakrTNqAlm/2Snv1eqAX+JmHLGDRLmRjt9skAcjprxfvibLYdKaXb+RE+9TJ68ezy2po1XJvh9EKxYsj8KnutdwI4NHQAmfVSDB0Llag24lnAVAVr1aw/k81QObh/FO5rReU/KYbtRZDutU8y9kVQe/GtRQ3WUd6yQ9btlUQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753938429; c=relaxed/simple;
	bh=oMD9ojuEqSC91r1EtgsZ8m2Uv7me0vD4qN4P4+iAElQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joh4mAZKw+j0PaVaDpW4INg4kUJwGdmuDNY1aunT295GmwC+usGkBw7URrA0J/E/6Rx+NBCbVaoEfvrh2spulA9pNLUyQg+/xwh6b0jp/8QgAC0Nq+RnTDU1zrSrVm3vS/9b4wMN7m3kp5Bg7UZGeqYhyN8vSqPz4Y1DBtGRLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLURZnli; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fWMv003756
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 05:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdm4gXLWdVs5flQzM+AWNBlwOFKGXX/VfQzEuW5xlxU=; b=DLURZnli+jI0/Dhh
	V51nnbO62PvhNn3SwX1zE4K5eq3SRqc6NnfSjPVEGaSC1qcYZl605CqdLO86kJrk
	H/Ie1UJ+pHXtnj9JsPAQa4IKfOeLW/OWHWl9AdpmBCDRMS3Z8P87JqRD4cLBnwHV
	DghJ+fJIP4k4epiHkwOXRsQxvZV2NxFRQHGpb6+HWb+LRHgyRoCExby4ASkicpHC
	ml83szLswhcG182FZFldUX41y34+/uz3+WXL+Du3Nhw0vDbRzAhgpfcDQUpeecUD
	+I+c9T2iKhbnT2ub4SfX/flAAVNazX+P2ynwcqTJw5D7J7GTaLyIRTByvozD16Bm
	4muGbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm67vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 05:07:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fe2c31e15so1990515ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 22:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753938425; x=1754543225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdm4gXLWdVs5flQzM+AWNBlwOFKGXX/VfQzEuW5xlxU=;
        b=iXzLv6dL7RZX1RHyVgU0t8+0bYTCMMNvaayfmPr+l+E4Uqg9a2yHSwnOIz0jgwBWny
         pUG14bCk5ge+vcwzQv2t8iVkrFrf2gu0ciSxtIvBrPzfbqF8D9v0urHXJwmEhneIgl/O
         8hUPKlIRmzKpDSRn10rO36TKRNsfhIRH7bx3dDre5F3YipRoKjnMI8oBVIQh6W5HVl3i
         ubanIwa4daqHNJHwtqnbhSFVlbwPjJ3PrSniYNFNFxz4Afboqr4q/kI5Yg8hhUetNtwW
         12yhtQGEEItUCNx/ajq4J6ns2KtaB9T21hPrqHfO8gpiHGxpm5mjAMPYR3+/w8RerPOb
         uLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVaKp0cGG2Tr5sOYHLwJct1MLt/XqY+8tOB0/B65GtTSrHFlsvKdwEaAQxQgovciDsAVreW4+QGRje34SRK@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4PswnPCQYXqSEUZ+AwDYva1BinNU1tEt25LAHURxe6tYDKn0
	QqtMsmD1gMYOlfu6C5i8VCa8cUEsy/BhNjFPBWZB05gQAciGO1iy7vbej2s54VWjr5+iRXz3aFR
	EiRfRPg4IGqfj9d6pkuOHBD0lZmvb3s4GzrSydvLA5Y9O6v7NdKdBRDm08sZpgnjKyeR2
X-Gm-Gg: ASbGncvRxlE8ldZEU55H+crtVNHlm514eq0yWRznWhzkkJKMrxC0gOW/u2BnriePfGg
	CZQmHIk/aFpN+mVwDc1vW/4lZWFqpiHZUdjeCNjLlgUSLY8P9qqYIcomaAAgIXu5/eYlMWXfUcN
	Ul2ytRCU/E5b0nJ7FETbK25zWlqFmMebpBI09lhU0FV1+eH9CKcq6JgMmmRXJdJacl08/sLUOo/
	S83RXZFfkeH7L+PJT3Gj6upV+/ObIkJhAvMI2OghmyVz+rni6rNeae1XsdwWBayzbJrlAzH751+
	Ouo1ShAgwBXqKvvihlvyynnVO1DmbePlTTYUT4G/WHLj68Z1zYp+qnnjZQ9OU0oNVOjMR1CxAkW
	+KPQIodt7RQgRqO5y/15LEfGoMfzc2A==
X-Received: by 2002:a17:903:1245:b0:240:5bde:5356 with SMTP id d9443c01a7336-24096b43fabmr34301415ad.12.1753938425053;
        Wed, 30 Jul 2025 22:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpuslh08k6M34ym6YfFcMckHCuWB75owSXY1Cvj445vcdl3T8PffXsxv+Hr0oDFjwXUsQMdg==
X-Received: by 2002:a17:903:1245:b0:240:5bde:5356 with SMTP id d9443c01a7336-24096b43fabmr34301165ad.12.1753938424492;
        Wed, 30 Jul 2025 22:07:04 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cbdsm6670135ad.75.2025.07.30.22.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 22:07:04 -0700 (PDT)
Message-ID: <bd8f8643-a8c8-43d7-b293-acdba5ff798a@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 13:06:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
        quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
 <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
 <w3rwao5wbmstdyics6qhp7beulbbp5ludqkwpfsmevgqmzz3d6@u2e533zlitkr>
 <e5a3f05f-9775-4e3d-ae7d-ebbca14b4df5@oss.qualcomm.com>
 <ffdvzupefzhqq7fqtloycc3xzu57i55ths73xcjftor2cifuzr@5vhq2hfmkvda>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ffdvzupefzhqq7fqtloycc3xzu57i55ths73xcjftor2cifuzr@5vhq2hfmkvda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688af9fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8
 a=mDTR1APp6137iyMtkm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAzMSBTYWx0ZWRfX3AsetbjQ1pN/
 EqHqEVKBQaucI99+G1ISl6RSxgeQkXyvavJouXkOfwK2gZev+BFnsYk9OiBdViPMMsdOdTLoQwm
 V21MQn8HnSiNrbOaLveIzPk57RJHFfFRlQfVEa3la2FoLMxC/RGj/f8iKAI03QJWMSvBdlkL1me
 ZhMbxmpBbKbqGM0W6SP0dwIH2t/fPT4LUPGpPpaq1QLvvPsqCNVrKMYLnBu7k0vfVygvgz8XWGy
 rNG9i64rkDVjIxRBW4Qw4Ako4KNJQQIIe6rQXpkeUomKPpOphYDSc+RFf6100q0x2/vlwDlfKHE
 y4/qZ5L6ynBullMwnJ+SHqY8XgtcqwmxOBend3TzzAPymmN8L8/9UizmijL/qLpy1Xiwyczpvem
 Phk8asRKoNf5jJ4WUtQpDsjs3z214uZT1Fd9VCaVgBbKzJb5cs4p6CcYsDRloB+4eU4WEO+q
X-Proofpoint-ORIG-GUID: g80WGRBZe3XjVid5frDKFkU4ddxXllKs
X-Proofpoint-GUID: g80WGRBZe3XjVid5frDKFkU4ddxXllKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310031


On 7/31/2025 2:35 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 30, 2025 at 04:53:16PM +0800, Xiangxu Yin wrote:
>> On 7/22/2025 8:41 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
>>>> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
>>>>>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>>>>>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>>>>>> designed to operate independently from the USB3 PHY.
>>>>>>
>>>>>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>>>>>> standalone and does not support USB/DP multiplexing. The binding
>>>>>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>>>>>> cells for proper integration.
>>>>> Simply put: no, this is not correct. Even if you go to the SM6150 block
>>>>> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
>>>>>
>>>>> I thought that we have discussed it beforehand.
>>>>>
>>>>> I can quote my comment from the previous thread:
>>>>>
>>>>>>> No. It means replacing extending existing entries with bigger reg and
>>>>>>> #phy-cells = <1>. The driver must keep working with old node definitions
>>>>>>> as is to ensure backwards compatibility. New nodes should make it
>>>>>>> register two PHYs (USB3 and DP). On the driver side modify generic code
>>>>>>> paths, all platforms supported by the driver should be able to support
>>>>>>> USB3+DP combination.
>>>>> Looking at the hardware memory maps:
>>>>>
>>>>> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>>>> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>>>> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>>> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>>>
>>>>> Now:
>>>>> SM6150: USB3 PHY regs at 0x88e6000
>>>>>         USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
>>>>>
>>>>> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
>>>>> can comment on it.
>>>>>
>>>>> But based on that list, the only special case that we need to handle is
>>>>> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
>>>>> it will be handled anyway by the code that implements support for the
>>>>> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
>>>>>
>>>>> Having all of that in mind, please, for v3 patchset implement USB+DP
>>>>> support in the phy-qcom-qmp-usbc driver and add the following logic
>>>>> that also was requested in v1 review:
>>>>>
>>>>>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>>>>>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>>>>>>> powering on USB should fail.
>>>>> I think our understanding might not be fully aligned. 
>>> I did not write this. Please fix your mailer to quote messages properly.
>>> As you are using Thunderbird, I'm not sure where the issue comes from.
>>>
>>> Also please fix it to wrap your responses somwhere logically.
>>>
>>>>> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs. 
>>>>> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
>>>>>
>>>>> 1. About the TCSR DP_PHYMODE Registers
>>>>>
>>>>> MSM8998/SDM660:
>>>>> 	Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
>>>>> QCM2290/SM6115:
>>>>> 	TCSR_USB3_0_DP_PHYMODE at 0x3CB248
>>>>> 	TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
>>>>> SM6150:
>>>>> 	TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
>>>>> 	TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
>>> SM6150 has two different sets of output pins, so the first register
>>> covers first set of SS lanes (which are routed to the documented SS
>>> PHY), the second register covers the second set of SS lanes (which are
>>> routed to the DP and secondary USB PHY).
>>>
>>> I can only assume that the same configuration was supposed to be
>>> applicable to QCM2290 / SM6115, but was later removed / disabled, while
>>> the registers were kept in the TCSR block.
>>>
>>>>> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
>>>>>
>>>>> Additionally, I found some interesting register documentation for QCM2290/SM6115:
>>>>> 	TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
>>>>> 	TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
>>>>> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
>>> Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
>>> If you check the memory map, you will find the second VLS CLAMP register
>>> for the second USB PHY.
>>>
>>>>> 2. SM6150 Test Results
>>>>> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
>>>>> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
>>>>> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
>>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
>>> Here it still programs the TCSR register.
>>>
>>>>> Based on these info, I believe these are separate PHYs, and only the
>>>>> TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
>>>>> mutually exclusive. This is why I have maintained separate private
>>>>> data for each PHY and implemented Power on mutex control via TCSR,
>>>>> rather than using a qmp_combo-like structure.
>>> Still, no. Check the block diagram of SM6150.
>>>
>>>>> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
>>> Yes.
>> I checked the related PHY series and block diagrams again.
>>
>> PRI and SEC go to different nodes based on the SoC design, and there are two types of configurations: USB3-only and USB3+DP pairing.
>>
>> Before proceed the v3 patchset, I’d like to double-confirm whether the following structure is what you expect:
>>
>> usb_qmpphy_1: phy@88e6000 {
>>     compatible = "qcom,sm6150-qmp-usb3-prim-phy"; <== rename to PRIM
> No, we already have a compatible name and DT schema for this device.
Then current compatible name is "qcom,qcs615-qmp-usb3-phy" and shall we need update to "qcom,sm6150-qmp-usb3-phy"?
>
>>     ...
>>     qcom,tcsr-reg = <&tcsr 0xb244>, <&tcsr 0xb248>;
>>     qcom,tcsr-names = "vls_clamp", "dp_phy_mode";
> No need for qcom,tcsr-names. Second TCSR register should be optional in
> the driver.
Ok.
>
>>     
>>     #clock-cells = <1>;
>>     #phy-cells = <1>;
> #clock-cells = <0>;
> #phy-cells = <0>;
>
>>     ...
>> };
>>
>> usb_qmpphy_2: phy@88e8000 {
>>     compatible = "qcom,sm6150-qmp-usb3dp-sec-phy"; <== SEC SS, use usb3dp to indicate DP capability
> qcom,sm6150-qmp-usb3-dp-phy
Ok, but for this part, shall we update dt-binding in "qcom,msm8998-qmp-usb3-phy.yaml" or create a new one?
>
>>     reg = <0x0 0x088e8000 0x0 0x2000>; <== SS2 base address and offset define in driver config
>>
>>     clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>>             <&gcc GCC_USB3_SEC_CLKREF_CLK>; <== This SoC has no USB3.0 SEC SS clk
>>     clock-names = "cfg_ahb",
>>                 "ref";
>>     clock-output-names = "dp_phy_link_clk",
>>                     "dp_phy_vco_div_clk";
> No need to, the driver can generate names on its own.
Ok.
>
>>                     
>>     resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>>          <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>>     reset-names = "phy", "phy_phy";
> "phy_phy", "dp_phy". Is there no GCC_USB3_PHY_SEC_BCR?
There are only GCC_USB2_PHY_SEC_BCR and GCC_USB3PHY_PHY_SEC_BCR, no GCC_USB3_PHY_SEC_BCR.
>>     qcom,tcsr-reg = <&tcsr 0xbff0>, <&tcsr 0xb24c>;
>>     qcom,tcsr-names = "vls_clamp", "dp_phy_mode"; <== added for backward compatibility with legacy configs that only had vls_clamp
> No need for qcom,tcsr-names, correct otherwise.
>
>>     #clock-cells = <1>;
>>     #phy-cells = <1>;
>>
>>     status = "disabled";
>> };
>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
>>>>>>  1 file changed, 111 insertions(+)
>>>>>>

