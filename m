Return-Path: <linux-arm-msm+bounces-109372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIS3AG2UEGpSZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E95B85DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDAB2306F210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DD036F912;
	Fri, 22 May 2026 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DwnQsN/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrtWE73V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43145366DCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470881; cv=none; b=L4TnbfUOsf6qyNNSTmHs3yUqsxcrKEiRoDTM2zbdfLOUOEe8kS8LSBBIdjLOX64C08OEGsdF9xON7MYtxIeZdLdH4S4YeIYFoSOrxpV0XpHKSSdHT/MtVJRdorf4+6/ErYiYfKigzeCrHHXns+lnOiSji4vqdQAKSeFpGMYLSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470881; c=relaxed/simple;
	bh=tiTO1/V4zGWsv3ghvAaDnMKjOZwwzp/llr7bdYjQy04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pFgHJMvdscTRcjbiBEcshEZZ3K/0fOhe5/e1GVyJjKT3uiDHT4G+iTYiSYWOzZnpecbyqAbCejBrKHIhXOgkQXAic1RllHMjuvmzqVxXmaVeAF/g3Ak5kVyqGck5IfuawUjYlgOO/AGvDPr3YzgAv/dG4SQr0hixmhK49LJDwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DwnQsN/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrtWE73V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCVDSV778711
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xr7Wy4QXMfO
	rifsD4dWmz64/s7KqilIWMlLtYa4AGkY=; b=DwnQsN/aNE/T8EG+Mh5sPgaQIGa
	CSoNpbkymX0zoJA8m+g+0msoeE9jbsOyMw+Yj5uMb3HNZtTmLGK3IERp9oFnzEEZ
	kjkoKJRLPZ18LJMiiolPqSQvtBvUq1PeTO4tuCv8Kmp+vy82GQ9q1nerATIim97l
	wLep1TbkgWuKdlFl2cCt9cu8dpa6zJSZJ5TIIkzmokhOzf1a92f1u6e2UoiJPCOu
	YobcXXmfMZq+596t7s8X5xKjKRIQTNnK44nb/vfUFN/bO7qbsS5Z6L7HVai14FTP
	ZhoMsx8231YWEVgdk1mIqm8UxYdkVdMFCtUFp5OEJYZLy4Y0p6HFNlwGiow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7aux26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83eefe4867eso4050854b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470878; x=1780075678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr7Wy4QXMfOrifsD4dWmz64/s7KqilIWMlLtYa4AGkY=;
        b=UrtWE73VOK5DYYzccPcjgC1qapKI5nNmnXqkPzEscgoRZzs2oq+RiDxg9uM/lTYsWR
         NEI7+Ogoi2/BGoEEHIjcPi5Av1noa5yALPHcvKcX5a5aFS2Z1w9cMHDGA4NBJogcmMcu
         p2EpVYso4fj9XJlxcp4uHJGcOJcKtRPOya154qUpEFoJh72eacp5cMVriuBRJm7gwh3B
         cJZALLDg9NC7mMtwfpZX8BNrTJZQQoRzmBmPAFEh/Tb3snXN48YxuZZ6Uhk7KiTnlaqe
         JvPB4YPyB9V+XTiJvEd05Wz994xrB6X7lBoEDUjnx0ipFkxouZ7K4WEkvH6MTJhGb3Sh
         vA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470878; x=1780075678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr7Wy4QXMfOrifsD4dWmz64/s7KqilIWMlLtYa4AGkY=;
        b=gOJT7rOKvZfRzudO6rehcdnE8jUFaWRzILUhIRIRH3++sOm5pVBxCVcHgVb37H7xm4
         wXUjtxkBhMe6B+zGZFbLwQMnlehW9Rvux6zx/U5DkJZELY8IDSv6hEMEU/FiPFVT/XcF
         RUUtTOYlsg+k093Ik8PxNfXSyHgRZ3XhIUr35ax9f0ryOr2+P9aZAMsY4H5XDd7O61Y0
         lzPpNzJeXerOs8LciD/C2oP6xr54sM3KBR2+x1eZ25jS1mblywwMIwaKWPASOH39mVm8
         s15Wa72SAajIkON1y6COzSzW6ZlT3idXDCtkOppqHYqIkQRlBBUjRxv6va9dfL+M8Uoi
         +zbQ==
X-Gm-Message-State: AOJu0YypcWnZo1ORnT/CtWBhoCAblNuqCEDUALDcE6e1yF5EtVUFVW6s
	M7oCWVv8mp2+CRDC7RAgwciZvpzMj39P/OfgDr7R7JGz4DMK+RchmKMrrH7hCxtUVwwcM1qXDTZ
	Q6GRQWlzntBv9B2i4x5hcblb8eH3ViColg8Wj+v/tuR9x3/QhMBxIFCTpVf2igplLeele7Ibv6M
	fb
X-Gm-Gg: Acq92OH+GarWWQejdk8fbcHV+OJ8kFmAV+0mBvuYA1XXcayzB6bWFjQc6htMHP1bhhm
	r0XnA/TVxOkv6b9hCLNJTzEb7fZaDLGJ1CAJWtdzvNQZcUt4Vdo912loQz7KnUkdbAmijVV7wpL
	Dus5uBa+4HzIkSi5CaJt9yac07gRcWWt1v5V+wusqKj3dmocuWxNtOD4NPY1zrQdm/sCqplecOg
	BgOp6YZFYk6v2ASi5U8ageax3eMdLd7f/dSBYk7V3Q7cmcWYnskF5+a9zxXzMk2ViABj1ski4CB
	mBJv73Qz2Qe+SwBkWKv2g0vOeASOH1+SJbUM6HTghiTOyGhOdJcZJ2vbG2UwPsJMwvrG0FSgC5x
	T7rW+BTzw1qbS5jY8rx+zEbAqKeuo0s5R5iIb8JqHZuWv8ua0LJqvKg==
X-Received: by 2002:a05:6a00:3923:b0:82f:ac48:8342 with SMTP id d2e1a72fcca58-8415f4066camr4850573b3a.24.1779470877932;
        Fri, 22 May 2026 10:27:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:3923:b0:82f:ac48:8342 with SMTP id d2e1a72fcca58-8415f4066camr4850516b3a.24.1779470877323;
        Fri, 22 May 2026 10:27:57 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:56 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Date: Fri, 22 May 2026 22:57:16 +0530
Message-Id: <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0PWIK8Dd-M1PgGo0B8xIhZeodeiQkQuN
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10921f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=h_in7VWVVixVgI9GMPYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 0PWIK8Dd-M1PgGo0B8xIhZeodeiQkQuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX1YZUECDnwuD0
 fUXJ72KiZMX3ef+FD0Cuzycaw0Rt4XQYVZYiaOaYcSVMeyrIMHNFi+jwsEUpvd/kJKScm3Jd02y
 lNNYDsI09Y/ZhC1z5tw7du83m3vKWzxdAbMtWWPWRl+Rg63GQXuOQEG+wRLpOJYS9WWVLqEicBP
 87kr1PyChmy7TRB+KTbuWbay4EhJoyET/fmxz0wNvTWJYgCzQNdA+FeGdR3NrUHKndzj8ewo2Ww
 HXLuAXpU+Q8GiJJyKrAgO28El06BS5lUE5LAkuIhyFOX8IRDjWOgrVgKJW7W4Mu01VE1kT5Wt0h
 Z78lww2b8cbah1Ff8E9CjKXaMc+iEParm+zfO4Ohk279lftQ0eU7aK7jOI/zC1wiqUJUrDKcnXb
 0yTKmIVWLTNitnUybpIjsep9s517PpCsgqrwz9n+c6NfXg+AgZrgmx2Ml6e+pBN57Hy3JruVHu5
 tUBd6858tgaZKxulbGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109372-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE7E95B85DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Add the init sequence tables and config for the UFS QMP phy found in
the Hawi SoC.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
new file mode 100644
index 000000000000..e80d3dd6a190
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_UFS_V7_H_
+#define QCOM_PHY_QMP_PCS_UFS_V7_H_
+
+/* Only for QMP V7 PHY - UFS PCS registers */
+#define QPHY_V7_PCS_UFS_PHY_START			0x000
+#define QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL		0x004
+#define QPHY_V7_PCS_UFS_SW_RESET			0x008
+#define QPHY_V7_PCS_UFS_PCS_CTRL1			0x01C
+#define QPHY_V7_PCS_UFS_PLL_CNTL			0x028
+#define QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02C
+#define QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY		0x060
+#define QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY		0x094
+#define QPHY_V7_PCS_UFS_LINECFG_DISABLE			0x140
+#define QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2			0x150
+#define QPHY_V7_PCS_UFS_READY_STATUS			0x16c
+#define QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1		0x1b8
+#define QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1		0x1c0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
new file mode 100644
index 000000000000..5f923c3e64ec
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
+
+#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX		(0x34)
+#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX		(0x38)
+#define QSERDES_UFS_V8_TX_LANE_MODE_1				(0x80)
+#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2			(0x1BC)
+#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4			(0x1C4)
+#define QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4			(0x1DC)
+#define QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(0x2C8)
+#define QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS			(0x1E4)
+#define QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3			(0x2D0)
+#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4	(0x120)
+#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		(0xD4)
+#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4		(0xEC)
+#define QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL			(0x288)
+#define QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4			(0x2B0)
+#define QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4			(0x324)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7			(0x3B4)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9			(0x3BC)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7			(0x3E0)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9			(0x3E8)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7			(0x40C)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9			(0x414)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7			(0x438)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9			(0x440)
+#define QSERDES_UFS_V8_RX_UCDR_SO_SATURATION			(0xF4)
+#define QSERDES_UFS_V8_RX_TERM_BW_CTRL0				(0x1AC)
+#define QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL			(0x498)
+#define QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM			(0x4d0)
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 771bc7c2ab50..538f1b947c87 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -29,9 +29,11 @@
 #include "phy-qcom-qmp-pcs-ufs-v4.h"
 #include "phy-qcom-qmp-pcs-ufs-v5.h"
 #include "phy-qcom-qmp-pcs-ufs-v6.h"
+#include "phy-qcom-qmp-pcs-ufs-v7.h"
 
 #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
+#include "phy-qcom-qmp-qserdes-txrx-ufs-v8.h"
 
 /* QPHY_PCS_READY_STATUS bit */
 #define PCS_READY				BIT(0)
@@ -84,6 +86,13 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V7_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V7_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V7_PCS_UFS_SW_RESET,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
@@ -1306,6 +1315,12 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
 	{ .supply = "vdda-pll", .init_load_uA = 18300 },
 };
 
+static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 324000 },
+	{ .supply = "vdda-pll", .init_load_uA = 27000 },
+
+};
+
 static const struct qmp_ufs_offsets qmp_ufs_offsets = {
 	.serdes		= 0,
 	.pcs		= 0xc00,
@@ -1324,6 +1339,15 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
 	.rx2		= 0x1a00,
 };
 
+static const struct qmp_ufs_offsets qmp_ufs_offsets_v7 = {
+	.serdes		= 0,
+	.pcs		= 0x0400,
+	.tx		= 0x2000,
+	.rx		= 0x2000,
+	.tx2		= 0x3000,
+	.rx2		= 0x3000,
+};
+
 static const struct qmp_phy_cfg milos_ufsphy_cfg = {
 	.lanes			= 2,
 
@@ -1844,6 +1868,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
 
 };
 
+static const struct qmp_phy_init_tbl hawi_ufsphy_serdes[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_CFG, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_CTRL, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE0, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE1, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE1, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_tx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_LANE_MODE_1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL, 0x8e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4, 0xb8),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_SATURATION, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_TERM_BW_CTRL0, 0xfa),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM, 0x77),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PCS_CTRL1, 0x42),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_g5_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PLL_CNTL, 0x3b),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x06),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x06),
+};
+
+static const struct qmp_phy_cfg hawi_ufsphy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_ufs_offsets_v7,
+	.max_supported_gear	= UFS_HS_G5,
+
+	.tbls = {
+		.serdes		= hawi_ufsphy_serdes,
+		.serdes_num	= ARRAY_SIZE(hawi_ufsphy_serdes),
+		.tx		= hawi_ufsphy_tx,
+		.tx_num		= ARRAY_SIZE(hawi_ufsphy_tx),
+		.rx		= hawi_ufsphy_rx,
+		.rx_num		= ARRAY_SIZE(hawi_ufsphy_rx),
+		.pcs		= hawi_ufsphy_pcs,
+		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_pcs),
+	},
+
+	.tbls_hs_overlay[0] = {
+		.pcs		= hawi_ufsphy_g5_pcs,
+		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_g5_pcs),
+		.max_gear	= UFS_HS_G5,
+	},
+
+	.vreg_list		= hawi_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(hawi_ufsphy_vreg_l),
+	.regs			= ufsphy_v7_regs_layout,
+};
+
 static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	void __iomem *serdes = qmp->serdes;
@@ -2258,6 +2395,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_ufs_of_match_table[] = {
 	{
+		.compatible = "qcom,hawi-qmp-ufs-phy",
+		.data = &hawi_ufsphy_cfg,
+	}, {
 		.compatible = "qcom,milos-qmp-ufs-phy",
 		.data = &milos_ufsphy_cfg,
 	}, {
-- 
2.34.1


