Return-Path: <linux-arm-msm+bounces-71661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146FB40A41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F116C1BA2127
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB9B33A010;
	Tue,  2 Sep 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8na68Dv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAD338F4F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829559; cv=none; b=aRkx1fU2VLcZrMTmf+TwauXY53cmBtTVfzBEk37EcrGlm55ELT4j6CETcnFw5xgqGUzbrRRCXcXeJQ1y6BZJ6J1p85OTTlKlOCqCfpb48NWJHup18BvEMQYp6ckhwOtmyq0X6vxE5XQ614cmg25nggC/nUyX+E0SzAEW9Wl8iso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829559; c=relaxed/simple;
	bh=22UQKqZEE75whWfcKjmqptRLQHG1TLjqGYu3QEoeu/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khprGdpgSQ+ZpPYi0vtKqfiXqhhg2MtIXedAQ7iKIZ+DSDUQI2oixePz2DsFZmWrgPGxRHf9JGg3sTq6Vqo+yLVn/ApkieChqQ+s2bX7n2edt6AmZrqgN748nSV6pOEFsX1yvxsDgGTEqDiBDS+kzwGKwVbEvGE9385qbAkh0JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8na68Dv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCqn025305
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0R/5Zj769Au
	2Qx/NKjlGFYXhGNsn5YsOkx56fIrbEYk=; b=h8na68DvhcVzpdorNjJDllOqyjy
	SPAL6wkz8NdP/pTuY/ZbRPElzIE2zs4FfrYTwLkOtiLX5HNFYHRDeLMrlk4TsjVp
	EoQHT3QBxm06mRhgXfWjHJQZwZVJuGpfj3T2Z4NNrqwrvgII6iVv25NPM1K/q6VF
	KPvgAF8N8UsDO8khYJx12gCeKmfvFcGWrKFJANkpcVkScFIA/LLY3mmm3B4xhc4n
	ZKQat2Ay3+8KY4w7onmcvMT+AAoATmEObfqT4cmrBpv/x+M9unwMFQAYq4hU0bFW
	KKGpKno/TrDcOooXhLSPqbmz2NoAoKpQZxX7g9wyDQ43rD7JC+QRA6GbQnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv0ha2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:12:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b302991b39so93635291cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829556; x=1757434356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R/5Zj769Au2Qx/NKjlGFYXhGNsn5YsOkx56fIrbEYk=;
        b=etcOHWQ6dOeq3wyBvRzN9kiKTjYeBLgVHdF5onLYiDQbVYVYA36AEDkLN3Yn6zIa5u
         z1c5BnYs/gEAkkbd8HxMdQi1syF/6gDpAA3IjsOcSc8qTEke7AAhBnDcQq6oyX2FMK8c
         I2x5qNLYcHceewceBDt0s1qxVFenhQcQHe+iOUGWgLqimDGQiHM9OpqxQUVgjoedwUYW
         2OSG4KKi3YCqKYMO0OucrdlYBbLkg0ZnDQargqoGCnlk3jdBbyodoaN2kqEPD0HlF569
         mv8PLMlCKyidyO7oPrt1J3XhGYiemWkGxRdaL7IIrbbS9a+QkG38xofYXrhEWGifYLu1
         t1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWawW5FlmfbXUMtDQOIDZmqOv9FChtConHtwOv8Rl2Sgj2PJx5GuPd9/Q7xoOkaArOVfeQpn437WQJ+VopM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyja8zG5k1oTRtKkue6TyN7Qk0b/MDNIXBqjGiAdN82BgkJNhiE
	fqDdqr6R24uAfe7Wr0ey2j8c4/XmW2PYKOOw2tN8KNCiLVVvQGdUNlmsIK70SQChaX2XZuhgm4i
	nEgBxMJq2Nw+KAlIWEPzEoQf3c2uK6nWtEemXTiPHM88F3THOendCCAIacx1MECug32W0
X-Gm-Gg: ASbGncvStQk/ZaJJ0MnW/XX3G7A7e2D7IBHbh76aP6XdvWZpsgUAgEl27BfdopAsoq0
	VOfPqhnEi1zqugZLNc34yKTTTFzewzREPK1EzlgJQftwO/Spb4f/omYrngbfxJfxL6PzzNbop7z
	bRbrOtPhSAptZ8RcUmGLRVqPQF+HWumORT4ryxkM8fRxizrZjlHCn6A6fsFRjNwdezRE+AJ1fzV
	YCQgjMjC5kt6fXz9AyNA+gbYO+I5WFPsCW0MmoRy6rDxRlP88CrzPyT93XqdK2JJQKUqjOKL35I
	6OGmtBVw6bHXKTNDl0BaTpjgKcj0hRaNYwsPpFslipTtLzPlAw7mng==
X-Received: by 2002:a05:622a:1211:b0:4b2:eda4:6f4 with SMTP id d75a77b69052e-4b31d844fbemr123678801cf.2.1756829555728;
        Tue, 02 Sep 2025 09:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb5q14K6UZsLZNa9dpcMfk4bQw9vrUd4iQQZHufdW757UOPh2YyyQFQJM2k07vCqnSBjTutw==
X-Received: by 2002:a05:622a:1211:b0:4b2:eda4:6f4 with SMTP id d75a77b69052e-4b31d844fbemr123678031cf.2.1756829555011;
        Tue, 02 Sep 2025 09:12:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] soundwire: qcom: deprecate qcom,din/out-ports
Date: Tue,  2 Sep 2025 17:11:53 +0100
Message-ID: <20250902161156.145521-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX/jNojoTFkY+T
 3KUIWkjS6bSAiKsP49v/F0BNdFReqoOH5wpjYW1RGFDXhxzryiAJcs7a4PMhJll/PXyye5lDEJB
 vl4pF3H+0k0wuIHDobAFrv6kNB9VHiI0UD08h9ipvgBANmVLeCr/owCbf3Bz9rc7zbsyMxtwDWV
 3YHDT+lDqAmSWVaa8tQArdQK3nLpDF0qUJV10EzjyMEg5lSlQxx48R0WS+MggXI82L+1DG+jDVd
 GEpoaebOAlRpC02S/AzwYEx1777ncmnHbf61hj1Y1HBJ/BI+hKyrzB+eGigteI0w72fPsAkxiIq
 f+QXywG7P7krnRQ/QR3gMTOXTRfWS+rJUD84Yhb3MgCWyhX7i9gmo6iTLlz3iBJr4DFK+g0jBpl
 CWslJg8k
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b71774 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nfbzo9wS4cg9a-Y7DkQA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pV_oAMBCJwXqIz4Bc9QQ-58RTc63kfE8
X-Proofpoint-GUID: pV_oAMBCJwXqIz4Bc9QQ-58RTc63kfE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

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


