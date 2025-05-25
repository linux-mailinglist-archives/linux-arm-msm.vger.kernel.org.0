Return-Path: <linux-arm-msm+bounces-59310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850DAC328A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 07:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD923BAD79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 05:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C60918C03D;
	Sun, 25 May 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GB7hrnOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38218B47E
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748152658; cv=none; b=qabRddJPtAsijDv2giBuARvbykkKkNK2ElGfMzWWCVw4mzGRXAQO6qer+1f2F723QpXWdWDqxJARdwtCtsv1BxOh7Hv3ts51FaGszjgME/MZO9bDNpXwXNjC7EyX7pnfIRiu+sjaBWPkQpgDCdGSy0A8q/sEe5sPMV2ZGG/Q5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748152658; c=relaxed/simple;
	bh=9ozY19np9D59zhCMV9nEj2Z3kQvxFnZfxXl6FezHh9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQW7j6F1FPFkgN887XnPkYLBsu+ijyG93tbGTNLkWDD9zJjyi1gSA2SHdTWfn9YRBHWbEmZa78vFVBDdgJZzGDTyfJdDkCdBA3Wugeh1i0lGilC0H6bSZHqa4L+JuHf5fERe1shs+ojI22zkMZUOUhhNHZhB1X9AbaZ+9z389TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GB7hrnOh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P4VjOe001417
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 05:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCBrRVec53XJAJcr8a7rcd7CgHI9045Hz8PKjdUV4vM=; b=GB7hrnOh7GM7LAYR
	m62gizWlb1RHncaAKE0ua+Rt/1OnsmXG3YbO+WTjuKU70W1BF0tgB1+Mq4i+i6hW
	q9/3sIZEYZ3DGLLRhwgkLZDkAhKM9FzGQekbLKuj++ZLh30+9swLWdNN4iH/3RfF
	1f9zCKYpEAXcEbGfUkLFGlZDfKVEyh2iK56oye8LNwFscG470Q4ALQ46lSpyf8WQ
	7AsmD2YSu1suOrlRR9v68J0W8xk3u4GvBsyaGS7lfZgEj2gqMjLCHr0isQiiDVww
	sHVp3qjF/Rsxl2dnZecY/U2YI1SFWo4JEgJgmnCO/2uB7U1tXkCXJKIug2QWWtDM
	DLbBZg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5499m2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 05:57:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so645832a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 22:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748152655; x=1748757455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCBrRVec53XJAJcr8a7rcd7CgHI9045Hz8PKjdUV4vM=;
        b=KJ/oLalkGz8Ce+bn84qtG1HmSkWb7YxZgzx7WFmgdds/EWhjdxuYb1os0f9J/aELfb
         yh9oX5kv61ySWLsldziicu01aaEltVeX66ZoMae116vxnbAd3HLm0TefA7xqQCY0qMBV
         fCZo8eBtMWCY9QwC+mxDtbUhQgtLP/NQvCtfSvsMsj1fXtsW9igJ8VV1Ub/ndC3ZAB+y
         NaFJBWC1PX3iav2FAJqxh+ARzI1k3+rbsAwmxyualZE+n/11PBv/ju8NxtWYL/bQhBYs
         c99NfabJyyooqXnOg+35ZPxhML8Fk3U/XnIS0Pm7AabO89ZBq59wQ0FQu6gfcAyR/nsZ
         aQng==
X-Forwarded-Encrypted: i=1; AJvYcCUJkqb+I8RF/QoI6DQL5nyhfrO0QbAhXAleCRsykCBro7C3dNmRiLFK4q2v5AkWTVXV3yH6ltmXINRHjVGU@vger.kernel.org
X-Gm-Message-State: AOJu0YwRmO9NlXcjvS3kIW5CJSrdE9zHkIn3z0phPYEbEzUOCqGBl2Cd
	LyD4G3pg/Juj/iZvjYUMIb1zRQAg7fJAC48eq7PwF+AbBfPMXye1lDjWTXw6GgJIjZW5pN3Uga/
	sM8NLoOqpsum67BlMiLPWmTGheVHjEVvkEF90ij5KTtS3nmo3phvnMl2OnwkERDzhYvyo
X-Gm-Gg: ASbGnctGbYYKLqiIdTGomQ1Uy3g0IZ4fifQKFHbutMIs8le57HEU67GaVADo1K6B1fV
	Xulv7dzVkya7ew0NGLqJSkwUi3VAyipwP+x2M7PovgW9KGWbj9QMQ+C+MDr+sGV8qpGOHjorcf5
	1TIDfmDeLm1h+Hx//xsuxHVfTpbC2QDcgWnAXsH7dUTxpZSepXuQYQDeIcSZ3sssFsI4krxZxda
	vuFJegPrwdr+XG2sZAqX6cwAIhK1fAJB1nT2KIfyVWsT/H7nJgIToEC0ZFWTT7or9I7/+pyeCfW
	SuFslT07qz1LdBJkIcaZ1EVnCFoqd6v6C6Oz
X-Received: by 2002:a05:6a20:6f08:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-2188c28ac6fmr7979905637.23.1748152654954;
        Sat, 24 May 2025 22:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYB9ys5LU41WMsUNzEUbblt6pbgRfq0ZbrNTfi12+yDo2o8NBvJF6v2pb7A79rQ2Bbbd2jZg==
X-Received: by 2002:a05:6a20:6f08:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-2188c28ac6fmr7979885637.23.1748152654611;
        Sat, 24 May 2025 22:57:34 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829a4dsm15594030b3a.107.2025.05.24.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 22:57:33 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Sun, 25 May 2025 11:27:18 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
In-Reply-To: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748152639; l=1254;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=ZrWCEywu0mWwC+jWkykM+m7UXWwtOyeU4GP0qpQ4gdA=;
 b=Nol7LDvUZeI/WcrBH10lNY/PP4g26x7BSa57S+p9a1rFdJ1BMFs4YC/57HgFFjJAxnjdGJUXG
 Jov7H1oROAaBPWVX374fo9Rx4rBOEDS7JAQ84wyluHeGu5RQUOFn4aJ
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-GUID: yI_Wz6-9E9BPGWzlPZYM4lWGcDIxDD2K
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6832b150 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=A2jF9ndpTPISZJbatkMA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA1MyBTYWx0ZWRfX9sUQk/uxS3Eq
 6HlUFFu19xtQBNt++sIBQwWOx4pk/iJjkmdO486TRzRDJHoAPGTlJY5H9UTKM7X7Kdf3mbb4JgF
 7jB2cGpbaNOfY58uuBW9z1Cza8tl+dZY6EKPoIL9elMzBwNACIpjdpwG2goxf4s5uFN4STz+4ar
 4LoTShfVhQh+Lqfp0T8zVnXx0o7ztAxLX8d45/8hm8V+yWMXTt3YxUHb4imLZb7QOujDy+E3mQs
 nCg74ymWMp5R3G0cOWfYcjyt6SWwbUX5khTpiH4IMyegXrDz8aH3YilDm025a+ZAzwG47plEEGd
 N57eBiTSSpOpw9PyG1vDmx0IBawLw3x9zcItgsSz8tBjr5x5q6/DppYfmYnOs39JhnCQulkpE/d
 yKqIIBnkOhDHkKjm+P/kL2x/JuNSY0mmd83hj6h+OxFvxK0YQxFNEbkRn6sC+RvyKAFlWbk4
X-Proofpoint-ORIG-GUID: yI_Wz6-9E9BPGWzlPZYM4lWGcDIxDD2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=945 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250053

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

The maximum link speed was previously restricted to Gen3 due to the
absence of Gen4 equalization support in the driver.

Add change to remove max link speed property, Since Gen4 equalization
support has already been added into the driver.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
 		power-domains = <&gcc PCIE_0_GDSC>;
 		phys = <&pcie0_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <2>;
 		linux,pci-domain = <0>;
 
@@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
 		power-domains = <&gcc PCIE_1_GDSC>;
 		phys = <&pcie1_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <4>;
 		linux,pci-domain = <1>;
 

-- 
2.25.1


