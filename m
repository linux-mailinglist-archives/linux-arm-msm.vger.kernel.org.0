Return-Path: <linux-arm-msm+bounces-26527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE59347E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BFDB1F23618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C7B57C9F;
	Thu, 18 Jul 2024 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FFDCDpYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689657CBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283262; cv=none; b=qWwki56Wbz9SZl615ALx9wDhjaHBKg9XrWDCao8iaj5AhCLEaL4sB/dMpwAwQXv2VUU0IlYlog0CfSzrV1nYE+y8qocX6NBvTUARuk5F8HZFCNXe+6D/mO82HQaXabn6zOFLLcChktuPftvZeLKuooYHZ0Y7uXnW7rxZLdtQNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283262; c=relaxed/simple;
	bh=NbJuKlpz/HdyMUMka0lR+hjUloEZQK9ygdGxKV1PFyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXOtWOuC/3+7kK980BvNKWhlAny1JaKh3eJF2cZPptmXYFC8ILzs0cX9LwWxTkLfYNhhoC13RzbwswiNu2iSXt6+CJ5lXOzpWXxM49unTUqhEITDdEtrGknTPiAqFQyeO5abKdzBwb9e6zfRYhjXyvz0xK4wHzGYdJVKTql2yU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FFDCDpYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I3FkXZ023854;
	Thu, 18 Jul 2024 06:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AoGo8twjVy3zt5IJObiPQEnCncAkwUMMLU07ks0BazY=; b=FFDCDpYXh0fGFNO5
	IO1bYHwR4RnQ9rpE+qiX6zX4d5rBIufRA+1l84KtEl+gQvF/NCrmFzKt5TOOBpbL
	yRG5i9RKl8lTNFWg8EP3SoqaYQYJBqseLxNgneEI1yDggOFuADcVmpRWh7tjZXfb
	6ojgDN5bF+YcChNqKAaOrOrXn/XBNNV0fzO6nr4L+yCEDyxRToVA5rXMVThVQ9Dz
	RtpWrQvZoXGz694l93PT+QTTG2WmWWz74hCrGZtPQKAPxJ5KSpLYab0VM3YBoA3y
	O46WhlyXemXWavtO5X76t9eAiLQVlgE2NyiJDKeqp/tJbDh79es18yei58yMkVdc
	i06/jw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfu4h77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6EF10024698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:15 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:13 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 5/6] bus: mhi: check for RDDM cookie set by device to indicate readiness
Date: Thu, 18 Jul 2024 11:43:43 +0530
Message-ID: <20240718061344.575653-6-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hxxMEmlZ3HNoO6UHnkqmAIBnqwHXqnyB
X-Proofpoint-ORIG-GUID: hxxMEmlZ3HNoO6UHnkqmAIBnqwHXqnyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180040

From: Rajkumar Ayyasamy <quic_arajkuma@quicinc.com>

If the device is unable to send the mission mode execution
environment change event but has already entered mission mode
with the ability to allow ramdump collection, it can set a unique
cookie pattern to indicate the availability of ramdumps. Allow
the controller to query for this unique pattern upon any bootup
failure or timeout.

Signed-off-by: Rajkumar Ayyasamy <quic_arajkuma@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/bus/mhi/host/main.c | 44 +++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         |  8 +++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 26baa04badf4..de804a701b85 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1772,3 +1772,47 @@ void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl)
 	}
 }
 EXPORT_SYMBOL_GPL(mhi_debug_reg_dump);
+
+bool mhi_scan_rddm_cookie(struct mhi_controller *mhi_cntrl, u32 cookie)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+	int i;
+	u32 val;
+	bool result = false;
+	struct {
+		char *name;
+		u32 offset;
+	} error_reg[] = {
+		{ "ERROR_DBG1", BHI_ERRDBG1 },
+		{ "ERROR_DBG2", BHI_ERRDBG2 },
+		{ "ERROR_DBG3", BHI_ERRDBG3 },
+		{ NULL },
+	};
+
+	if (!mhi_cntrl->rddm_size || !cookie)
+		return false;
+
+	dev_dbg(dev, "Checking BHI debug register for 0x%x\n", cookie);
+
+	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+		return false;
+
+	/* look for an RDDM cookie match in any of the error debug registers */
+	for (i = 0; error_reg[i].name; i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi,
+				   error_reg[i].offset, &val);
+		if (ret)
+			break;
+		dev_dbg(dev, "reg:%s value:0x%x\n", error_reg[i].name, val);
+
+		if (!(val ^ cookie)) {
+			dev_err(dev, "RDDM cookie found in %s\n",
+				error_reg[i].name);
+			return true;
+		}
+	}
+	dev_dbg(dev, "RDDM cookie not found\n");
+	return result;
+}
+EXPORT_SYMBOL_GPL(mhi_scan_rddm_cookie);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index c0c9bfc28e4a..2f90de8616f3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -839,4 +839,12 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
  * @mhi_cntrl: MHI controller
  */
 void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_scan_rddm_cookie - Look for supplied cookie value in the BHI debug
+ * registers set by device to indicate rddm readiness for debugging purposes.
+ * @mhi_cntrl: MHI controller
+ * @cookie: cookie/pattern value to match
+ */
+bool mhi_scan_rddm_cookie(struct mhi_controller *mhi_cntrl, u32 cookie);
 #endif /* _MHI_H_ */
-- 
2.34.1


