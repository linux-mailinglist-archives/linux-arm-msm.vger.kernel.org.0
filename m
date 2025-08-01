Return-Path: <linux-arm-msm+bounces-67291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D021CB17B85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 05:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2041F1C21876
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 03:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574A5188CC9;
	Fri,  1 Aug 2025 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhrG+NMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C311607AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754020685; cv=none; b=oTc8C82HDWntN09WGdXBIhNUyKms0jfNazQ0oJ41Zx5V06yirHCMgqJj8ZQlvyvkPqw0rku9O6ogmoGb498xE8wlpm4ujqjHDfly/B/tP1vUeqUnwurCG2wJH3/rEC1XPbvzt6+nA2vp13jdt/tejkqhDR4UJ0SiEdVZYa1OcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754020685; c=relaxed/simple;
	bh=UO0lZMJPPhDxk7mSF7iGN6/wHbR5r3yzJBCSKwUDnJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plU0upYx+BRgYgbsKMD+/FpzmRJCkRzM8jby2npkNOKO+vCpflXEQFEzRHn/JEg/E4LrYMz1wtU7KjWFwgrsD3BlilTboqVVfuyjA+UOuNvGCF8EnJGciPtRpUckJ1TGof/ab860EAauU5NExB29yGnLxsS3jp7Kp8E71c2agXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhrG+NMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710pKPb031731
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 03:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UO0lZMJPPhDxk7mSF7iGN6/wHbR5r3yzJBCSKwUDnJ0=; b=YhrG+NMw9LnX+yZD
	fjWuVqBI0etONNwrCljiYvVBZjGAO5LegkXcnHxSO2IFXP55OMppPjMbGGo44s8j
	Q1QZ/FZZCBADYFR7s2A3LTD/iJzC42AJtTmFQ+BU4Lyq/AKUs7OnkBdBxm1ll+UV
	RxFO/5YdrSEaS8qV7ydKLbmFYrOdTmVJ1DKK+lx4/HNIMJ0eE/+zZmZpYBYUxO9z
	WSwHjubuq25wAHq6QUsbgEjo/Dmo1Q6IKpZIhGwlOBwZoT7x52r17DCrLRYabqAA
	Eo8q82YjQ/5oaLSyvUdMwCl/wrvEgyPeI5c5X3qGi8vnCHVghMFaRG1Wmcn+1kW4
	oh9DJg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwexpfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 03:58:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fc61ddddcso3345915ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754020681; x=1754625481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UO0lZMJPPhDxk7mSF7iGN6/wHbR5r3yzJBCSKwUDnJ0=;
        b=GbZ+5GzaqeiCpzsGVWIVdECZk3JosRn1iro55RSGP6bnUQrUPkBueHsutge6m7og2n
         qf18D3yLjTIZHkAVK5V2cSLshPqh0GjrMO379OKnmFNTAL/tRuiZtdAO+dskjavrDyHT
         Uckx0/5e7l1JX+GzRKUblm7zY7KDZFkkb3EwPnIArNz6qqvXIhk4ZI7+7/spiTQjbF8r
         KTJ9tc9GUgpGOu9R9dGAbLhNerqYLfOBQ7wEjsMk1Ai2uo1dqEEKraf8qcKo3y/nPUSR
         KHAJ9hhCxkxAnBc/kaQ4lq4d0c3opYYNZ9deQcKrcMDneQNhJl4P7w8xSsVjhMEWg3bE
         DrVA==
X-Forwarded-Encrypted: i=1; AJvYcCUC4U9iKBq95FcuFNbU77YzL+Z56knY4IR8KD7Lb0QBM555KDhnbLgpWy+E2VXUBA/uRLyUTiu9caGt7QLF@vger.kernel.org
X-Gm-Message-State: AOJu0YyRlszCaWE8XQB0yoJrJDl+BAHuVQzEf9LGZcYCHb7MQ3ZaaHOG
	Pmz7wsb2+QM9SQ2HVuFqx7WAV0gqV+NkQio8b0C9YzJ9bJkHZjlb7pR5yLEbvsdF1MRnHhYhBmU
	K9wvHVvQ+VQX8kqNUvzntZr9DLbcj+/9ZMXgIiIWSmLd2MFIcDmHtr6xCCO163us2F09c
X-Gm-Gg: ASbGnct3rvsQnhXpF+4RYQHgZOvDTY+FaZcCJYirVR3gxPJp7mNdKZkfyHjWX2wdRpR
	fHm5+wAPnzP48/H/+RhogP01mBWOT8ix8O8dTcGqjmDcAXVMRRWRmYReuNzMgzhDiO6uhdG3PyJ
	/z0KLY2/lO1ix4v+HjsypOy8No6BuinOPfff/ALjGYe66jEjoRHozBcqTJFFpQdoOWDci5sJRHF
	Q1uNbnNa72nXKRdk36OWTlDt5XO7QoKBtRRUDVWu7QZc+ot0oRkcQy6Oupu2wQsSSPeZB3x7pnw
	RqOoBH3i5mS3H3TLNrtOEWlONS1Q8qMNIAI6d1goQD0MjVqd8mfKZpffexKYw/aTlcMwtedEjSS
	EKbHENX2hgmg1eSzT+YKKlpc4Mdy1hw==
X-Received: by 2002:a17:903:1c6:b0:240:b9c0:bc6f with SMTP id d9443c01a7336-240b9c0bebfmr11100155ad.10.1754020680563;
        Thu, 31 Jul 2025 20:58:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhXyUs6B80q8wF4GT4SaS9kVxn1ul1R0VRcy26253GED8PXnyjNS/bSUEoCCQWMZ4c4Fv3iw==
X-Received: by 2002:a17:903:1c6:b0:240:b9c0:bc6f with SMTP id d9443c01a7336-240b9c0bebfmr11099775ad.10.1754020680014;
        Thu, 31 Jul 2025 20:58:00 -0700 (PDT)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e757sm31142185ad.55.2025.07.31.20.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 20:57:59 -0700 (PDT)
Message-ID: <2de51bf2-baed-4bf9-a40c-1681b2efcf79@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 11:57:50 +0800
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
 <bd8f8643-a8c8-43d7-b293-acdba5ff798a@oss.qualcomm.com>
 <ad4f53eb-2f4b-4e62-a162-461de431e3de@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ad4f53eb-2f4b-4e62-a162-461de431e3de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aOnwqK3ls5CUqkTpUQhBx6mqkRg4IUBq
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688c3b4a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8
 a=74qhCITlYKpdjXRJ2hIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: aOnwqK3ls5CUqkTpUQhBx6mqkRg4IUBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyNiBTYWx0ZWRfX5xL8OkUG+BW6
 W0hHl21DWxLdUHCf0cTwwa1hPKhCGkQXzQyVuyT1/H3kZmTPZpyVgTM0fYEMxFD+qsx+zxA+oNI
 OfT+PorbVah+EzWmNIAunRW6NQIOheeiL9GJogSy6TabKcBEV9z+Z35VYpnyPnWCUaickh3MtMz
 nBKkMEtBkep+ie06lUikO2YwixNcQNp5A21XpG52ip3xPTGyA5EmjgXqPc4ujaucoSGsIc94ntl
 4V2KoeR3Sgfso/rYK9XMsX76tsYqKP8M0HVYaH1fKcf0sAmttFz9/6FtdNKVT+3Jb+qLynJTbc/
 HvFGVD7DF4/NgyFJ5j1VX9Tw9azapY/f7Em3uenA0eIqjDzwfVRa0eQT0vcMviYXIF0mnloclj/
 EkGoXr6DYytDx4ipRgJNKVsxlo5m6LHuD9SGtnrKX4mJRU6Ce+1fpCQj3BcqRal5Mm3JhVLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010026


On 8/1/2025 1:13 AM, Dmitry Baryshkov wrote:
> On 31/07/2025 08:06, Xiangxu Yin wrote:
>>
>> On 7/31/2025 2:35 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 30, 2025 at 04:53:16PM +0800, Xiangxu Yin wrote:
>>>> On 7/22/2025 8:41 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
>>>>>> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
>>>>>>>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>>>>>>>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>>>>>>>> designed to operate independently from the USB3 PHY.
>>>>>>>>
>>>>>>>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>>>>>>>> standalone and does not support USB/DP multiplexing. The binding
>>>>>>>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>>>>>>>> cells for proper integration.
>>>>>>> Simply put: no, this is not correct. Even if you go to the SM6150 block
>>>>>>> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
>>>>>>>
>>>>>>> I thought that we have discussed it beforehand.
>>>>>>>
>>>>>>> I can quote my comment from the previous thread:
>>>>>>>
>>>>>>>>> No. It means replacing extending existing entries with bigger reg and
>>>>>>>>> #phy-cells = <1>. The driver must keep working with old node definitions
>>>>>>>>> as is to ensure backwards compatibility. New nodes should make it
>>>>>>>>> register two PHYs (USB3 and DP). On the driver side modify generic code
>>>>>>>>> paths, all platforms supported by the driver should be able to support
>>>>>>>>> USB3+DP combination.
>>>>>>> Looking at the hardware memory maps:
>>>>>>>
>>>>>>> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>>>>>> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>>>>>> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>>>>> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>>>>>
>>>>>>> Now:
>>>>>>> SM6150: USB3 PHY regs at 0x88e6000
>>>>>>>          USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
>>>>>>>
>>>>>>> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
>>>>>>> can comment on it.
>>>>>>>
>>>>>>> But based on that list, the only special case that we need to handle is
>>>>>>> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
>>>>>>> it will be handled anyway by the code that implements support for the
>>>>>>> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
>>>>>>>
>>>>>>> Having all of that in mind, please, for v3 patchset implement USB+DP
>>>>>>> support in the phy-qcom-qmp-usbc driver and add the following logic
>>>>>>> that also was requested in v1 review:
>>>>>>>
>>>>>>>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>>>>>>>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>>>>>>>>> powering on USB should fail.
>>>>>>> I think our understanding might not be fully aligned.
>>>>> I did not write this. Please fix your mailer to quote messages properly.
>>>>> As you are using Thunderbird, I'm not sure where the issue comes from.
>>>>>
>>>>> Also please fix it to wrap your responses somwhere logically.
>>>>>
>>>>>>> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs.
>>>>>>> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
>>>>>>>
>>>>>>> 1. About the TCSR DP_PHYMODE Registers
>>>>>>>
>>>>>>> MSM8998/SDM660:
>>>>>>>     Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
>>>>>>> QCM2290/SM6115:
>>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x3CB248
>>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
>>>>>>> SM6150:
>>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
>>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
>>>>> SM6150 has two different sets of output pins, so the first register
>>>>> covers first set of SS lanes (which are routed to the documented SS
>>>>> PHY), the second register covers the second set of SS lanes (which are
>>>>> routed to the DP and secondary USB PHY).
>>>>>
>>>>> I can only assume that the same configuration was supposed to be
>>>>> applicable to QCM2290 / SM6115, but was later removed / disabled, while
>>>>> the registers were kept in the TCSR block.
>>>>>
>>>>>>> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
>>>>>>>
>>>>>>> Additionally, I found some interesting register documentation for QCM2290/SM6115:
>>>>>>>     TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
>>>>>>>     TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
>>>>>>> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
>>>>> Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
>>>>> If you check the memory map, you will find the second VLS CLAMP register
>>>>> for the second USB PHY.
>>>>>
>>>>>>> 2. SM6150 Test Results
>>>>>>> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
>>>>>>> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
>>>>>>> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
>>>>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
>>>>> Here it still programs the TCSR register.
>>>>>
>>>>>>> Based on these info, I believe these are separate PHYs, and only the
>>>>>>> TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
>>>>>>> mutually exclusive. This is why I have maintained separate private
>>>>>>> data for each PHY and implemented Power on mutex control via TCSR,
>>>>>>> rather than using a qmp_combo-like structure.
>>>>> Still, no. Check the block diagram of SM6150.
>>>>>
>>>>>>> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
>>>>> Yes.
>>>> I checked the related PHY series and block diagrams again.
>>>>
>>>> PRI and SEC go to different nodes based on the SoC design, and there are two types of configurations: USB3-only and USB3+DP pairing.
>>>>
>>>> Before proceed the v3 patchset, I’d like to double-confirm whether the following structure is what you expect:
>>>>
>>>> usb_qmpphy_1: phy@88e6000 {
>>>>      compatible = "qcom,sm6150-qmp-usb3-prim-phy"; <== rename to PRIM
>>> No, we already have a compatible name and DT schema for this device.
>> Then current compatible name is "qcom,qcs615-qmp-usb3-phy" and shall we need update to "qcom,sm6150-qmp-usb3-phy"?
>
> Why? You _already_ have a compatible string. You don't need to change it just to follow the SoC name. 
>
Ok, but just to confirm — in this case, the USB3-DP PHY would use "qcom,sm6150-qmp-usb3-dp-phy" while the USB3-only PHY still uses "qcom,qcs615-qmp-usb3-phy"?

Since both PHYs are on the same SoC, would it make sense to keep the naming consistent and use "qcom,qcs615-..." for both? 

>>>
>>>>      ...
>>>>      qcom,tcsr-reg = <&tcsr 0xb244>, <&tcsr 0xb248>;
>>>>      qcom,tcsr-names = "vls_clamp", "dp_phy_mode";
>>> No need for qcom,tcsr-names. Second TCSR register should be optional in
>>> the driver.
>> Ok.
>>>
>>>>           #clock-cells = <1>;
>>>>      #phy-cells = <1>;
>>> #clock-cells = <0>;
>>> #phy-cells = <0>;
>>>
>>>>      ...
>>>> };
>>>>
>>>> usb_qmpphy_2: phy@88e8000 {
>>>>      compatible = "qcom,sm6150-qmp-usb3dp-sec-phy"; <== SEC SS, use usb3dp to indicate DP capability
>>> qcom,sm6150-qmp-usb3-dp-phy
>> Ok, but for this part, shall we update dt-binding in "qcom,msm8998-qmp-usb3-phy.yaml" or create a new one?
>
> I think (I might be wrong here) new ones is a better fit. We'll migrate the rest of PHYs to new bindings later on. 
>
Ok, I’ll keep the USB3-DP PHY node definition in a separate YAML file in v3.
>>>
>>>>      reg = <0x0 0x088e8000 0x0 0x2000>; <== SS2 base address and offset define in driver config
>>>>
>>>>      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>>>>              <&gcc GCC_USB3_SEC_CLKREF_CLK>; <== This SoC has no USB3.0 SEC SS clk
>>>>      clock-names = "cfg_ahb",
>>>>                  "ref";
>>>>      clock-output-names = "dp_phy_link_clk",
>>>>                      "dp_phy_vco_div_clk";
>>> No need to, the driver can generate names on its own.
>> Ok.
>>>
>>>>                           resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>>>>           <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>>>>      reset-names = "phy", "phy_phy";
>>> "phy_phy", "dp_phy". Is there no GCC_USB3_PHY_SEC_BCR?
>> There are only GCC_USB2_PHY_SEC_BCR and GCC_USB3PHY_PHY_SEC_BCR, no GCC_USB3_PHY_SEC_BCR.
>
> Ack.
>
>>>>      qcom,tcsr-reg = <&tcsr 0xbff0>, <&tcsr 0xb24c>;
>>>>      qcom,tcsr-names = "vls_clamp", "dp_phy_mode"; <== added for backward compatibility with legacy configs that only had vls_clamp
>>> No need for qcom,tcsr-names, correct otherwise.
>>>
>>>>      #clock-cells = <1>;
>>>>      #phy-cells = <1>;
>>>>
>>>>      status = "disabled";
>>>> };
>>>>
>>>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>   .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
>>>>>>>>   1 file changed, 111 insertions(+)
>>>>>>>>
>
>

