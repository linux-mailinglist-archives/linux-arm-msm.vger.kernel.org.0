Return-Path: <linux-arm-msm+bounces-67074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C0B15AF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBA2168CC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA678290D95;
	Wed, 30 Jul 2025 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4eBIy1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3CD28DEE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753865610; cv=none; b=dfjpZs6j3vvq5G1vr0ucI5fci8oNVkWApwqrMWi48gp4NOvGBJm/K6Ao/fc8lKYew2U84PgY7My1sKik7cUCB5i1oP9QaO+Xioy7WljM/IpxF59fYD7bkJ6vOWge55CP+sIMhgxmZ1Mj8aI8Zsaj/TmcTJ44DnFHXzB33C+QvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753865610; c=relaxed/simple;
	bh=LEGjQIX/OSS70e2pba18afB58fnFMkCFWqzgfCGcH2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWeh+12Wnu19ONiojiLqOWaGZTJpPcDSXPjtXNPgUzkkEcTCI8BCLgQoBJrpAL1PzbOD0/mhhQpS7nb5tE7kPFsqcZq43QWs70NmmRe6X3BIdIbXKKKhtKS4vZaUWGexhQ4UUATZF27gvwZjMU5f9suULu0iUIrpsuVY0ZxYA/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4eBIy1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U74xp5018846
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yry99kMMFqY8zCfj7lzYjkJIij1/JDYYNXnSDFUTCG0=; b=A4eBIy1GyrTNL8FR
	HHew1H3isqDjCTSZtmeUW71Pfb+vXhZb14hPo2yiP6y/g+PreAftTE7fwR83tuPg
	Y+fEQG3eA/Vm3fmXCJ4XEtE91oC5J3mim4FDKKN6bFTAKGg6TC9dO1SYJabrd3jH
	TF8vY0vbIFnqJ6D4eZ9HhWSnqvAK+d5sc8lfPXMNxwgHAraCuOv8nzW1cx63jY3h
	IOS/l65gkDY0Pc9Uh0rETLD/njU8X88t0CQSp9o//UadTiX+Fo0Lx1DN4mo2DFw+
	YNmRprdQRRuogDuIglMIHWBSg8VQ6VLeXlvYMwjFaTx7JLbv8zdSqTZBSCXoxmSA
	XpmR2Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2k019-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:53:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74951713860so1326952b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753865606; x=1754470406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yry99kMMFqY8zCfj7lzYjkJIij1/JDYYNXnSDFUTCG0=;
        b=nq1jsrEKbGxsndxHNryp2FNLmetZKOSguS8v18SOeJSAPbNT5nH/wm873fqHA9C3Bs
         lI5eyFAYI3G4MbMfldJd2VYG2LgKKNKUL06/XMeU+ItAjaCllKvdfpQ3A5MRQKa1hYwP
         rWyanbrjtd9t1Zx60i7mnhSIKvgliDwulyRu8uoMWhqd+YFwL2VBGdjWx7QjAYZ1xKFR
         3Saj1QsNxIcvN9/E9e0nzg+ie1T3fdXnG+HhBvtw7chxJdAR30HWQndQ3F+K2wHJH7F3
         iXU1LXWno8UULumwmNRZCuuVrwng1oi6giqwT3zPtl7ykXMpSOWT1OKBxae8jPehvDM9
         lhog==
X-Forwarded-Encrypted: i=1; AJvYcCVwE5aIGVAyohlmT5+hlCTKoQ3MAgZTNvkLZnmrAczKpA1hl9MK2m2IwUCmlL8LpcBrfX8DtdrzRpGxPePU@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1UXkUlqtcbfd/1yLmpoFGpGPyFvksVcRLbLqAstYMXAly30t
	jeCR8t/0163cpF3U2XpQEXcuejL9LxoJNKVTevdXkMD3sPy6jcRvphRu/aw8YJxQxSexrDQoBt3
	c//KHylVRksS5Q4p7M+v2XSr0PC3V5L13LhH3JtTdZfEByoLkhfuQSLbUKrBw6zXur7Mz
X-Gm-Gg: ASbGncvAJLpWrDg+Gb/t6NXpebzQ7TUVA0xk02afSJtJJzqrsehMEQn4RvcJ6M2nIfN
	DwfU6PjZwjwvVUb32xDZhgVViuqiqcHxxq0lDkv00qRckdP5f+KuNcxH+Eo3eywPHVcpvk8n6SR
	kVYkdefVux19hyZGUfU4eL95x4LE2Rl0BduBoZjyuHbVu1kWs1mJPkeXqg/KWMmVc5x/MYA/BJA
	CbrJo7i1ftsrYvmb5MXAW9FQwceQnK53feGgNmTghaxmr0wQgtcVYnfamLq/TRBLG/KNtNR44dU
	ukeUzp8E/BqTiIf2m2aYpBQV6ld7/xAGZtuExMxongAMUwc0IdIDNpNNEjYEAXvI2PG6ZnWnGgd
	dDHbPL4KEthig2eIpBTD9nbJU5uZoOw==
X-Received: by 2002:a05:6a00:3a15:b0:736:fefa:b579 with SMTP id d2e1a72fcca58-76ab331d67emr1785822b3a.7.1753865606436;
        Wed, 30 Jul 2025 01:53:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1lcGCmyjgrElcbydcxH4piKCVTBp09W5mqd3uW9/dBMAgGC4DCe3OpUMuk8Rvd0cylpoWZg==
X-Received: by 2002:a05:6a00:3a15:b0:736:fefa:b579 with SMTP id d2e1a72fcca58-76ab331d67emr1785793b3a.7.1753865605877;
        Wed, 30 Jul 2025 01:53:25 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76b210e4f94sm1072225b3a.36.2025.07.30.01.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 01:53:25 -0700 (PDT)
Message-ID: <e5a3f05f-9775-4e3d-ae7d-ebbca14b4df5@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 16:53:16 +0800
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <w3rwao5wbmstdyics6qhp7beulbbp5ludqkwpfsmevgqmzz3d6@u2e533zlitkr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VPpMFFeHNL6w_7xbvR5ttC5GFfKhQvUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MCBTYWx0ZWRfX1vubaHAqhiYz
 FzghT3dg/wRy0C26iCwPqkOejBleHCXNo9WDX3ErVkrsXCj9VbwGkBvpKWixLyQzQucaXTtVrYS
 qshzsi47vFt//+69Y/SmL55YLp/us8qH8aRinG85en41mkH+JBGJnGFY4uJKcp1Uinn2NBIFz1n
 DfzMtZ8LOixdZhSA10tyP3/pYNFqxicPK3Niru6v/ws1mfeZkczii3ltsLXzYkQ3lQ9Qh8oiMYf
 NsYV4VraoGwkbXrDdYiogc6/d4HG6+EWRjCKxyu9iSa1Vd/Q9+dHDUJqif/QlxBdLkaqX7eQTSA
 6avBnYiDuxuvDaix6fnTdGfuzndTVwKQo2xUM+S3ZTOx4EmLoJWpB5wJ86qupm8Eg9PyO5RDSXJ
 /EUU/UfZHO0bLv0kxmFNW4tu2qz/eDRh1lwFPDnX7oN5/gtWjDQNgs8xxUf+1X6p9R05RNwM
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6889dd87 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8
 a=B85Fo_iQka-ta6S4ByUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: VPpMFFeHNL6w_7xbvR5ttC5GFfKhQvUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300060


On 7/22/2025 8:41 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
>> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
>>>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>>>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>>>> designed to operate independently from the USB3 PHY.
>>>>
>>>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>>>> standalone and does not support USB/DP multiplexing. The binding
>>>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>>>> cells for proper integration.
>>> Simply put: no, this is not correct. Even if you go to the SM6150 block
>>> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
>>>
>>> I thought that we have discussed it beforehand.
>>>
>>> I can quote my comment from the previous thread:
>>>
>>>>> No. It means replacing extending existing entries with bigger reg and
>>>>> #phy-cells = <1>. The driver must keep working with old node definitions
>>>>> as is to ensure backwards compatibility. New nodes should make it
>>>>> register two PHYs (USB3 and DP). On the driver side modify generic code
>>>>> paths, all platforms supported by the driver should be able to support
>>>>> USB3+DP combination.
>>> Looking at the hardware memory maps:
>>>
>>> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>
>>> Now:
>>> SM6150: USB3 PHY regs at 0x88e6000
>>>         USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
>>>
>>> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
>>> can comment on it.
>>>
>>> But based on that list, the only special case that we need to handle is
>>> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
>>> it will be handled anyway by the code that implements support for the
>>> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
>>>
>>> Having all of that in mind, please, for v3 patchset implement USB+DP
>>> support in the phy-qcom-qmp-usbc driver and add the following logic
>>> that also was requested in v1 review:
>>>
>>>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>>>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>>>>> powering on USB should fail.
>>> I think our understanding might not be fully aligned. 
> I did not write this. Please fix your mailer to quote messages properly.
> As you are using Thunderbird, I'm not sure where the issue comes from.
>
> Also please fix it to wrap your responses somwhere logically.
>
>>> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs. 
>>> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
>>>
>>> 1. About the TCSR DP_PHYMODE Registers
>>>
>>> MSM8998/SDM660:
>>> 	Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
>>> QCM2290/SM6115:
>>> 	TCSR_USB3_0_DP_PHYMODE at 0x3CB248
>>> 	TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
>>> SM6150:
>>> 	TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
>>> 	TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
> SM6150 has two different sets of output pins, so the first register
> covers first set of SS lanes (which are routed to the documented SS
> PHY), the second register covers the second set of SS lanes (which are
> routed to the DP and secondary USB PHY).
>
> I can only assume that the same configuration was supposed to be
> applicable to QCM2290 / SM6115, but was later removed / disabled, while
> the registers were kept in the TCSR block.
>
>>> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
>>>
>>> Additionally, I found some interesting register documentation for QCM2290/SM6115:
>>> 	TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
>>> 	TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
>>> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
> Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
> If you check the memory map, you will find the second VLS CLAMP register
> for the second USB PHY.
>
>>> 2. SM6150 Test Results
>>> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
>>> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
>>> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
> Here it still programs the TCSR register.
>
>>> Based on these info, I believe these are separate PHYs, and only the
>>> TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
>>> mutually exclusive. This is why I have maintained separate private
>>> data for each PHY and implemented Power on mutex control via TCSR,
>>> rather than using a qmp_combo-like structure.
> Still, no. Check the block diagram of SM6150.
>
>>> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
> Yes.

I checked the related PHY series and block diagrams again.

PRI and SEC go to different nodes based on the SoC design, and there are two types of configurations: USB3-only and USB3+DP pairing.

Before proceed the v3 patchset, I’d like to double-confirm whether the following structure is what you expect:

usb_qmpphy_1: phy@88e6000 {
    compatible = "qcom,sm6150-qmp-usb3-prim-phy"; <== rename to PRIM
    ...
    qcom,tcsr-reg = <&tcsr 0xb244>, <&tcsr 0xb248>;
    qcom,tcsr-names = "vls_clamp", "dp_phy_mode";
    
    #clock-cells = <1>;
    #phy-cells = <1>;
    ...
};

usb_qmpphy_2: phy@88e8000 {
    compatible = "qcom,sm6150-qmp-usb3dp-sec-phy"; <== SEC SS, use usb3dp to indicate DP capability

    reg = <0x0 0x088e8000 0x0 0x2000>; <== SS2 base address and offset define in driver config

    clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
            <&gcc GCC_USB3_SEC_CLKREF_CLK>; <== This SoC has no USB3.0 SEC SS clk
    clock-names = "cfg_ahb",
                "ref";
    clock-output-names = "dp_phy_link_clk",
                    "dp_phy_vco_div_clk";
                    
    resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
         <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
    reset-names = "phy", "phy_phy";

    qcom,tcsr-reg = <&tcsr 0xbff0>, <&tcsr 0xb24c>;
    qcom,tcsr-names = "vls_clamp", "dp_phy_mode"; <== added for backward compatibility with legacy configs that only had vls_clamp

    #clock-cells = <1>;
    #phy-cells = <1>;

    status = "disabled";
};

>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
>>>>  1 file changed, 111 insertions(+)
>>>>

