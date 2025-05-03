Return-Path: <linux-arm-msm+bounces-56663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B61AA81AD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046411884769
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C492D27CCD4;
	Sat,  3 May 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F9M1tlz0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF927CB10;
	Sat,  3 May 2025 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289520; cv=none; b=qkABjg0sJGEezse4p1LIFc3nidjp2JB5UeTB+ORO0+c4U1qdjLRkD+XdPijMHT4P/32e/qq5Oo7/MvJ+lenNo52WdD7f3NojwQSuD8aP3kKxnrNI4YN0HxT8cO3XVyGwD9+UO0SdQtOfh8jaGlcxWymMjN5vypq6M58DtJNfn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289520; c=relaxed/simple;
	bh=DMsYtszwKbaJHWSgGhhKr+6/QPWIRpEJ3qbJQ22KJEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJSdr4Ktj5xBMsaIrEEaynA40uomOYhSy+7r8WZ2TT6zvBq2kL/93OtFVAmklqLPKejD7K8uLVqjPRgEXfg0/Ha+HIv4wINaCIYxtQfJNzjL8Mqm/iZcleh74/v8xjmDFVSHUUUi6upYlzjg8YCdBUCXxalvgRv9DjDzm3HmbVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F9M1tlz0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543EuvQO009578;
	Sat, 3 May 2025 16:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D0pTP1hM4o3
	TzMvnv4Nz9MR4RVKcnuDN5vfDC19GGl4=; b=F9M1tlz0I+2QdwTXv8rqAv4XYh/
	4uvVTszvCTnv44SmO11Zu//k4ZMQFuBfrpHnMQA2RAlQBYvIW/sZsmROPIvBLvSj
	mB86//UqyJXEO1nmjI4uuQ5q4nPvOs6PKXhBTab1Rn/gUdstyUWA1+Za/yO8S/YJ
	X9LUMW5rM9kaheO3fiZS+vTXdQcrCgrdOSk6unfSjCTRXuvkG8ao8x0UlrmOVvTv
	caTUXdSCpxSbu4u+OkDsNQ3NPCZPf0ImlMd07I0IN/mMglYDU+FL96is0wKa7Zah
	dNTGqLU9OWimoJuBaGUTN0dEpc8R6ttpSjfcUZqjO3IX+0rRvmwgPvLMUTg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0ya2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOiwR029769;
	Sat, 3 May 2025 16:24:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1ex-1;
	Sat, 03 May 2025 16:24:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOhc2029761;
	Sat, 3 May 2025 16:24:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOhut029759;
	Sat, 03 May 2025 16:24:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 033045015A2; Sat,  3 May 2025 21:54:43 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 01/11] scsi: ufs: qcom: add a new phy calibrate API call
Date: Sat,  3 May 2025 21:54:30 +0530
Message-ID: <20250503162440.2954-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6816434f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=jLEhXYc_IhqhhXrxegcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RAoPz5TR96ClSCrMmRwoM2GbLi2tcm5j
X-Proofpoint-GUID: RAoPz5TR96ClSCrMmRwoM2GbLi2tcm5j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfXy7VYVoIZhovC
 YPAE6+L99y9Gl4E1MfBvhmNu8V5zl9u+1QxnQdIMnJO5V/NLCHMpxpnp5UntfA/0c9cE7kR+s8g
 PuPVHFanbZ/PpiihmnQCeyr7VungQLT39hZAXD/JNNKlh73jSc7yOEfLY3Mljbpc7xBhMcfUcx3
 lH8RGysJuaCclvky/Wh78rqcVgu1btt7k4suFITFfbDz1WblhNrvVPfkxkhVy3BBLf/d6MEpAuo
 vgXvPU4y4w/+KA9JpnEqOEmQrpNWnuoDTsubX0sTeQtRmE+ZEoXNzknszPMgOK1XkqIhDGQQ7XR
 Xi908A7jfavU1mf2UDglvZeokIyR+fyEWbg9PjhF4AhjcuoEc5AIDeYxu+K/BdTGEOwbq5ceS+h
 o1ODlYODdu7Cc7pQSzil2ENZpLkpQzCFxyUEq3m5zmmfiT8HiKM7VSwdUTVb1SNahhm7Gg2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030150

Introduce a new phy calibrate API call in the UFS Qualcomm driver to
separate phy calibration from phy power-on. This change is a precursor
to the next patchset in this series, which requires these two operations
to be distinct.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1b37449fbffc..2cd44ee522b8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -473,6 +473,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		goto out_disable_phy;
 	}

+	ret = phy_calibrate(phy);
+	if (ret) {
+		dev_err(hba->dev, "Failed to calibrate PHY: %d\n", ret);
+		goto out_disable_phy;
+	}
+
 	ufs_qcom_select_unipro_mode(host);

 	return 0;
--
2.48.1


