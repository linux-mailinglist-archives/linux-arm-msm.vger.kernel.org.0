Return-Path: <linux-arm-msm+bounces-85232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BBCBDAF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 956953048814
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABE333122E;
	Mon, 15 Dec 2025 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iwKo7rCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778843271F8;
	Mon, 15 Dec 2025 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800039; cv=none; b=ZoIq+8ecima3FuQWXEz/9W69DcsRDUqZsG2lyGGVg4DDDEV65W/RQcY6ULXKrBTY1OqXcnzJxhzlEEiENFPJIi3pq5BYyw8OgR1cVQGb5q8buBTlhPrSTNR1yDepjH5FTWHQnc7rQr/5D6fmzgCQ7m0MXerYamYBVSlLiIt5hwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800039; c=relaxed/simple;
	bh=OrjGeSOF4tJANnwof0E3DBY2Ek1qOK+zQvqIeGSWIw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=juQa3pvZmMpsi7hdwJenEQ6qyGBSzXlhEDwtxJAD5dvPT/o2LQuzVqiCFHpG51DjLgcbIWGkE0wyG0bc7PaWbVFed6SDjyTRN/yfmfTVleIae31Vnds34/gsLK8ou/D/SXXK+98mv2oNIp7sTPyypL0zbhSAmroVVqhIU8tVZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iwKo7rCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFAO2Nd314783;
	Mon, 15 Dec 2025 12:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TBCbk4zBGLh
	oWKOMGJNe+JgFauS+OLZDrrrt6URdzbY=; b=iwKo7rCMrTFykwo0K/dER8bLDEU
	KvBqYP4bwf48DkbTEAeOjJsvt2cYYhSm2IKZLYg7mHhSxAWJkxDuUt0sfY0qhdWb
	y+80yqfd3H4TD7MTPtvIqKCpdDt6nKNnbJ+L029OzhiGHHYRkdtp/EAAu8J919yE
	zdSdSTiJldMQ1IeK8QGI1kw9Qu5B59nCOFt/lbhmMz99WqgtzRvtLduyZA340fXL
	oZvxFsYWpRQkzw5xgTsXo8ShJn8JbNhcGdAg23EyPz/jsivT8QcxAnI8VFHk0+TV
	dHvv0STO+rJdLjxzzcVpozQgwfBihp+fQrO5ewzsZ1fC+rymGg6SyK2OWEw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119amcx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFC0GBg029034;
	Mon, 15 Dec 2025 12:00:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b117kxe35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BFC0SOJ029114;
	Mon, 15 Dec 2025 12:00:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BFC0SWu029112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 683AE5CE; Mon, 15 Dec 2025 17:30:27 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v6 3/5] mmc: sdhci-msm: Add core_major, minor to msm_host structure
Date: Mon, 15 Dec 2025 17:30:07 +0530
Message-Id: <20251215120009.3877889-4-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=693ff861 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=PK7NwhktG5IhTMEw4kUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNCBTYWx0ZWRfXyXIj9ahFw2Lg
 xK8onwd4d2rmkNdQ0t8vNrM6DL/Iqeqm0NwUpBLWKBDdo/AEVSnD/bk/9SZblEaDiSloUIcY/Jz
 k40I730+GIPFgm9ACY3Gh93gHwfxJuEMDyctfmmS+NXt1IloS/SRniB7toi5izk7+U/7aUCeReh
 /7eZjuwpDLgLuuygeo91HlAl/JVGSH3mouVyRQmyTnc35Ordx8s82HyCQPxKkZlxdJr7d9XQ63/
 LDLV9gFloTQvtAjI61yN9kBmDv23SyEFNPVC0qKfldnj6WZnMTXZwjA26/p2pdb7n1FG0MVYhF5
 foxDhEOuJey8ljWzxUaMEaBVqQRLDbQnoGC5+Saoax80ozYmOFb3hkdmK8YP6jXbuVokGt3qYDp
 xaGAInPkcVB2B4bsH2/H+Q8m5s6nkg==
X-Proofpoint-ORIG-GUID: EYL8iVHAPsHA_-jWt74rpmQ13tPIjX_S
X-Proofpoint-GUID: EYL8iVHAPsHA_-jWt74rpmQ13tPIjX_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150104

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Add the core_major and core_minor variables to
the msm_host structure, allowing these variables to be
accessed more easily throughout the msm_host context.
This update is necessary for an upcoming follow-up patch.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3b85233131b3..dc79f828522b 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -283,6 +283,8 @@ struct sdhci_msm_host {
 	bool tuning_done;
 	bool calibration_done;
 	u8 saved_tuning_phase;
+	u8 core_major;
+	u16 core_minor;
 	bool use_cdclp533;
 	u32 curr_pwr_state;
 	u32 curr_io_level;
@@ -2691,6 +2693,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	core_major = (core_version & CORE_VERSION_MAJOR_MASK) >>
 		      CORE_VERSION_MAJOR_SHIFT;
 	core_minor = core_version & CORE_VERSION_MINOR_MASK;
+
+	msm_host->core_major = core_major;
+	msm_host->core_minor = core_minor;
+
 	dev_dbg(&pdev->dev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
 		core_version, core_major, core_minor);
 
-- 
2.34.1


