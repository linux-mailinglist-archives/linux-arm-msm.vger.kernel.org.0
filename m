Return-Path: <linux-arm-msm+bounces-49279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F7A43E10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DAFD7A3353
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4FE267F4E;
	Tue, 25 Feb 2025 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNDAswF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D99267F63
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483949; cv=none; b=uF00XkCBhl6rcZfMtUUG9Z8CeyNcxMqcHGawAS70jIZlrxrYXl4n6ObOlHO/KSWhq+Og9Dx8rHp8FKOZjG2s3C54XbnxBaC+zqwhPg0gK8+IpDQC9Byw79pEJoVh0xB56bmbRL5typUJ2sROsHKUcgOOxsD0sIM0bJ1SbZU67po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483949; c=relaxed/simple;
	bh=cH6cJK5Ae1lKPS1EbcIIAvfveOkLU423Yy6ksQNO478=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2XEkt9RzYRxoqj4rRFjKxJSbu8rPpDSfyLuX+7l5EPiIC3W6U8Z9KwFqtZtbnvC0TgkWalF9rs2Vk7KeYvw4SQaGvw3vagTo6XPqaOjWOagb88Uq61OmzJ12ae08teYAm4mO/kOe+J1cDoCD6HRwNjAWbGo2osvON2Q1NvLK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNDAswF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P84w6B013301
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGKt38W4f3xZD0hMtHhCvO5JvatGevs7OdH5fWqSmVE=; b=CNDAswF8ayjf6Q7d
	TZmgyWBsUi0g1EOPP0tuFGskCVSqf2raWrqknZUiK8+ioBGju17bIu2zzErcQmpl
	fO1GUhW3OLhLRuc2TIWRysmOsZVFMfaEQ3lApgn6SlY21FCPIoTw0u4egW2FnQbg
	ajlPmDYm5FfiQoje5Q/24Qa/JrBFVMhEUkMjoZCDNpTmwz59SX/Pqlc6s11Ui27V
	c/M1VQLFKoeBCj1Ebz6iJBCkXupRbCo64pP3cUjYPVf2yk2QiYGT4epfQGZTCdst
	mnVpZnpuPuCc4YEMIUrt2DA7nNjwiJaZ+l/reoK7gijvvOR1bJ4e4qhY2dYoXJ2C
	Ad6k0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgrt1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso18471169a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483944; x=1741088744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGKt38W4f3xZD0hMtHhCvO5JvatGevs7OdH5fWqSmVE=;
        b=GymWVDCoImqx2/9mI+0PjMwKHP1jtKIQcwfmMR9v4QKjlXUMKYDK8Tbc35zrycdvg6
         RUXCASNKa/p2KaQ+qtYzOKmNV2GGepfmPwz04SVspd1gDaaKvkw2Hg9mi/66Gxyy7Jtt
         yxGfIt9t2DH4UtLxPRAyd7marQqK5vBWtmghpDzJlzu3fSFTdEVyZvVRGfdgqq/iRSKB
         IqSNHJ02zgXW9ys5z7fGq1JExQsfwPsVG0hzbvKCvfTkANfKUr2y2+ZkPpnucpXnWoom
         JtjJdHl8Xmw0gAHhphli4EVS090BENZIsAWeYfg2DZIKwPlf5ff8BUvymRYzG12xxGr4
         5xcA==
X-Gm-Message-State: AOJu0YzDypwH0ymBcJbK6X4kw3g85oCj9AFhb94KPqZKxPbzjNfDzPCV
	vLtYEVj/TyuX8uLO7mc3A/Fx++BeHWWZ0jY89WwN+RIVMspebLEhnx6di/MG0BjeZGjksBus2aR
	uc8QzSbNZNx60vEaFfI4YIh3zH1tAIqXScFhx2ltx2ruroSmBa9cvHLki4Pt8WF8F
X-Gm-Gg: ASbGncthBXmsGJmmJU3Hz/97gUR83c3usnV47bSBxu+/K4xQ8u8A0zwmFDqBAc0i+XC
	w0zcNaph8c+VF4updwgBs2ZsrQfHInAH0SQKseCtXQTWzBaFXeQNskJX/eRe6/5V1YtD9g4ElFy
	c4CSk3k97plZ5R+nWez4r4KhR7cBnMYKjOEmY7I39v+FbZ4J+2AVKDrkl+94RvxqWIqukAjyr95
	+VmyMBOyq1JXZssiv4gGlnN2OkRK0Q2W27j9gzL2thwIz3QdJ5ZCIB2pCO42U5I9L4aVquW8THw
	M5u6MiLyudnqfiyC8ExFjPa7gNehSyWsC8BViPP4TWvBveUtcNg=
X-Received: by 2002:a05:6a00:4f88:b0:730:a40f:e6ce with SMTP id d2e1a72fcca58-73426d85439mr23398666b3a.17.1740483943637;
        Tue, 25 Feb 2025 03:45:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH53d44YmSSgu0vz59WLwncGay6321eEVUl6u4lCgcM+mZ/SIJFyIXRVdtsf4iUG7rccPC/ig==
X-Received: by 2002:a05:6a00:4f88:b0:730:a40f:e6ce with SMTP id d2e1a72fcca58-73426d85439mr23398626b3a.17.1740483943313;
        Tue, 25 Feb 2025 03:45:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9bb1sm1331790b3a.92.2025.02.25.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:45:43 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 17:15:04 +0530
Subject: [PATCH v7 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-preset_v6-v7-1-a593f3ef3951@oss.qualcomm.com>
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
In-Reply-To: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740483933; l=1863;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=cH6cJK5Ae1lKPS1EbcIIAvfveOkLU423Yy6ksQNO478=;
 b=TDE/vhW0tt+TCyiVeC+7VmGtzLVU/FCyF+softJ/q8wTToMyQSDj+dVhEZ31Ykix3o93rNaW8
 W3dfP+6sWsbDDTVJa0rfXGBObjJjrXntYldVwmUyGPB4sKrpWruw426
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Y5t4E2IUJb8NXgcbM4Z63D2Z1afPinKg
X-Proofpoint-ORIG-GUID: Y5t4E2IUJb8NXgcbM4Z63D2Z1afPinKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250082

Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
rates used in lane equalization procedure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146
---
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff..9a18b8f90145 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3209,6 +3209,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie3_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
+						     0x5555 0x5555 0x5555 0x5555>;
+
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+
 			operating-points-v2 = <&pcie3_opp_table>;
 
 			status = "disabled";
@@ -3411,6 +3416,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
 			status = "disabled";
 		};
 
@@ -3538,6 +3547,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie5_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 		};
 
@@ -3662,6 +3673,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {

-- 
2.34.1


