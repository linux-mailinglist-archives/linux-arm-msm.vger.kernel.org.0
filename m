Return-Path: <linux-arm-msm+bounces-39952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0589E0DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 22:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E363B3C12F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89551DEFF4;
	Mon,  2 Dec 2024 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PnfW2M6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA71DEFC6;
	Mon,  2 Dec 2024 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733172166; cv=none; b=oVqNODBAcXcfHCNwdcLW7NeSY3myO5bF7sKFY4XVUSTh58DiitAGrZXHuYIKEKdHdwz+tmNJA/nwhz7LgXOhDtfX+mZgN7TR48IdBLnF+vsfskC57eWw15P/tC82Xbc4D3eu5Sckt9Q9MVJBljzL7QbxuqFgUkt0U0lIAIOWvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733172166; c=relaxed/simple;
	bh=8xU8eZvxuxJZRudg+03NMMrCYKY67CgFbv6HcpsX0CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qvpxlDPjH87AtZgmdcH5QNFexJ2Jn6M2WYta0K8s10z9AUo7nkicvhU3OwhNhMA4Oxuvqm/HPulqupbmwx/7XKgHJAEKH/JcTKd7zMoM+5tzwubbZvAfscNgE6It2QQ4VPL2x263NIc5rXexDZXjb2H6DxbmoVmGwUJ14UEwSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PnfW2M6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2K9dJc002804;
	Mon, 2 Dec 2024 20:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVmZna+XbYf+uUPJxg0T3pmfRS7RDVjCkPeIXRm81gA=; b=PnfW2M6/apYhs833
	yUh2DmFG15kprWwlFB5+P0kSrwuk18PeSwmZkxBJEJe6gg3G5TpN7ebnyzBRuuaW
	4Ih8ARynQNTkY6UYWEl1+ZJdUGq4kQs7L5aXGuHspLR7Wpuv9jdlnm9APOSSZolG
	sohyFB6wfWrixKtNYtcgv+kfdtP7J3YQoJXiauGO6YMejF0Gu8WJgJTXHhzWMxwp
	G3CtiE1RSIl2WVgiughfHGcuRdnofXGprMNqL5+ZiJYqGUqz0iUROGL2s/5YodLo
	BDoO28MtYV8DsNFwP8M+nlBCCAG1px1NTutZiCo+hPquhlXQVwZvOVILNFFUdB5H
	YpDNUw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjwsdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 20:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2Kga9i029657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 20:42:36 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 12:42:35 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 12:42:00 -0800
Subject: [PATCH 3/3] drm/msm/dp: add a debugfs node for using tpg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733172154; l=3055;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=8xU8eZvxuxJZRudg+03NMMrCYKY67CgFbv6HcpsX0CA=;
 b=4/ROjG1S7kkiQW2W6xJJvNSX5rNWFt7upb0DJunvrd04bgETUqKSs9h8eftzb6NsxXhwVpFx9
 JP/udaRE1NpA/kZpT9tCAjzKExBq+T0TG1TAzgV6Bgd391F+hWIpJec
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PJnDwuu67LYDulM6sF_bp-nAaWxHrNEM
X-Proofpoint-ORIG-GUID: PJnDwuu67LYDulM6sF_bp-nAaWxHrNEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020173

DP test pattern generator is a very useful tool to debug issues
where monitor is showing incorrect output as it helps to isolate
whether the issue is due to rest of DPU pipeline or in the DP
controller itself. Expose a debugfs to use the TPG configuration
to help debug DP issues.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 61 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 22fd946ee201..843fe77268f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -197,6 +197,65 @@ static const struct file_operations test_active_fops = {
 	.write = msm_dp_test_active_write
 };
 
+static ssize_t msm_dp_tpg_write(struct file *file, const char __user *ubuf,
+				size_t len, loff_t *offp)
+{
+	const struct msm_dp_debug_private *debug;
+	char *input_buffer;
+	int val;
+	int status = 0;
+	struct msm_dp_panel *dp_panel;
+
+	debug = ((struct seq_file *)file->private_data)->private;
+	dp_panel = debug->panel;
+
+	input_buffer = memdup_user_nul(ubuf, len);
+	if (IS_ERR(input_buffer))
+		return PTR_ERR(input_buffer);
+
+	status = kstrtoint(input_buffer, 10, &val);
+	if (status < 0) {
+		kfree(input_buffer);
+		return status;
+	}
+
+	msm_dp_panel_tpg_config(dp_panel, val);
+
+	dp_panel->tpg_enabled = val;
+
+	kfree(input_buffer);
+
+	*offp += len;
+	return len;
+}
+
+static int msm_dp_tpg_show(struct seq_file *f, void *data)
+{
+	struct msm_dp_debug_private *debug = f->private;
+	struct msm_dp_panel *dp_panel = debug->panel;
+
+	if (dp_panel->tpg_enabled)
+		seq_puts(f, "1");
+	else
+		seq_puts(f, "0");
+
+	return 0;
+}
+
+static int msm_dp_tpg_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, msm_dp_tpg_show, inode->i_private);
+}
+
+static const struct file_operations msm_dp_tpg_fops = {
+	.owner = THIS_MODULE,
+	.open = msm_dp_tpg_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = msm_dp_tpg_write
+};
+
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
 		  struct drm_connector *connector,
@@ -231,6 +290,8 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		debugfs_create_file("dp_test_type", 0444,
 				    root,
 				    debug, &msm_dp_test_type_fops);
+
+		debugfs_create_file("dp_tpg", 0444, root, debug, &msm_dp_tpg_fops);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 0e944db3adf2..7910b11fd685 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -50,6 +50,8 @@ struct msm_dp_panel {
 	u32 max_dp_link_rate;
 
 	u32 max_bw_code;
+
+	bool tpg_enabled;
 };
 
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);

-- 
2.34.1


