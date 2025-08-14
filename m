Return-Path: <linux-arm-msm+bounces-69285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424DB26E80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 20:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D618B64EF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 18:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83385304965;
	Thu, 14 Aug 2025 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iH4Smz27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A029D291
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755194358; cv=none; b=Bh9EbcaBxhaLYnLSqt61ApFHepUAPrhJYz/nCuCaEWRBZTbCVI4dut//VXGzNq9unvvDQxuTgYnEOegZxuQ3H/6FOKx/eIgjo//fEffB4BcuG6+wW8a2QOtjZCA5J1DPXMIKKyfAEhvq3w0+2nN4cqdlsPQ2u5B8IRnByeoApNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755194358; c=relaxed/simple;
	bh=JS9t65y1Tb1O6melp5jomNPznMIQx6bnOe95kV9Fp1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5NNaaks2P5gdn2XsVwuuikq+TipCRYNiI7jqVfYBtV46AdhXbTyyX927tEdxOhoqvK3UYhOrvsJRS+77HA0+AKKxr6BuehvEG3hMPIiW2S3c9zK+MZWpDAwdGn161Vc5YqSgJlKHXvdM5RjuS24CZ7IyvoHrtfGCYovoQ3dXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iH4Smz27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9p7jQ012964
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 17:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LO/W9ECJNjW/7mTqzpbQr9aX5cekagiWhhTTCfpUqyY=; b=iH4Smz27c7c6v8fC
	gd4IJ4GLcEUkrrX1oxWoEATx0vco95d3li0XOYATVXPe0c2hX/cjQQzzkwe9wMV3
	joDkba9hfIDuOe5X3SAs9c7+P935nusLu98V9W21ADk5dfZrXg4xKdZS9bKrhfIh
	XSVzFp8mB1l0WA1Z2C/vZGaHIXmev/SOnW2Zsk5NNllWmWDzUMqG3Sv5mH7fC9zy
	w1quCsa6Jc9s+i1bFXXdm1sWyWu+Nvs57+Y/Ovcf5OpgvwsjNIR/2rc0cF+wLRZO
	2WtWKVwOXHQXVUem3lWGCZPGHLqaGz3Sftt7p47Bw03BY982V4vGDJtzlBoq+j5J
	+uHwpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6vk54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 17:59:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458297be0so24985265ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 10:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755194355; x=1755799155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO/W9ECJNjW/7mTqzpbQr9aX5cekagiWhhTTCfpUqyY=;
        b=w8e6HYoxQrUDlqOrOmI7DQ0crmVE2wwXI6qS/FPYUjTMO5dfXy7YI1yZ+Kzw9ajrGS
         5kRuJMUPJEuwGIqkpKRF9M0bb5dNeeWKF0rC1BQU+D/gQamWyK0PZh8rxd8ewu3M+aBv
         UFbHF8kjar9Xex+BHxJ1nPHx8WtVKdy9Xa2RcW6z3czG0MVeFygeEmKHfc83+GNDFhwG
         qf+FJ2nkJqN/dGFK6hAemM3eIQ+orhqSVbaBfVPCgetQIw2oYmSqp0Lk5y8nrAJiU425
         cooGnjKP+5eff3vRy5B//sP5YQjzQlL3XliK3Uohqvt6td4/sexLB6oKS7GYR0y87VE7
         4n/g==
X-Forwarded-Encrypted: i=1; AJvYcCVg60jJMDTBGMF5rBnmbzpJk7qbEzOKCjT4mxvDbxn3Cm/CxusTzK7lec2uXlINErI4kbC16clGEXQ2G7CY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3GjFt9L2X7SJgDjw7UVvuUS7aJ32Y5672UKvbQEURBODi6gBj
	I8xAaT+qiMNyK5hf1SyC9cqBd6fxE3EQ5zeHnikwepr9JAW0gTuSksdhioFa9XH1A5aA0kH4TRB
	86KtNAx1aSXncfEz/oIt5fmi/rzNB2ey8sc18VdGA+EtkwqqHhiveYXt844oS8r8HTGL8
X-Gm-Gg: ASbGncvjkSnI0sXFsXtQet+ePpfkRbQQ3h2M3SU+y2JpqlV1O1nMwgf9UFM6U7fZDPj
	qYa1rLPoMmTLJMTLwIxuML7+5h6OP2BjKSoYKucfkCNGtTjaJEvi1h7G+d8QzhimZLEgPJxVnqp
	B3oxVfdmkOf5PcOgHoE0geO2aj36S7Ky1g6bVe8PH4Xp11H0QU6mlk0A7xFhqoZ36uN7vVO/pDt
	QPmXJ79OsQojN3E76PvgeYsbPrVZTpEjVx0n5L2AuLsVlzBRAEHSdo0N0X5X+pERw3mhgKfzqIX
	5Day0P3ZleVBqMosQE3Hw/2WU7tREg3rwova8Z/SUQaT/QnaXaxTuLuup4KUoAN+PScl
X-Received: by 2002:a17:902:e78e:b0:242:460e:4ab8 with SMTP id d9443c01a7336-244586dbc4dmr58553115ad.46.1755194354941;
        Thu, 14 Aug 2025 10:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIklnR5m9SKzdIwzPoNhD2QB7ecbzwEviH7LYbrbwUTVp3FSf4QzZ8WYzFNV2mqkqnebnf1g==
X-Received: by 2002:a17:902:e78e:b0:242:460e:4ab8 with SMTP id d9443c01a7336-244586dbc4dmr58552725ad.46.1755194354475;
        Thu, 14 Aug 2025 10:59:14 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef595esm354448525ad.13.2025.08.14.10.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 10:59:14 -0700 (PDT)
Message-ID: <657a4915-fc24-4e6e-bd28-4e122e66c97d@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 23:29:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] dt-bindings: clock: qcom: document the Glymur
 Global Clock Controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-6-a408b390b22c@oss.qualcomm.com>
 <wttnza5lagqzda2qxeyksm464mmzycp7vwcwzrwynx7mmounti@ex7pbezr6eiy>
 <2ac5aaa8-18ba-466a-ba67-8212daf9c3b5@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <2ac5aaa8-18ba-466a-ba67-8212daf9c3b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3bsW05OPz+fp
 BoEa7WAejZPVWWDCEDXtIVY3amzeL1l2xMdD8G35MN7Md3PDeGWKi+VI7+Ek1I6WbnukCtu2Xvz
 wQj3Y5Lb8T1m4/ckWxzT70ChYdUYNO+Ulv1E9Lpqy7INBJ8Kq0UJgol4ZLzpIa0iScb09+c6WTB
 VVNs34MOf4/SKks3MZopnkTieErU4RWutnRR6HN/dG2gHxbSd3pQIwHo6y5rqGD9g7ANkiF3SGx
 g3XYrqLTR1JKJyrDdiqfuBOWLJNoxGpq4dQr/6alGHEqo/qbJCkFP5jtsjd+kQVleFAoDUB3mFA
 dBpKS60WFoaCdh2NOh2iDthSlIeHQwcdZP2XlFuqtrbcKstTsGKXn57g3uLXPmY+nwlNmqkniBg
 YB+4N9uN
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689e23f3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=/kiP2gCwObMqexHosDfpNA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=_CSq4AhyHEGRIHh0IXIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rxh3wMX96Lv0XyxaYvfsMSvisiaPPBB-
X-Proofpoint-ORIG-GUID: rxh3wMX96Lv0XyxaYvfsMSvisiaPPBB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075



>>> +      - description: USB 2 Phy PIPEGMUX clock source
>>> +      - description: USB 2 Phy SYS PCIE PIPEGMUX clock source
>>> +      - description: PCIe 3a pipe clock
>>> +      - description: PCIe 4b pipe clock

Bjorn, will fix this typo and the below one as well.

>>> +      - description: PCIe 4 pipe clock
>>> +      - description: PCIe 5 pipe clock
>>> +      - description: PCIe 6 pipe clock
>>> +      - description: PCIe 6b pipe clock

Got this extra due to huge list of external clocks.

>>
>> When I look at the documentation, we seem to have pipe clocks for pcie
>> 0, 1, 2, 3a, 3b, 4, 5, and 6. And this seems to better match the clock
>> defines below as well...
>>
> 
> Bjorn, the PCIE 0, 1, 2 are connected to USB4 PHY 0/1/2 pcie pipe clock
> source.
> 
>> Can you please confirm that the inputs you have listed here are complete
>> and correct? (It's not going to be possible to add things in the middle
>> later and adding 0, 1, and 2 at the bottom will not sit well with my
>> OCD).
>>
> 
> These are the complete list of external clocks and nothing else is required.
> 
>> Regards,
>> Bjorn
>>
>>> +      - description: QUSB4 0 PHY RX 0 clock source
>>> +      - description: QUSB4 0 PHY RX 1 clock source
>>> +      - description: QUSB4 1 PHY RX 0 clock source
>>> +      - description: QUSB4 1 PHY RX 1 clock source
>>> +      - description: QUSB4 2 PHY RX 0 clock source
>>> +      - description: QUSB4 2 PHY RX 1 clock source
>>> +      - description: UFS PHY RX Symbol 0 clock source
>>> +      - description: UFS PHY RX Symbol 1 clock source
>>> +      - description: UFS PHY TX Symbol 0 clock source
>>> +      - description: USB3 PHY 0 pipe clock source
>>> +      - description: USB3 PHY 1 pipe clock source
>>> +      - description: USB3 PHY 2 pipe clock source
>>> +      - description: USB3 UNI PHY pipe 0 clock source
>>> +      - description: USB3 UNI PHY pipe 1 clock source
>>> +      - description: USB4 PHY 0 pcie pipe clock source
>>> +      - description: USB4 PHY 0 Max pipe clock source
>>> +      - description: USB4 PHY 1 pcie pipe clock source
>>> +      - description: USB4 PHY 1 Max pipe clock source
>>> +      - description: USB4 PHY 2 pcie pipe clock source
>>> +      - description: USB4 PHY 2 Max pipe clock source
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - '#power-domain-cells'
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>>> +    clock-controller@100000 {
>>> +      compatible = "qcom,glymur-gcc";
>>> +      reg = <0x100000 0x1f9000>;
>>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +               <&rpmhcc RPMH_CXO_CLK_A>,
>>> +               <&sleep_clk>,
>>> +               <&usb_0_phy_dp0_gmux>,
>>> +               <&usb_0_phy_dp1_gmux>,
>>> +               <&usb_0_phy_pcie_pipegmux>,
>>> +               <&usb_0_phy_pipegmux>,
>>> +               <&usb_0_phy_sys_pcie_pipegmux>,
>>> +               <&usb_1_phy_dp0_gmux_2>,
>>> +               <&usb_1_phy_dp1_gmux_2>,
>>> +               <&usb_1_phy_pcie_pipegmux>,
>>> +               <&usb_1_phy_pipegmux>,
>>> +               <&usb_1_phy_sys_pcie_pipegmux>,
>>> +               <&usb_2_phy_dp0_gmux 2>,
>>> +               <&usb_2_phy_dp1_gmux 2>,
>>> +               <&usb_2_phy_pcie_pipegmux>,
>>> +               <&usb_2_phy_pipegmux>,
>>> +               <&usb_2_phy_sys_pcie_pipegmux>,
>>> +               <&pcie_3a_pipe>, <&pcie_4b_pipe>,

Fix here.

>>> +               <&pcie_4_pipe>, <&pcie_5_pipe>,
>>> +               <&pcie_6_pipe>, <&pcie_6b_pipe>,

Fix here as well.

>>> +               <&qusb4_0_phy_rx_0>, <&qusb4_0_phy_rx_1>,
>>> +               <&qusb4_1_phy_rx_0>, <&qusb4_1_phy_rx_1>,
>>> +               <&qusb4_2_phy_rx_0>, <&qusb4_2_phy_rx_1>,
>>> +               <&ufs_phy_rx_symbol_0>, <&ufs_phy_rx_symbol_1>,
>>> +               <&ufs_phy_tx_symbol_0>,
>>> +               <&usb3_phy_0_pipe>, <&usb3_phy_1_pipe>,
>>> +               <&usb3_phy_2_pipe>,
>>> +               <&usb3_uni_phy_pipe_0>, <&usb3_uni_phy_pipe_1>,
>>> +               <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
>>> +               <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
>>> +               <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
>>> +      #clock-cells = <1>;
>>> +      #reset-cells = <1>;
>>> +      #power-domain-cells = <1>;
>>> +    };
>>> +

-- 
Thanks,
Taniya Das


