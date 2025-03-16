Return-Path: <linux-arm-msm+bounces-51543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D142AA633B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 05:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A958D189345A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 04:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B58715573A;
	Sun, 16 Mar 2025 04:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/ScJK1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962D156F54
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742098163; cv=none; b=M+H3y94nsVNXbTe8rczN9ma06ME2z0mLr+t8qNohdwplwAAD8dSEKV6iT4DtBreicgZntVODaGh1dCGl7BYKl7e7JATogIbLzRsew5eL86K2VS4dehSe/ZwXPE+70tpmIg3c5GZMMcWGF5WXio8P6w2yRYDSoLU0tTqmxS3bEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742098163; c=relaxed/simple;
	bh=3xtlvs1vbdz9Lx9DTGncf10UyrhBPWHbtrA9J6tHahs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xyz9YGgq0lssM8joJMVau4wpW/xF4mkjeHszrXg5xOQNGDfZ8VDbLONZwC8iujaKSfHTw9PlPVFmOjv9B0xuR56mJZBBgzl94e6eABkYjyX/fl/S17ApnqA/o1kZAW4Yuxyp8HzinOw73TMHJbzRRZyp8bcag7B+KBfpRhR/gVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/ScJK1m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52G3psMC001542
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOCWk2D0zXdlqRt97flBwH+ovhY8VuJGcvABkqQ95gA=; b=F/ScJK1m8GGpnzug
	BS1I73SmDQmHhLuB9acV9ymru/fXAO91Cd9MsUkv4dL76RO0YTzPdcIxKXa3mKP0
	A9/O4GPQ1kQgN7jXjYUgO1Z9VI/QrPGJkZBopoPeDXlxdO00PtLVC/4+vTLnLbPi
	B5Sh8F3J7SlHjUSG2cea1Mo+R4p9hx0HqKoevGeRg+y5ApWYyNhr5f8aq8Bkuglr
	Qp+yO2qPhTETLkZmC5eN2sOHngtap6JV6iIKtEQzUE4jUzdi/3suGtxwfEezEoUm
	lySj2E/R1aKA1Y1XHv3eFJxmUPLN1vMsdzhwDe5EogkhMgT0Fe2aBZv92veC9A69
	EOlXjQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2u9skny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-300fefb8e05so1063898a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 21:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742098160; x=1742702960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOCWk2D0zXdlqRt97flBwH+ovhY8VuJGcvABkqQ95gA=;
        b=CK5uVfTKaLKzRwE4302S8s+pW3vYjmMktCGVkKcmuNHInYhFpXMxB4hJvpWre/g6Un
         0/xbUtpkQEy9Ar+CEKWq8/7cevxP6IcXSEO2m93kE6ysd2CffGZ+sr7T1El5L0/aVLzJ
         yXfbX+bwMDPq9jmp9K0WO69NoPm+eEFH7OmnMveVbl6ARvWhIFmfZKVYEP+SgidwoVbD
         wEf4YkHFbVA0XkP+ombH8H3XacB6ivQTvPH+AnUsem0SQwzqO0z3QI5i/FbGZAKSB3T7
         t+gWPj2OM2PuvMRGogjIvYi6umW6NvS4ke0I/vFZG70sxZHWJqcNedrxwf5bwdskGAcX
         Zrxw==
X-Gm-Message-State: AOJu0YwXZJH6O3CBMLRRP5z0EbgpDer4oRm3ZVXQOczlWTkN4IMufxqo
	EogchcuQXRRZUiSiIBWFe1VNbXCbQxSCJdOKnY1j8YQ7gOr6u3TRTuGNJQfVsfrM7GYSMPLZsnR
	gLly0YxCs2UcpxyRUx5gMS8F2SuUImblZagveJWafw19sLtNU1GmAAP2uObobXAFHn9jfviA8
X-Gm-Gg: ASbGnctlYLCPCZ9iOVqkli8CeRNMJms4CEeevGdA1Md3Emy/7lARgTs7q6Uau53gHRu
	6mVh8OeEDIHVeMRJNR+wiYElu9x0TFpmh344w1yFqKJpZryXNeInu1yx0xbqrK3IuonugSBdocE
	Df7DWXfWJkfZ9KBO6TNzr6QCjdFEYAYq3lC1seHm4UDT9EK3/+JKtGdw9O5gl3z5Dl/8lldalEu
	AtKgbfc/UBuZ780xe8RgCGqxC/sLfRIiWymcnAjOpSp/0Mpr8X+h9V5f9hI/pdWjPDBWnufNQ+2
	OeRtox8FX0ebrKYY9PCuPdt6Sp+awE/7qFba7LjFjEZRkJ4oV+k=
X-Received: by 2002:a17:90b:4b86:b0:2ff:556f:be8 with SMTP id 98e67ed59e1d1-30151ced707mr10339022a91.16.1742098159936;
        Sat, 15 Mar 2025 21:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaO9Xhh1LVIUXCc3nNgt4F1e7bpW4bW6YzCeWOgUkjC6fIlE88SVkaRrW3Dp09QjwJPH0u5g==
X-Received: by 2002:a17:90b:4b86:b0:2ff:556f:be8 with SMTP id 98e67ed59e1d1-30151ced707mr10339001a91.16.1742098159565;
        Sat, 15 Mar 2025 21:09:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153bc301esm3490438a91.49.2025.03.15.21.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:09:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 16 Mar 2025 09:39:01 +0530
Subject: [PATCH v8 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-preset_v6-v8-1-0703a78cb355@oss.qualcomm.com>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
In-Reply-To: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742098148; l=1925;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3xtlvs1vbdz9Lx9DTGncf10UyrhBPWHbtrA9J6tHahs=;
 b=D/JtwlhFqZH9afzkcd9ro4t8sceM5Iegcnj4mneC6tRh56ANpJVHfghfaxrbI1VbjffXF4HCu
 8qjEgU3lCqBBc2iD40AOmDATLHoly7hvJXLzEz8DAxLigheG9pycczD
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=JsfxrN4C c=1 sm=1 tr=0 ts=67d64ef1 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Z5gnv71TwNnGgClZ3ajgQJMMsL00SSSW
X-Proofpoint-ORIG-GUID: Z5gnv71TwNnGgClZ3ajgQJMMsL00SSSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503160029

Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
rates used in lane equalization procedure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146
---
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff..9f14dd13d02e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3209,6 +3209,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie3_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
+						     0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+
 			operating-points-v2 = <&pcie3_opp_table>;
 
 			status = "disabled";
@@ -3411,6 +3415,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
 			status = "disabled";
 		};
 
@@ -3538,6 +3545,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie5_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 		};
 
@@ -3662,6 +3671,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {

-- 
2.34.1


