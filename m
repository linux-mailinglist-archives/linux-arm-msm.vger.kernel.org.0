Return-Path: <linux-arm-msm+bounces-22601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11E907893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614A01F21618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6174563A5;
	Thu, 13 Jun 2024 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SdG3oHth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512912D775;
	Thu, 13 Jun 2024 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297138; cv=none; b=GM9/BSX0V6awjPhpCFhxP8EQWuF6GQyJXUyYoTCjUjRGLOwja7Znoq2Uhme3Ja+JNqCiaQ1KgeKhF3DK6v8oQn9B4Tl0bcV13jYqOL7NERIh8TWjqJWHr1P4Z4ui+Ab+7/FxwcoOutMuG3G5BY6AN2gLDuX4ItMeXNGRlSv1Kvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297138; c=relaxed/simple;
	bh=tiljCiNLvQGlJmjyR9Odqrxtift+JD+Stzcu183Qx4I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QISi4Y29dU15O5LrjBhV+xX9s8KKEs5Es5HLCNs2p86Fihe402edbmgvrzn9Cfnxc2BWaTovXgU0IvrM2b4knMElxYqQXTVoCzZ2wUnqUOchXn60fEaJL9/xn+zAo/zR1i+LkE2E33ZdpSui3InYkgVTRg7HmtG0NmEemHNagMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SdG3oHth; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DEXQc6001018;
	Thu, 13 Jun 2024 16:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PRE9Shmd/Dulfe9+6Jgtbb
	tk2F/LuqPjSOhBVuWT80I=; b=SdG3oHthUbhE6UaFags5CYfb0Ok1n59r8WuBd+
	eJzInV70JwhK+0EV2oADFp6grZZWhyr5JYsn+o+lfaXJ2i5qndrwET1cmATuwwzD
	Py3Q/lmGVQi9LkwVAcLIR75WUNZBu9hML+GV3FW5p5jMpX7ogKieZUuYxtiMvDdq
	JKeC4AweSDVoMfB8Dbpkc0I+VmoWYX1ucpBp5rG6sb1u965f3tTsKnMCe5sg23HJ
	JNDQv4ClQ4hyJBIshmC11yBwYkGFZP4FGFdAupyoqd/4hsSjudFfGQ5RDamC1Bp4
	6GIUav/7qhg9Ai1NZBlVWDEergM4lRU+YzkExBoj8BnFlJJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqukc9nec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 16:45:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DGjRGR006196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 16:45:27 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Jun 2024 09:45:23 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <thara.gopinath@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH] soc: qcom: icc-bwmon: Fix refcount imbalance seen during bwmon_remove
Date: Thu, 13 Jun 2024 22:15:06 +0530
Message-ID: <20240613164506.982068-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: Tk_GMHvcatbzUhbysq0mQ6TfHl9eutXt
X-Proofpoint-ORIG-GUID: Tk_GMHvcatbzUhbysq0mQ6TfHl9eutXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_11,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130118

The following warning is seen during bwmon_remove due to refcount
imbalance, fix this by releasing the OPPs after use.

Logs:
WARNING: at drivers/opp/core.c:1640 _opp_table_kref_release+0x150/0x158
Hardware name: Qualcomm Technologies, Inc. X1E80100 CRD (DT)
...
Call trace:
_opp_table_kref_release+0x150/0x158
dev_pm_opp_remove_table+0x100/0x1b4
devm_pm_opp_of_table_release+0x10/0x1c
devm_action_release+0x14/0x20
devres_release_all+0xa4/0x104
device_unbind_cleanup+0x18/0x60
device_release_driver_internal+0x1ec/0x228
driver_detach+0x50/0x98
bus_remove_driver+0x6c/0xbc
driver_unregister+0x30/0x60
platform_driver_unregister+0x14/0x20
bwmon_driver_exit+0x18/0x524 [icc_bwmon]
__arm64_sys_delete_module+0x184/0x264
invoke_syscall+0x48/0x118
el0_svc_common.constprop.0+0xc8/0xe8
do_el0_svc+0x20/0x2c
el0_svc+0x34/0xdc
el0t_64_sync_handler+0x13c/0x158
el0t_64_sync+0x190/0x194
--[ end trace 0000000000000000 ]---

Fixes: 0276f69f13e2 ("soc: qcom: icc-bwmon: Set default thresholds dynamically")
Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/soc/qcom/icc-bwmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index fb323b3364db..ecddb60bd665 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -565,7 +565,7 @@ static void bwmon_start(struct icc_bwmon *bwmon)
 	int window;
 
 	/* No need to check for errors, as this must have succeeded before. */
-	dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_low, 0);
+	dev_pm_opp_put(dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_low, 0));
 
 	bwmon_clear_counters(bwmon, true);
 
@@ -772,11 +772,13 @@ static int bwmon_probe(struct platform_device *pdev)
 	opp = dev_pm_opp_find_bw_floor(dev, &bwmon->max_bw_kbps, 0);
 	if (IS_ERR(opp))
 		return dev_err_probe(dev, PTR_ERR(opp), "failed to find max peak bandwidth\n");
+	dev_pm_opp_put(opp);
 
 	bwmon->min_bw_kbps = 0;
 	opp = dev_pm_opp_find_bw_ceil(dev, &bwmon->min_bw_kbps, 0);
 	if (IS_ERR(opp))
 		return dev_err_probe(dev, PTR_ERR(opp), "failed to find min peak bandwidth\n");
+	dev_pm_opp_put(opp);
 
 	bwmon->dev = dev;
 
-- 
2.34.1


