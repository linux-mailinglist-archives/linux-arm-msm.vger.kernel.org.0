Return-Path: <linux-arm-msm+bounces-16615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3423589A896
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 05:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39850B20C86
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 03:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8FE13ACC;
	Sat,  6 Apr 2024 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jP/ES/PU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6078E1BF2A;
	Sat,  6 Apr 2024 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712373370; cv=none; b=ezskC9RKUq4Ei8oST7/bGpkXMVGvpQwCxRHomEjsliDxCPmsQrk9SkP0tZ4m3taTuBnjJLHNhXt31XUTv1nQxhmSOKhAx08+c+xTaQ+P0wYltwOwMYbQtqqR0PXKmo67LEBubXX0IkiiVDBwpPtr6Jjt4Asuo98r0G5lSybj3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712373370; c=relaxed/simple;
	bh=7iVVIeCIaeddrVJDWv2k6XSmkT+lw8CdqexMk9/S9y0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWWL0QsMsncE8nYt7/5a0IUkeO+TRzZW7N553nNxzoPFJrn9oXnC6B6dSfv/bQWu9KCyBWhLLAw/Kf+3b2PrO9swfM/Zid1baBKtblQOFOSenUNwLe6wghDa4iQ5FPfAVgfFm2JBI/hr6u/vqrLRAR6y1UEwkk6UTZYS+hyqOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jP/ES/PU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4362uPoq027459;
	Sat, 6 Apr 2024 03:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=8e7K1ZI
	uNe7swty97ta2beArCZ5WELl3PnRnzrT2CfQ=; b=jP/ES/PUsjBH1e/oAE1hgYx
	kuGF+Qlbgptnvp7APhH8xNMpkIvS+5VmkHUHYZIWv9tL9E/3mey26PCSWk/B5U16
	TPWs7+PN+xsciM4EiS7ft91S3ZYlEv1F9TvQNw7QLML+emlz268T2rIgjZhLhFnf
	b2i66Be9v0JtaeAoWdns5xqz2ujAzgHmyE7num+DNwvS90zCybKGbbP7mjIAsdJ/
	N0EHFUdWWrkEweodexqUJvFSlH6kYDXM/UdfMz1ivdayIRPG1mEDxei6UXXaYwzA
	0NvMEyxmT4AdCwYXGYp7ygADzdl5byURTx1rstUZUv6Ca8gEBrqqyEQ7lUB7Bdw=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xawdcg1uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Apr 2024 03:15:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4363FvmC018149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 6 Apr 2024 03:15:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 20:15:56 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
        <quic_bjorande@quicinc.com>, <johan@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle() directly for external HPD
Date: Fri, 5 Apr 2024 20:15:47 -0700
Message-ID: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0irvAP2_jKJRQupanpi4uIFFyXTBYDCq
X-Proofpoint-ORIG-GUID: 0irvAP2_jKJRQupanpi4uIFFyXTBYDCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-06_02,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404060023

From: Kuogee Hsieh <quic_khsieh@quicinc.com>

For HPD events coming from external modules using drm_bridge_hpd_notify(),
the sequence of calls leading to dp_bridge_hpd_notify() is like below:

dp_bridge_hpd_notify+0x18/0x70 [msm]
drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
drm_helper_probe_detect+0x94/0xc0 [drm_kms_helper]
drm_helper_probe_single_connector_modes+0x43c/0x53c [drm_kms_helper]
drm_client_modeset_probe+0x240/0x1114 [drm]
drm_fb_helper_hotplug_event.part.26+0x9c/0xe8 [drm_kms_helper]
drm_fb_helper_hotplug_event+0x24/0x38 [drm_kms_helper]
msm_fbdev_client_hotplug+0x24/0xd4 [msm]
drm_client_dev_hotplug+0xd8/0x148 [drm]
drm_kms_helper_connector_hotplug_event+0x30/0x3c [drm_kms_helper]
drm_bridge_connector_handle_hpd+0x84/0x94 [drm_kms_helper]
drm_bridge_connector_hpd_cb+0xc/0x14 [drm_kms_helper]
drm_bridge_hpd_notify+0x38/0x50 [drm]
drm_aux_hpd_bridge_notify+0x14/0x20 [aux_hpd_bridge]
pmic_glink_altmode_worker+0xec/0x27c [pmic_glink_altmode]
process_scheduled_works+0x17c/0x2cc
worker_thread+0x2ac/0x2d0
kthread+0xfc/0x120

There are three notifications delivered to DP driver for each notification event.

1) From the drm_aux_hpd_bridge_notify() itself as shown above

2) From output_poll_execute() thread which arises due to
drm_helper_probe_single_connector_modes() call of the above stacktrace
as shown in more detail here.

dp_bridge_hpd_notify+0x18/0x70 [msm]
drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
drm_helper_probe_detect+0x94/0xc0 [drm_kms_helper]
drm_helper_probe_single_connector_modes+0x43c/0x53c [drm_kms_helper]
drm_client_modeset_probe+0x240/0x1114 [drm]
drm_fb_helper_hotplug_event.part.26+0x9c/0xe8 [drm_kms_helper]
drm_fb_helper_hotplug_event+0x24/0x38 [drm_kms_helper]
msm_fbdev_client_hotplug+0x24/0xd4 [msm]
drm_client_dev_hotplug+0xd8/0x148 [drm]
drm_kms_helper_hotplug_event+0x30/0x3c [drm_kms_helper]
output_poll_execute+0xe0/0x210 [drm_kms_helper]

3) From the DP driver as the dp_bridge_hpd_notify() callback today triggers
the hpd_event_thread for connect and disconnect events respectively via below stack

dp_bridge_hpd_notify+0x18/0x70 [msm]
drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
drm_helper_probe_detect_ctx+0x98/0x110 [drm_kms_helper]
check_connector_changed+0x4c/0x20c [drm_kms_helper]
drm_helper_hpd_irq_event+0x98/0x120 [drm_kms_helper]
hpd_event_thread+0x478/0x5bc [msm]

dp_bridge_hpd_notify() delivered from output_poll_execute() thread
returns the incorrect HPD status as the MSM DP driver returns the value
of link_ready and not the HPD status currently in the .detect() callback.

And because the HPD event thread has not run yet, this results in two complementary
events.

To address this, fix dp_bridge_hpd_notify() to call dp_hpd_plug_handle/unplug_handle()
directly to return consistent values for the above scenarios.

changes in v3:
	- Fix the commit message as per submitting guidelines.
	- remove extra line added

changes in v2:
	- Fix the commit message to explain the scenario
	- Fix the subject a little as well

Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d80f89581760..bfb6dfff27e8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!dp_display->link_ready && status == connector_status_connected)
-		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		dp_hpd_plug_handle(dp, 0);
 	else if (dp_display->link_ready && status == connector_status_disconnected)
-		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		dp_hpd_unplug_handle(dp, 0);
 }
-- 
2.43.2


