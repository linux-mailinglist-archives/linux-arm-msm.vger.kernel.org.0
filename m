Return-Path: <linux-arm-msm+bounces-54640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F0A91CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF4B5A6EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E0924290F;
	Thu, 17 Apr 2025 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fzrv2xDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A23360;
	Thu, 17 Apr 2025 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894039; cv=none; b=UC4kaBIxXyLzel+YvbML0/i5kKxBFcYuDYX1mX67S5vMiDXLRqovpD39TX70zLmEym8Si0pp1ze450FbzTnCfWbp+9qSCC3vk0y5MvA6yBbTEl2gqKjhCLnsO286fTO8UsJWpziy/wCJs8j+/8+6Y+ofCeCcbKvdbnThYorrE0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894039; c=relaxed/simple;
	bh=SLrZviWnZvXQg9b5nDysF8gQumMDm53nZyVfxaiql44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byNf9nWqaZpyZn4ZLrUIUGSs+IOq3UI5G0lvFzj4wLKhhVfju1E4Ekkk/SCqt4HPGg2su0AWFMpImnirMAtyIrbr8G59TWZblh+ioVVL7dq3BJjWEiz2JBUo1DlluacqwhnFoxc5JOPdLFOo+cH9hOXopgmwaHhlzXI+gfeJ4v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fzrv2xDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCHtqU023485;
	Thu, 17 Apr 2025 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QW71RSDpipu
	RjnJxG36tgJata/JVHYLv8EUUyd3ynTc=; b=Fzrv2xDNPwgGPS4iUMeOBZThzfb
	5+r1xDZ8W/wdEr8K9uftQ0KVIzGf/sPQsoaJTyXzyqJbXYHXHwnrR26kw+Nu54oJ
	9OJofAEBFtR5qegzBtbS3LEfAQShjK25ZsefyjNqe0vJvzAW32iuGjjBZA8AW9cg
	Cj7EkpkjEyLZNn0yflZgDDk8+q7DpylWYZlwPIzAsRVCKgK9K98szBUPZruWVyOS
	dBW0BcULjURRIFktiY12LajfFdSv6zTqJ8JV6i5ziH81AAZLOcKG1BfvU2TD7uXz
	fc5mHkbUU9GrJkUHvwygvGwLRsjdqFaVHQaDjUjf9L9Zz80BGqogScXn5Ug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjpug9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:46:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCkmt0017622;
	Thu, 17 Apr 2025 12:46:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 462f5drtta-1;
	Thu, 17 Apr 2025 12:46:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53HCkmZl017617;
	Thu, 17 Apr 2025 12:46:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53HCkm8l017613;
	Thu, 17 Apr 2025 12:46:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id AF44F501599; Thu, 17 Apr 2025 18:16:47 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM property
Date: Thu, 17 Apr 2025 18:16:43 +0530
Message-ID: <20250417124645.24456-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: 0_mwgAwpRwRXsEaNxeLkWoLO8fAQNT31
X-Proofpoint-ORIG-GUID: 0_mwgAwpRwRXsEaNxeLkWoLO8fAQNT31
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6800f83c cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=bmo5lHaIWG-R3PfxNqQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170095

Disable UFS low power mode on emulation FPGA platforms or other platforms
where it is either unsupported or power efficiency is not a critical
requirement.

Document the UFS Disable LPM property for such platforms.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 Documentation/devicetree/bindings/ufs/ufs-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 31fe7f30ff5b..eab28beb0e76 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,11 @@ properties:

   msi-parent: true

+  disable-lpm:
+    type: boolean
+    description:
+      Disable UFS LPM features.
+
 dependencies:
   freq-table-hz: [ clocks ]
   operating-points-v2: [ clocks, clock-names ]
--
2.48.1


