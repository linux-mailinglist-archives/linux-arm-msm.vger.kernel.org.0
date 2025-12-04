Return-Path: <linux-arm-msm+bounces-84310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2786CA2D27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65BBC30221B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4533074AA;
	Thu,  4 Dec 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfAvvCC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206ADDDAB;
	Thu,  4 Dec 2025 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837177; cv=none; b=WA6SCbSxuEzXZuDGLhV8wr7QGNKOn657W2T7ZQM06/blx3DGJNszNv4CEIeK63KxCokdBVzUQMmN2C6BKdxXaRf+M5ZhPEj1pyWGSp968o7g+7D6p8ukBa/Rq8N2xPgbHRccnjmj8uWNx7UFqG2gc7I8vDYl5XCPrc+cMHCwDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837177; c=relaxed/simple;
	bh=E1VUuvU6gWaTOENYKred3XK7wVwMj/xHiK8WIqsrNdY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JLVHfueWdPsxlTJVTz/u07L9x2XN4+ITvFFtrl4ck7xaYjIS0Cn2sjMCJn/yrykxolMVJpTyRAiDZpfP/Hei6a0K/o5ijW9r2V/Euhww1e/yh6Lbzu/KQlY3/SG1xxSEdF6f0K7Bof6VykRvNJ8Cb9MXVPQH9RljKsJTCI/P3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfAvvCC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4690Sw492343;
	Thu, 4 Dec 2025 08:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Iqt078CGEtzwzCFCKiSZIm0MkBz7/THl3ZX
	qoOFzrLY=; b=CfAvvCC6BIUfxMa+F7dhaWdv7Vp7DnaMMAkNsGgSm+ox4g0h8m+
	7VVoZYB2MyI2/BA+YIrofHKSfAHimXBiPQmxCW2Vx8DT388bmh8rn7NPpWuNk84X
	7XW/4cxrBoruqqNFI6Nc4fr88m4oBug7MaidZRZhV9NHf6hrNqEmjNSC3VoSM4xy
	9KApd9mYm+pOj8Cxv2rehFqe77y210mFoOE18kROacWaz3HkIQPsbgZB921znjAM
	9uGM0j+vyVwrOFAq/Sym9UXNYVvtGu72q6Mvw/J1wo3mjjMDabODL8ohwAinYmuR
	c+8fa0cKpJRYBt6ngtgyWEffpb7cmqJSE/A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtke8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:53 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B48WoBx009722;
	Thu, 4 Dec 2025 08:32:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4aqswmd3yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:51 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B48WoOc009713;
	Thu, 4 Dec 2025 08:32:50 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5B48WoxE009712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:50 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 1032B2101A; Thu,  4 Dec 2025 16:32:49 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Thu,  4 Dec 2025 16:32:23 +0800
Message-Id: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=69314735 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=iGxVMBivTTxaZTGGaQcA:9
X-Proofpoint-GUID: 2zZq3ENNixm9Xp1QQ15MmRIeTemSTwr2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2OCBTYWx0ZWRfX9hOebtmzTdyD
 MtacBOHaee0jz37/V3i3uW71XrKIPDzrDvOOL08astcF12vyl6rXRfIQ/JGxXOY1vWI8Am2gJjg
 jc4jQ7JPcWAuaS3ko9C7q73zwGe8S9aikc3355E2oKooH+M1WxI1Of+GVHVquvxELFccYaTLldy
 ZMk0LmwkjIbtGZfVJVlKFhT+OcNHTdGjpjf+CNK+4QvOCMthKNEqWbPpR9A96OPXz/aTO5v7G8j
 BW4Y1ow1EpuUgjw4lLyuDR1zOCSY7zu7SBDZvPI8z6q7r26MThDG6SpXk94x2eZkJVOb170tiNT
 RAc3WuKNRAoQPzcG5fBe2BjAUl5/plruaLqAfJLxRrH6iMy1YL/QXcRTiYgjRF03h+jJUvOabrB
 1YBXO2lKAxd8iEGVE+T7QJJXdSQ57Q==
X-Proofpoint-ORIG-GUID: 2zZq3ENNixm9Xp1QQ15MmRIeTemSTwr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040068

This series adds initial audio support for the QCS615-based Talos EVK
platform. It introduces the GPR (Generic Pack Router) node in the SoC
device tree and enables a sound card node with the DA7212 codec on the
Talos EVK board.

With these changes, playback through headphones and capture from the
headset microphone have been tested and verified to work.

---
Changelog:

v3:
  - Updated sound card model name to "TALOS-EVK".
  - v2-link: https://lore.kernel.org/all/20251125033311.254869-1-le.qi@oss.qualcomm.com/

v2:
  - Address Konrad's comment to modify the commit message and
    group GPIO pins together into a single entry, moved to the
    SoC-level DTSI for reuse.
  - v1-link: https://lore.kernel.org/all/20251024023720.3928547-1-le.qi@oss.qualcomm.com/

Le Qi (2):
  arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM
    pins
  arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec

 arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi    | 47 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)


base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
prerequisite-message-id: <20251201172222.3764933-1-tessolveupstream@gmail.com>
-- 
2.34.1


