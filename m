Return-Path: <linux-arm-msm+bounces-55117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E3A9884D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FCD916619C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834DF26FA5E;
	Wed, 23 Apr 2025 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqe1tPyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CBD26FA4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406972; cv=none; b=JTbDh617uMgR1DySaDGM8CncF5Y06i8phtWhQa/r6gc/CmGxg/CZk9cXPTdnudpEhojc5hgky2NwrEvmwgGC9JGXRFrkcrKozvvCuabW2puqPVxNBLbHWleNWFwLu4ZrkfhCwnllWumKMWv2FdKOHT93amGusIWwk0bnjAdTJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406972; c=relaxed/simple;
	bh=Ao/qnVJ2ED9fYS1CHDGACWoxp+R0Ll0MvJG6b2vG1bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVvWBQZdsTgvDLJ5lMt/3WrL7PmK5AroA4tFSqyoHT3l9OrJM8y1qTTWnw/LVkbh+lSv7Kx8aa3IahIuhOt8oTMljfC0TFIzXBpZMraryBzCtoa0CDMbdNOlFq5trWxchW1ckfZNmp4ImGN7K5Z2sNmb5MDt8nRPT/54EcxeyeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqe1tPyo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB6SHv023892
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Y1JwMtd4uK16pcTQ8YY60okLSHQtu11DwqQOIErEiE=; b=iqe1tPyoM59zRd4J
	Ibubj1eI4GdFGoZbHFt91/6+Hkqok32FvrMOtIeQp/XZ9OVOFJx3HGqfo5h7Puo9
	Ngv69N4hm7jDI1v0Ieb5iEp/xxe2wnmtbjb6S+F59OmTRpWBdih5WoEsz8JTItxf
	Knfp5V3oTc6NWsNJEqGF52pAq/vss2LTS6SlWqKwcevQNpOc3HU7e6j127VqR2aM
	HE2BFSZ71gR+bH2Cl909LjFX9Q98DRk9qAWLHk2rwuz+VrF+3IPRO6JAjLDkMnm2
	WEH0h/g+uUseqMVzhIxHY49xFvFNsrP9fjj1irVShpzlVtTuFCmalVPcMWDZGMDe
	S5IpLg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39w7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:16:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1415cba951so686977a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 04:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406969; x=1746011769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y1JwMtd4uK16pcTQ8YY60okLSHQtu11DwqQOIErEiE=;
        b=MN7a3eSyf+i5DEOBnlFfvDtyEQ48N/Ok9WF5c46JmuUt/VRKArmIgeobzyG/RVTX15
         54P1K1nZuuyyE5IkvQhVKHft/htOqlUgUOnjjrQueAYd78MhsLIAxW+IOkK43s7IV4eV
         JZNFzS0zyqCkN0cGZV3aHiDNMU2JxcId7vAodx04fo+2gWWAPIINQ4jUZWu2Td3VTVzc
         Raf4v9i3L0OwDU8qsmhCM2i4TtHPEBKTeItx3yqp8Czh0hQpNLzLb/SycSbmqHnmSDef
         Vcdj9tAk6qYlmHcYL+WAz5qLMzDghMUa9UOAA+HbbokMlZ8EYReaU9KGQFC+ZCUwbFF1
         JQLA==
X-Forwarded-Encrypted: i=1; AJvYcCWc9tD+uFHCXja05h7YD6+VKiyCM1D50cKBIwDfAK1+4h/IF37/EUcxnG+yIuohZCFljBzvhiSOk2zkCpWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOC9ec42mmAh7zpwE82rKnO+GZCGS0kZJ0F5CI0RHYNdvirCEc
	OyjathZmbrZxsUERy0IBT6pvDcq3tlUG0cDm0s2zLFtTxppzBz36kAY7Lr93KCXln/4dtfdhiA5
	M0VC2kk7+7s3DDvPwDx/XP1Koam5l1edU8fGeO3v8rS2E7eQVheOJnZZBCIHlegdV
X-Gm-Gg: ASbGncsWPvEGPw5qZ1QOssrRORABhQ6ZoAHKUp48awhkLSv+AKeLMTFq+YPL/4JYtDn
	nGRnfw34g4gba53ElgNkvRtfI1xaIeGF+mdRqxse+5jtru37EKXeN0w1mnXy7qeu9MHi6oCiI9X
	SS5ix/POfI5z4DRd+8+wsGF/9Wbv0aE/rqyul42T/cVOffEvUtpQQE227hPgFVCUq/XgqPc3/Zb
	u+2gZh4C/Oop4L1lg9VjPKczMQM5t4fgBmQ49PzrlPqz7J8uNQSF6iSV5+aLD9J2Wd9Y+f77XmB
	QohHJPzZiX31HoMHjzslWVXBViVC2Kz3WmoKLvFbcH56ww==
X-Received: by 2002:a05:6a20:4392:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-203cbc25d41mr26711597637.4.1745406969169;
        Wed, 23 Apr 2025 04:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIgeTg8nQyicE0E2gbgH4aTKJoTOrELpR/ZGQokExKHFkOwkPkoAk07Qr9yJ/+8LmKu70/sw==
X-Received: by 2002:a05:6a20:4392:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-203cbc25d41mr26711553637.4.1745406968764;
        Wed, 23 Apr 2025 04:16:08 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c5f8bsm8787322a12.35.2025.04.23.04.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:16:08 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:45:44 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: Set max link speed to Gen4
 for PCIe EP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-update_phy-v1-2-30eb51703bb8@oss.qualcomm.com>
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
In-Reply-To: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745406947; l=1327;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=Ao/qnVJ2ED9fYS1CHDGACWoxp+R0Ll0MvJG6b2vG1bE=;
 b=JFxcl+90IRUx26htP38D0Tn3drRo2Ftyrk2iITfbsNyYcRHp5k4/eMCl0QH0DNaU1BRZOYIqV
 2iW1NZeYcsvA6WieFd3lrevbrrjLH/DfEwH9AZCNXTLd6WdkN0CrfCW
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: y5Kabc5X-dh3BA-TD3rV-JOpXaVnX7Z8
X-Proofpoint-GUID: y5Kabc5X-dh3BA-TD3rV-JOpXaVnX7Z8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OCBTYWx0ZWRfX7CA6x0IU0y9G enjQL9rfIh2+SEYlvH7uUl3m0iHue+ct74jR/+5PBq7p+5gWUSovAsWrHbr7jMC2j6l/QFJHExJ au0e7YkUH7FY2QleK44K0R6Iad9I69ZGsrhaKjX7K92HT4UNi4jpSgD46SbVEW0GMwEdSeJ3eUb
 hsc4Z6qnBFY/bVLMkdtqZq0MOX2gH5ViYZxZztDrWTHGL3f2XXVO6k/GNd+9gBhNkweOQTneb/i NuIzrGy3RidcXPvui3HJ/AhGqpAeddqcYfqIGrK2n51aByE7SZlzaTOm5NXKk7tSCb0tSABY2bD rLAErXYPuCfuMM1xP+DowfoXsm+61l0D8CAPVbhk2GDF5V7g9Fa4KmgAYUfxOGVDcUqa7b9iMB0
 P8CHmv3f3IpaBzqxHghfMOSTKi1ilBnaBdQIAp3lnbE7cVzTFgza0aoP+Fmf3OFV+ByoTDbu
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808cbfa cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=o35e_me_ocybVmOQpLMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=962 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230078

The maximum link speed was previously restricted to Gen3 due to
the absence of Gen4 equalization support in the driver.

Add this change to set the maximum link speed to Gen4, as Gen4
equalization support has now been added into the driver.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b143444543c68cd1c1d475c3302555..65d9433a298f80eb782439120ad9c3c74025b441 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6462,7 +6462,7 @@ pcie0_ep: pcie-ep@1c00000 {
 		power-domains = <&gcc PCIE_0_GDSC>;
 		phys = <&pcie0_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
+		max-link-speed = <4>;
 		num-lanes = <2>;
 		linux,pci-domain = <0>;
 
@@ -6620,7 +6620,7 @@ pcie1_ep: pcie-ep@1c10000 {
 		power-domains = <&gcc PCIE_1_GDSC>;
 		phys = <&pcie1_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
+		max-link-speed = <4>;
 		num-lanes = <4>;
 		linux,pci-domain = <1>;
 

-- 
2.25.1


