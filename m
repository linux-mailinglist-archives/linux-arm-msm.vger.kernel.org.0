Return-Path: <linux-arm-msm+bounces-26521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBE9347CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC3C1C20E35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548DD26ACF;
	Thu, 18 Jul 2024 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qxf7Osif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897C14AED1;
	Thu, 18 Jul 2024 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721282640; cv=none; b=tz00NCSYGALt190gI+ND3J+bFJwxNraygnj82YxGLCTqk9oUuNn7dpS+Gqa7poU4DKKD2YTZCziErK7Q+6xV++oFL9Tts/kM7Mb+sMdcDsG5tr21OuRxxwaXbzq+N8obPlfaEYFjR6oxdV+HzshEBbU+aU0CsZUvPMaaHyi9jRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721282640; c=relaxed/simple;
	bh=NZ3ng2iZcjXEfmc3D40nbbx/ZyOe2D+kdxHgxKcXUbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=qv3KFrCh/n0q71/XbJeEk1QX1IEGatOGkxoCoYYNbbbJfneJ7/U/Yocj5LS4QVf+V0B75H4siLY5ud0A3p32Wr3dfn7IqiybxG77gIl9/q+TsfEUpRzbVUzVfEj0pjJ3bCAggkrPAGx6FaZomxCTZevAOYDeEeFFa+OwmKILwlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qxf7Osif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I5f4Ns008355;
	Thu, 18 Jul 2024 06:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vlQY4FXkD/U9iUSMXAzp43
	NvlX/hl5sdIfBON9ao3sc=; b=Qxf7OsifQWPHyzJfFo/spQn+E5oXdykDpQNstk
	kVS4uLgfuaKg2XAS6Ak+GZLUoi83VL3rAlB+IPshtGntI4q+iUGByqoNgoCpJuHE
	K57jWh0w0c9bnqVDYz2y17sSg6WZAOfq203zLjEj2GgUaH6spi7gJsWkerjgmO+M
	R72JFxoWK8ma9b7XSXjhLLKFfNKLGMfbFcilXUMtHJNOmJx2LvN9xkoW/Xaxhqif
	qeD6ODW+eTvU7RGE1kA7k9Tnq1v9+Xo1F/3Rw6R2IgCBEwDik/3gvXDO8yfOwDde
	19UcjE6BA/VvIvz25dSCEe3XNOex8SXjc8DanrnoGpXbbhBA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfu4f8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:03:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I63gkP000418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:03:42 GMT
Received: from hu-mkshah-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:03:37 -0700
From: Maulik Shah <quic_mkshah@quicinc.com>
Date: Thu, 18 Jul 2024 11:33:23 +0530
Subject: [PATCH v2] soc: qcom: cmd-db: Map shared memory as WC, not WB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACqwmGYC/0XMTQ6CMBBA4auYWVtShp+CK+9hDCnTwTZaSooQC
 eHuNm5cfov3dpg5Op7hctoh8upmF8YEPJ+ArB4fLJxJBpRYSpU3grzpTN8tI2mybAQ3bW10RRW
 2NaRqijy4z+94uycPMXjxtpH1/1OgQinbXGVYqVoWpcjFGl7BbH6LXa97ssvzypP2GQUPx/EFw
 1Q65qcAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <caleb.connolly@linaro.org>, <stephan@gerhold.net>, <swboyd@chromium.org>,
        <dianders@chromium.org>, <robdclark@gmail.com>, <nikita@trvn.ru>,
        <quic_eberman@quicinc.com>, <quic_pkondeti@quicinc.com>,
        <quic_lsrao@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        <stable@vger.kernel.org>,
        Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>,
        Maulik Shah <quic_mkshah@quicinc.com>
X-Mailer: b4 0.12.5-dev-2aabd
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721282617; l=2071;
 i=quic_mkshah@quicinc.com; s=20240109; h=from:subject:message-id;
 bh=lKAIUb1skUkA8cL4EPiYWVNEAhYmNSsLm3hrt7vTGws=;
 b=6hCYuosMLrGlEhy14UfQUk3w8yLUpMDXqzOv48AtomrT5PHSzKYN11QC6DBRnBx54hITFszSz
 irz48zwvpGMBgzDW25DGEFwOod49uUiIxF+HvQid2ULK9iTlxtCWgIA
X-Developer-Key: i=quic_mkshah@quicinc.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H62BE5nWWiN7h4iV7B0cjeGlWH15OCnp
X-Proofpoint-GUID: H62BE5nWWiN7h4iV7B0cjeGlWH15OCnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_02,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180039

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Linux does not write into cmd-db region. This region of memory is write
protected by XPU. XPU may sometime falsely detect clean cache eviction
as "write" into the write protected region leading to secure interrupt
which causes an endless loop somewhere in Trust Zone.

The only reason it is working right now is because Qualcomm Hypervisor
maps the same region as Non-Cacheable memory in Stage 2 translation
tables. The issue manifests if we want to use another hypervisor (like
Xen or KVM), which does not know anything about those specific mappings.

Changing the mapping of cmd-db memory from MEMREMAP_WB to MEMREMAP_WT/WC
removes dependency on correct mappings in Stage 2 tables. This patch
fixes the issue by updating the mapping to MEMREMAP_WC.

I tested this on SA8155P with Xen.

Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
Cc: stable@vger.kernel.org # 5.4+
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Tested-by: Nikita Travkin <nikita@trvn.ru> # sc7180 WoA in EL2
Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
---
Changes in v2:
 - Use MEMREMAP_WC instead of MEMREMAP_WT
 - Update commit message from comments in v1
 - Add Fixes tag and Cc to stable
 - Link to v1: https://lore.kernel.org/lkml/20240327200917.2576034-1-volodymyr_babchuk@epam.com
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index d84572662017..ae66c2623d25 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -349,7 +349,7 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WB);
+	cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WC);
 	if (!cmd_db_header) {
 		ret = -ENOMEM;
 		cmd_db_header = NULL;

---
base-commit: 797012914d2d031430268fe512af0ccd7d8e46ef
change-id: 20240718-cmd_db_uncached-e896da5c5296

Best regards,
-- 
Maulik Shah <quic_mkshah@quicinc.com>


