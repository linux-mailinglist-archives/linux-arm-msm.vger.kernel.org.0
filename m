Return-Path: <linux-arm-msm+bounces-71662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077AB40A43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0AD63AB6C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43733CE89;
	Tue,  2 Sep 2025 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fb0MAOPR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A53376B2
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829561; cv=none; b=jfJByblxJ8lHhVdgWeFYl+EXbZyjfXsbVixEj65pw1dkxVtffdOME6a80LEOIX44MB3QfQyIN8RxgoEcp6DyZSxvfAlYkOgbediTN8HVRas+0yebfvrJxftw5qJcFGyxJdWs0qXThLJT81eO2+tSCBIGel4mMuX+UNnC34OmRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829561; c=relaxed/simple;
	bh=MCt0AAzgk+Spj4t//WWGOSAsleWLkYbQAko9OKAJnNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tI5ZTk7OqkgOhpbz+CT8J9aVL/6RXdosYTl84OvUvpW8uk+h795F3PZ3L1lX71llV07JIQnkB85hEwHt2AlYCHaMwcgANuLC4Gb3mzyP7Rz5g0Hs1x3IaTt5VcGgO7Iw4/K86qx34zaY5/RU5AIQi6kgrfqNb2UYeNK7N5mZuXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fb0MAOPR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqKmq019738
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QgPrdRIlfMd
	8DirDCyifuaxS1PjXlld6jz6oQI/b/ZY=; b=Fb0MAOPRCC5f06m0HLW0uqYOKbN
	xC5YNqRb9ac5gs4ZDPKzQx5/yGGl8BXdSARkUwS07+vhPLU42DvJN83CMJ3pWezL
	E+ZXVJDanefm7qcZXrSIR8EX8iC8jLvZBwaIvKTDKnv3/9uV2mtKN7lvHR6XWpOl
	XZOqusxKZTb9csYEKcE+i/2zDyQsHSODFZWV2mgoLStDFqUfS8dlil1pfDF4Vq3L
	SyMpDEDoAaLnItQORFg6tXa6XEhyEULfcWo1YuA8i/2WDdO0awdZ/z7a6GUmMvo8
	rAjKoUSC6NGDhJhXUOkQo9bLMSIJ2I8BYEMV+3SxaWXskptNkj+C0VKGW1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw00fvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:12:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32d323297so48826631cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829557; x=1757434357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgPrdRIlfMd8DirDCyifuaxS1PjXlld6jz6oQI/b/ZY=;
        b=dD9Z+yFlEyl5HTZChw9EPqYHYlFo9+ioAvZOoG6g/tq4vYlUw5sSA2cHVYAgFlxu8Z
         z7BfQvty97SjBwHTsj3K1iCpX6r7Fr3SoLXX/fbLAdSVOOuhj+Bu/eTShwZSaBY5Pkag
         ZxkPhcchF5lCuWbx8i8cNY6LoWBdLbCbx+sl0/yGzpurY5Q0lwd6u0wL/yZnwTrODOSV
         TsYp16Jp4+zcABOScWCQ3kjHdx3IezLffvu8WyJ7mD/05+p4wP4R3YsOHor7kxF/uI+u
         H/BnW7kHSb88tSmmZ62F11MaXbpwe14gGe1656OvuivMpJTWm8cF2BuxzzRs6LHwoaH7
         cP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/2DqYbgg4P0+fiude7ZU3Yg0qMELcVjHHjW2zhWuPR9n94vuhB7ovjCjuDKdE8zgfRv39ESbSRM83n7SV@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUoYBe9M5k0rZKS4sGm4LiJXaRQWKjKmQ4fTObYile/5ZSKSc
	s/GF/06eyyJIEG75nZ89EAks4CIk47cLjoVewih6uLUjV48ye/LRMvAe6ZSDcuw4z0VWRrsfxWc
	klOTsl/o9T+ZqLy3dXKrjA5EAl/Q8+PJnqCuBc7INf4qmz8U5/AhxigPUlQjTeJrwVTRB
X-Gm-Gg: ASbGncsTewsW55wkYAj3NyQ/zSA3zs+tT/5wsapNoLe4c9eN0bjqNAFT1w8vk7wf5+F
	uG1h1vfpJfXzuZ68eH0K2WC9lTR9nafSqsLg8sojvNFdUsxoNfaercDxu+Ibofv9EC1fvwSVrx9
	W7pL1uDRXZRpmSUYRpan/fjEqdgYrzq1WxDoytNcnTMuJCNUK6Fm4jwatoYG7Y5bfURXoLcM3uB
	d/mP/7tXAgMz/+RD3JOffO0RIdN2hVPmbYGVLsD+ff33pBoRpoj1R++R0+NV+TqeosDT3z5fQuz
	n6j8ae4bX7cTCwwFv54G+yoXF5Y018kouRM+DxnX9tF7EFJO0UA/Rw==
X-Received: by 2002:a05:622a:4085:b0:4ab:9586:386b with SMTP id d75a77b69052e-4b31da22698mr168627311cf.53.1756829557022;
        Tue, 02 Sep 2025 09:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJkTJcUQ/yX5aX22luk5Vf8q0lM5NIj4aVAwx479cSoaiYueGXur4w4d6rif7Njpsb2+rIaw==
X-Received: by 2002:a05:622a:4085:b0:4ab:9586:386b with SMTP id d75a77b69052e-4b31da22698mr168626001cf.53.1756829556102;
        Tue, 02 Sep 2025 09:12:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/7] soundwire: qcom: prepare for v3.x
Date: Tue,  2 Sep 2025 17:11:54 +0100
Message-ID: <20250902161156.145521-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rXOjCC2horEJtr0ShDZP9YnlFsxd5E1d
X-Proofpoint-ORIG-GUID: rXOjCC2horEJtr0ShDZP9YnlFsxd5E1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX34R/Sp4Vsb0h
 Ub2d9cO8w9EG6s6KCsvTIu5ag/zrdBBL+C3Vpqqaqvl/YWNmnlR84erWD+YIrsv9GKf2oNEJrOc
 22qfBXz+YP0k3PQHGq0qHxbvv0RxDyeaGangTeNEFDRZzERvQLUOfzLX62J1/ySw/agAKFXL3ku
 6NYb2GgMw0riL0QI0rUJHMXL2QXmzPY7bbto/895lt+OdCsGJ0oI0U4rWLdFNIKX3sG/UOvjWvu
 AUpelmoI4yOxnQ2iqg4JMg6x4FgSf2vFfz9u0/NsUjXELypX+X/7yJApsVPmBRMRjueT8qo8wSC
 UuANEe12znxDwL4zNai9B846OB85n5VlMpUubqN33J1Mm8fjIMaL2OgaoLuLbP4t+aNhMvCVM0e
 BzeFpPC9
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b71776 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KTr9yuUO_FWm3CjRSecA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

cleanup the register layout structs to prepare for adding new 3.x
controller support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 77 +++++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 21 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 34d4e2c2dd0a..3d4d0c443977 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -99,14 +99,15 @@
 #define SWRM_MCP_SLV_STATUS					0x1090
 #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
 #define SWRM_MCP_SLV_STATUS_SZ					2
-#define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_BLOCK_CTRL_1(n)		(0x112C + 0x100 * (n - 1))
-#define SWRM_DP_BLOCK_CTRL2_BANK(n, m)	(0x1130 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_SAMPLECTRL2_BANK(n, m)	(0x113C + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
+
+#define SWRM_DPn_PORT_CTRL_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_PORT_CTRL_2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_BLOCK_CTRL_1(offset, n)	(offset + 0x100 * (n - 1))
+#define SWRM_DPn_BLOCK_CTRL2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_PORT_HCTRL_BANK(offset,  n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_BLOCK_CTRL3_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_SAMPLECTRL2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+
 #define SWR_V1_3_MSTR_MAX_REG_ADDR				0x1740
 #define SWR_V2_0_MSTR_MAX_REG_ADDR				0x50ac
 
@@ -171,6 +172,13 @@ enum {
 	SWRM_REG_CMD_FIFO_RD_CMD,
 	SWRM_REG_CMD_FIFO_STATUS,
 	SWRM_REG_CMD_FIFO_RD_FIFO_ADDR,
+	SWRM_OFFSET_DP_PORT_CTRL_BANK,
+	SWRM_OFFSET_DP_PORT_CTRL_2_BANK,
+	SWRM_OFFSET_DP_BLOCK_CTRL_1,
+	SWRM_OFFSET_DP_BLOCK_CTRL2_BANK,
+	SWRM_OFFSET_DP_PORT_HCTRL_BANK,
+	SWRM_OFFSET_DP_BLOCK_CTRL3_BANK,
+	SWRM_OFFSET_DP_SAMPLECTRL2_BANK,
 };
 
 struct qcom_swrm_ctrl {
@@ -230,6 +238,13 @@ static const unsigned int swrm_v1_3_reg_layout[] = {
 	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V1_3_CMD_FIFO_RD_CMD,
 	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V1_3_CMD_FIFO_STATUS,
 	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V1_3_CMD_FIFO_RD_FIFO_ADDR,
+	[SWRM_OFFSET_DP_PORT_CTRL_BANK]		= 0x1124,
+	[SWRM_OFFSET_DP_PORT_CTRL_2_BANK]	= 0x1128,
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x112c,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1130,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1134,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1138,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x113c,
 };
 
 static const struct qcom_swrm_data swrm_v1_3_data = {
@@ -264,6 +279,13 @@ static const unsigned int swrm_v2_0_reg_layout[] = {
 	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V2_0_CMD_FIFO_RD_CMD,
 	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V2_0_CMD_FIFO_STATUS,
 	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V2_0_CMD_FIFO_RD_FIFO_ADDR,
+	[SWRM_OFFSET_DP_PORT_CTRL_BANK]		= 0x1124,
+	[SWRM_OFFSET_DP_PORT_CTRL_2_BANK]	= 0x1128,
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x112c,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1130,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1134,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1138,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x113c,
 };
 
 static const struct qcom_swrm_data swrm_v2_0_data = {
@@ -964,10 +986,10 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 				 unsigned int bank)
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
-	return ctrl->reg_write(ctrl, SWRM_DP_BLOCK_CTRL_1(p_params->num),
-			       p_params->bps - 1);
-
+	return ctrl->reg_write(ctrl, SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
+				p_params->bps - 1);
 }
 
 static int qcom_swrm_transport_params(struct sdw_bus *bus,
@@ -977,9 +999,11 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	struct qcom_swrm_port_config *pcfg;
 	u32 value;
-	int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
+	int reg, offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
 	int ret;
 
+	reg = SWRM_DPn_PORT_CTRL_BANK(offset, params->port_num, bank);
+
 	pcfg = &ctrl->pconfig[params->port_num];
 
 	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
@@ -991,15 +1015,19 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		goto err;
 
 	if (pcfg->si > 0xff) {
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_SAMPLECTRL2_BANK];
 		value = (pcfg->si >> 8) & 0xff;
-		reg = SWRM_DP_SAMPLECTRL2_BANK(params->port_num, bank);
+		reg = SWRM_DPn_SAMPLECTRL2_BANK(offset, params->port_num, bank);
+
 		ret = ctrl->reg_write(ctrl, reg, value);
 		if (ret)
 			goto err;
 	}
 
 	if (pcfg->lane_control != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_2_BANK];
+		reg = SWRM_DPn_PORT_CTRL_2_BANK(offset, params->port_num, bank);
+
 		value = pcfg->lane_control;
 		ret = ctrl->reg_write(ctrl, reg, value);
 		if (ret)
@@ -1007,20 +1035,23 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	}
 
 	if (pcfg->blk_group_count != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK];
+
+		reg = SWRM_DPn_BLOCK_CTRL2_BANK(offset, params->port_num, bank);
+
 		value = pcfg->blk_group_count;
 		ret = ctrl->reg_write(ctrl, reg, value);
 		if (ret)
 			goto err;
 	}
 
-	if (pcfg->hstart != SWR_INVALID_PARAM
-			&& pcfg->hstop != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
+	offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_HCTRL_BANK];
+	reg = SWRM_DPn_PORT_HCTRL_BANK(offset, params->port_num, bank);
+
+	if (pcfg->hstart != SWR_INVALID_PARAM && pcfg->hstop != SWR_INVALID_PARAM) {
 		value = (pcfg->hstop << 4) | pcfg->hstart;
 		ret = ctrl->reg_write(ctrl, reg, value);
 	} else {
-		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
 		value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
 		ret = ctrl->reg_write(ctrl, reg, value);
 	}
@@ -1029,7 +1060,8 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		goto err;
 
 	if (pcfg->bp_mode != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK];
+		reg = SWRM_DPn_BLOCK_CTRL3_BANK(offset, params->port_num, bank);
 		ret = ctrl->reg_write(ctrl, reg, pcfg->bp_mode);
 	}
 
@@ -1041,9 +1073,12 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 				 struct sdw_enable_ch *enable_ch,
 				 unsigned int bank)
 {
-	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
+	u32 reg;
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 val;
+	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
+
+	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
 	ctrl->reg_read(ctrl, reg, &val);
 
-- 
2.50.0


