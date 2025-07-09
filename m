Return-Path: <linux-arm-msm+bounces-64290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF1AFF360
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 22:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07A6B5A511E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 20:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3CF251795;
	Wed,  9 Jul 2025 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jJTlluFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C224679F;
	Wed,  9 Jul 2025 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094617; cv=none; b=d/ojDjQwvPds1Y7F6t6Idzupzq2R5I+nhHngbQ3k4gzNk0XtDR05165D7NUUZmeRvvFV+hJ6tzISTakywV5DDPxeBovyDbdB+XWQsZtBkSjRMokP2kPYQ+sk8RWQEB2uCRTIKkSaEnjE/v84MCWgaKUjrN7dBRryWmpt8vzKpaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094617; c=relaxed/simple;
	bh=CHwVxYD5o2KPSWWyuzrq+m8uu7HG9NIQ2Uo4BhoRAwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtdLU4rgSNH8KLV6sqWyESxIG/rRf7lrSPm/CK6Bz7URxZOSWlvUbzctjA5ameVp3dnvOviwCzP/ucchdYSmrgiOR2f0PmtTM4erTcREZxnfGNA+FNPVG2elxk5zhLF95b6B9c3gS60z33BOuGZpq/X9IrGT+iGBxPQ6+PtjBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jJTlluFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cp9xc015336;
	Wed, 9 Jul 2025 20:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q0CBs4ZVtOU
	kYbBJDC2bi65n1zlWq+EK2iiNmO9MBIM=; b=jJTlluFn/WP91v1x3JyisPbNIq/
	XZbEvd4GTipOL0XVkBqQPqREcfqKAFK612+iifj6V5fKhrK5ePqN8cyaB2Arm5bf
	HgeY9reqB7++Tle127SIirnvaJp8tDw5LctK1fg+2Z4wrBAMr9k3LJexZtOnel72
	25HkYfZDV64J/L0oRJLITj+jQ6eaveo7EyY/49Sq+ihePf/OML1YUQPNg8v5+Mwd
	p+bAWUQd2iEbqlFPmZjNVrBpN3jTsSkIzXIK6jdLU+yDw45vjYAKCq/Jn+r4pB0Y
	DnXFs8RWedWjEMcwepY7m+sQDqxpIn+SUzEotp96Z3gyYPB04NClj4DyQHQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b13c80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 20:56:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569KueRi029929;
	Wed, 9 Jul 2025 20:56:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47sdus4c7t-1;
	Wed, 09 Jul 2025 20:56:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Kue1f029924;
	Wed, 9 Jul 2025 20:56:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 569KudZi029921;
	Wed, 09 Jul 2025 20:56:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 523F857186F; Thu, 10 Jul 2025 02:26:39 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH V4 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
Date: Thu, 10 Jul 2025 02:26:34 +0530
Message-ID: <20250709205635.3395-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
References: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686ed78b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=FKiQevh3cX4uHeHiuLsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE4OCBTYWx0ZWRfX5uXVMk1P0M42
 ygvKT66UaEcBPPWn/X0+5XPxES0EN8QK8B7iOTs1HR0VqFuwkJVzeoEocqGFZSGv6MqhhFpZ/WR
 PBlr4vuuusi1Cwz1R3GgbXL1PwEh4ibmzw/IfqlLkQmaDJ3IXkAAfkKZC+R5PDovVLpQoiyUgOj
 dfNBYfXXyRtLR6ieriF7hu3uIUDKZ2i9in2WtBs1OG5HXgzh1qcf9KaFQwp3s6dQLDFiI3zFxrK
 Ws1t0T67ANEcE121Q5mPXtkIBH8J4ckCUR+NKcHkknr2K90ixcNYhV+qktzsZSnYiVY456TW4yi
 y94P4HapvXDvfoCn9Wqv7pcO8HxgXoesGTX4K6B1w0Ci9sf/SrbJcpaHKrVPo8xV2cTmk5h6D3K
 tbNKAX+nlcdAlPPHELnyyYJ1dJttRsNc3g22Ak35vCe/2xFUAbii8gGm1bG2iHFe0RZgbxc4
X-Proofpoint-GUID: CUK8VXfwaCU3FRUO5jtywv3mca5sqoSk
X-Proofpoint-ORIG-GUID: CUK8VXfwaCU3FRUO5jtywv3mca5sqoSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090188

Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
attributes in UFS host controllers using a mask and value.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507091547.T2t1t8Wz-lkp@intel.com/
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/core/ufshcd.c | 24 ++++++++++++++++++++++++
 include/ufs/ufshcd.h      |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 13f7e0469141..42b9b7b0ee7c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4251,6 +4251,30 @@ int ufshcd_dme_get_attr(struct ufs_hba *hba, u32 attr_sel,
 }
 EXPORT_SYMBOL_GPL(ufshcd_dme_get_attr);

+/**
+ * ufshcd_dme_rmw - get modify set a DME attribute
+ * @hba: per adapter instance
+ * @mask: mask to apply on read value
+ * @val: actual value to write
+ * @attr: dme attribute
+ */
+int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
+		   u32 val, u32 attr)
+{
+	u32 cfg = 0;
+	int err;
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
+	if (err)
+		return err;
+
+	cfg &= ~mask;
+	cfg |= (val & mask);
+
+	return ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);
+}
+EXPORT_SYMBOL_GPL(ufshcd_dme_rmw);
+
 /**
  * ufshcd_uic_pwr_ctrl - executes UIC commands (which affects the link power
  * state) and waits for it to take effect.
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 9b3515cee711..1d3943777584 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1480,6 +1480,7 @@ void ufshcd_resume_complete(struct device *dev);
 bool ufshcd_is_hba_active(struct ufs_hba *hba);
 void ufshcd_pm_qos_init(struct ufs_hba *hba);
 void ufshcd_pm_qos_exit(struct ufs_hba *hba);
+int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask, u32 val, u32 attr);

 /* Wrapper functions for safely calling variant operations */
 static inline int ufshcd_vops_init(struct ufs_hba *hba)
--
2.48.1


