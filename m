Return-Path: <linux-arm-msm+bounces-67302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B3B17DBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651BC624730
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 07:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9AC1F5619;
	Fri,  1 Aug 2025 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3U0IvTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1A1DF270
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033933; cv=none; b=HHLswGLUMkIR+J/UYn7gUC+J/fTXHeZ3+k0kLH6doSqmOOvI5xjlLDWY/rHLE2X1nDbkEF4m1bETpxJ4bsstPPhnTgTEz9atihF1Csm59axk7/qBApnuqfaiLAZ2vbH9g4D5FEsJ6D08Vn6ZNJSU/uCA/XtwcOxnE53oge44JxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033933; c=relaxed/simple;
	bh=ZNM55YfUl9xp2ZSYJcQSU6AfmSKr/O5GZtEj4E9ArwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqZiMTh+Vp5/1ksyzR8FaB3GzBAWRkRHaaql3/hxWojxxGKfhLroyXFpVtblcv9KHOUmqhqvmUZFUmAm9/2LC0TJxsc/5CRtQondlFrbSi1heNffFA5n3lCc6y+SBGwRieaEclCMlJ4o4GjpyRhd3RCHRJ01u8DV+4HVFAPDslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3U0IvTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57101rGW031638
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 07:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNM55YfUl9xp2ZSYJcQSU6AfmSKr/O5GZtEj4E9ArwM=; b=J3U0IvTxb5MLEnJQ
	PRrdnr/FwfRHXckOy9HIUtdMTPVCzaNvKkIUIfiRmVMUqz+PVsSSpEKebj4O7Ym9
	XlJJCriRT666zMQEXsxU+GfECmfAiTH5jEahOipKko3etXInUW6lTFI4pKLJ+IAK
	NJ2oUjByg3yYUYwJpR1FR1mhOIs608mqm2EX+EVMSWM8p4S6E/vmrJSmmGGVCngj
	YCRN0wkWAT+Iq4wwiLwtuc4tar0GdGjayrTsbSHISCuoMgAuQqQpTBUog8dBRv0k
	ptu8DaMbM+rMYMA1C/gFXv/MYDASt0d610Vxq08g8dxeyMArMDTtqd7X0wblksWT
	24akog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwey9u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:38:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31f00adab23so528299a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 00:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033929; x=1754638729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNM55YfUl9xp2ZSYJcQSU6AfmSKr/O5GZtEj4E9ArwM=;
        b=NjXN4xv4RPt3L2d18IxpiqLtAF/ODXcqlD4+wzPVJQpEJVzdkXzO7CLrVwCx/1JEEp
         DRoLyRSacGhCMgfqvWgh54FpQf4vdlPIq8/TdChlPejJ/XzVnRUH/NQulJ9fhUpfUFAK
         BzFEybVpSvlbc3QsEB5dcRjGsJm9TtGcABIQFZAySW8WC8tUFdlKPd9oTM4xQ92e0W6/
         OqD9DrPFQKCl/typUhzj2Rc7NN6qjS2flMLRii77dXadRbbtpqJr6/jPghF9ZG62uqCB
         WTPVlh4ltxyZKxIW1qSthusRGdNHdc29NLtX8tti3dDOIeYB4xeQ+bbqt74Tes3/dbz0
         6WJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkuONYthfLUVBJO/LO52VzOWQsmCQlZ+QBr+EY72X2lerDdV6w6AK8rpOmn4O9SNPrwlOI0S/K1miuLV2G@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8epH0GY4M+uV1AX2qtd1oZTomu5m9jJnHR5Vi7688GAFE5el
	D20cO5TRHPbpptmnaXRw2f/SLWSNGO36vi5Uf50nIz4ztHdUPxDysLiyL7j9QIoPrH8IH/R14CK
	ss6UJXWflxAxqsEqG/iuK3lDsM/XOc6ClLTfMU7GdJ30AnViAKqkjRRhPAoVDNKFFNioaaR62Jg
	kOgAE=
X-Gm-Gg: ASbGncsok5/AzaCPxbW2tF1j/CwdBbL7GVUFaSbfy9zoLw59fYs7Dt9ssLHwfox0vAS
	bS3TCcg4Zk0K2YZG6j7GU4ijywncmWM3EkZ75ngeOiF/UVgJfbbJ4Wt66SQ6oegwNAw2Q+3EBkL
	o493HXvTuoASs182nAXAenfLKUpRBEB30To8HlA1u+f7p7wrs7H3OmYYnQ1aB3NXTWz+Yp0385v
	uygrKO0SUFnQud4Op3G3lyLg6okvT2zDHw8Z0z7PQH6qcaTP+6zwQVIjLd6Mllz6kdNdxNWnNHf
	baS8JOfOXHHU28Uq3OykyxLsP2UR8T5bGN6FMeN+cpRdRSnNbT7rRtYnSz1OUxAs8PvGsknxuFf
	bnOfrMVdj0WdK4wr5MfjWPNvbsKBs9g==
X-Received: by 2002:a17:90b:1b48:b0:31e:cdc1:999e with SMTP id 98e67ed59e1d1-31f5dda821cmr6238997a91.1.1754033928367;
        Fri, 01 Aug 2025 00:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM0h4u47OKSZmyNwaHGa0yV5M9Yp5I0Yk+dyJ89VWmvfIRnuW3gw2qmcHYwbcIoh+J2GMIAQ==
X-Received: by 2002:a17:90b:1b48:b0:31e:cdc1:999e with SMTP id 98e67ed59e1d1-31f5dda821cmr6238958a91.1.1754033927851;
        Fri, 01 Aug 2025 00:38:47 -0700 (PDT)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207ebc3266sm3898449a91.13.2025.08.01.00.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 00:38:47 -0700 (PDT)
Message-ID: <80c59c45-e010-4ec2-8ec5-9ebc2884e282@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 15:38:39 +0800
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
 <2de51bf2-baed-4bf9-a40c-1681b2efcf79@oss.qualcomm.com>
 <x4ozwgcti2vrgorgow6nttcjmduk5e4kkd3pjj6xfsgihk6u4n@klfpypor6ya6>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <x4ozwgcti2vrgorgow6nttcjmduk5e4kkd3pjj6xfsgihk6u4n@klfpypor6ya6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HhWNMfj9vI5j-g4M0YAgEz-4Pwea3jXx
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688c6f0a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Oh2cFVv5AAAA:8 a=6kdnFUR2qZRIvO1OxKUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: HhWNMfj9vI5j-g4M0YAgEz-4Pwea3jXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA1MyBTYWx0ZWRfX22LU1r9Z/yau
 a5HrZk5dFZeQtXVUwKQIaLUHka43aYOt/qgC12x5aoOdfY02D4yN4ispEx3KNOoNqEOla+Zxs35
 E8VOrTpJFOGu4xg3PmVrv+m9iEm6rygp5vY7ZiUOmRejv6EYJV5bmzDaDhxnMJ5bhEHm/1NF17f
 NlhNR+t4OSdnzs6qPPgep/7F8SoOr63Nzl/PBJ7YmIn/Yr0PGcbaf2fj73+3bi/ZIl/PreF2Rmb
 jgs7jcC0qCHf0rUI/PmlammDL5msjZalXZClqin6ZRI/i5ZbRYKHHaWiIzGuKSfkiA9oi+nKd+S
 3neau34ZXbF3AucgKkDHKOyn1sdymgNw9OpGUbVVBwtYg8k4tG0kLQtlZrlYqXLUsDgfb704nAT
 x7T5Os+eiScOF9mt03lMQrvfOAkIfdJZm5eEI4Ck+HxJMhyyD+iTqehSX/pLBnoIUFs5ss/9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010053


On 8/1/2025 3:30 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 01, 2025 at 11:57:50AM +0800, Xiangxu Yin wrote:
>> On 8/1/2025 1:13 AM, Dmitry Baryshkov wrote:
>>> On 31/07/2025 08:06, Xiangxu Yin wrote:
>>>> On 7/31/2025 2:35 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Jul 30, 2025 at 04:53:16PM +0800, Xiangxu Yin wrote:
>>>>>> On 7/22/2025 8:41 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
>>>>>>>> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
>>>>>>>>>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>>>>>>>>>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>>>>>>>>>> designed to operate independently from the USB3 PHY.
>>>>>>>>>>
>>>>>>>>>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>>>>>>>>>> standalone and does not support USB/DP multiplexing. The binding
>>>>>>>>>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>>>>>>>>>> cells for proper integration.
>>>>>>>>> Simply put: no, this is not correct. Even if you go to the SM6150 block
>>>>>>>>> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
>>>>>>>>>
>>>>>>>>> I thought that we have discussed it beforehand.
>>>>>>>>>
>>>>>>>>> I can quote my comment from the previous thread:
>>>>>>>>>
>>>>>>>>>>> No. It means replacing extending existing entries with bigger reg and
>>>>>>>>>>> #phy-cells = <1>. The driver must keep working with old node definitions
>>>>>>>>>>> as is to ensure backwards compatibility. New nodes should make it
>>>>>>>>>>> register two PHYs (USB3 and DP). On the driver side modify generic code
>>>>>>>>>>> paths, all platforms supported by the driver should be able to support
>>>>>>>>>>> USB3+DP combination.
>>>>>>>>> Looking at the hardware memory maps:
>>>>>>>>>
>>>>>>>>> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>>>>>>>> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
>>>>>>>>> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>>>>>>> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>>>>>>>>>
>>>>>>>>> Now:
>>>>>>>>> SM6150: USB3 PHY regs at 0x88e6000
>>>>>>>>>          USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
>>>>>>>>>
>>>>>>>>> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
>>>>>>>>> can comment on it.
>>>>>>>>>
>>>>>>>>> But based on that list, the only special case that we need to handle is
>>>>>>>>> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
>>>>>>>>> it will be handled anyway by the code that implements support for the
>>>>>>>>> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
>>>>>>>>>
>>>>>>>>> Having all of that in mind, please, for v3 patchset implement USB+DP
>>>>>>>>> support in the phy-qcom-qmp-usbc driver and add the following logic
>>>>>>>>> that also was requested in v1 review:
>>>>>>>>>
>>>>>>>>>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>>>>>>>>>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>>>>>>>>>>> powering on USB should fail.
>>>>>>>>> I think our understanding might not be fully aligned.
>>>>>>> I did not write this. Please fix your mailer to quote messages properly.
>>>>>>> As you are using Thunderbird, I'm not sure where the issue comes from.
>>>>>>>
>>>>>>> Also please fix it to wrap your responses somwhere logically.
>>>>>>>
>>>>>>>>> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs.
>>>>>>>>> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
>>>>>>>>>
>>>>>>>>> 1. About the TCSR DP_PHYMODE Registers
>>>>>>>>>
>>>>>>>>> MSM8998/SDM660:
>>>>>>>>>     Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
>>>>>>>>> QCM2290/SM6115:
>>>>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x3CB248
>>>>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
>>>>>>>>> SM6150:
>>>>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
>>>>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
>>>>>>> SM6150 has two different sets of output pins, so the first register
>>>>>>> covers first set of SS lanes (which are routed to the documented SS
>>>>>>> PHY), the second register covers the second set of SS lanes (which are
>>>>>>> routed to the DP and secondary USB PHY).
>>>>>>>
>>>>>>> I can only assume that the same configuration was supposed to be
>>>>>>> applicable to QCM2290 / SM6115, but was later removed / disabled, while
>>>>>>> the registers were kept in the TCSR block.
>>>>>>>
>>>>>>>>> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
>>>>>>>>>
>>>>>>>>> Additionally, I found some interesting register documentation for QCM2290/SM6115:
>>>>>>>>>     TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
>>>>>>>>>     TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
>>>>>>>>> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
>>>>>>> Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
>>>>>>> If you check the memory map, you will find the second VLS CLAMP register
>>>>>>> for the second USB PHY.
>>>>>>>
>>>>>>>>> 2. SM6150 Test Results
>>>>>>>>> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
>>>>>>>>> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
>>>>>>>>> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
>>>>>>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
>>>>>>> Here it still programs the TCSR register.
>>>>>>>
>>>>>>>>> Based on these info, I believe these are separate PHYs, and only the
>>>>>>>>> TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
>>>>>>>>> mutually exclusive. This is why I have maintained separate private
>>>>>>>>> data for each PHY and implemented Power on mutex control via TCSR,
>>>>>>>>> rather than using a qmp_combo-like structure.
>>>>>>> Still, no. Check the block diagram of SM6150.
>>>>>>>
>>>>>>>>> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
>>>>>>> Yes.
>>>>>> I checked the related PHY series and block diagrams again.
>>>>>>
>>>>>> PRI and SEC go to different nodes based on the SoC design, and there are two types of configurations: USB3-only and USB3+DP pairing.
>>>>>>
>>>>>> Before proceed the v3 patchset, I’d like to double-confirm whether the following structure is what you expect:
>>>>>>
>>>>>> usb_qmpphy_1: phy@88e6000 {
>>>>>>      compatible = "qcom,sm6150-qmp-usb3-prim-phy"; <== rename to PRIM
>>>>> No, we already have a compatible name and DT schema for this device.
>>>> Then current compatible name is "qcom,qcs615-qmp-usb3-phy" and shall we need update to "qcom,sm6150-qmp-usb3-phy"?
>>> Why? You _already_ have a compatible string. You don't need to change it just to follow the SoC name. 
>>>
>> Ok, but just to confirm — in this case, the USB3-DP PHY would use "qcom,sm6150-qmp-usb3-dp-phy" while the USB3-only PHY still uses "qcom,qcs615-qmp-usb3-phy"?
>>
>> Since both PHYs are on the same SoC, would it make sense to keep the naming consistent and use "qcom,qcs615-..." for both? 
> Either way is fine with me.
Ok, then I’ll use |"qcom,qcs615-qmp-usb3-dp-phy"| for the USB3-DP PHY in the v3 patch.
>

