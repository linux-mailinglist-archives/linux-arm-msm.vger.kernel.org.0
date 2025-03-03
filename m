Return-Path: <linux-arm-msm+bounces-49991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE4AA4C073
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 13:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D51188F6B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 12:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DAD1F0E34;
	Mon,  3 Mar 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I2nvwUHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0835948;
	Mon,  3 Mar 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005444; cv=none; b=ExqzMxv+HMhHD2gl91+Ypp0ztMxyVPsECHeEYXnZXaT84sCKgPhC7lCH8Xoo5gB1Np+bUl1MDG0r8jSGh7qDi+fkIesyLDwCQVH0ggNLQlaR2Z7/ohfqT3txLdQQN1qTf1z0b1wHRkuIdLIz4buwxitAC4ntoLIAy9jdzo27in8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005444; c=relaxed/simple;
	bh=KO/ptCKQGbI88IVSdKpu4vDMEQYOiIPHj0zgPryD3Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=VbqgsAARl84IUpfSjbB8UsAU2Xo020hgYWt2oU9ei7yYmtLTJpICVSWElwkOZVlQJ+lzGenUPnE+slLLvxcXI3Pw6cpOQXEFN+HDviO2gtrV4F2wztgGPFThxr7dqt+B+vp0dsEaZ1tRqb9HfVy8SKhqjZ3pVzTBN4vL96palhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I2nvwUHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523APghE021481;
	Mon, 3 Mar 2025 12:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/XQc/9e4XzQQrYeo63Ndqd
	78K0VUKE9SvAO9W+csK0I=; b=I2nvwUHTqd5Gcxh1pgJbLuzTSYxFKTpYIQWhNM
	927XUYDFGt+SySc9+hBuskLftZ/Haued26ITyeuCxSis6tZEzGuM9BfytjDTzDsz
	jWd4qQcLyQw+U5tH8xwQBE19wnhataRyFWgfi9tf9NsGEBUpKWtkr53yD2UumG6r
	/5zOe7Z6dSmoy4nxLrBMM6xoS4VPyRhZZ12+eAowGWTnPTTK+MiQ/joaqP1z+UiM
	SKNjb42Isab2wjrrDk3CfslhBF4iFxhnGvJ19CT/uduHE356dnSRjPkcKVm5LctG
	zV8OxRA6CT6zCrv+NhcdjX9d88RpOLGpFeHps3SkgpaDBBqQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tm5mwq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:37:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523CbGjF030875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 12:37:16 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 04:37:13 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 3 Mar 2025 18:07:01 +0530
Subject: [PATCH v2] arm64: dts: qcom: sc7280: drop video decoder and
 encoder nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250303-b4-media-v2-1-893651a4b1c7@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGyixWcC/23Myw6CMBCF4Vchs7amFwngyvcwLOh0KrOg1VYbD
 eHdraxd/icn3wqZElOGc7NCosKZY6ihDw3gPIUbCXa1QUvdSiONsCexkONJdIP3sjO9HdBDvd8
 TeX7v1HWsPXN+xvTZ5aJ+6x+kKKGEc9hirxC1NZfHi5EDHjEuMG7b9gWfjQfXogAAAA==
X-Change-ID: 20250303-b4-media-79ff0738b9cf
To: <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741005433; l=1370;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=KO/ptCKQGbI88IVSdKpu4vDMEQYOiIPHj0zgPryD3Sg=;
 b=KqVs2fRTN5ILxNgBVve82UFFUVODblvctNo++jqea6J+X44cxACAPB1SA7IOgM7wpQM/3MpuA
 wGpzNz6MYVoAJBozp/pH1kaH5UT0nN4V9K3NyQG9n1YLHUn7/9sDqTF
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3FM2fI1Mm4B_Y245bL9Rb3vTxBIsLAQz
X-Proofpoint-GUID: 3FM2fI1Mm4B_Y245bL9Rb3vTxBIsLAQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=677 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030096

Decoder and encoder nodes are already deprecated from bindings. Update
the venus node to align with bindings. The nodes were deprecated with
commit 459997e8990d9 ("media: dt-bindings: qcom-venus: Deprecate
video-decoder and video-encoder where applicable") and is part of
v6.14-rc1 and onwards.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v2:
- Add history in commit message about the deprecated nodes.
- Link to v1: https://lore.kernel.org/r/20250303-b4-media-v1-1-ddc5c81cc2b3@quicinc.com
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..31abb2b9555f37ecc9c7753509e95acd57acf015 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4301,14 +4301,6 @@ venus: video-codec@aa00000 {
 
 			status = "disabled";
 
-			video-decoder {
-				compatible = "venus-decoder";
-			};
-
-			video-encoder {
-				compatible = "venus-encoder";
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

---
base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
change-id: 20250303-b4-media-79ff0738b9cf

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


