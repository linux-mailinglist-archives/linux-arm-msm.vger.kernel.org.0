Return-Path: <linux-arm-msm+bounces-41094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2E9E9559
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04A6281FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA87722616F;
	Mon,  9 Dec 2024 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f7xaCj7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DC51C5CD4;
	Mon,  9 Dec 2024 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748904; cv=none; b=BRvRpKzf4bNAqJHhDsC42e9qZeR+4v2aiDDgmssf3s47vbKQdW5gChmWBhVs8R7GEePIN8W+l4YoS7VY2cs+z0s2Xol/3bc3DNeMYYs6Y2CqT+pUdXwfKSuvA8bINNkKOLSr+TY7NKuWipoCp2wScNVAm4/EMEi/3cjq35BfQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748904; c=relaxed/simple;
	bh=9agMauWBsXbIuaRa4PWRJZ53jML0fhr1krM9eEY5C7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mFdg1bVjI0lTc8y7q6zq8iYmULJbgl94tmLlBAr4RG4VJ+O5ic16xRqMfYi6uJC51u/5G/ob9RpgWmZSygiSDRKSlx4pvzzdHWf270/JG2+MaqT3jjQ5ykEUa6N7Wxyl2YCEhd2f/jBCBrk/vai7nj+jJZWCcnbvWUv9kFKqzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f7xaCj7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AZVHg022156;
	Mon, 9 Dec 2024 12:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUQgft4KWpcVcaiVVE8ff64B6pw4scke+CZanZcl2/U=; b=f7xaCj7y0K0Zaxo7
	aF8YX+819tTcqh+WfiQKnI+CazYcWIcQm6PhdecPOxjWDNeepwYkgJp2jGcXOYJw
	eOq5WO6Mu5xFTg9Ftn6XKVu4QQu14UD2pUX6pOGTvlDpz1zRUmOCe7KzucHUfjCA
	ka4Z06vH/Yi/sHlTPhmIxrqDbF4I2nZV53Sei2CyHinN72wkJPniOYqyC2cGkqiL
	CT4NxLYbtjQqhTlUAsdRDGDIZ7e9dJL+AfAPeCuImhC1I37icBC7stA+kUfROalY
	zcs5VaNQTdMXX3E7sWeyZW8PyacnEMgWWJz3eSGmlQxMP+xr8BtzlBGPcgDO30/M
	wB2moA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgmw6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:54:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9CsruM015000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:54:53 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:54:47 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:22:09 +0530
Subject: [PATCH v7 24/28] media: iris: add check whether the video session
 is supported or not
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-24-05c6bdead47b@quicinc.com>
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=4742;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=nxiX64H+lBveGHTb0vFqzk1sIWN6Q2dZWcZOvSakOVs=;
 b=RvI09jaaSpnBhchJQoQvf/Wr+uq4g+k3F7lhB8z6cfrzEndiFAtzKoNpUoXV3/0upXgVmpyxD
 SQHmYexl3eYBGujHI+pHukbT0QsKDpQOm9/CruIXcLKAEfTNCZZ7qLc
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0TuPwFnjsvayP1G3SCM-seGGhq1h9sE9
X-Proofpoint-ORIG-GUID: 0TuPwFnjsvayP1G3SCM-seGGhq1h9sE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090101

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on the hardware capabilities, add check to restrict whether the
video session is supported or not by the hardware during start_streaming
and queue_setup.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        | 96 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index de0388a100c3..a5a7d6838d16 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -144,6 +144,7 @@ struct iris_platform_data {
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	u32 max_session_count;
+	u32 max_core_mbpf;
 	const u32 *input_config_params;
 	unsigned int input_config_params_size;
 	const u32 *output_config_params;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 2a45e605e140..68907ba6986f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -232,6 +232,7 @@ struct iris_platform_data sm8550_data = {
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
+	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
 	.input_config_params =
 		sm8550_vdec_input_config_params,
 	.input_config_params_size =
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 59fc133c9f98..712d37723ec3 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -11,6 +11,94 @@
 #include "iris_vb2.h"
 #include "iris_vdec.h"
 
+static int iris_check_core_mbpf(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u32 total_mbpf = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list)
+		total_mbpf += iris_get_mbpf(instance);
+	mutex_unlock(&core->lock);
+
+	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int iris_check_inst_mbpf(struct iris_inst *inst)
+{
+	struct platform_inst_caps *caps;
+	u32 mbpf, max_mbpf;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+	max_mbpf = caps->max_mbpf;
+	mbpf = iris_get_mbpf(inst);
+	if (mbpf > max_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int iris_check_resolution_supported(struct iris_inst *inst)
+{
+	u32 width, height, min_width, min_height, max_width, max_height;
+	struct platform_inst_caps *caps;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+	width = inst->fmt_src->fmt.pix_mp.width;
+	height = inst->fmt_src->fmt.pix_mp.height;
+
+	min_width = caps->min_frame_width;
+	max_width = caps->max_frame_width;
+	min_height = caps->min_frame_height;
+	max_height = caps->max_frame_height;
+
+	if (!(min_width <= width && width <= max_width) ||
+	    !(min_height <= height && height <= max_height))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int iris_check_session_supported(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance = NULL;
+	bool found = false;
+	int ret;
+
+	list_for_each_entry(instance, &core->instances, list) {
+		if (instance == inst)
+			found = true;
+	}
+
+	if (!found) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = iris_check_core_mbpf(inst);
+	if (ret)
+		goto exit;
+
+	ret = iris_check_inst_mbpf(inst);
+	if (ret)
+		goto exit;
+
+	ret = iris_check_resolution_supported(inst);
+	if (ret)
+		goto exit;
+
+	return 0;
+exit:
+	dev_err(inst->core->dev, "current session not supported(%d)\n", ret);
+
+	return ret;
+}
+
 int iris_vb2_buf_init(struct vb2_buffer *vb2)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
@@ -48,6 +136,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		goto unlock;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto unlock;
+
 	if (!inst->once_per_session_set) {
 		inst->once_per_session_set = true;
 
@@ -95,6 +187,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ret = iris_vdec_streamon_input(inst);
 	else if (V4L2_TYPE_IS_CAPTURE(q->type))

-- 
2.34.1


