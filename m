Return-Path: <linux-arm-msm+bounces-35729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF89AEEB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52C531C220E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757BC1FE0E8;
	Thu, 24 Oct 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jIF6zO24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134B1FEFB6;
	Thu, 24 Oct 2024 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792431; cv=none; b=GolGGD4h9ZM7pZ4kaXVbDgFdFNQHLl7lWqVh4xGuRPqj6ORhKhfTRbB6Ah5wmS0iFFfnlJWGjZ+g2Wwa/R52DVzYvyLpp8UeFHvNjQO0VqhyBC5jw7Vpbzybix57uxxt+dLjJ+TsR1XFwdO9S1qNFjMFxS18VApQ1yQubX7o75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792431; c=relaxed/simple;
	bh=wf4Glc1hanqJTEE89z6YctKfrzuX3CKptNjSKVI+qeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=HlRxh0Onv2hOUehYrGq9CNAPW3DZr2gQCl/vtgD1T2DqgknyyW+qgRpH1acG0nWTYxLahdPmPyBLcTMy/rH5ewcn1exoVRSDwvnqM5SawvHoeSzcHK/GjfRffCOM9cxcW5qXg2sR8SN1a7N4VqOMXj8ywcq7+scy3J6lzxSw8AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jIF6zO24; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OA6niL026198;
	Thu, 24 Oct 2024 17:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SdFPGAkk5sfMCVHEaO9IDX
	HeQAhjdtUYSx7Xrk7BWfU=; b=jIF6zO24unxhKD1JoM3W27v0EMusPE/H75aEvy
	iAaHX62qMCDiSasiSGjbTI8GwWWrsU3SOkBfpX40jJw4bgedm0Noe5HwvnQmXeNT
	nRxEoYMdUHnFj/kj3L7y7ZNe9a/MCaUWqJQq6+AvvG/TYNTBzlMiR8bbzu1aNUDq
	hO9Cd2pAKmpPcmgHvyC3+OHmNsE6ar02CBCPRJK0LiEy0Mt980SlQzvWE1VhjLVR
	U6cQgVmQlJiVv5EzT2S6PmptAZVVe4GjVP7pdfGzF3BxrO+h7z9RicXnlacVvRw/
	bRMY9ltYHycoKw7DTR52Lmiou7eR4bMzOS0g37P2h7OeNeXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40ehwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:53:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OHrc7W009878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:53:38 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 10:53:35 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 24 Oct 2024 23:22:55 +0530
Subject: [PATCH v2] arm64: defconfig: Enable sa8775p clock controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHaJGmcC/5WQS26EMBBEr4K8Tkf+ADYoinKPaIRM0x6s4Rebo
 EQj7h4PZJFtllWLek91Z5GCp8jq7M4CbT76eUpBPmUMeztdCXyXMpNc5oJLCR05nCfnr020Rut
 iaXCY8dakcg3zMFCIoDjnVOS8KHnL0tISyPmvg/J+OXOgj88EW8+StTYS4DyOfq2zUrXKOa66S
 lgyzujCkdG5Rm2ELaRw2mBHQj+mR4rRHpZ19nJKCgG/ajCOsOUQKNLUwWJX7CnCVgCH3FZO6A5
 Lo+xbUkE/4XMSeGUPwd7HdQ7fxyubOAz/dcAmQAC2qqparnKJ5i+CXfZ9/wG/b2XZeQEAAA==
X-Change-ID: 20241022-defconfig_sa8775p_clock_controllers-3000e540560b
To: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a7vv6e-6NNWOfdrg8zTm4haucIyWtrq8
X-Proofpoint-GUID: a7vv6e-6NNWOfdrg8zTm4haucIyWtrq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=750
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240147

Enable the SA8775P video, camera and display clock controllers to enable
the video, camera and display functionalities on Qualcomm QCS9100 ride
and ride rev3 boards.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Changes in v2:
- Update the board names for QCS9100 [Dmitry].
- Link to v1: https://lore.kernel.org/r/20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 36b33b9f17042128f5bef96f58667b5807b712c2..6197934b38e08b7294ec897e451af6e96fd63cda 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1324,10 +1324,12 @@ CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
 CONFIG_SC_CAMCC_7280=m
+CONFIG_SA_CAMCC_8775P=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m
 CONFIG_SC_DISPCC_8280XP=m
+CONFIG_SA_DISPCC_8775P=m
 CONFIG_SA_GCC_8775P=y
 CONFIG_SA_GPUCC_8775P=m
 CONFIG_SC_GCC_7180=y
@@ -1366,6 +1368,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
+CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m

---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20241022-defconfig_sa8775p_clock_controllers-3000e540560b
prerequisite-message-id: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
prerequisite-patch-id: c405247d3558175ea16e723e36ccba87b51da3e6
prerequisite-patch-id: 2f421e48713add52f17b6e0a95a1e4cb410322e0
prerequisite-patch-id: 037cc7f8c1c9f690bea1976550616e661f48c53a
prerequisite-patch-id: 930db8201718c0a66286d85418c7bac1719a76d1
prerequisite-patch-id: 79dc8594844768685144c302eaf404b0d6cb7ebd
prerequisite-patch-id: 836d46d2d006bdaae12b8a8aaed2eb786fd636ce
prerequisite-patch-id: 096e89f063b35a70bbd8f92c4eb5a32c850bd927
prerequisite-patch-id: 5a49926d1dfada78038f963d5de23a558d9dd19b

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


