Return-Path: <linux-arm-msm+bounces-54002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497EDA85BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6CE4A2F6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4240729B21C;
	Fri, 11 Apr 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UOX6i/ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE429B214;
	Fri, 11 Apr 2025 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371381; cv=none; b=KGxAtyWCa63XPCB7ui5q2LVaqfM/z5fdnYcI+WrrqEQ3cwqBkYk0sC7+AOFKVSS544o72Oy38y18KwyrkJfF8uApFg5D/NSgOSnRcI6dbGwJRH6Pw5e5LWccNWwVgPdSqbPeEMSycpltLDWfMzfhHiF7y2MH4hrhO6o9QGIyPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371381; c=relaxed/simple;
	bh=55gjNIGIW+U2dGtZipdrF6XglrcDDTwZqRnJymumiIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aByoPqaz0++WeAK9dQg7mRpcytOo+NyEFVTCbU6KtQOmFR0hMX05tgSyfvV9bD5wawgSVz6wPYhJ6KKw0//QGByOlvmCJIG/tSI5doQXLqcE7/n3K236pm53Rw+vc7bzmOToLMgzd/BX6MGopEAIe5YyMiiqcwLjZdr4YybR/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UOX6i/ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5WMMJ032011;
	Fri, 11 Apr 2025 11:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c63I/ycZ6NN
	qzoA9+qUGPU56vP2DlXK6DQqWrFBcBJc=; b=UOX6i/ayXqtAG0MJwcImPNSATt+
	HPK/uJ7Z6k/Dzgk6T1zUA2FDGR2XRrPDmg3/lFYQFA490UHEKvQLCFKX9/Kmms8k
	eGWp9GWjynX2m8R7RkFVTDGGwgcx800KQlv4tKFP7tUPDOEk72YULyMBCXkhEiuF
	ZoNEKFrY4GkU3vAsPVkI8H5wd7hp+Uq4MVLVEqJ4YENwFyeA3gWa1yVfPKaLLZlT
	FUPIAODGcVKVRn+eexvQMYooPY/xdVqfR5IdP+gWb3i+AD2LsefQhl3c330DukR3
	ES1f/kqk1hgTPy7g5VUQTVRYREpbTm6P0V7J+FcDWn4PUMiseBU69SUIRbQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmj5ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:36:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53BBa6TW032024;
	Fri, 11 Apr 2025 11:36:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45ue7gax1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:36:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53BBa6fF032019;
	Fri, 11 Apr 2025 11:36:06 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 53BBa5Ns032017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:36:06 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 0A9F024077; Fri, 11 Apr 2025 17:06:05 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v4 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver
Date: Fri, 11 Apr 2025 17:05:16 +0530
Message-Id: <20250411113516.87958-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: LWiI_H5XabJcCpt6gFVYalD7TiZfqJaT
X-Proofpoint-ORIG-GUID: LWiI_H5XabJcCpt6gFVYalD7TiZfqJaT
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8fea9 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=8AirrxEcAAAA:8
 a=cn7IUS33xWvMNiiCnpYA:9 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110074

Add a new entry for the I3C QCOM GENI driver to the MAINTAINERS file.
This entry includes the maintainer's name and contact information,
ensuring proper maintainership and communication for the new driver.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2b64f4568d..a8fcca5d234a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11254,6 +11254,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
+I3C DRIVER FOR QUALCOMM GENI CONTROLLER IP
+M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
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


