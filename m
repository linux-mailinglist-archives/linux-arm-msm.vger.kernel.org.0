Return-Path: <linux-arm-msm+bounces-63143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E00AEEFA8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A483B2127
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4B9261584;
	Tue,  1 Jul 2025 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aritTNDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A05325A2D2;
	Tue,  1 Jul 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354389; cv=none; b=qc9odxT+stOgGm4l6+XMj1X+DQZkie996gA/COxKGMp4c/TrGZjzXkeyyJVoGMkH3JA3GyM7aHQLcpznaRgsbJpsM/p78sgtBimiKbr2l23fuc7oCxX6q3ShVmT6G7gyntyYK2kpg63re7szkVjF6LZ4i3n/LqYNgT9rIDVwmXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354389; c=relaxed/simple;
	bh=99dX5zU100aHpSGCccGRhg/pfAJIxSYtWIHuJxewZww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QL8wumTB4EHmzbfqkaOljnXz5uu+3W9BhRIebOD+mCJUbzibSMFNzZyFYzytbQ7Sx+lbXQd7P55fWNbOocsHmxZAdl/7wyeNKThZ3QJs4NXPiCH+VT+QzxbmnbusOJooU1ERlp4dryXJgbU+L/3TZhUFHMA1B7iw6saHbD85Gp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aritTNDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613kXcP008527;
	Tue, 1 Jul 2025 07:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sUA8EiR2Nwb
	td8XBmzTBYhrcA1Iu4saGqjKh+PaV3Rw=; b=aritTNDe3PrQIM2d/bQhOUZY8vs
	ZMtMb4aqsvUOgVXps1GB3L0ksKuZplwrbiKwvlEM0wbxk0H1vwKNOqfBiXViKqmb
	HZkUk91gt2nZC7TPSNQTiZVOfffsXtgDLgVANflamjTSjS5Wsrg09GzelNAHfBkX
	rrLpLw+N2K42/VKCm6DbFOc69r1khvDijP2dZC6FNHIowzxIkPp239c3lGI8o76u
	/wZeJmIEvMQLeAkS4L9nGRrPVlTjoGCuWoG5eFEzkDWYuHqF/aloboB+WpGfvLAI
	wmuacGt+GemIUtY/a0ycuJzq7N+LAoWFCp0/OHNWhQDNnmv+3v/hD9XH2sg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmv7sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5617JQHK029904;
	Tue, 1 Jul 2025 07:19:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fktsv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:26 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5617JGnA029792;
	Tue, 1 Jul 2025 07:19:26 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5617JPaY029887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:26 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 28BCB24053; Tue,  1 Jul 2025 12:49:25 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH v6 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver
Date: Tue,  1 Jul 2025 12:48:52 +0530
Message-Id: <20250701071852.2107800-4-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vDY8Yl2hB-6B6uDNKF8n7Nb9wxWeTCwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MCBTYWx0ZWRfX0IqoMiK7nD4X
 qqLX7/vePDs+97/+Hb8FrDqr1faRn2cvyADIZzwRRmwfW7kDLVxOh3fdcRdavrp+t6UVIXhEeH4
 frUg0ZpFhAYK/iPPwRlKqui6HV+I4iuljrcSPfCf45/RbYiuKUmdEqQLUHDDldSIkcNBpkoTifG
 z1UULsYMOyy/lWDgJZ0nibh8C3PsdYehTh7eYLW5oPCcvuVoiqaUYY1erEsZ3+k14oLFpU1QGyJ
 MLUj/DhfDXbeSNWgmPMWToT1uTMgfffVCpbRGNNzov9+gQuuwjhJ91Hmdg0bVP6pwjb8E/PLP47
 +zcI0mHe0kpLYrVIjTa6dJ86yulVR+EIjdmmG9I8dVbsRbhFHaGYxChMyzM8TFOAELGzpAggGeR
 MogzXqwzpSNzT+xCQsayplsizU+BtKueJava6Yk6bQDGjVkI+gQGV1NqwjcGlECgwiQoQLxa
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=68638c01 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=8AirrxEcAAAA:8 a=cn7IUS33xWvMNiiCnpYA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: vDY8Yl2hB-6B6uDNKF8n7Nb9wxWeTCwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010040

Add a new entry for the I3C QCOM GENI driver to the MAINTAINERS file.
This entry includes the maintainer's name and contact information,
ensuring proper maintainership and communication for the new driver.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a928ae141de..f2bb02bb5369 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11513,6 +11513,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
+I3C DRIVER FOR QUALCOMM GENI CONTROLLER IP
+M:	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
+F:	drivers/i3c/master/i3c-qcom-geni.c
+
 I3C SUBSYSTEM
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 R:	Frank Li <Frank.Li@nxp.com>
-- 
2.25.1


