Return-Path: <linux-arm-msm+bounces-73251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4EB54578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD6633BD881
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD4E2D641D;
	Fri, 12 Sep 2025 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhvp49I5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1326F293
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665961; cv=none; b=GXbPoyJ0OQdW2VcVaIO7wQKXNUcPifTIrN4KqUyX7wXjE+pz2X0zvGg+zDzIWjLY0k2xfH44lFNDFiX7eVl0Ol7G1o1Orbb60eLnFHlUZLy5nn0Jp2/8p1ZDN6A24aKkwfEpO5mm13YbIZKiKZ9pOLQqy1pFPOHxZZrorinAMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665961; c=relaxed/simple;
	bh=KgmQ/hSkjgUTEMmMZfE98tC2KSb+hCTHMqCZHrCUBmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W94zPqzZIR14FBE8eblA/dhH4EXRyM0Kyrql50vuGcd7l6GM+osFySerVi9fAkRV57eb9CqQ1YVthZhOBfbRQ5AVp+vGaSrAXRkdefb6QKhx86J77g+lh7xwbfQXkCiA1eyqHsplhVTjvnj3iMpLZHBl/i7D0KXnm0YxYQUXMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhvp49I5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C8EK3l016087
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TodlzAk3PWj
	NeAOH4IrU296rtTk0ONyPMQfQ4YQJa5U=; b=jhvp49I58uLfG+HrfuQMCZmfBt0
	bmHX6fD4KuKoyXl2eSz6lh9GRcphp6+Q53dSvNcjjnf5jHx29pzp/Zdu8W1nKnpN
	c08Ft7RhS+lfP6UiLFJFiB/1xsB8fE0Iq+cLJtDWptzdyA0O6yszL8a+/+++sN51
	QCAYtRypeCrBt0VBqxwLyBAyNgdkSGUg8dB+SePdStz+Z2LwlT7EHyMmGaE151+1
	g4mfQv7ZxDCBLQvtqg7561r07xsqrqp48u+w59SZwbM9z9mf88RfaMWJSS0AI6fT
	TIvXbiEKP+6AJQEuIvKj+/dnnHFoK9ajwlhzzFTIdeoexUYxPWs24j6G10Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t38789c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72023d1be83so53492856d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665957; x=1758270757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TodlzAk3PWjNeAOH4IrU296rtTk0ONyPMQfQ4YQJa5U=;
        b=IYZEzCng5JHQIwc36QkcSfhI1/5tYQLYj4ej3sHlVoXp6v/OE8V+9t4n15LJcmxoYp
         KPv8UM7jwz/07X8gIvd6zCzIrsQdz4eiN94jPIhcr8gqtTCwmURKH2pDmBBGd07Nl+MN
         fokKQLBbYO9SRomv3BwNMV3k5Wn5k0thTCYPZ7C/U3xbtlNqMlVWdUapHzYsik7pi+KG
         5xk8a6/1CRjEyjeRV4r+cXYoqAdpjsJiKsud0jOc3dshBebHPTZV+/vLB7ClBaM/j8Ai
         NL2SXJcqSKR9SV/dljWHmIdjM2FDw+iYHwg0azqgnPGY1eC3pXfcXzVlbNJhs00shm0P
         aOtg==
X-Forwarded-Encrypted: i=1; AJvYcCXcCPEzlnSeq5kZek4t3tRqJI6SKQEhIbFJqM7aS8d5Moc3n3xuFIo6l6Md8n38qPSoSmux0qhJvrD3BD0D@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPHVynO9S1wii6GBSHBwdlNsYCp2Oi/H0sTDnIH05wP92VZd5
	F4N+5/24Mi8kontldus2AEjtK07b4GrIfUEHJLuQAPWAbaqg3D/kRI8pYWLGmtn4DNDx28c/v5L
	tJQhp5dzRJ1y44N/EN0lePo1H3ce/5RtqUXLHcWuiUmLMdL0Bk5vumAsBeGyufTBXRB48
X-Gm-Gg: ASbGnctIcE4kxcNBECRSIjwgnWXxggtRbFWuGQaMx/BLuqmb9oz9ecrCRymRtGkm0Aw
	Mc5PDMdDe8y23ciITkcVQ07ydfpDTryrMkElQM1rhX/TPjkVfFIixHfejfS4VwfUzfJv0LunkJL
	a4+x8MMTZjVHulSPobJMTASL5CM0K4A0JdUTVbHME+5d6vWQ9Rd+SGQEKZXGZ0pNFnJBq9yOESY
	yjgOiKxi5R1atXqR0ysrfD0Y8Xim70VoadILQzbzb4YSe3X5CPcnHo0hBRNRH6cySmIHrch2M1r
	CaDa58j3B3jUu7BYk3yWjdnkXt1ZAfiXaZiYNeR0wM0Dcdqhyk+uaw==
X-Received: by 2002:a05:6214:2aa2:b0:728:a449:2187 with SMTP id 6a1803df08f44-767c506125emr25387546d6.62.1757665957363;
        Fri, 12 Sep 2025 01:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGnbCRTuZ3Am14fVs/obm0V6pQOSiYhtntw03Q1ZVSbes8Tu/EjmCay9Xcu5Qd4Zj/7NUdRg==
X-Received: by 2002:a05:6214:2aa2:b0:728:a449:2187 with SMTP id 6a1803df08f44-767c506125emr25387346d6.62.1757665956886;
        Fri, 12 Sep 2025 01:32:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
Date: Fri, 12 Sep 2025 09:32:22 +0100
Message-ID: <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZExbQ4NwBbsWNDIYlzplRB6DiVZzvVm8
X-Proofpoint-GUID: ZExbQ4NwBbsWNDIYlzplRB6DiVZzvVm8
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c3daa6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nfbzo9wS4cg9a-Y7DkQA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX8QHRHKX/FpLU
 OeDIh9C/tnGudPWdVeoimzX13itymA9JFJFl6yPXdeRBLKG/EbH9PkJzc5dPrFABgDftE593pbb
 HsaGT4xt2ea1IWfNvaMmMG1auILykFEoiiBquHzxjczJiateYe55Fo2hct5eFWVeCxpk4MxaK6A
 x0G9N6x+HEn9H6aODGJvWbplOsvMa5iSNoosrhf558LwThJkmuPier4k0rsCDYxz74Gejg1rKEO
 0zdjopAM64NWvhi7SjPtUOlS7E/7ieCqP6IQFLnA9BKGAT6EDeX/0uY3PEyMmA1h6hUVxOxP8C8
 v6izJJkdH6paP9OR6csp/HxkfDXoNY5zp3b1em1iyIRC4PYco1ymy9FUvLQSo+LPfxI9lhLDDh8
 L+4mbjx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Remove the code parsing this property along with marking this as
deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 141 +++++++++++++++++----------------------
 1 file changed, 62 insertions(+), 79 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f3ad53ec6e76..9e6dc43c1112 100644
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
@@ -1347,17 +1349,8 @@ static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
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
 
@@ -1365,88 +1358,78 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ctrl->num_din_ports = FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK, val);
 
 	ret = of_property_read_u32(np, "qcom,din-ports", &val);
-	if (ret)
-		return ret;
-
-	if (val > ctrl->num_din_ports)
-		return -EINVAL;
+	if (!ret) { /* only if present */
+		if (val != ctrl->num_din_ports) {
+			dev_err(ctrl->dev, "din-ports (%d) mismatch with controller (%d)",
+				val, ctrl->num_din_ports);
+		}
 
-	ctrl->num_din_ports = val;
+		ctrl->num_din_ports = val;
+	}
 
 	ret = of_property_read_u32(np, "qcom,dout-ports", &val);
-	if (ret)
-		return ret;
+	if (!ret) { /* only if present */
+		if (val != ctrl->num_dout_ports) {
+			dev_err(ctrl->dev, "dout-ports (%d) mismatch with controller (%d)",
+				val, ctrl->num_dout_ports);
+		}
 
-	if (val > ctrl->num_dout_ports)
-		return -EINVAL;
+		ctrl->num_dout_ports = val;
+	}
 
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


