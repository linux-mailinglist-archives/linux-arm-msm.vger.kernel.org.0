Return-Path: <linux-arm-msm+bounces-64104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D30DDAFD9C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 23:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF3B43AE2F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 21:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19643244686;
	Tue,  8 Jul 2025 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OdxSYtjD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1932417E0;
	Tue,  8 Jul 2025 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752009964; cv=none; b=o6jHGS8Nu8jJFOdRfFBQQRJhVlFe6sIujFvqBxyDkLwXPXJivA2rh5jebEfiiaHrI4y0d5GfdvfmeZABrxSuvV/pS0fiqvjMblwJBSxq2qYYspX/3PuiaVLZfhCk7LYmrYxAo1FT3/qxo5YVfCvKN0+WDUWCWzNS4URFk77NgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752009964; c=relaxed/simple;
	bh=M2+GRVIJzzyVTSieGmh/70mZLHxM1uzhbevAoKQ1kqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwWhqrDngwYewxXHw67ToG6NGIGmWrVUZMtCgSetbeoSKCgEU1W4dROUeIDrjFNHan/hxHFnIP5zgLz4GXWBjaS+ABO7sy8VGB6NtXgHZNowE9/Q5/VJcnMPeicUcuPAwo6nJMnBLW4y7j/sD5Kt0DgaqJ7QRcPR6CCwlIYT2C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OdxSYtjD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568I5bTj026767;
	Tue, 8 Jul 2025 21:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dUpLre4Wxq3
	86W+8Iqu5WY0XCFsd42rsQicFmCmD/ro=; b=OdxSYtjDNt8xE/63ZKbI7le41ep
	CFlmgPRwPyeiV6VNUIFW3CuZqBMui3cxzOl6lq+96hC2EANcjbOzlP1vYyGmSZBQ
	JuLBouGoBUIoGUsnEaoTX4ekRKhNHhyvIeaWFmMGU1Dm0N3MbJ08CvmCrAU8uzZf
	4VdHp89B8hPTPfCQ8zFWgz0lbkh7ORyiOx7X6/Wh3EGJ15UO+LviQm4YRlWMfo4I
	zvC1i5Go0QvZ+Dnav6p/QZC8M9gxYxryvn5vCeobuLEeuJIw4tdnheGpCEsKTOH7
	uHASX/mYKQs4AIJObJF2I5VdtjSWihLo6++ilnqkmTT05Rd06J2NPwI/CEw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdr2ca7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 21:25:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 568LPb9x000876;
	Tue, 8 Jul 2025 21:25:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4kvamr-1;
	Tue, 08 Jul 2025 21:25:39 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 568LPdSW000901;
	Tue, 8 Jul 2025 21:25:39 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 568LPddl000900;
	Tue, 08 Jul 2025 21:25:39 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id DF236571870; Wed,  9 Jul 2025 02:55:38 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
Date: Wed,  9 Jul 2025 02:55:33 +0530
Message-ID: <20250708212534.20910-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686d8cd7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=FKiQevh3cX4uHeHiuLsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KKOXwnarrAwigm4BI5zMio6WrSqiB_Id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE4MyBTYWx0ZWRfX4rRZUll9j8KX
 fktMKjqdk5SwpzFtvwHvTnvLiiVvLU8ssPy6Eb2GvhmxmWPVZfv5JUpANPWeMDe24kFKV6HWwLM
 qcJ4JWYT6H2HmadtYVB8grAbPKMskuFshmUHL8qbH7rePxNaqeuOj9XWCKwGvM91OPl5xpAcIhD
 l1UQ076hoP4Q5HiZRUzWYiyMX0DdZpXojeh0Fx952TYVUIYtA4AZAXEx5W2wS31bLXanuPlHkXY
 CYMtlj0nyEXqnA7tz5zjZtVGr6zHBhYbjxv/H1jKe4UGdfXDdrNfIKJfgkv1xl/d+ihaFdb/6p2
 ZlK8w0+oUbEr6RJQMV4NymnPcP7okPmOvYOgJMi6Uw1CpT5VnSERuBdtBA0CpkXdgJFzYqAeYLi
 E7orxVyRxJasersjXBufVeLzg5VOCdCS4qUj+we5eV3fUPo1PzIlHSWs2lhxXA+Q/S2dmGHD
X-Proofpoint-GUID: KKOXwnarrAwigm4BI5zMio6WrSqiB_Id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_06,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080183

Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
attributes in UFS host controllers using a mask and value.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/core/ufshcd.c | 24 ++++++++++++++++++++++++
 include/ufs/ufshcd.h      |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 13f7e0469141..8964f8912fb2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4251,6 +4251,30 @@ int ufshcd_dme_get_attr(struct ufs_hba *hba, u32 attr_sel,
 }
 EXPORT_SYMBOL_GPL(ufshcd_dme_get_attr);

+/**
+ * ufshcd_dme_rmw - get modify set a DME attribute
+ * @hba - per adapter instance
+ * @mask - mask to apply on read value
+ * @val - actual value to write
+ * @attr - dme attribute
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


