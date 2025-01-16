Return-Path: <linux-arm-msm+bounces-45229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA66A1355F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6387161B54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0F619CC05;
	Thu, 16 Jan 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kdvh3vmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8D197A8B;
	Thu, 16 Jan 2025 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016365; cv=none; b=VLXTH7pJ3sbOOk2Sw+tNm6rMwK/oHa2bItLarHmQ6zP21k98ufWY3bX69LZt8tCNxQbfD2+q3R3LU8J+OtYweRVN5qtTlDpCGbDYWuMCq62OuiBKMG+jQXuGxIy15Xsx4sxyjxEuPpY1zhNRwj4Ws0c6IAZDgnG782tA00n7NaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016365; c=relaxed/simple;
	bh=lTQszKWp7GEvfUb4Z2q1JNMx+Pr5PyYPE5IiSqPm4w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=YHINCxIMnw5zKUyKVJBbJsRdsIm3n6eQStEwXBq8zOn2oRX3cLsaCiAW9y3qlIOqj+8tqDOtF0wnh/uBdBw4qR9IXHzxhquJJKMkgknbv5Lzlb7riq4U4o1Ctq6V1dhL3uMRLzy9HG4eZLF5iFCpRNDofKZUIzUrjIxAEN9b8mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kdvh3vmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G87o6J001541;
	Thu, 16 Jan 2025 08:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KagrXkCuQ+v5fEytrHLDQh
	gL0MdV8djw5jkQW1vSdak=; b=Kdvh3vmJpZzo4Csg1tQ/tUfTQfW90JzW6IDElV
	xyQWdrOzkw2k34ieZ/4fJ0TfcNqRjW507RfB46FuAluMFXzdDN4ddRv97+6oS69k
	ynUiDRsLLf4N+pVAYBZwu/F7Uk1CCrj09f+lMFs462x1CWHo8g5JjtBzRDhEBRVB
	m34dH/AhYOHPcNgofFdq6N4GbZds5RroP88VFGU0dqY1H2WoJX9KieuHE6TMUw2C
	BPJXYaaMrPAYkBOADVs4SVZCO3ZfdJaeyw32hjL/SOwrMkOIn4KOqzUvZi/mJBf2
	vs0ZZ11X6YjpygUM9DngraDXmBmy+8tDPMepCh9Kdq+KebpA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446xay8262-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 08:32:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G8WdaM017700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 08:32:39 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 00:32:33 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Thu, 16 Jan 2025 16:31:48 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615: Fix kernel test robot issue in
 SPMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250116-fix-kernel-test-robot-unexpected-property-issue-v1-1-b1f4cc2c52d5@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPTDiGcC/yWNQQ6CMBQFr0K69ie0tKBcxbCw/Q9tFIptMRrC3
 W10ObOY2URC9EiirzYR8fLJh7mAPFTC3S7zFeS5sFC1MrWUDY3+TXfEGQ/KSJlisCHTOuO9wGU
 wLTEsiPlDPqUVZFkex5a1stqJUl0iSuJ3PA9/jniuZZz/UthLArkwTT73leqM0VAWo+auPmrpN
 KuaT61ru4ZhJNg2pnFi2PcvltM1Ys0AAAA=
X-Change-ID: 20250113-fix-kernel-test-robot-unexpected-property-issue-bd18f6d42b4c
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "kernel test
 robot" <lkp@intel.com>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737016353; l=1068;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=lTQszKWp7GEvfUb4Z2q1JNMx+Pr5PyYPE5IiSqPm4w4=;
 b=awCjmWcy8wzSsl0S4t1UMCVlcXAn0jjS3FVyvC/bqujJEesfpjrux6ihMCXA1BmsWZ0xRgC9V
 NbCLOn8tmdhCM/01WtBPmGM3z53m+pLm3zDvRCqQnlIqczMwggneFe3
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mBlDtMnc-zHGxxdGAPJF35uuQcNmPLq4
X-Proofpoint-ORIG-GUID: mBlDtMnc-zHGxxdGAPJF35uuQcNmPLq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 adultscore=0 mlxlogscore=817 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160061

Fix the kernel test robot issue in qcs615-ride.dtb spmi@c440000 by
removing the unevaluated 'cell-index' property.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202412272210.GpGmqcPC-lkp@intel.com/
Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index fc69abff71270af591ad41f33bf893751cd7d300..7b3de4b8605722c2f24bc3dcbe9471440685745d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -2964,7 +2964,6 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 			#address-cells = <2>;
 			#size-cells = <0>;
-			cell-index = <0>;
 			qcom,channel = <0>;
 			qcom,ee = <0>;
 		};

---
base-commit: 27554e2bef4d70841c4d20d96c673de51edb353c
change-id: 20250113-fix-kernel-test-robot-unexpected-property-issue-bd18f6d42b4c

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


