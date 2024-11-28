Return-Path: <linux-arm-msm+bounces-39401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9629DB4E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E7D281C55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317DB155C83;
	Thu, 28 Nov 2024 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hk2ugi2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69F17BA5;
	Thu, 28 Nov 2024 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732786863; cv=none; b=IvIJJxjli8h2mtIcA3qwTleKleir0Xiu/s/fhl3qEaTxAkTBkX+haoejL4p9pMhjBdf13u91mYAI8G6dMb2Ma/8IrH/eKjh8Wlui004j3p7LT9/SD3EeBMTO/vnG/4P2fT+CDY5TLGvU+KtewsVQCZnrtUOKCSuWrSPa90pA8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732786863; c=relaxed/simple;
	bh=vFV6Nj2KrO4WkxbG47vKDNbGBfTYlTl3wzgsLj3ySGs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ulX9Fz/B3ta1GKkuD2P9KCgqRFtU2IF/sj1hVjLQESYGSVEhJFs/lClxGYAEFud66PsDhOmoFP4Ttw+5xq4+SvD5CWp3diYfNCouUe0oXinA7Fgt3/h5OqV9DLZ/ZOs0h52UcQ/ciGvgQFhSwmp+iqvQk8Wf6zuateNIk4Js/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hk2ugi2P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS91wRq026180;
	Thu, 28 Nov 2024 09:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OawNQTqX1f28dPaprFXmk5
	BNUBBjUaOp3yiDieGP/KY=; b=hk2ugi2PKk1zxH8/Mgr5VVocJ22+i5/gq6o12x
	/J7KJE8KNygp/CEvst+TwfhHLYlvQOh5LFBGh7Ge2+zfVCS/MYhGcd6TkusB8dss
	vkk2vmCtAGhBH+Qc9zSOyahpd55z6C3uZFsyafhPazoqeEH4rUSXdkNiUsbyd6rc
	lkpJ5D8mjpdPysCqSKKQnFSsENdtDvS59wVx1ac6tgwPlUKrm/3mPERqb7r5BOld
	2Glo8g5JeIgz49tWAnc0SK4r63n5SY/j2a/Dqw4yJ1grCndwQ6HlWiPPxDLSKOJF
	zdeXxI0ZDXNPIiT+sURMc7aawIMem4R+Ny4E37CSuSEyheDw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673ja1qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:40:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS9ewAF003210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:40:58 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 01:40:52 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH v2 0/2] Adds SPMI bus, PMIC and peripherals for
 qcs8300-ride
Date: Thu, 28 Nov 2024 17:40:15 +0800
Message-ID: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAII6SGcC/5WPwW6DMAyGXwXlvEyJCRA49T2mqgqOMyy1QBOGN
 lW8+1K6SduxBx9+S/79fTeRKDIl0RU3EWnlxNOYA7wUAgc3vpNkn7MABUZrAOm8TzLNF5Z5UM7
 5fB4ounOSYYryismWSknlSjSmshgaErlsjhT4c3/0dnzkSNeP/G95LEXvEkmcLhdeusITYqN0M
 Nqrxlht2zJ4cq0BVA7rHqAma9CLv5wZO1OqFqpfjBOPvLA7n/ySWJKrtQlkqtLobgVx5xg4LVP
 82v1XvYM8q7pqqWTfQIUAxodgDtkLecTXbHMH/CmsnyoE60I27G0d7L/C47Zt3316xP+3AQAA
X-Change-ID: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732786852; l=1489;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=vFV6Nj2KrO4WkxbG47vKDNbGBfTYlTl3wzgsLj3ySGs=;
 b=F/znyqJPSu22MBA3NOFcIVd5ST+TESfkTYN7qfz9oGmYAKLNYCRq9KzgsVFbKCDYajpNYzPK7
 yC+4olUfOmVDnsPr3HFWh0T/0v6WFQsmtKjv6QEpvYpsF4dJMasLfep
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sCFQRH8_YgROnZ9r2Vp-W4_smVzbis6h
X-Proofpoint-ORIG-GUID: sCFQRH8_YgROnZ9r2Vp-W4_smVzbis6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=868 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280076

Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The 
qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).

This patch series depends on the patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Changes in v2:
- Fixed comments in community.
- Added arbiter version(5.2.0) in commit message.
- Link to v1: https://lore.kernel.org/r/20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com

---
Tingguo Cheng (2):
      arm64: dts: qcom: qcs8300: Adds SPMI support
      arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 22 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


