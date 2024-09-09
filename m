Return-Path: <linux-arm-msm+bounces-31271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1389715CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62F71C22D22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3CD1B530E;
	Mon,  9 Sep 2024 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NuzOYVSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636BE1B5300;
	Mon,  9 Sep 2024 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879433; cv=none; b=Sx09L1opGSFV+sT26arth/vBdWA0rcfvunTq1wdWFuqj2q+jfw3IKSjK7aD5U21Y/MnfA5xpeG/PoJ3OtXPBHlb4L9JMlDA15X3I75Z7cqIu1YAZPbKaBvDFkB6n03L54EbOhUn5+DBvgePsqyNBj0t4W7RXlpLLJI87mR3rhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879433; c=relaxed/simple;
	bh=8Vd/OSojNgrcBBDFLqFIisQRt6JC3d7ABI1zc+MA35w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOE6otSn7YUE0QaF5BA+IEuzSc3D+681ZTvPcamcnDbTF+mN90WMtvtXas8eu+Kd9ZFXpuPePZIaaAiBOcNfYND/YV+butBG/g4pPq+f9ThYiVTPfmdNUDdAUfOVbgy0Qkuh7EL7MZ9PqGrud1qzCtIsH2bLECZC4eGAmD+LQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NuzOYVSp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4899K7pu031036;
	Mon, 9 Sep 2024 10:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihbuH8ZE0WoVokeOq+71+6Vox3J6l793D//UVXzSd8A=; b=NuzOYVSpSghN7evz
	wxYLZeyDXCrIAiAHYMyAbH8UlsNkAJfjNtwZhOk+mgOTCUIAdmGvu22Ls9OJFms/
	uSh5JRcaukSvycxrWQsylSgtNVGDKQV9kuClttUmRVEWDEAQIz7nCX6lOq3waafB
	7Vnkim53nk8obFLdOPjX1PzqgVOX/J/4NJPkDiucXYjhR+JZoH7kscKUcInlwuKZ
	Mkhm3Z/MO34/kDa0Am1pBijYAuD38UBPsGA+M3kzrcMNlkd6Dsuyg89JUhh05UQV
	ySpBN/Gt8uHfPYiC0pzoF5A7y0lzMRy6+vQ4pUOMa7bvLQzbPNzN7TZeL+XmRITb
	T/6lQw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rahf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:56:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489Auwvv016942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 10:56:58 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 03:56:50 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 3/4] soundwire: qcom: Add static channel mapping support in soundwire master
Date: Mon, 9 Sep 2024 16:25:46 +0530
Message-ID: <20240909105547.2691015-4-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2N1-ngBqMyy-wj7nDpgNQfaJBVAndt6B
X-Proofpoint-ORIG-GUID: 2N1-ngBqMyy-wj7nDpgNQfaJBVAndt6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409090087

Add static channel mapping support in soundwire master.
The qcom_swrm_set_channel_map() will update the master channel mask
based on master port number.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 drivers/soundwire/qcom.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aed57002fd0e..65ed1ff7888f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -156,6 +156,7 @@ struct qcom_swrm_port_config {
 	u8 word_length;
 	u8 blk_group_count;
 	u8 lane_control;
+	u8 ch_mask;
 };
 
 /*
@@ -1048,8 +1049,14 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 {
 	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct qcom_swrm_port_config *pcfg;
 	u32 val;
 
+	pcfg = &ctrl->pconfig[enable_ch->port_num];
+
+	if (pcfg->ch_mask != SWR_INVALID_PARAM && pcfg->ch_mask != 0)
+		enable_ch->ch_mask = pcfg->ch_mask;
+
 	ctrl->reg_read(ctrl, reg, &val);
 
 	if (enable_ch->enable)
@@ -1060,6 +1067,16 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
+static int qcom_swrm_set_channel_map(struct sdw_bus *bus, int *ch_mask, unsigned int port_num)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+
+	if (ch_mask && port_num)
+		ctrl->pconfig[port_num].ch_mask = ch_mask[port_num];
+
+	return 0;
+}
+
 static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 	.dpn_set_port_params = qcom_swrm_port_params,
 	.dpn_set_port_transport_params = qcom_swrm_transport_params,
@@ -1070,6 +1087,7 @@ static const struct sdw_master_ops qcom_swrm_ops = {
 	.read_prop = qcom_swrm_read_prop,
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
+	.set_master_channel_map = qcom_swrm_set_channel_map,
 };
 
 static int qcom_swrm_compute_params(struct sdw_bus *bus)
-- 
2.25.1


