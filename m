Return-Path: <linux-arm-msm+bounces-72030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F10CFB4395B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 806B61BC4C87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDFC2FB608;
	Thu,  4 Sep 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFRsq8ui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5002FC01F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983413; cv=none; b=VnIl3HZr3UYQm1www3/5B/IsvcS/SB9mtbkIl5KSVw9s3YxDiEkGRhBGo82nlPD1LuQlxEZPi9FZ69zGOLUfEHysSv86LqeFDiAye3jp8wT7crF9x/upHD6MoVxqcalTGvkbg8oX6opVHK167a2gBFAR7zcn+Fdv6lF4t2K0S48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983413; c=relaxed/simple;
	bh=22UQKqZEE75whWfcKjmqptRLQHG1TLjqGYu3QEoeu/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpCwv0lObu2jsUsU+mMte3hEuckp0vElTce+7cmnITnuKS1MEBLi7SopAOqWmT5ZLzlvVXgls1+1xOoAjnMgsIV3VHI6NPXocuSA7pzyNr4OC958JrqSlMlhO/XViaOns5Gjezobvi6+VnFICa8t/esx1OM+BwvMn0wvX+G+PWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFRsq8ui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9ia031829
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0R/5Zj769Au
	2Qx/NKjlGFYXhGNsn5YsOkx56fIrbEYk=; b=MFRsq8uiNDVd5vOpk0N/edCEKpx
	r5/AKuR7RMVifHFoUGLwVC5278prRQoxWBPHL+hMrxBRo5OpkYMPlkruMXMPQ5rN
	UdwKhFgsz+waggX2EZkOKxeH7lNkfY/j51YMp7/4Iul+5MVya0dWw4NDPbzAsvmU
	Hj7rXU8mexrPIdRkYhH7epqrP2mnvvHX4oTS8ozcJFx+EGHPsOp6kyFs1+4sXcWB
	HxUIi0kyCoft88AjnIw8M6kZ7dnmqooZXhCMT7q0TEci240uF79EYZOHS+PcfVoJ
	HrOKIplXo7XIX2xO7FELakzqP0feJ7T2/Zppoil9/yiZSelSSThu+Y3c2wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw078gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:56:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b4980c96c3so29147661cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983409; x=1757588209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R/5Zj769Au2Qx/NKjlGFYXhGNsn5YsOkx56fIrbEYk=;
        b=PlKOn2A728YtU3f3mTxiTpkj4o6nGVcysXCLiZGHcbRlxhQmonH9TnDbXUvb7WUSHm
         3GX0wjSjpKpCLXd4DjeJcTCeLToxALThGwbBZiXB/UhNeCutrnzgWJzj2l8W5/a/IVo4
         4HsBIw5m3kd46eYyap2TigdnnMoNZr62ogH58aTNjTBthnJnwqSOCS/KLsLnOxtFx9Uc
         Ain7HUMVqzGTktTx+h1EeNBc1vrwQt6E3TNX71cKGfIaNugDKkHe1BwZAWkVk2ha2G1p
         nseUYhClZr1TaY3/gQ9vMnipLOanUSYp6YDeHWv15hrnvSEyEwS+gO1OvURwpHroNS1l
         wPJA==
X-Forwarded-Encrypted: i=1; AJvYcCUt6HBbUEDSuXxRZ26UsrvjUhTbGT7GLEDw7d11W88aMjnYtZvkOUB3l5qX7OtUN8t/xqw2fxm6mC93K1w5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx47d8KpzTDdJfaiVmZrXIi9tiP+J9HDoAgoTa2DB/bZXSoQp5
	SMVoS7YjUg9WMhVZqLfLTpIDpNMFJshuzCRhSta2EzA2TvUZaq66LQjbbeDgHDQwu0zr+d46eVx
	CRGQmZUDTpljJon1W107enmXy7gXbHZZWgNbNb5Tt6W6YWIqnS8y76jTGTwJCYuOz1WeR
X-Gm-Gg: ASbGncuYnM1zIo2tlLrqBf5Nrxhqfim+gphCqLizeOzimuIRtoh4Eb/F5fAW9ZGLshG
	iRVgTktZZbEJ9MqfoR9l4zAL5AbGY49xFzST57tRvokSkvOUgW51s2nQzydyjqqP0gTTZHKqf23
	CSaetX4XxVRFviwYyK9I1wB6KURzy8NR4IGlv3WATH2hQRJ9sNGms8ptsUudLO6i7a6L9GWaBf+
	cS9GTmXL+OU1Etg5H5jiaLRuku1V/B8ug1lEWxBR/YVdokuwunUrLHEq8HYhD1N80jfVmJNt8GE
	M2KOJ4rUg8WhGlDDjyVsUAvsbM2cUxRnvmTligLBYY5uwY/j1+YUpw==
X-Received: by 2002:a05:622a:58a:b0:4b0:792b:2745 with SMTP id d75a77b69052e-4b31d89daffmr239185171cf.9.1756983409518;
        Thu, 04 Sep 2025 03:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuxxT3iN4fDyTjsVsrkUbH23YKJ5paesDqYBES25e5NSkK0d0j9e213imCWTDl5h3j5ziE8g==
X-Received: by 2002:a05:622a:58a:b0:4b0:792b:2745 with SMTP id d75a77b69052e-4b31d89daffmr239184971cf.9.1756983409068;
        Thu, 04 Sep 2025 03:56:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/7] soundwire: qcom: deprecate qcom,din/out-ports
Date: Thu,  4 Sep 2025 11:56:13 +0100
Message-ID: <20250904105616.39178-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wuC9cvoOhsXswiHCq9Trz1xsjnHaU3FS
X-Proofpoint-ORIG-GUID: wuC9cvoOhsXswiHCq9Trz1xsjnHaU3FS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX9+0Xqa3OiDfj
 6CvLHdppjhK+78WU2/bz0wsnwuCQcd9oVOb5bjspu1UHY4KYAW+ol+jaO6CB4ZHfqayJwryFYoo
 EQuUSdxkrlZOC/hBmZJ3KuxpQx7XVVvhZtNv/N/XMeqk4Mv4eJd3+vBZ8vW1Bj3fZPbxx7mQjcL
 +pmQRI55mi9grktltOrsCo22xYFN+cD8LPX1IOUq6c+hIdoB7RHzIcag2A5ABKcp98UWohuDeSs
 NZzSTAdqdAcXa9hHEwgehX3MSNj+rzKTHYjZlJrJt6PZofZn4VvaH6nGcfgIzf4Qw5NiAP2/r18
 HcBX8K1c55/6QEpNc+EYe/PmaRmfoae1Qff89pPLpJerpFWcWHno8QIzszkAWyExJ2y92fx3M+F
 dSVF8nDg
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b97072 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nfbzo9wS4cg9a-Y7DkQA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Remove the code parsing this property along with marking this as
deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 133 ++++++++++++++-------------------------
 1 file changed, 48 insertions(+), 85 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f3ad53ec6e76..34d4e2c2dd0a 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -128,7 +128,6 @@
 #define MAX_FREQ_NUM						1
 #define TIMEOUT_MS						100
 #define QCOM_SWRM_MAX_RD_LEN					0x1
-#define QCOM_SDW_MAX_PORTS					14
 #define DEFAULT_CLK_FREQ					9600000
 #define SWRM_MAX_DAIS						0xF
 #define SWR_INVALID_PARAM					0xFF
@@ -195,6 +194,7 @@ struct qcom_swrm_ctrl {
 	int wake_irq;
 	int num_din_ports;
 	int num_dout_ports;
+	int nports;
 	int cols_index;
 	int rows_index;
 	unsigned long port_mask;
@@ -202,7 +202,7 @@ struct qcom_swrm_ctrl {
 	u8 rcmd_id;
 	u8 wcmd_id;
 	/* Port numbers are 1 - 14 */
-	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
+	struct qcom_swrm_port_config *pconfig;
 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
@@ -1153,7 +1153,6 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				       struct snd_pcm_hw_params *params,
 				       int direction)
 {
-	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
 	struct sdw_stream_config sconfig;
 	struct sdw_master_runtime *m_rt;
 	struct sdw_slave_runtime *s_rt;
@@ -1162,6 +1161,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	unsigned long *port_mask;
 	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
+	struct sdw_port_config *pconfig __free(kfree) = kcalloc(ctrl->nports,
+								sizeof(*pconfig), GFP_KERNEL);
+	if (!pconfig)
+		return -ENOMEM;
 
 	if (direction == SNDRV_PCM_STREAM_CAPTURE)
 		sconfig.direction = SDW_DATA_DIR_TX;
@@ -1186,8 +1189,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 			continue;
 
 		port_mask = &ctrl->port_mask;
-		maxport = ctrl->num_dout_ports + ctrl->num_din_ports;
-
+		maxport = ctrl->nports;
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 			slave = s_rt->slave;
@@ -1347,106 +1349,67 @@ static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
 static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 {
 	struct device_node *np = ctrl->dev->of_node;
-	u8 off1[QCOM_SDW_MAX_PORTS];
-	u8 off2[QCOM_SDW_MAX_PORTS];
-	u16 si[QCOM_SDW_MAX_PORTS];
-	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
-	u8 hstart[QCOM_SDW_MAX_PORTS];
-	u8 hstop[QCOM_SDW_MAX_PORTS];
-	u8 word_length[QCOM_SDW_MAX_PORTS];
-	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
-	u8 lane_control[QCOM_SDW_MAX_PORTS];
-	int i, ret, nports, val;
-	bool si_16 = false;
+	struct qcom_swrm_port_config *pcfg;
+	int i, ret, val;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 
 	ctrl->num_dout_ports = FIELD_GET(SWRM_COMP_PARAMS_DOUT_PORTS_MASK, val);
 	ctrl->num_din_ports = FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK, val);
 
-	ret = of_property_read_u32(np, "qcom,din-ports", &val);
-	if (ret)
-		return ret;
-
-	if (val > ctrl->num_din_ports)
-		return -EINVAL;
-
-	ctrl->num_din_ports = val;
-
-	ret = of_property_read_u32(np, "qcom,dout-ports", &val);
-	if (ret)
-		return ret;
-
-	if (val > ctrl->num_dout_ports)
-		return -EINVAL;
-
-	ctrl->num_dout_ports = val;
+	ctrl->nports = ctrl->num_dout_ports + ctrl->num_din_ports;
 
-	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
-	if (nports > QCOM_SDW_MAX_PORTS)
-		return -EINVAL;
+	ctrl->pconfig = devm_kcalloc(ctrl->dev, ctrl->nports + 1,
+					sizeof(*ctrl->pconfig), GFP_KERNEL);
+	if (!ctrl->pconfig)
+		return -ENOMEM;
 
-	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
 	set_bit(0, &ctrl->port_mask);
+	/* Valid port numbers are from 1, so mask out port 0 explicitly */
+	for (i = 0; i < ctrl->nports; i++) {
+		pcfg = &ctrl->pconfig[i + 1];
 
-	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
-					off1, nports);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u8_array(np, "qcom,ports-offset2",
-					off2, nports);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
-					(u8 *)si, nports);
-	if (ret) {
-		ret = of_property_read_u16_array(np, "qcom,ports-sinterval",
-						 si, nports);
+		ret = of_property_read_u8_index(np, "qcom,ports-offset1", i, &pcfg->off1);
 		if (ret)
 			return ret;
-		si_16 = true;
-	}
 
-	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
-					bp_mode, nports);
-	if (ret) {
-		if (ctrl->version <= SWRM_VERSION_1_3_0)
-			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-		else
+		ret = of_property_read_u8_index(np, "qcom,ports-offset2", i, &pcfg->off2);
+		if (ret)
 			return ret;
-	}
 
-	memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
+		ret = of_property_read_u8_index(np, "qcom,ports-sinterval-low", i, (u8 *)&pcfg->si);
+		if (ret) {
+			ret = of_property_read_u16_index(np, "qcom,ports-sinterval", i, &pcfg->si);
+			if (ret)
+				return ret;
+		}
+
+		ret = of_property_read_u8_index(np, "qcom,ports-block-pack-mode",
+						i, &pcfg->bp_mode);
+		if (ret) {
+			if (ctrl->version <= SWRM_VERSION_1_3_0)
+				pcfg->bp_mode = SWR_INVALID_PARAM;
+			else
+				return ret;
+		}
 
-	memset(hstop, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-hstop", hstop, nports);
+		/* Optional properties */
+		pcfg->hstart = SWR_INVALID_PARAM;
+		pcfg->hstop = SWR_INVALID_PARAM;
+		pcfg->word_length = SWR_INVALID_PARAM;
+		pcfg->blk_group_count = SWR_INVALID_PARAM;
+		pcfg->lane_control = SWR_INVALID_PARAM;
 
-	memset(word_length, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-word-length", word_length, nports);
+		of_property_read_u8_index(np, "qcom,ports-hstart", i, &pcfg->hstart);
 
-	memset(blk_group_count, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-block-group-count", blk_group_count, nports);
+		of_property_read_u8_index(np, "qcom,ports-hstop", i, &pcfg->hstop);
 
-	memset(lane_control, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-lane-control", lane_control, nports);
+		of_property_read_u8_index(np, "qcom,ports-word-length", i, &pcfg->word_length);
 
-	for (i = 0; i < nports; i++) {
-		/* Valid port number range is from 1-14 */
-		if (si_16)
-			ctrl->pconfig[i + 1].si = si[i];
-		else
-			ctrl->pconfig[i + 1].si = ((u8 *)si)[i];
-		ctrl->pconfig[i + 1].off1 = off1[i];
-		ctrl->pconfig[i + 1].off2 = off2[i];
-		ctrl->pconfig[i + 1].bp_mode = bp_mode[i];
-		ctrl->pconfig[i + 1].hstart = hstart[i];
-		ctrl->pconfig[i + 1].hstop = hstop[i];
-		ctrl->pconfig[i + 1].word_length = word_length[i];
-		ctrl->pconfig[i + 1].blk_group_count = blk_group_count[i];
-		ctrl->pconfig[i + 1].lane_control = lane_control[i];
+		of_property_read_u8_index(np, "qcom,ports-block-group-count",
+					i, &pcfg->blk_group_count);
+
+		of_property_read_u8_index(np, "qcom,ports-lane-control", i, &pcfg->lane_control);
 	}
 
 	return 0;
-- 
2.50.0


