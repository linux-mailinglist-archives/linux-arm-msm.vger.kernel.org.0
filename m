Return-Path: <linux-arm-msm+bounces-20434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F28CED50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 03:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253491F217D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A77610F1;
	Sat, 25 May 2024 01:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NigPwiM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C904696;
	Sat, 25 May 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600449; cv=none; b=Y93a4xP/+QeIjtTwcL3W5G7zRBehSNGX22tnTHY2FFBRBKuJIO1gGgrv2Qh9PUM+rYirdY8m9pAoxeQWu76qx3se3csmTYmzV1G1oLTHT40yIl+ppVM2ZoKN1VfKqkpbCntmBIhDsHAtiTF8TIFIU1IuFqInYILj9t8qD4v5phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600449; c=relaxed/simple;
	bh=13HAQrLwwWPz+/+91LNfsO8pC8kND2d29yux2cPGoF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=THNsLEHqlsJPVIS+0Ubp3XknAU4wJ9q5cIOB/mlPA+CnXROjKmPRnJNed+DfxPt8XHvdyR6+67teK5oUynOfrWMdYZj+GE61UzL462IOosTgjxUn2Z6/aVwB3dEuxQja8YE7qhfUsw74lPQjUvZ96mXpjZfGb29TkNHup7EkNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NigPwiM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44P0xtLt026120;
	Sat, 25 May 2024 01:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWW/Fts9ZTO/IMJHtvDIeUpdCYtzrr5gIN9D8VxPqig=; b=NigPwiM8xIAo0LcI
	92xlY9WCOoj/uLXo1FJGdBUFBxAZO7OsOXwpHiC2N970S2RYh6pK16yCvx43S0iy
	h+kSaeXL9ws18j1iao1PJqHD50peiusyxKJ5twH63UCeTDqWi3vRQs1wyn7C+1v4
	gdDHWMSSJZuvNtOMB6VdpPXavTQIFJSdhSAqXCdcwGGyAu5d0xWjad5LgljkGQ1D
	zq2pVICYS9CTee9d5yxZQZ+UAelklPXigoDJNres47LmoUPKWQoVajVRhLQPzJdX
	t2ZFfA5fOiunlD9yRjtZB5G1BO5HoLHVzcjnfde9BZri85UMe/lUTyecrjL09tka
	CrKsOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9u3q3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:27:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44P1Qxv0031411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:26:59 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 18:26:58 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Fri, 24 May 2024 18:26:41 -0700
Subject: [PATCH v2 2/4] hwspinlock: qcom: implement bust operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240524-hwspinlock-bust-v2-2-fb88fd17ca0b@quicinc.com>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
In-Reply-To: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        "Richard
 Maina" <quic_rmaina@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716600418; l=1477;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=8LP+NZipY61xQn1OPhiw3j6bY8rC5vxWsxK44sr5W9o=;
 b=+TvJED5FF6HiBMbRymGJLf/R/tjbq5RBwxuE/PI6XKd/JzxxvtFNuATZGbfh0GX+ZBchLO1pe
 IWRa/1GyPZqCjDc9FqwlxzIod6JhuHj8BCtyvZD7Y6/rO/4fa7jvdOF
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fgV9spTLvkXTw9qy13K9oEORibNksZLv
X-Proofpoint-ORIG-GUID: fgV9spTLvkXTw9qy13K9oEORibNksZLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250010

From: Richard Maina <quic_rmaina@quicinc.com>

Implement a new operation qcom_hwspinlock_bust() which can be invoked
to bust any locks that are in use when a remoteproc is stopped or
crashed.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 814dfe8697bf..0390979fd765 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -64,9 +64,34 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 		pr_err("%s: failed to unlock spinlock\n", __func__);
 }
 
+static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
+{
+	struct regmap_field *field = lock->priv;
+	u32 owner;
+	int ret;
+
+	ret = regmap_field_read(field, &owner);
+	if (ret) {
+		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
+		return ret;
+	}
+
+	if (owner != id)
+		return 0;
+
+	ret = regmap_field_write(field, 0);
+	if (ret) {
+		dev_err(lock->bank->dev, "failed to bust spinlock\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct hwspinlock_ops qcom_hwspinlock_ops = {
 	.trylock	= qcom_hwspinlock_trylock,
 	.unlock		= qcom_hwspinlock_unlock,
+	.bust		= qcom_hwspinlock_bust,
 };
 
 static const struct regmap_config sfpb_mutex_config = {

-- 
2.25.1


