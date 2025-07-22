Return-Path: <linux-arm-msm+bounces-66061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B2B0D8EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684086C30ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5022E3384;
	Tue, 22 Jul 2025 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ3mzrxN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E142E427B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753185922; cv=none; b=Eu1Wyx6t4VYUJZvTux/bKIbXCkFe6ypZpnZHqvlT9ZEzMfgtBVK4ENMK+jrmwdV/ha9lLuI/iav4Y4Q6yF1o6v2HfKiiqQ/FPFmseujv81Opv4mAgkZ3ndty5OqTXKklJ1kmn+PHVBzT7dvSMGvngAcYtFD8SNwoMGEw8kwQX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753185922; c=relaxed/simple;
	bh=vAjk5EdrVfsB9uNIF3ywSNNttFckv3DpPn6PfbgJzX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Boh0a/i9vJwmv2pq4yJahTjXEd+p1W+uWO1YHmUDwhtbNISbal5WtZFdH7vYDVYXj831dG5DX2H4zNUoMkv588Gu7EegSl9c/EzyZTGr8BhkwByD1YcwSOanjflpVjIfjWM4UuM7THLrLBTouPhnkFN+Mq3u5xMdSmgzs6c9rRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ3mzrxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8mSZK012594
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyIbCMFrlPdmkgoKqjBfMM2i4HyJIcVeeKjewThJMrU=; b=cQ3mzrxNu4xA2qQl
	15LSXW1qN4oae5WXWOBB3WKRr0CFk0URXkVWpuv8FyM3dDfrh1enzJIjYxsz1Nw5
	C+uTK+VtUmdGuo0uI2ojVSs8csmJvW5dPwV79wAH8Sxyz3mtsXWfXiBtb2kXZjfr
	MtF83WGtuMThSBrpjkvSjGFdNbzBfz8m5s9xpQ/mzXMkcWYqKx8v+YpQ/z9manIv
	wKE0UO8Z7FDY6XTjii8KQlLk0KgjDIKRH4P2HjWEYzZWPRzuLMUdloGJRKZdUyMM
	129Et38wqLP+ex0G+B3BfAGPQFZR5sGQESMY6IorZlseTIgDAgcXjOblYigbiiJM
	uyeibQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6km03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:05:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23c8f16343eso17437705ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185918; x=1753790718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iyIbCMFrlPdmkgoKqjBfMM2i4HyJIcVeeKjewThJMrU=;
        b=TQiehPSUFwXUpW4cNEdHxo6KWpsZ6GaGw5oUDjCoElTJNsjfbMH4EzFx4rzrA0HHJb
         PbzoLNykm3dlgAzddKTc1OnBQ8A/tefoMvoAZFIHOVSWAHRiyNGK6j0+RqAdc5+PVGeM
         vMKrb9dVu3MXZBT1MqDb8PZSUD8ot5LYiPZTCWoWZ3PZO+thm7r+ZEQKE1tDitWfKoNX
         D0m6gs/W+6Bo372ntb6A5oDHvDb/nO+WJq2rbjavq6uKYjRvRIyRLwqf0uFmgxYHGXdR
         v79/Kk2X3G4SVt8pijBXERHhxrrePFYvH+q4c1ufV2EW8btelni2U/ksCJ/V2GPyJKaE
         524w==
X-Forwarded-Encrypted: i=1; AJvYcCXF6yvLQuaO8R783nAW9St1tkl98l+lUzu3kRauXT8q+PxeILEvIxAed2QvwBU6LXiyPDE8mnYtrdVIsZO8@vger.kernel.org
X-Gm-Message-State: AOJu0YxH74/wRFSAUMjX0AkWzhyCHHNXkbxUPSZQBJh1x6FyH91mUpPo
	vpSQKy11FNN/l67SQhp2fsSAOb7HQG05hP6R2ZLpOe2KiVTBM2JJfUXmL4qvXZZCT3OWPqq2uBk
	p2i7bojTRbbMYYO0YltnmCqzQGPE/ZR+TJZNKwruMJqkAXU0QdaBBifT6G6kRl/jvAORz
X-Gm-Gg: ASbGncsVdpsGjvXfaDEGhJVAKl29zASFCy+pC2nztQ9wt9MbXVn4Qigr+xhB6HjtzSS
	zUfP8+O1VbI2W3e9Y0T3Pc6ajanoLGAJxVyGxqVk+YNQbz6T2MnYBTu2Atqep/qx34Kw+Rq8EK5
	u4Xh0FzO5b4em9LpxTpjaPk32Dr+FlXW2E3F/haFTfnS84fdO4RcNVzwqDzAFc2al1H8HEoK2rm
	6t/9WDHjphN+kepmIvIotVX/OMLOCvpF7GqGvb7HJ9mVY3VKeXlucUnYRN6NIBaH34aagldyBuh
	6r+T4fMNQXi6PYiB6qHxpR9M4fuEJCkuRbWMXRqGYMqEDiaBu2kt67JVzFnh5woY0qxfx4B8S4N
	dlRWHs3DyUGK4ZLVp6pXwJgBkjyKf
X-Received: by 2002:a05:6a00:4fc9:b0:736:559f:eca9 with SMTP id d2e1a72fcca58-756e99fe5afmr14912584b3a.3.1753185917419;
        Tue, 22 Jul 2025 05:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoGJCKiTPaM45TrN+M/E5LCa63vjhB/iRPsOdQ17RiEy//OhqN7LQOTuKba6p+/2B4x4JuLw==
X-Received: by 2002:a05:6a00:4fc9:b0:736:559f:eca9 with SMTP id d2e1a72fcca58-756e99fe5afmr14912493b3a.3.1753185915178;
        Tue, 22 Jul 2025 05:05:15 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8dc8fsm6980846a12.28.2025.07.22.05.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 05:05:14 -0700 (PDT)
Message-ID: <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 20:05:06 +0800
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f7e7f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cRT8ne84DSJdP7yTid4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: QCt7WK1dk7tYNJd5YBOUpXgbA406pIDR
X-Proofpoint-GUID: QCt7WK1dk7tYNJd5YBOUpXgbA406pIDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5OCBTYWx0ZWRfX6zr8MsKJUXyJ
 8O+hWbcXJsQvbErXtlr6ChdX/+4WXD3JKu62jfw+DyaUlshTK+tJl+UUn37sh4BngQxqTzgkocS
 YiCFLFP9Tcv2chPLbf1vjSBJXvJEg6F9siTiRYu/nlDYodzSSMIDORGnxqrAK5BwPB4RmE3QAb0
 ntt2/nwgkohcyMbRx58UAcEIqxiZ/Gtm6dYNCSWX/GmCmxTI9VwbYzZWCYYQLnFFN0vkfWM217M
 H9JLrgNWgflhkufn7mRy8Ojp/x40l+Jdg1F8K/gC+DKXNP5PFwucE2lK90g/zqSGdvTHKoBzpXk
 c6xhVEuMM9EuRsYyqgqhnJjIKMYNHXSNku6vVNulIJRegimI0UseVbAw3nN8RGlOjLu/ppNXR7n
 J3qG5sZ5mDx9ru1tMWrQvD8G+WX9GTZ6JmdOfnCaIXRpCdabIiQ8AhnrmJjTDDmdgL1vQ3W4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220098


On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>> designed to operate independently from the USB3 PHY.
>>
>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>> standalone and does not support USB/DP multiplexing. The binding
>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>> cells for proper integration.
> Simply put: no, this is not correct. Even if you go to the SM6150 block
> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
>
> I thought that we have discussed it beforehand.
>
> I can quote my comment from the previous thread:
>
>>> No. It means replacing extending existing entries with bigger reg and
>>> #phy-cells = <1>. The driver must keep working with old node definitions
>>> as is to ensure backwards compatibility. New nodes should make it
>>> register two PHYs (USB3 and DP). On the driver side modify generic code
>>> paths, all platforms supported by the driver should be able to support
>>> USB3+DP combination.
> Looking at the hardware memory maps:
>
> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>
> Now:
> SM6150: USB3 PHY regs at 0x88e6000
>         USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
>
> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
> can comment on it.
>
> But based on that list, the only special case that we need to handle is
> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
> it will be handled anyway by the code that implements support for the
> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
>
> Having all of that in mind, please, for v3 patchset implement USB+DP
> support in the phy-qcom-qmp-usbc driver and add the following logic
> that also was requested in v1 review:
>
>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>>> powering on USB should fail.
> I think our understanding might not be fully aligned. 
> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs. 
> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
>
> 1. About the TCSR DP_PHYMODE Registers
>
> MSM8998/SDM660:
> 	Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
> QCM2290/SM6115:
> 	TCSR_USB3_0_DP_PHYMODE at 0x3CB248
> 	TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
> SM6150:
> 	TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
> 	TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
>
> Additionally, I found some interesting register documentation for QCM2290/SM6115:
> 	TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
> 	TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
>
> 2. SM6150 Test Results
> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
>
> Based on these info, I believe these are separate PHYs, and only the TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or mutually exclusive. This is why I have maintained separate private data for each PHY and implemented Power on mutex control via TCSR, rather than using a qmp_combo-like structure.
>
> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
>>  1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..17e37c1df7b61dc2f7aa35ee106fd94ee2829c5f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-dp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QMP PHY controller (DP, QCS615)
>> +
>> +maintainers:
>> +  - Vinod Koul <vkoul@kernel.org>
>> +
>> +description:
>> +  The QMP DP PHY controller supports DisplayPort physical layer functionality
>> +  on Qualcomm QCS615 SoCs. This PHY is independent from USB3 PHY and does not
>> +  support combo mode.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcs615-qmp-dp-phy
>> +
>> +  reg:
>> +    maxItems: 4
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_ahb
>> +      - const: ref
>> +
>> +  clock-output-names:
>> +    maxItems: 2
>> +    description:
>> +      Names of the clocks provided by the PHY.
>> +
>> +  qcom,tcsr-reg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the DP PHY moode register
>> +    description:
>> +      DP PHY moode register present in the TCSR
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: phy
>> +
>> +  vdda-phy-supply: true
>> +
>> +  vdda-pll-supply: true
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +    description:
>> +      See include/dt-bindings/phy/phy-qcom-qmp.h
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      See include/dt-bindings/phy/phy-qcom-qmp.h
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - clock-output-names
>> +  - qcom,tcsr-reg
>> +  - resets
>> +  - reset-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +    phy@88e9000 {
>> +      compatible = "qcom,qcs615-qmp-dp-phy";
>> +      reg = <0x088e9000 0x200>,
>> +            <0x088e9400 0x10c>,
>> +            <0x088e9800 0x10c>,
>> +            <0x088e9c00 0x200>;
>> +
>> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
>> +      clock-names = "cfg_ahb", "ref";
>> +      clock-output-names = "dp_phy_link_clk", "dp_phy_vco_div_clk";
>> +
>> +      qcom,tcsr-reg = <&tcsr 0xb24c>;
>> +
>> +      resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +      reset-names = "phy";
>> +
>> +      vdda-phy-supply = <&vreg_l11a>;
>> +      vdda-pll-supply = <&vreg_l5a>;
>> +
>> +      #clock-cells = <1>;
>> +      #phy-cells = <1>;
>> +    };
>>
>> -- 
>> 2.34.1
>>

