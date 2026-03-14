Return-Path: <linux-arm-msm+bounces-97683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOAEGYjvtGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:18:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24528BC46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8483C30E4330
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5301A30C35F;
	Sat, 14 Mar 2026 05:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kpx4Z1nY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwfigJZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA634EF0B
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465286; cv=none; b=FE+02TqRO7c84Ciq1bWIbofSi/AwL7buvFosY6ItDP5vtAJaeOXWfjHusQohEu7yHKKnHhykRZOx0q73hPaz54Bb2m+1z4zmpJA9bwf+qWz408dZo4pDDM2wNmFJOfqQvV+G0lHkWMYoqEXO4SjN4KfdbHqY2N17+ukodYOb7xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465286; c=relaxed/simple;
	bh=OSBUzLYTIJ4MI+6jUVFeQrTlJw8fzfJU0EGpfUqHN+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMfhE33ElWkK6bgrwp52OZz6WAEmbDQcvCJlFP6tOI7zJ4VMRxmYd6bf7eGOxPRQySUxcOAvYmOeIw5uIlmEcneBDpWrwWPO/cmLsCPVGfsJarabNYdCroET0/DeMNI8RIBI1OGSQUqKwFcsDTPlh5PZ09KiuncilCoC4W0dvw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kpx4Z1nY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwfigJZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3mqWM2537219
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a0e61A+lFYo
	HDi+m9I3WYxkbeSxlXIa7ThAt/Db262A=; b=Kpx4Z1nYFjqcKwS0TrN13XtxJ1e
	HQmerNXKeNy9Sci606IT8OO5W529SdKWD9wSTQ/Jq0HyArYzAURFXmavvoGpKsB+
	vxvwfuU+ZC5n6nu0TF2rF4q3tiy6ETWjuXMZr4kEJM8La1wbdyGv4k4cPcBeEb1G
	6YVskiBPFk1EBnc31/H9r5A3anOVcRuSJST0O3oP+VG9eTGxqOaxyvf3IQwYpi5V
	OOfvE6qEkMsd/UteZG0DdXG01M4CcWV2vKJ47mxUJK0iRbxNcUoH1mPM3C/wNAVQ
	QfUxd/oHaxzbtZCiXYLWfBqmAcAnSuap1nvuXphgLg5Kgew1j4Zam8ohSfw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qg46y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127337c8e52so17292402c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773465282; x=1774070082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0e61A+lFYoHDi+m9I3WYxkbeSxlXIa7ThAt/Db262A=;
        b=RwfigJZznJCItTYnaZRFksqB/Yzt1vLq8IxIsswG6n/hRACoQDKWC2Sa0sr2z/2Isa
         WuHXqzlN+Y7M72eIWMdl6t7w5a+MpbxzXXxiVm+I4Lm91TixRlS7qeaDjk1wYp28PLDW
         mHj8BHejA6KiIzCy9z83wqQ72xacSuad1rw/9fOJg7SY7JPN1GvPanvKmhPsli2NRcR1
         qw+dPuu3GeDYqS9fCUYzH3Yh22cvzFnirf/IIi94rYjwSUO0kPRyLas4ObLe3oqnYBAU
         kCb0KbeXkfqrdCrYt7dkIyJRmUfiS7BfQk43prEEe1qD/38pXivj9S++/IFan8axFH6s
         1uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465282; x=1774070082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0e61A+lFYoHDi+m9I3WYxkbeSxlXIa7ThAt/Db262A=;
        b=SYFLGx+cgVaaiUouXp2ukmwcuQidMoMMh3breF5nXi1phGhws254Bv9MVjirHLxOH/
         t38UaipCfLCm8KBXUWDFKG+leQpZDQLlBy/k2zigBQSK2x9tQwQyebRl5J9Q4L/ZaI6L
         vUPalbdOh/qCb1pvJYdLV505u82j9hy+Ioddj/L+Ej+cPzLwrAKSC3He6NZRD51s9/Qp
         FG+7M2lTAuKORSjOU3euy9CGwVvQtyoybyTf3OruqNAw1VC65eYWACVISJBTzPH1FE/s
         BuhdlFj4bbgL00I4xJMN7vgm1QiaNUOh2Z3aKnjScW2ir4NgIAmTC/bJhFuU5/YWxozh
         enFw==
X-Forwarded-Encrypted: i=1; AJvYcCWk7vxHyOJbIobMYcWzHh7hVcBfSPJLkOPSE6Ufd+gC6l/cirelNuloC55iwdkQYzM7jy4kOPEossm+zeSI@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJ0zgL1a30nFX/mz0xQ0Cqj08rCOG6u2EMxMgGSP18jG7csoR
	6smaa/7Gs8KAjZXJ66HZJB3reg5OulXeLHUnX3S/JMbWcMij10EdAaoSRXonekk0yOJ+Tspxuzs
	o7EHWTHZ1B6FnE9MzTLBbBhJEM9hQj76ddPleEt+hyJM3u2vwwt7h11howpJWQPqMR0AA
X-Gm-Gg: ATEYQzyGvEchG/GED0KxRG4QBSR/4QNk+OtrDJaJZWAZ5SckPKNewrX8vQ9TQ/fxeUU
	0uks6tLxMbD7FQy3T9AzHJCmdCvlQc4VWXVlJE3mHKgkRxk+Ux3TFnlTeSCvA4VTjTGDHWsKaPy
	3HycYcqTAqmTetthcQz8f1Zb07Y17msFahJQWlsRfUQUx9TJWytiL01lkTFoFZw91e4GZtDf68x
	vAlkfKrXfgiY2Hb7M7ZxHf1IdbDlvIiokQyI2mRf3mjG7FAYYuotRYXBVkhSx8RtFS1r9FMOlKh
	ya2cTmeX8JiD8PjPV4YEweCkxJHQBvnveenyML4vpL7/lku3934FwIVw0kS3wSn5fJKeA4qRrMQ
	kEwiBkpOXLEGPMfYqBbE593MKEAF2FgU1jMDMW2//yB0784hMJuVQfxNXdQJF36IMtoHUNjuD2V
	5jChRIXw==
X-Received: by 2002:a05:7022:e21:b0:128:d4be:7428 with SMTP id a92af1059eb24-128f3d9197emr2798368c88.19.1773465281330;
        Fri, 13 Mar 2026 22:14:41 -0700 (PDT)
X-Received: by 2002:a05:7022:e21:b0:128:d4be:7428 with SMTP id a92af1059eb24-128f3d9197emr2798354c88.19.1773465280675;
        Fri, 13 Mar 2026 22:14:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm1784045eec.0.2026.03.13.22.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:14:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 6/6] phy: qcom-qmp: Make QSERDES TXRX v2 registers explicit
Date: Sat, 14 Mar 2026 13:13:25 +0800
Message-ID: <20260314051325.198137-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tn1nYoI7jASCZYEmdzupHVigrTZicgGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOCBTYWx0ZWRfXyZHGMBJelGFr
 /T49rfkNVi4FTL9mb6t0hYdi9atRp1TJQZUfz8vbvomPZv8aPw01gQ3GYlGZ5qVK79bJaJ3n9mN
 GUFxruVL4Uj2bEmAtGASCVP8lNNSXqNY/GEuPR/j189T+4k4PlPh2pPppHY8vpp5xg2c8n/MZmo
 HDSu7qGW4eAlpBICre+RjsxtdftQhjN/zYpdPzTRREPz5E9WpMdqYo2LOqJLt4Z6pIqkIaQZ0f8
 VIldPkaA+QIcD6/ar2Pyvkp7FLlDwrFb+INFGC5pENEvhRJXocUKl6i50Ni1q0yRYkoKr7nvT1t
 C0JWnyXROMjyJ9LP2t5xzqv8HUFA04FYN6T39PCGGO0Cv1Qd/Rxi/oTiu8YU0TXT74HvNVl7vpz
 CwY35cTBAJN+H8NVwhXjhX0tFVK9m2kXJnhpalW/0GwUKZ9YwT6eHRrVvmUP8kkrrUzC9LxSoDf
 KCngqNxgdHVXLAaxQ3w==
X-Proofpoint-ORIG-GUID: tn1nYoI7jASCZYEmdzupHVigrTZicgGj
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b4eec2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HmBPgOZM63ur2ZWdtjIA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603140038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97683-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB24528BC46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename QSERDES TXRX v2 registers and the header to make version
explicit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  24 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  50 ++---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h   | 205 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  | 205 ------------------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  60 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  74 +++----
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   3 +-
 7 files changed, 310 insertions(+), 311 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 24b5d66e9ecf..37e96493b722 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -105,21 +105,21 @@ static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x06),
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_BAND, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN_HALF, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_LVL, 0x19),
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_pcs_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index aa2f8da93a02..75afbd15aaf4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -352,22 +352,22 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl ipq8074_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x6),
-	QMP_PHY_INIT_CFG(QSERDES_TX_RES_CODE_LANE_OFFSET, 0x2),
-	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_TX_TX_EMP_POST1_LVL, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_TX_SLEW_CNTL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x6),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RES_CODE_LANE_OFFSET, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_EMP_POST1_LVL, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_SLEW_CNTL, 0x0a),
 };
 
 static const struct qmp_phy_init_tbl ipq8074_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x1),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x0),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN, 0x4),
 };
 
 static const struct qmp_phy_init_tbl ipq8074_pcie_pcs_tbl[] = {
@@ -796,21 +796,21 @@ static const struct qmp_phy_init_tbl qcs615_pcie_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qcs615_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x1),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x0),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x4),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN_HALF, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN_HALF, 0x4),
 };
 
 static const struct qmp_phy_init_tbl qcs615_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x6),
-	QMP_PHY_INIT_CFG(QSERDES_TX_RES_CODE_LANE_OFFSET, 0x2),
-	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x6),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RES_CODE_LANE_OFFSET, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RCV_DETECT_LVL_2, 0x12),
 };
 
 static const struct qmp_phy_init_tbl qcs615_pcie_pcs_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
new file mode 100644
index 000000000000..9ae0cf95e317
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
@@ -0,0 +1,205 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
+
+/* Only for QMP V2 PHY - TX registers */
+#define QSERDES_V2_TX_BIST_MODE_LANENO				0x000
+#define QSERDES_V2_TX_BIST_INVERT				0x004
+#define QSERDES_V2_TX_CLKBUF_ENABLE				0x008
+#define QSERDES_V2_TX_CMN_CONTROL_ONE				0x00c
+#define QSERDES_V2_TX_CMN_CONTROL_TWO				0x010
+#define QSERDES_V2_TX_CMN_CONTROL_THREE				0x014
+#define QSERDES_V2_TX_TX_EMP_POST1_LVL				0x018
+#define QSERDES_V2_TX_TX_POST2_EMPH				0x01c
+#define QSERDES_V2_TX_TX_BOOST_LVL_UP_DN			0x020
+#define QSERDES_V2_TX_HP_PD_ENABLES				0x024
+#define QSERDES_V2_TX_TX_IDLE_LVL_LARGE_AMP			0x028
+#define QSERDES_V2_TX_TX_DRV_LVL				0x02c
+#define QSERDES_V2_TX_TX_DRV_LVL_OFFSET				0x030
+#define QSERDES_V2_TX_RESET_TSYNC_EN				0x034
+#define QSERDES_V2_TX_PRE_STALL_LDO_BOOST_EN			0x038
+#define QSERDES_V2_TX_TX_BAND					0x03c
+#define QSERDES_V2_TX_SLEW_CNTL					0x040
+#define QSERDES_V2_TX_INTERFACE_SELECT				0x044
+#define QSERDES_V2_TX_LPB_EN					0x048
+#define QSERDES_V2_TX_RES_CODE_LANE_TX				0x04c
+#define QSERDES_V2_TX_RES_CODE_LANE_RX				0x050
+#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET			0x054
+#define QSERDES_V2_TX_PERL_LENGTH1				0x058
+#define QSERDES_V2_TX_PERL_LENGTH2				0x05c
+#define QSERDES_V2_TX_SERDES_BYP_EN_OUT				0x060
+#define QSERDES_V2_TX_DEBUG_BUS_SEL				0x064
+#define QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN		0x068
+#define QSERDES_V2_TX_TX_POL_INV				0x06c
+#define QSERDES_V2_TX_PARRATE_REC_DETECT_IDLE_EN		0x070
+#define QSERDES_V2_TX_BIST_PATTERN1				0x074
+#define QSERDES_V2_TX_BIST_PATTERN2				0x078
+#define QSERDES_V2_TX_BIST_PATTERN3				0x07c
+#define QSERDES_V2_TX_BIST_PATTERN4				0x080
+#define QSERDES_V2_TX_BIST_PATTERN5				0x084
+#define QSERDES_V2_TX_BIST_PATTERN6				0x088
+#define QSERDES_V2_TX_BIST_PATTERN7				0x08c
+#define QSERDES_V2_TX_BIST_PATTERN8				0x090
+#define QSERDES_V2_TX_LANE_MODE					0x094
+#define QSERDES_V2_TX_IDAC_CAL_LANE_MODE			0x098
+#define QSERDES_V2_TX_IDAC_CAL_LANE_MODE_CONFIGURATION		0x09c
+#define QSERDES_V2_TX_ATB_SEL1					0x0a0
+#define QSERDES_V2_TX_ATB_SEL2					0x0a4
+#define QSERDES_V2_TX_RCV_DETECT_LVL				0x0a8
+#define QSERDES_V2_TX_RCV_DETECT_LVL_2				0x0ac
+#define QSERDES_V2_TX_PRBS_SEED1				0x0b0
+#define QSERDES_V2_TX_PRBS_SEED2				0x0b4
+#define QSERDES_V2_TX_PRBS_SEED3				0x0b8
+#define QSERDES_V2_TX_PRBS_SEED4				0x0bc
+#define QSERDES_V2_TX_RESET_GEN					0x0c0
+#define QSERDES_V2_TX_RESET_GEN_MUXES				0x0c4
+#define QSERDES_V2_TX_TRAN_DRVR_EMP_EN				0x0c8
+#define QSERDES_V2_TX_TX_INTERFACE_MODE				0x0cc
+#define QSERDES_V2_TX_PWM_CTRL					0x0d0
+#define QSERDES_V2_TX_PWM_ENCODED_OR_DATA			0x0d4
+#define QSERDES_V2_TX_PWM_GEAR_1_DIVIDER_BAND2			0x0d8
+#define QSERDES_V2_TX_PWM_GEAR_2_DIVIDER_BAND2			0x0dc
+#define QSERDES_V2_TX_PWM_GEAR_3_DIVIDER_BAND2			0x0e0
+#define QSERDES_V2_TX_PWM_GEAR_4_DIVIDER_BAND2			0x0e4
+#define QSERDES_V2_TX_PWM_GEAR_1_DIVIDER_BAND0_1		0x0e8
+#define QSERDES_V2_TX_PWM_GEAR_2_DIVIDER_BAND0_1		0x0ec
+#define QSERDES_V2_TX_PWM_GEAR_3_DIVIDER_BAND0_1		0x0f0
+#define QSERDES_V2_TX_PWM_GEAR_4_DIVIDER_BAND0_1		0x0f4
+#define QSERDES_V2_TX_VMODE_CTRL1				0x0f8
+#define QSERDES_V2_TX_VMODE_CTRL2				0x0fc
+#define QSERDES_V2_TX_TX_ALOG_INTF_OBSV_CNTL			0x100
+#define QSERDES_V2_TX_BIST_STATUS				0x104
+#define QSERDES_V2_TX_BIST_ERROR_COUNT1				0x108
+#define QSERDES_V2_TX_BIST_ERROR_COUNT2				0x10c
+#define QSERDES_V2_TX_TX_ALOG_INTF_OBSV				0x110
+
+/* Only for QMP V2 PHY - RX registers */
+#define QSERDES_V2_RX_UCDR_FO_GAIN_HALF				0x000
+#define QSERDES_V2_RX_UCDR_FO_GAIN_QUARTER			0x004
+#define QSERDES_V2_RX_UCDR_FO_GAIN_EIGHTH			0x008
+#define QSERDES_V2_RX_UCDR_FO_GAIN				0x00c
+#define QSERDES_V2_RX_UCDR_SO_GAIN_HALF				0x010
+#define QSERDES_V2_RX_UCDR_SO_GAIN_QUARTER			0x014
+#define QSERDES_V2_RX_UCDR_SO_GAIN_EIGHTH			0x018
+#define QSERDES_V2_RX_UCDR_SO_GAIN				0x01c
+#define QSERDES_V2_RX_UCDR_SVS_FO_GAIN_HALF			0x020
+#define QSERDES_V2_RX_UCDR_SVS_FO_GAIN_QUARTER			0x024
+#define QSERDES_V2_RX_UCDR_SVS_FO_GAIN_EIGHTH			0x028
+#define QSERDES_V2_RX_UCDR_SVS_FO_GAIN				0x02c
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_HALF			0x030
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_QUARTER			0x034
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_EIGHTH			0x038
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN				0x03c
+#define QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN			0x040
+#define QSERDES_V2_RX_UCDR_FD_GAIN				0x044
+#define QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE		0x048
+#define QSERDES_V2_RX_UCDR_FO_TO_SO_DELAY			0x04c
+#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_LOW			0x050
+#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_HIGH			0x054
+#define QSERDES_V2_RX_UCDR_MODULATE				0x058
+#define QSERDES_V2_RX_UCDR_PI_CONTROLS				0x05c
+#define QSERDES_V2_RX_RBIST_CONTROL				0x060
+#define QSERDES_V2_RX_AUX_CONTROL				0x064
+#define QSERDES_V2_RX_AUX_DATA_TCOARSE				0x068
+#define QSERDES_V2_RX_AUX_DATA_TFINE_LSB			0x06c
+#define QSERDES_V2_RX_AUX_DATA_TFINE_MSB			0x070
+#define QSERDES_V2_RX_RCLK_AUXDATA_SEL				0x074
+#define QSERDES_V2_RX_AC_JTAG_ENABLE				0x078
+#define QSERDES_V2_RX_AC_JTAG_INITP				0x07c
+#define QSERDES_V2_RX_AC_JTAG_INITN				0x080
+#define QSERDES_V2_RX_AC_JTAG_LVL				0x084
+#define QSERDES_V2_RX_AC_JTAG_MODE				0x088
+#define QSERDES_V2_RX_AC_JTAG_RESET				0x08c
+#define QSERDES_V2_RX_RX_TERM_BW				0x090
+#define QSERDES_V2_RX_RX_RCVR_IQ_EN				0x094
+#define QSERDES_V2_RX_RX_IDAC_I_DC_OFFSETS			0x098
+#define QSERDES_V2_RX_RX_IDAC_IBAR_DC_OFFSETS			0x09c
+#define QSERDES_V2_RX_RX_IDAC_Q_DC_OFFSETS			0x0a0
+#define QSERDES_V2_RX_RX_IDAC_QBAR_DC_OFFSETS			0x0a4
+#define QSERDES_V2_RX_RX_IDAC_A_DC_OFFSETS			0x0a8
+#define QSERDES_V2_RX_RX_IDAC_ABAR_DC_OFFSETS			0x0ac
+#define QSERDES_V2_RX_RX_IDAC_EN				0x0b0
+#define QSERDES_V2_RX_RX_IDAC_ENABLES				0x0b4
+#define QSERDES_V2_RX_RX_IDAC_SIGN				0x0b8
+#define QSERDES_V2_RX_RX_HIGHZ_HIGHRATE				0x0bc
+#define QSERDES_V2_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET	0x0c0
+#define QSERDES_V2_RX_RX_EQ_GAIN1_LSB				0x0c4
+#define QSERDES_V2_RX_RX_EQ_GAIN1_MSB				0x0c8
+#define QSERDES_V2_RX_RX_EQ_GAIN2_LSB				0x0cc
+#define QSERDES_V2_RX_RX_EQ_GAIN2_MSB				0x0d0
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL1			0x0d4
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2			0x0d8
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3			0x0dc
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4			0x0e0
+#define QSERDES_V2_RX_RX_IDAC_CAL_CONFIGURATION			0x0e4
+#define QSERDES_V2_RX_RX_IDAC_TSETTLE_LOW			0x0e8
+#define QSERDES_V2_RX_RX_IDAC_TSETTLE_HIGH			0x0ec
+#define QSERDES_V2_RX_RX_IDAC_ENDSAMP_LOW			0x0f0
+#define QSERDES_V2_RX_RX_IDAC_ENDSAMP_HIGH			0x0f4
+#define QSERDES_V2_RX_RX_IDAC_MIDPOINT_LOW			0x0f8
+#define QSERDES_V2_RX_RX_IDAC_MIDPOINT_HIGH			0x0fc
+#define QSERDES_V2_RX_RX_EQ_OFFSET_LSB				0x100
+#define QSERDES_V2_RX_RX_EQ_OFFSET_MSB				0x104
+#define QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x108
+#define QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2			0x10c
+#define QSERDES_V2_RX_SIGDET_ENABLES				0x110
+#define QSERDES_V2_RX_SIGDET_CNTRL				0x114
+#define QSERDES_V2_RX_SIGDET_LVL				0x118
+#define QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL			0x11c
+#define QSERDES_V2_RX_RX_BAND					0x120
+#define QSERDES_V2_RX_CDR_FREEZE_UP_DN				0x124
+#define QSERDES_V2_RX_CDR_RESET_OVERRIDE			0x128
+#define QSERDES_V2_RX_RX_INTERFACE_MODE				0x12c
+#define QSERDES_V2_RX_JITTER_GEN_MODE				0x130
+#define QSERDES_V2_RX_BUJ_AMP					0x134
+#define QSERDES_V2_RX_SJ_AMP1					0x138
+#define QSERDES_V2_RX_SJ_AMP2					0x13c
+#define QSERDES_V2_RX_SJ_PER1					0x140
+#define QSERDES_V2_RX_SJ_PER2					0x144
+#define QSERDES_V2_RX_BUJ_STEP_FREQ1				0x148
+#define QSERDES_V2_RX_BUJ_STEP_FREQ2				0x14c
+#define QSERDES_V2_RX_PPM_OFFSET1				0x150
+#define QSERDES_V2_RX_PPM_OFFSET2				0x154
+#define QSERDES_V2_RX_SIGN_PPM_PERIOD1				0x158
+#define QSERDES_V2_RX_SIGN_PPM_PERIOD2				0x15c
+#define QSERDES_V2_RX_SSC_CTRL					0x160
+#define QSERDES_V2_RX_SSC_COUNT1				0x164
+#define QSERDES_V2_RX_SSC_COUNT2				0x168
+#define QSERDES_V2_RX_RX_ALOG_INTF_OBSV_CNTL			0x16c
+#define QSERDES_V2_RX_RX_PWM_ENABLE_AND_DATA			0x170
+#define QSERDES_V2_RX_RX_PWM_GEAR1_TIMEOUT_COUNT		0x174
+#define QSERDES_V2_RX_RX_PWM_GEAR2_TIMEOUT_COUNT		0x178
+#define QSERDES_V2_RX_RX_PWM_GEAR3_TIMEOUT_COUNT		0x17c
+#define QSERDES_V2_RX_RX_PWM_GEAR4_TIMEOUT_COUNT		0x180
+#define QSERDES_V2_RX_PI_CTRL1					0x184
+#define QSERDES_V2_RX_PI_CTRL2					0x188
+#define QSERDES_V2_RX_PI_QUAD					0x18c
+#define QSERDES_V2_RX_IDATA1					0x190
+#define QSERDES_V2_RX_IDATA2					0x194
+#define QSERDES_V2_RX_AUX_DATA1					0x198
+#define QSERDES_V2_RX_AUX_DATA2					0x19c
+#define QSERDES_V2_RX_AC_JTAG_OUTP				0x1a0
+#define QSERDES_V2_RX_AC_JTAG_OUTN				0x1a4
+#define QSERDES_V2_RX_RX_SIGDET					0x1a8
+#define QSERDES_V2_RX_RX_VDCOFF					0x1ac
+#define QSERDES_V2_RX_IDAC_CAL_ON				0x1b0
+#define QSERDES_V2_RX_IDAC_STATUS_I				0x1b4
+#define QSERDES_V2_RX_IDAC_STATUS_IBAR				0x1b8
+#define QSERDES_V2_RX_IDAC_STATUS_Q				0x1bc
+#define QSERDES_V2_RX_IDAC_STATUS_QBAR				0x1c0
+#define QSERDES_V2_RX_IDAC_STATUS_A				0x1c4
+#define QSERDES_V2_RX_IDAC_STATUS_ABAR				0x1c8
+#define QSERDES_V2_RX_CALST_STATUS_I				0x1cc
+#define QSERDES_V2_RX_CALST_STATUS_Q				0x1d0
+#define QSERDES_V2_RX_CALST_STATUS_A				0x1d4
+#define QSERDES_V2_RX_RX_ALOG_INTF_OBSV				0x1d8
+#define QSERDES_V2_RX_READ_EQCODE				0x1dc
+#define QSERDES_V2_RX_READ_OFFSETCODE				0x1e0
+#define QSERDES_V2_RX_IA_ERROR_COUNTER_LOW			0x1e4
+#define QSERDES_V2_RX_IA_ERROR_COUNTER_HIGH			0x1e8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
deleted file mode 100644
index d20694513eb4..000000000000
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
+++ /dev/null
@@ -1,205 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2017, The Linux Foundation. All rights reserved.
- */
-
-#ifndef QCOM_PHY_QMP_QSERDES_TXRX_H_
-#define QCOM_PHY_QMP_QSERDES_TXRX_H_
-
-/* Only for QMP V2 PHY - TX registers */
-#define QSERDES_TX_BIST_MODE_LANENO			0x000
-#define QSERDES_TX_BIST_INVERT				0x004
-#define QSERDES_TX_CLKBUF_ENABLE			0x008
-#define QSERDES_TX_CMN_CONTROL_ONE			0x00c
-#define QSERDES_TX_CMN_CONTROL_TWO			0x010
-#define QSERDES_TX_CMN_CONTROL_THREE			0x014
-#define QSERDES_TX_TX_EMP_POST1_LVL			0x018
-#define QSERDES_TX_TX_POST2_EMPH			0x01c
-#define QSERDES_TX_TX_BOOST_LVL_UP_DN			0x020
-#define QSERDES_TX_HP_PD_ENABLES			0x024
-#define QSERDES_TX_TX_IDLE_LVL_LARGE_AMP		0x028
-#define QSERDES_TX_TX_DRV_LVL				0x02c
-#define QSERDES_TX_TX_DRV_LVL_OFFSET			0x030
-#define QSERDES_TX_RESET_TSYNC_EN			0x034
-#define QSERDES_TX_PRE_STALL_LDO_BOOST_EN		0x038
-#define QSERDES_TX_TX_BAND				0x03c
-#define QSERDES_TX_SLEW_CNTL				0x040
-#define QSERDES_TX_INTERFACE_SELECT			0x044
-#define QSERDES_TX_LPB_EN				0x048
-#define QSERDES_TX_RES_CODE_LANE_TX			0x04c
-#define QSERDES_TX_RES_CODE_LANE_RX			0x050
-#define QSERDES_TX_RES_CODE_LANE_OFFSET			0x054
-#define QSERDES_TX_PERL_LENGTH1				0x058
-#define QSERDES_TX_PERL_LENGTH2				0x05c
-#define QSERDES_TX_SERDES_BYP_EN_OUT			0x060
-#define QSERDES_TX_DEBUG_BUS_SEL			0x064
-#define QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN	0x068
-#define QSERDES_TX_TX_POL_INV				0x06c
-#define QSERDES_TX_PARRATE_REC_DETECT_IDLE_EN		0x070
-#define QSERDES_TX_BIST_PATTERN1			0x074
-#define QSERDES_TX_BIST_PATTERN2			0x078
-#define QSERDES_TX_BIST_PATTERN3			0x07c
-#define QSERDES_TX_BIST_PATTERN4			0x080
-#define QSERDES_TX_BIST_PATTERN5			0x084
-#define QSERDES_TX_BIST_PATTERN6			0x088
-#define QSERDES_TX_BIST_PATTERN7			0x08c
-#define QSERDES_TX_BIST_PATTERN8			0x090
-#define QSERDES_TX_LANE_MODE				0x094
-#define QSERDES_TX_IDAC_CAL_LANE_MODE			0x098
-#define QSERDES_TX_IDAC_CAL_LANE_MODE_CONFIGURATION	0x09c
-#define QSERDES_TX_ATB_SEL1				0x0a0
-#define QSERDES_TX_ATB_SEL2				0x0a4
-#define QSERDES_TX_RCV_DETECT_LVL			0x0a8
-#define QSERDES_TX_RCV_DETECT_LVL_2			0x0ac
-#define QSERDES_TX_PRBS_SEED1				0x0b0
-#define QSERDES_TX_PRBS_SEED2				0x0b4
-#define QSERDES_TX_PRBS_SEED3				0x0b8
-#define QSERDES_TX_PRBS_SEED4				0x0bc
-#define QSERDES_TX_RESET_GEN				0x0c0
-#define QSERDES_TX_RESET_GEN_MUXES			0x0c4
-#define QSERDES_TX_TRAN_DRVR_EMP_EN			0x0c8
-#define QSERDES_TX_TX_INTERFACE_MODE			0x0cc
-#define QSERDES_TX_PWM_CTRL				0x0d0
-#define QSERDES_TX_PWM_ENCODED_OR_DATA			0x0d4
-#define QSERDES_TX_PWM_GEAR_1_DIVIDER_BAND2		0x0d8
-#define QSERDES_TX_PWM_GEAR_2_DIVIDER_BAND2		0x0dc
-#define QSERDES_TX_PWM_GEAR_3_DIVIDER_BAND2		0x0e0
-#define QSERDES_TX_PWM_GEAR_4_DIVIDER_BAND2		0x0e4
-#define QSERDES_TX_PWM_GEAR_1_DIVIDER_BAND0_1		0x0e8
-#define QSERDES_TX_PWM_GEAR_2_DIVIDER_BAND0_1		0x0ec
-#define QSERDES_TX_PWM_GEAR_3_DIVIDER_BAND0_1		0x0f0
-#define QSERDES_TX_PWM_GEAR_4_DIVIDER_BAND0_1		0x0f4
-#define QSERDES_TX_VMODE_CTRL1				0x0f8
-#define QSERDES_TX_VMODE_CTRL2				0x0fc
-#define QSERDES_TX_TX_ALOG_INTF_OBSV_CNTL		0x100
-#define QSERDES_TX_BIST_STATUS				0x104
-#define QSERDES_TX_BIST_ERROR_COUNT1			0x108
-#define QSERDES_TX_BIST_ERROR_COUNT2			0x10c
-#define QSERDES_TX_TX_ALOG_INTF_OBSV			0x110
-
-/* Only for QMP V2 PHY - RX registers */
-#define QSERDES_RX_UCDR_FO_GAIN_HALF			0x000
-#define QSERDES_RX_UCDR_FO_GAIN_QUARTER			0x004
-#define QSERDES_RX_UCDR_FO_GAIN_EIGHTH			0x008
-#define QSERDES_RX_UCDR_FO_GAIN				0x00c
-#define QSERDES_RX_UCDR_SO_GAIN_HALF			0x010
-#define QSERDES_RX_UCDR_SO_GAIN_QUARTER			0x014
-#define QSERDES_RX_UCDR_SO_GAIN_EIGHTH			0x018
-#define QSERDES_RX_UCDR_SO_GAIN				0x01c
-#define QSERDES_RX_UCDR_SVS_FO_GAIN_HALF		0x020
-#define QSERDES_RX_UCDR_SVS_FO_GAIN_QUARTER		0x024
-#define QSERDES_RX_UCDR_SVS_FO_GAIN_EIGHTH		0x028
-#define QSERDES_RX_UCDR_SVS_FO_GAIN			0x02c
-#define QSERDES_RX_UCDR_SVS_SO_GAIN_HALF		0x030
-#define QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER		0x034
-#define QSERDES_RX_UCDR_SVS_SO_GAIN_EIGHTH		0x038
-#define QSERDES_RX_UCDR_SVS_SO_GAIN			0x03c
-#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		0x040
-#define QSERDES_RX_UCDR_FD_GAIN				0x044
-#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	0x048
-#define QSERDES_RX_UCDR_FO_TO_SO_DELAY			0x04c
-#define QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW		0x050
-#define QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH		0x054
-#define QSERDES_RX_UCDR_MODULATE			0x058
-#define QSERDES_RX_UCDR_PI_CONTROLS			0x05c
-#define QSERDES_RX_RBIST_CONTROL			0x060
-#define QSERDES_RX_AUX_CONTROL				0x064
-#define QSERDES_RX_AUX_DATA_TCOARSE			0x068
-#define QSERDES_RX_AUX_DATA_TFINE_LSB			0x06c
-#define QSERDES_RX_AUX_DATA_TFINE_MSB			0x070
-#define QSERDES_RX_RCLK_AUXDATA_SEL			0x074
-#define QSERDES_RX_AC_JTAG_ENABLE			0x078
-#define QSERDES_RX_AC_JTAG_INITP			0x07c
-#define QSERDES_RX_AC_JTAG_INITN			0x080
-#define QSERDES_RX_AC_JTAG_LVL				0x084
-#define QSERDES_RX_AC_JTAG_MODE				0x088
-#define QSERDES_RX_AC_JTAG_RESET			0x08c
-#define QSERDES_RX_RX_TERM_BW				0x090
-#define QSERDES_RX_RX_RCVR_IQ_EN			0x094
-#define QSERDES_RX_RX_IDAC_I_DC_OFFSETS			0x098
-#define QSERDES_RX_RX_IDAC_IBAR_DC_OFFSETS		0x09c
-#define QSERDES_RX_RX_IDAC_Q_DC_OFFSETS			0x0a0
-#define QSERDES_RX_RX_IDAC_QBAR_DC_OFFSETS		0x0a4
-#define QSERDES_RX_RX_IDAC_A_DC_OFFSETS			0x0a8
-#define QSERDES_RX_RX_IDAC_ABAR_DC_OFFSETS		0x0ac
-#define QSERDES_RX_RX_IDAC_EN				0x0b0
-#define QSERDES_RX_RX_IDAC_ENABLES			0x0b4
-#define QSERDES_RX_RX_IDAC_SIGN				0x0b8
-#define QSERDES_RX_RX_HIGHZ_HIGHRATE			0x0bc
-#define QSERDES_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET	0x0c0
-#define QSERDES_RX_RX_EQ_GAIN1_LSB			0x0c4
-#define QSERDES_RX_RX_EQ_GAIN1_MSB			0x0c8
-#define QSERDES_RX_RX_EQ_GAIN2_LSB			0x0cc
-#define QSERDES_RX_RX_EQ_GAIN2_MSB			0x0d0
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1		0x0d4
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d8
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		0x0dc
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		0x0e0
-#define QSERDES_RX_RX_IDAC_CAL_CONFIGURATION		0x0e4
-#define QSERDES_RX_RX_IDAC_TSETTLE_LOW			0x0e8
-#define QSERDES_RX_RX_IDAC_TSETTLE_HIGH			0x0ec
-#define QSERDES_RX_RX_IDAC_ENDSAMP_LOW			0x0f0
-#define QSERDES_RX_RX_IDAC_ENDSAMP_HIGH			0x0f4
-#define QSERDES_RX_RX_IDAC_MIDPOINT_LOW			0x0f8
-#define QSERDES_RX_RX_IDAC_MIDPOINT_HIGH		0x0fc
-#define QSERDES_RX_RX_EQ_OFFSET_LSB			0x100
-#define QSERDES_RX_RX_EQ_OFFSET_MSB			0x104
-#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x108
-#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x10c
-#define QSERDES_RX_SIGDET_ENABLES			0x110
-#define QSERDES_RX_SIGDET_CNTRL				0x114
-#define QSERDES_RX_SIGDET_LVL				0x118
-#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		0x11c
-#define QSERDES_RX_RX_BAND				0x120
-#define QSERDES_RX_CDR_FREEZE_UP_DN			0x124
-#define QSERDES_RX_CDR_RESET_OVERRIDE			0x128
-#define QSERDES_RX_RX_INTERFACE_MODE			0x12c
-#define QSERDES_RX_JITTER_GEN_MODE			0x130
-#define QSERDES_RX_BUJ_AMP				0x134
-#define QSERDES_RX_SJ_AMP1				0x138
-#define QSERDES_RX_SJ_AMP2				0x13c
-#define QSERDES_RX_SJ_PER1				0x140
-#define QSERDES_RX_SJ_PER2				0x144
-#define QSERDES_RX_BUJ_STEP_FREQ1			0x148
-#define QSERDES_RX_BUJ_STEP_FREQ2			0x14c
-#define QSERDES_RX_PPM_OFFSET1				0x150
-#define QSERDES_RX_PPM_OFFSET2				0x154
-#define QSERDES_RX_SIGN_PPM_PERIOD1			0x158
-#define QSERDES_RX_SIGN_PPM_PERIOD2			0x15c
-#define QSERDES_RX_SSC_CTRL				0x160
-#define QSERDES_RX_SSC_COUNT1				0x164
-#define QSERDES_RX_SSC_COUNT2				0x168
-#define QSERDES_RX_RX_ALOG_INTF_OBSV_CNTL		0x16c
-#define QSERDES_RX_RX_PWM_ENABLE_AND_DATA		0x170
-#define QSERDES_RX_RX_PWM_GEAR1_TIMEOUT_COUNT		0x174
-#define QSERDES_RX_RX_PWM_GEAR2_TIMEOUT_COUNT		0x178
-#define QSERDES_RX_RX_PWM_GEAR3_TIMEOUT_COUNT		0x17c
-#define QSERDES_RX_RX_PWM_GEAR4_TIMEOUT_COUNT		0x180
-#define QSERDES_RX_PI_CTRL1				0x184
-#define QSERDES_RX_PI_CTRL2				0x188
-#define QSERDES_RX_PI_QUAD				0x18c
-#define QSERDES_RX_IDATA1				0x190
-#define QSERDES_RX_IDATA2				0x194
-#define QSERDES_RX_AUX_DATA1				0x198
-#define QSERDES_RX_AUX_DATA2				0x19c
-#define QSERDES_RX_AC_JTAG_OUTP				0x1a0
-#define QSERDES_RX_AC_JTAG_OUTN				0x1a4
-#define QSERDES_RX_RX_SIGDET				0x1a8
-#define QSERDES_RX_RX_VDCOFF				0x1ac
-#define QSERDES_RX_IDAC_CAL_ON				0x1b0
-#define QSERDES_RX_IDAC_STATUS_I			0x1b4
-#define QSERDES_RX_IDAC_STATUS_IBAR			0x1b8
-#define QSERDES_RX_IDAC_STATUS_Q			0x1bc
-#define QSERDES_RX_IDAC_STATUS_QBAR			0x1c0
-#define QSERDES_RX_IDAC_STATUS_A			0x1c4
-#define QSERDES_RX_IDAC_STATUS_ABAR			0x1c8
-#define QSERDES_RX_CALST_STATUS_I			0x1cc
-#define QSERDES_RX_CALST_STATUS_Q			0x1d0
-#define QSERDES_RX_CALST_STATUS_A			0x1d4
-#define QSERDES_RX_RX_ALOG_INTF_OBSV			0x1d8
-#define QSERDES_RX_READ_EQCODE				0x1dc
-#define QSERDES_RX_READ_OFFSETCODE			0x1e0
-#define QSERDES_RX_IA_ERROR_COUNTER_LOW			0x1e4
-#define QSERDES_RX_IA_ERROR_COUNTER_HIGH		0x1e8
-
-#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index cb799015c494..a4ec2d37ea91 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -196,22 +196,22 @@ static const struct qmp_phy_init_tbl msm8996_ufsphy_serdes[] = {
 };
 
 static const struct qmp_phy_init_tbl msm8996_ufsphy_tx[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x02),
 };
 
 static const struct qmp_phy_init_tbl msm8996_ufsphy_rx[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_CNTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_TERM_BW, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN1_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN1_MSB, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN2_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN2_MSB, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
 };
 
 static const struct qmp_phy_init_tbl sc7280_ufsphy_tx[] = {
@@ -377,26 +377,26 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_hs_b_serdes[] = {
 };
 
 static const struct qmp_phy_init_tbl sm6115_ufsphy_tx[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x06),
 };
 
 static const struct qmp_phy_init_tbl sm6115_ufsphy_rx[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x0F),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5B),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xFF),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3F),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xFF),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x3F),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0D),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5B),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_CNTRL, 0x0F),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_INTERFACE_MODE, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x1E),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_TERM_BW, 0x5B),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN1_LSB, 0xFF),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN1_MSB, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN2_LSB, 0xFF),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_GAIN2_MSB, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0D),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SVS_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5B),
 };
 
 static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index f43650f9a45c..c5507168e135 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -248,7 +248,7 @@ static const struct qmp_phy_init_tbl ipq9574_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TRIM, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SVS_MODE_CLK_SEL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CMN_CONFIG, 0x06),
@@ -281,22 +281,22 @@ static const struct qmp_phy_init_tbl ipq9574_usb3_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl ipq9574_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x06),
 };
 
 static const struct qmp_phy_init_tbl ipq9574_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x6c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xb8),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x6c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4, 0xb8),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_ENABLES, 0x0c),
 };
 
 static const struct qmp_phy_init_tbl ipq9574_usb3_pcs_tbl[] = {
@@ -330,7 +330,7 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TRIM, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SVS_MODE_CLK_SEL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CMN_CONFIG, 0x06),
@@ -363,15 +363,15 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl ipq8074_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xb8),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4, 0xb8),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_ENABLES, 0x0),
 };
 
 static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
@@ -438,22 +438,22 @@ static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl msm8996_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE, 0x06),
 };
 
 static const struct qmp_phy_init_tbl msm8996_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xbb),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4, 0xbb),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_LVL, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
 };
 
 static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 19e91f44e84e..11b7e03b4fab 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -6,9 +6,8 @@
 #ifndef QCOM_PHY_QMP_H_
 #define QCOM_PHY_QMP_H_
 
-#include "phy-qcom-qmp-qserdes-txrx.h"
-
 #include "phy-qcom-qmp-qserdes-com-v2.h"
+#include "phy-qcom-qmp-qserdes-txrx-v2.h"
 
 #include "phy-qcom-qmp-qserdes-com-v3.h"
 #include "phy-qcom-qmp-qserdes-txrx-v3.h"
-- 
2.43.0


