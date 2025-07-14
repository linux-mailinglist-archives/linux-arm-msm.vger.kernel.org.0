Return-Path: <linux-arm-msm+bounces-64769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A32B0385A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC369164762
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3269F2367AD;
	Mon, 14 Jul 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ElGMtGUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F041E32C3;
	Mon, 14 Jul 2025 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479633; cv=none; b=Jc6XG6/BW4hwdeqI8YdBs4MIRwKlhUKSXHqIZuMMOrU0tF98bq3x1CqAbjK38VoZMzhvc/aYrH2PGMBvwt9WioBfWOHgG4zz2I5QHqxKDH0cnNN/x1gmukafqfTHCpvwHMmHTyS8+PS1VN2MdU6tgC0j5p9BHg97kSPhMfdhx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479633; c=relaxed/simple;
	bh=IJ2jJlGy0GHaHvF/4ryEJyMTHyAAzATf7sAtP6Q5Uuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHKfzGNylEyAw8O/katb30iIb0aQoHpj9qeiD2x6dhhjWQAMvHnqBDK0YZOCMs9sJQb4CXOo6+u0zB4eqNXLMD2mX0hadttLvguVf/NPV1dlLMc0X426G10dt0L3D0EHTeEQQANVav0mbp77BaPTc7IHp7Pl32lrdgV7c21uhu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ElGMtGUi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLrgCG000723;
	Mon, 14 Jul 2025 07:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5DUJoVfSxK
	L1+PAPjYm8T+1GeERtn6CCQsrD0h/qdY=; b=ElGMtGUiKABEo3mP+jSr56w9OPU
	YAb50dAl5ih6MlUv/lfUygVojzRiZ+DsP/r2Vz6ADtmLQlws0Oi7dAfE89l4nu0k
	R5ZmqgT+u64A659z5Mlx+MBJp194hG6k+R0cI+qJdT/coIpuM+VzeSJc75N1OGUU
	ghsD6XeULOXn7xxIkqvrOyX3QruJytRpuFr4JMkYxJhfo8Id9hjz7AR8n1au7k+Z
	lqxTkNAM8KV8fbabWSBDqlVkNzJEseZR0Y5RmhyjYwI7LpEe+riHQpUNGVOWD84S
	yDtXr0TJ23u99oyiqi5ufQAOxfTbMOLknlU6RNDHnpWrA1aziqwaC6fWp0w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmurcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 07:53:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7rdNN007512;
	Mon, 14 Jul 2025 07:53:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47ugskv3sj-1;
	Mon, 14 Jul 2025 07:53:39 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56E7rcv1007481;
	Mon, 14 Jul 2025 07:53:38 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 56E7rc6b007499;
	Mon, 14 Jul 2025 07:53:38 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 30A2757165B; Mon, 14 Jul 2025 13:23:38 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
Date: Mon, 14 Jul 2025 13:23:35 +0530
Message-ID: <20250714075336.2133-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
References: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: ZRVaIbA-leCWnWt1Ep3NGFTW9dVVjt_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA0NSBTYWx0ZWRfXxhoI1TjXop/v
 gTUG0bZ4IizA1gngHTiRIxeTyUgGZNXFW2ODDPRCy9v8L7/spnock6LOouQKx+OcKm6rBc64+RO
 nTaoCdYJquVOpfSeACJF9QB4qNe12xjvT5pQqobt0DVE1QutfrgkF1DIPNKqS8LQz3jExFhE2T1
 yFy5zduGgwHWeqHA3N5TkmSrX1Eup5gDVV+ZWIWbcLxDXXvTSWwW2IyV7b9y7NZe6Gv7BTonkNm
 eMVsh7OrZF/nryR7X/z/nkRrBVfzc6xuf6Q2DA7Bha8xxIjLd6GCarsssraU9QPGeeiST/Aujet
 tBi99c+KBORpq9xgPodwMAcwPnxPmpCqALLgfNmitMKpBe7OyZ1EsS4F1u5jmwBxPjZYlCid9+w
 H1zn71PX82H2BSSlxpAhkZuvc1PNiYNlnxi33vATnZNqIxQAjeJ6dpm34e7TsrPtdtFW9hoA
X-Proofpoint-ORIG-GUID: ZRVaIbA-leCWnWt1Ep3NGFTW9dVVjt_A
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6874b786 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=FKiQevh3cX4uHeHiuLsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140045

Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
attributes in UFS host controllers using a mask and value.

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


