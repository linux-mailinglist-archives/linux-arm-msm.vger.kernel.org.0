Return-Path: <linux-arm-msm+bounces-70250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703FB30F73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 445CEAC65DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80582E62A5;
	Fri, 22 Aug 2025 06:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLdEcBZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5CE2E5403
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845106; cv=none; b=LIZj17DXKEsO1z4aqpKusqBZUwXiooReYwjWqzep4VVcRxLeNZO+USRtHhDnOueAxpO5L8Zh9hWlmECDTs3iAq+5qMOmL5/DX7jfhTMqpRuqBzS9pbwk8CpfPNnLxN7MDW5V7DYWYWc6ij0kie55c56swVjfGrzJP6eFjSUmcA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845106; c=relaxed/simple;
	bh=H8mDuFA6IN6JVet/RRFR6a5B2KSBAJFFYyDeo8+iK+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPL5YgdQ9HUKzXUxtYqAwssJPVcZA62EMJ7I9aB4S9JuXfjRIJlzdoKdDlGdyXcZjNzxkRWoSjefPxf/xqLIJgXQxwzlBKQ/a+yXkfC0TV75KPSX4k5UWWMWe/zPleoaqUIbcTLwSvu8RVLmVOxe/irSWYXL/+YxooVeIjCR1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLdEcBZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6Goa6023954
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68E7HoEEPsN8r52rSpn4sYFWr4Hp7mhQ0BdhcIro7eo=; b=FLdEcBZOQdk8yONE
	lhrfBjCtxDx+GW6C1tCTAQNW+Mp9WqpydK3NSxxGxPtB3rS2yXEYyxv2dLeTcB0u
	KLdiEe910hb5Eqziw0aF6najaBt3fImRYWTSF0dqFfUG1tvp+lJGt6GX/Zvo2HVH
	91SZNxDNhzQ4bAYOSChzW9kxsp4D+Ug3WNijrXx3bSVMcSR0ayy61suRYge34UB3
	5mXxqCPxC5ELOzIT7eDUjOxN2D/CWzyGKk1HW3WeHjQIlNLDmtXBOtD64lhy0YDW
	pQNvw8JFJ78mtGDmdA3EQRZjTIPkl1b9Tyc6VLCXjsNMrlnEsRCBrITGt12eJa+T
	wR9K0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529048n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:45:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582e9d17so4824395ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 23:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755845102; x=1756449902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=68E7HoEEPsN8r52rSpn4sYFWr4Hp7mhQ0BdhcIro7eo=;
        b=AXUKpTTYKK4nOZEc0kIMo/AOSUMUiUFSv8m866fy/HYwIMDcZZ0X+OeTFpBcX+P8LA
         AV+phIgIVNvpsjUXEJ7MuZHtcXQ6jG+ASgEt291sRo8C5vSkp/ZasU/n+38djvCd+XIF
         SaWtoyMELWqI328odWKfK5km1BfR8bTOtb2F6r/8/KqiZP8eMVtyVOJq57th6zsmXfLI
         mtq9Y8A7c0VfqrCMtQwkg+uVGwWHfYLzhdHiyHbj/ruZ4N5i5QlEeNl/UPGPBAFLSOqr
         aexv8BxOe3tm6SnmYy4RIP+3eT13hqIMy7np1/Ehsp5I6fGKtBr5ErmfYxbxvy6GXba0
         e1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+jj5iXqo8Btxm6IS0FH4LSksXDN9+mcMIN7bbhP1IUPzVQjalNOjnZhi5MHuoGDrjiFwwcA+vRGupACdP@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGgRfk0RnGHC3Vg6TTf5cOyH01XEjGS4RAo4ihWplDD44PW2k
	9sSfnPzXkZjpQQ8Fpy+3rAXQv2/CWlI3uibj4Yk175YSHhFwNDT8gYXrn+L1euLx3VWNpqTnAxP
	Dr6WefTDLNFwCSUFhjdxH93asa8OTO31FaD8x4HRM+kXML83AWLHjU3BGZRlxR4oLb5o+
X-Gm-Gg: ASbGncvbYl4dHJUjwOyntRUIFI+m/xYFihyma5NLJ38exR41nv+GtBEQOCQ2zO1Jlho
	fYBQYXdwU47RvHaPQuOT9qSw7NbFDZc0t4XMqsglQEYLxvFY0ZF4m8NT3PhcSdsGKzuPtH+y1ec
	4DwqJhiey1Q6Q8JKOHwqDKFBq3myLO8f9nl643gUplrKeKa4ZNu4zMwZGpOSJxzFz2IQbXq0Jt6
	ARr9OvXTxnh/+Se358rTSL9tMaIS1ExHkvPmeSXgQUUeh0cOquCSpv0rUSenfEiGzIsHNIM/OHg
	SFYs1QLbTgmcB/rCtKdDeyDGLo1lSb6C3usQC+yu2nTPjtAxLs9qgBAEjGQjthabXGhhFuvUhyD
	tZZnnq7N495qsHq7ufvW5wvQxaUvqYg==
X-Received: by 2002:a17:902:ecc6:b0:240:3e72:ef98 with SMTP id d9443c01a7336-24630149490mr14840165ad.10.1755845102226;
        Thu, 21 Aug 2025 23:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTRC0qrO9ZsKmhumtwBi+xoakMJ8EF7G7365u0uhaKeGqNO2S7FCZeHLoYJ1Pg7dXN+9YNVw==
X-Received: by 2002:a17:902:ecc6:b0:240:3e72:ef98 with SMTP id d9443c01a7336-24630149490mr14839835ad.10.1755845101668;
        Thu, 21 Aug 2025 23:45:01 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed50352esm73541165ad.128.2025.08.21.23.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 23:45:01 -0700 (PDT)
Message-ID: <1cb3803e-5617-41ff-bf3b-95b9f616fbca@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:44:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
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
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <3lodaz4t72vsxnstfe2msooo3dnwbqy6hxzdshcmyrgb3fbjnv@2afo5atezt24>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3lodaz4t72vsxnstfe2msooo3dnwbqy6hxzdshcmyrgb3fbjnv@2afo5atezt24>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a811ef cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=H_21wVPlT9rzXepSeDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: pv1xgoS4U21mMZcREVCvKH1BghHuf4U_
X-Proofpoint-ORIG-GUID: pv1xgoS4U21mMZcREVCvKH1BghHuf4U_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+00Lrg9d80e2
 B15opgKoiicja3i2HRjbvz5FkJd6OV/aZUBfOXci9OfYVis/iEcKvYE+2EoJQXOPCv1G19Nz5TC
 lnJvtvJhB1eNLxAQjCx17uYOmgU4re8mnjBOmwEFVSUZJjtqX3rrRhU5QRasQUUsbVOJkJiwKcH
 M3Xjx2CTMXh/CtlRzw+oECpMM9xK1aqfce/9cPbpc7wRVvo8+TJnQ13zgCMucw9uCjl04hXmGOD
 BWQF6JS6mWuuPiUN3+lif9A54OQAxxdUMgMjv/6XQdsyGr5vWDRrsfgW4JkqGKksIvTYXqOySkf
 HgDitXjoOUTIAMPDM41vpIy3S00MSai1jpGqiX+fp8d9XxvmSot7ldaPDSZGelh7OImSSzfzmu2
 bh+KZEpx5S6ojYQEjxQAJShacKfhOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013


On 8/20/2025 6:09 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
>> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
>> on QCS615 Platform. This PHY supports both USB3 and DP functionality
>> over USB-C, with PHY mode switching capability. It does not support
>> combo mode.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
>>  1 file changed, 108 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> @@ -0,0 +1,108 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
>> +
>> +maintainers:
>> +  - Vinod Koul <vkoul@kernel.org>
>> +
>> +description:
>> +  The QMP PHY controller supports physical layer functionality for both
>> +  USB3 and DisplayPort over USB-C. While it enables mode switching
>> +  between USB3 and DisplayPort, but does not support combo mode.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcs615-qmp-usb3-dp-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_ahb
>> +      - const: ref
>> +
>> +  resets:
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: phy_phy
>> +      - const: dp_phy
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
>> +  qcom,tcsr-reg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the VLS CLAMP register
>> +      - items:
>> +          - description: phandle to TCSR hardware block
> Why do we need two phandles?

 Thanks for pointing that out. Will update to use a single phandle with multiple register offsets in the next patch.


>
>> +          - description: offset of the DP PHY mode register
> s/DP PHY/PHY/


Ok. Will update in the next version.


>> +    description: Clamp and PHY mode register present in the TCSR
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +  - qcom,tcsr-reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +    phy@88e8000 {
>> +      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
>> +      reg = <0x88e8000 0x2000>;
>> +
>> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
>> +      clock-names = "cfg_ahb",
>> +                    "ref";
>> +
>> +      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>> +               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +      reset-names = "phy_phy",
>> +                    "dp_phy";
>> +
>> +      vdda-phy-supply = <&vreg_l11a>;
>> +      vdda-pll-supply = <&vreg_l5a>;
>> +
>> +      #clock-cells = <1>;
>> +      #phy-cells = <1>;
>> +
>> +      qcom,tcsr-reg = <&tcsr 0xbff0>,
>> +                      <&tcsr 0xb24c>;
>> +    };
>>
>> -- 
>> 2.34.1
>>

