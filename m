Return-Path: <linux-arm-msm+bounces-73948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED999B7FEE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD85A625FF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16D32EC0AE;
	Wed, 17 Sep 2025 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pw8Nl3hD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BE52EBDC0;
	Wed, 17 Sep 2025 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118233; cv=none; b=CuYdzRldm1zUxe+Ouw/QDU5nw05DyzhQR5pSwujdjx3rMaBu9amlk00HyPFn6Qu7LYFS3/yg0ii9+hWO85XFWAhOLeS11RZcoUGY3ipRCufI2pgJLifOpqukN1VYFuyr3nFdvJImWrFr+FSbaqQc4SXnG8WbFipUhvF5RMUTw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118233; c=relaxed/simple;
	bh=nrqbmK5pgjYW0e7sO92z/DPY0TbK/i1tfGzvxJMkzAM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/84LWH+q2sPQZHJG/nGfPn8OTsU1D0KglSfMXzszVrleYc1PGY+tmiYuXIqvC1AFitsyY8Fx7a+ur7cf6Bhr9K6viKvRKNCZHjLiDs0AX6QiPCMPq4kZSOg2XrkcpMEVoIAXGCCdP5THlLRIvE1MrbjXXBskPrikvQqYm2NCyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pw8Nl3hD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZBl021414;
	Wed, 17 Sep 2025 14:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9L3Jbohsc3DdbDD1ToAmIYfceavXAAc6aods46Kh6Uc=; b=Pw8Nl3hDHp94g/EI
	kvS0kntleugPUZoUDF3vagjxgVUXrCa7GpBIiQDJsqU93UE2q0dgpf8hLdAuP4xc
	+S0VovGn4Z4MaIMdQ9VucBjVyCT5q8DT3lWbFcg7vTWDufOKlvwQeSAskcwpAm7b
	c3FuMomFC78hkxD1qJrOfxjBB1Z08mqE+FASdWzC/9rGnA9Wx74DBQLHf9VklXiW
	deJwv51D5BMYrtST1zkWaPLhPgQcFF2949ZxzOGRIbnlqZ70Kypkm0xIh/V1P6qU
	jIfeVZ1CP08BZarjlRr22zDEidlbrXYOGYOuwAT7IZvTBo6qnYzNYxtlUUiGy2SN
	0guTSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5am56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEA97n015445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:09 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 07:10:05 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Nitin Rawat
	<quic_nitirawa@quicinc.com>
Subject: [PATCH V6 3/4] ufs: pltfrm: Add DT support to limit HS gear and gear rate
Date: Wed, 17 Sep 2025 19:39:32 +0530
Message-ID: <20250917140933.2042689-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CJSuSDJ9DZBcPR3LShX-w6_9aNJqD8yr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxlvTCmEY3VuJ
 WY81xuA0kZjIyOYvhzz2iixOlmFVw0yBU+Ai/yAWmy8+Q53kExNbWnaQS1YOLmb5Ks22DbrJjXj
 Pg7wdXVKX7di36JVuDxBpAcaeTlM7HoqxIo2JAGr7kqVKUZ50Az3sYSe8e4oRcPG2mG6ilhqh4D
 2o26hLojfu68klO9fjyVGmKvFl+TJ76ldI2Grl3RBrPmpU19W9WeU53vBd9Xq395sxT/YT6upps
 aFXGW+NRKz3fmFPi3loUYeUT3E0mPY+NGeaFpHePIC6Jn7fqHO5oXg6FbNKSg72J7FF7k08rVHP
 2vvXudsKBJ6raeCEq0znGmUe78QVH680/JxiLW/GVY6MgmsOthkPSU0nvI//Fvi6YEz4Fd6uSyb
 YJ6oNwVu
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cac142 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=RJ6MAAfX04OqBZDSgvwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CJSuSDJ9DZBcPR3LShX-w6_9aNJqD8yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

Introduce parsing of 'limit-hs-gear' and 'limit-gear-rate'
device tree properties to restrict high-speed gear and rate
during initialization.

This is useful in cases where the customer board may have
signal integrity, clock configuration or layout issues that
prevent reliable operation at higher gears. Such limitations
are especially critical in those platforms, where stability
is prioritized over peak performance.

Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 33 ++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index ffe5d1d2b215..c2dafb583cf5 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -430,6 +430,39 @@ int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
 }
 EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_params);
 
+/**
+ * ufshcd_parse_gear_limits - Parse DT-based gear and rate limits for UFS
+ * @hba: Pointer to UFS host bus adapter instance
+ * @host_params: Pointer to UFS host parameters structure to be updated
+ *
+ * This function reads optional device tree properties to apply
+ * platform-specific constraints.
+ *
+ * "limit-hs-gear": Specifies the max HS gear.
+ * "limit-gear-rate": Specifies the max High-Speed rate.
+ */
+void ufshcd_parse_gear_limits(struct ufs_hba *hba, struct ufs_host_params *host_params)
+{
+	struct device_node *np = hba->dev->of_node;
+	u32 hs_gear;
+	const char *hs_rate;
+
+	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
+		host_params->hs_tx_gear = hs_gear;
+		host_params->hs_rx_gear = hs_gear;
+	}
+
+	if (!of_property_read_string(np, "limit-gear-rate", &hs_rate)) {
+		if (!strcmp(hs_rate, "rate-a"))
+			host_params->hs_rate = PA_HS_MODE_A;
+		else if (!strcmp(hs_rate, "rate-b"))
+			host_params->hs_rate = PA_HS_MODE_B;
+		else
+			dev_warn(hba->dev, "Invalid rate: %s\n", hs_rate);
+	}
+}
+EXPORT_SYMBOL_GPL(ufshcd_parse_gear_limits);
+
 void ufshcd_init_host_params(struct ufs_host_params *host_params)
 {
 	*host_params = (struct ufs_host_params){
diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
index 3017f8e8f93c..0a18a8aed94d 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.h
+++ b/drivers/ufs/host/ufshcd-pltfrm.h
@@ -29,6 +29,7 @@ int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
 				const struct ufs_pa_layer_attr *dev_max,
 				struct ufs_pa_layer_attr *agreed_pwr);
 void ufshcd_init_host_params(struct ufs_host_params *host_params);
+void ufshcd_parse_gear_limits(struct ufs_hba *hba, struct ufs_host_params *host_params);
 int ufshcd_pltfrm_init(struct platform_device *pdev,
 		       const struct ufs_hba_variant_ops *vops);
 void ufshcd_pltfrm_remove(struct platform_device *pdev);
-- 
2.50.1


