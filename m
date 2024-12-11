Return-Path: <linux-arm-msm+bounces-41503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F19ECE31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5FFF16137C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C4923E6D8;
	Wed, 11 Dec 2024 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P8siTpfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83323E6CE;
	Wed, 11 Dec 2024 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926162; cv=none; b=GsuD/cej2XN/LhyMZHLDIdYHUftHA4ETOhDWDz5BRw3nLCEAOWuB30/TsrrNDwwzKPambCgvibopaL8A8UrWh5aHH0kH9qJLGX5y6lv77788FmFjdLtNGYyRHJbZ5Y/94gRvJcQjxEN3Nbw26rU5ro1d/SpB1pY5qt4yM5/AcNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926162; c=relaxed/simple;
	bh=Ii83cg4a2Y8R1elJhFgR/+AqwMODRWTgoFUP7JKhanI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7TqR1jdwOMDqWZQoHvX3B11Yau+VhJooQktEUPOk8PaqzGFCRt40N6RA0LDVaFBlVbBAho4i4aZjYwvEeoZej/XGWbkJXXjE71lyCNcIHbFXnlNSebSwf4lJCQCE/WJXiZrIfsRyBF8BvnJxJyg2zlAkiJ9LKy7zeNt32XQNao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P8siTpfb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBCeO62014600;
	Wed, 11 Dec 2024 14:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOTJqtfgwtVwPvp7KQnuv+nW8GeXNry+9tR/gjIRbJg=; b=P8siTpfb1bU1wZQ+
	NZW3C6pNqCF/FsYp8p2dC+fBHIGpOVEtCjOxqqLjXCGYox2iBoADKtiB1zbHCmY1
	038iSzr2oWmavyKPomPNZknlNZTo/AyquKgWYD6+FmmPgrwTKkwnQWl2MQCN1XQb
	VG1+Hki/kXMLkjfv2POUtxBZebDaltzTOxq0+rtWLG84mLxPiE27QoHS4kDgFf+a
	QgYiRRA3r/0B/o2aZbIb7P9YT1/ZyAhDQ6WNIgs5xDKghX5p6G93ugZMraZ59yoE
	4w337j/2kYArCWnohH2uYLn7QmMRqvTzAcckmv5WPufZ0OWa46qv+jnxqKuZHGQM
	1nZ+4Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3ndc1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:09:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBE9FQr015845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:09:15 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 06:09:08 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update and buf done
Date: Wed, 11 Dec 2024 19:37:31 +0530
Message-ID: <20241211140738.3835588-10-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211140738.3835588-1-quic_depengs@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3-AmXJoNX9ios37QF3KPwRQ4vjAdS8Bk
X-Proofpoint-ORIG-GUID: 3-AmXJoNX9ios37QF3KPwRQ4vjAdS8Bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110102

The RUP registers and buf done irq are moved from the IFE to CSID register
block on recent CAMSS implementations. Add callbacks structure to wrapper
the location change with minimum logic disruption.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.h    |  9 ++++++++
 drivers/media/platform/qcom/camss/camss.c     | 22 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  3 +++
 3 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index f52209b96583..1369e7ea7219 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -152,6 +152,14 @@ struct csid_hw_ops {
 	 * @csid: CSID device
 	 */
 	void (*subdev_init)(struct csid_device *csid);
+
+	/*
+	 * reg_update - receive message from other sub device
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing reg update or setting reg update
+	 */
+	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
@@ -168,6 +176,7 @@ struct csid_device {
 	struct media_pad pads[MSM_CSID_PADS_NUM];
 	void __iomem *base;
 	u32 irq;
+	u32 reg_update;
 	char irq_name[30];
 	struct camss_clock *clock;
 	int nclocks;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18ad..e24084ff88de 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2087,6 +2087,28 @@ static int camss_link_entities(struct camss *camss)
 	return 0;
 }
 
+void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_buf_done(struct camss *camss, int hw_id, int port_id)
+{
+	struct vfe_device *vfe;
+
+	if (hw_id < camss->res->vfe_num) {
+		vfe = &camss->vfe[hw_id];
+
+		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
+	}
+}
+
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9da7f48f5dd7..6dceff8ce319 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -161,5 +161,8 @@ void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
+void camss_buf_done(struct camss *camss, int hw_id, int port_id);
+void camss_reg_update(struct camss *camss, int hw_id,
+		      int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.34.1


