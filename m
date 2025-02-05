Return-Path: <linux-arm-msm+bounces-46952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEAEA29022
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 15:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A13E91696B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D75A155CB3;
	Wed,  5 Feb 2025 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IbSqKxDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C69151988;
	Wed,  5 Feb 2025 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765929; cv=none; b=iLKtrGV/RJuN4klL9H/UtcM24i25Iu3/9cOOrrBPJwLpZXLDsfVsRK54T+h04ncMxg+3U0hSWCREBXt4xw5IJOHASxPDO7Jzt3PKNCmbh6OCVx+gklrykPu5ams9Bz4NAsAY+OaGKlJ+MdODo2LCzSKJVIPXDSHl522ILVTnuFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765929; c=relaxed/simple;
	bh=FSXSbkQDKJUXj53XLx4D2XtIiBjFgcKnhxplRwzBUlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mi28A2K5QPAkr8xpieh8Pt2PFrEAwTpmyKoozLUX4esfyG7ulv91h75P4WbpeJmF8Pd87maljpZthMV/5qsKCSwiPcWpr4SsMNwitBwceLxPsMXYLEboIvOQJAYixVhTuiFfmRaBUKS0oNMNUCwDVhEkD1HLQMYRnElvrZz1qLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IbSqKxDp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVhvO025803;
	Wed, 5 Feb 2025 14:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pxz9THixkd8
	MMWy14tVHB4+bN7P7Z9hkWsaKuJO8Q4E=; b=IbSqKxDp77TlbDGs6FQmdhD+TJI
	l8Hng9cmDIZX85uZzZ8VlsjkZWcufUKRYZD08KLOgA+sK/7vR8YXVX2Z4S8aKehf
	ZlUS6OylFX6dygZIq1k8fTgYoQcHSaXg1P4qcpOnNK5i+y1800cGacLRAXGU7xyZ
	EtEZnvzkNsqaBcp8vTSkN/anIaZZxVgys0rIDQscoHF1do7I/9aOsVO1wyOtWbFz
	qCICm4A73cTV7w8+h/iXSECEBjwgJpM2bF12Qnn+7/Utx33UNuKR56GIyqu8Ymho
	zEemoiSMHPUjCshiMFKrSjb1mGXqkmVruoN0hp8DkxlDc1PAQgNSdJCcPfA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txg01r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:32:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 515ETXKb024149;
	Wed, 5 Feb 2025 14:31:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpm8b5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 515EVvjf026671;
	Wed, 5 Feb 2025 14:31:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 515EVuFP026669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 83ADC241AA; Wed,  5 Feb 2025 20:01:56 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C driver
Date: Wed,  5 Feb 2025 20:01:09 +0530
Message-Id: <20250205143109.2955321-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GCPoLZZxjkESdCriMRXAuo0Mx3HF6a5N
X-Proofpoint-GUID: GCPoLZZxjkESdCriMRXAuo0Mx3HF6a5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=883 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050114

Add a new entry for the I3C QCOM GENI driver to the MAINTAINERS file.
This entry includes the maintainer's name and contact information,
ensuring proper maintainership and communication for the new driver.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3520ce6f9859..d343467740b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11011,6 +11011,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
 F:	drivers/i3c/master/i3c-master-cdns.c
 
+I3C DRIVER FOR QUALCOMM MASTER CONTROLLER IP
+M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
+F:	drivers/i3c/master/qcom-i3c-master.c
+
 I3C DRIVER FOR SYNOPSYS DESIGNWARE
 S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
-- 
2.25.1


