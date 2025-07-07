Return-Path: <linux-arm-msm+bounces-63949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26329AFBD17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 23:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31B71750D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 21:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE9126C38D;
	Mon,  7 Jul 2025 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P2GD44cj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627C28507E;
	Mon,  7 Jul 2025 21:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922212; cv=none; b=LT9WO7sbB+DW57D+8BAvDdK5oXOkaWhgeVxHkOMrgqZgRXam9tnVEBTVeTH3J8xsdPW2gJj9QEdNsS/a2zHqcPO14hDsIo5d9ue+kCedWjKSLXrmk4GH2NXJH97GgMtUNsAwJWYC8CgV1LEeKW+7ZG4vJEStiMXaAkbLAxjnBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922212; c=relaxed/simple;
	bh=PW3EpMTkyd3PUD/js6gQZ8msK/1k0sJoWea2gN2F+sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLEmlWEyE/0wQxJnJWEh69ZACZ3VfG7UoQ/mMLmlQFNw8Sa3fbu0tQIpqWzGkRKAo6kXVTdbODgAeRbvlbSrJMNLRzkCaszFisZR8GZf/kku7pOK3lq/207vJTu8YM1mR4viUgZGt/dV/t+2FZsi3W20lTyRu5XpeZFFMyBlb8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P2GD44cj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567DaIE7013890;
	Mon, 7 Jul 2025 21:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WAZOnatpwnB
	qfxi3yvAv84BqcUMiV2S6tl/4fbzTOqs=; b=P2GD44cjHRc+ls7Uw6Hy4IP7eL9
	oXIJJt89vZgRTy3nQPtLaanYSrwa4cq0jLDXVINY6nekkAL8CIanmw2UuwwleixT
	cEqsAGVkVFiSoY+C1Ij3pPwdlrP/Py+3JkNCmVCSdR0llYyWYizb98uXj8s6IKpi
	PT0r8e5dpWILCfx4JIUcLkj7D36E+kVjdR/9KuHVM69WMXOeXNCHk33A1Z6BG+Ps
	A6rpmm3PGSWbyC8OXjvQMvfdi8jVHHEWh+biOgm1EVvqNCzE/OUp/y8ZlcASdTgj
	EwKU+wRIV9B5FmX8J0oX63Fpp285aHVIBGYmECOdb7EFTrgvaYPCCP97TBw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0nyuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 21:03:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 567L35S1015153;
	Mon, 7 Jul 2025 21:03:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4knn2c-1;
	Mon, 07 Jul 2025 21:03:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 567L35x7015147;
	Mon, 7 Jul 2025 21:03:05 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 567L3558015145;
	Mon, 07 Jul 2025 21:03:05 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8631957186C; Tue,  8 Jul 2025 02:33:04 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
Date: Tue,  8 Jul 2025 02:32:59 +0530
Message-ID: <20250707210300.561-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250707210300.561-1-quic_nitirawa@quicinc.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686c360c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=BVTDQgY5xa8S9YhydkYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0MSBTYWx0ZWRfX8YBZ5AYp/MZq
 F7U6wUCw+Hn8qXyHZKVwE6lP1SJr5LHx2VV3VOjyHpyoG7T6pgW6Np629yZH6x0yLr6Ml+jljel
 M7yV6JzSNCznd4F7Y0f1n5pfDFQ+4KtnKzho5X6iKsTgyvJYGxaUAn7CTUlWYNi56XtPHlIJJ6X
 ITrSjwPYrJ5mBsvpDTORjiPxz10EgVCLBpIcw7vRn7dnpwIggmhtLRcGGA5blaHxS0t4wKSi/Tf
 Y6hh4K3hz51n/CDx0LGaseuqnkGKrtufFX9IHucbdN08PKw6Z2+BrzUrmgFkeVPDh7N+Bn8eLzV
 5bKn+TXM/mleoaVWOLhKABdHWRdKC8k5/XyguyuQFFuk24A/0QP+MuFnoRLWjccVW3XZ2bsh572
 FfAeOrCToiIS//U/htVQD0mRNCrl0z3SABaSsrX8v7FeXXoTTSTJxwb7cXlPJ3yqm5C+ULFw
X-Proofpoint-GUID: J2BMO8gGwLYmnm-sZf22Oeg4LwqUj6tW
X-Proofpoint-ORIG-GUID: J2BMO8gGwLYmnm-sZf22Oeg4LwqUj6tW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070141

Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
attributes in UFS host controllers using a mask and value.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 include/ufs/ufshcd.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 9b3515cee711..fe4bb248484c 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1498,6 +1498,32 @@ static inline int ufshcd_vops_phy_initialization(struct ufs_hba *hba)
 	return 0;
 }

+/**
+ * ufshcd_dme_rmw - get modify set a dme attribute
+ * @hba - per adapter instance
+ * @mask - mask to apply on read value
+ * @val - actual value to write
+ * @attr - dme attribute
+ */
+static inline int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
+				 u32 val, u32 attr)
+{
+	u32 cfg = 0;
+	int err = 0;
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
+	if (err)
+		goto out;
+
+	cfg &= ~mask;
+	cfg |= (val & mask);
+
+	err = ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);
+
+out:
+	return err;
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];

 int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
--
2.48.1


