Return-Path: <linux-arm-msm+bounces-61967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D698BAE2F69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 12:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 699FC7A8835
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDA4194A6C;
	Sun, 22 Jun 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D950iTo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706C1487ED;
	Sun, 22 Jun 2025 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750589175; cv=none; b=WnQiw3czYBV8TzXfgcypHmpCvPW72QwHx+n8aG3wEqtO495ZrU3s9IsHvPAsj3pe9TmTsLnZXnhXTA06HwKNEJ4t+ESNvyjQYvzeOnI2xB6ZuXyWZCPogj62kcHaG5rP76MHIeG8Ss7yY16q6eT6zfkQVzvG9yzVA6hN+tIfGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750589175; c=relaxed/simple;
	bh=kizRE/7A50Cyk2B3h4qUFJeTeSUtPyt043R/HLRIgRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLFFNWd4oO75DZxO0OxfH26FwOAEyK5HM7xarrpynCa75N/KSbWn/JUNQguIPb5GDgiAsnZ2wpl6HLAEMRtfzAUyrdLWbmSWScque/HtfKF0TMylDxpvFTbt9c1Lbqvmu3VL9xxaIeQmq4hZMeBe0hTioyRlRgnDFxbAOK6w9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D950iTo5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MAPba6013555;
	Sun, 22 Jun 2025 10:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dklWfapZVepCVoRgT7sgXjO0urQGfBXmmU9
	wG4RSUk0=; b=D950iTo5gXKkvTOwjRX8PDjBY7/GBqFkFDyMuv2aObRDFJD3r2x
	wnCIyQR1rhCVFhLz6UbpC9BuFbdvjTHJkYr3K4VwUhevz7ALgUzPJY7SbeG2S+GR
	xEwE9BacUeSSRatMw162/nBIWJq9BNT4hCd1AwDVL7CF2MxIYbJdCdCKSBbSbLh7
	FdUodSGcObwMNArmzQVcVU5PDfiLaywPMEuoWADnUjD3o1Gm6Nl98Qh2yNYMoYv2
	3GGcuE312qEiyL7UZ9DhTUEbf+sF4F8GT0qWzw2p5+N04++TbQyFgj+6UmFKVajp
	Ql4fNajHnmag2aKFFe9fXCPC4Tu+OdL82uQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7rc76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 10:45:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55MAjZ52017912;
	Sun, 22 Jun 2025 10:45:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47dntkecjw-1;
	Sun, 22 Jun 2025 10:45:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MAjZJc017906;
	Sun, 22 Jun 2025 10:45:35 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 55MAjYEN017905;
	Sun, 22 Jun 2025 10:45:35 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 2348560273E; Sun, 22 Jun 2025 16:15:34 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, andersson@kernel.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, quic_cang@quicinc.com,
        vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Aishwarya <aishwarya.tcv@arm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: [PATCH V1] scsi: ufs: qcom : Fix NULL pointer dereference in ufs_qcom_setup_clocks
Date: Sun, 22 Jun 2025 16:15:31 +0530
Message-ID: <20250622104531.19567-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zz67u5IWvJWDO6E7YryxmoBAFXD0s7n9
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=6857ded2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mPxzBgYThvL1vElN-AgA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA2NSBTYWx0ZWRfX/7B/9IMyYaLm
 Q/NVDYP6RVDrwXO0rE1E8ePp5uOcdNTNPX3TivT+kV9WtWCWmuAujvNNExMSDR01fZvy109u7qH
 tYMb5y208naOC+w/SaWEbYTFR/kjnhPOqXco6Y8XGyrPPF2WZbL1MmrDvHBlgujiWJkHPxLU5B0
 YVigum40Kn/A1St4eNeuvRXu2yw+8ndGp0UGh1C3Q0EK9d1f13Csszo9XncnFlcS8vTecFgcPJf
 djJ+TqX5r2OkKe6nahB+os9xL90yZ5Jtgq7cjbIfObm7BN5fADUZ5FsOsSI8tb/VowoQl0wYl7i
 +yumnIDB0CbHVQZJpg/zllAcqcrwb9SZN8HFe/6K9slhmb29y0PzExuQUegB5FdkbE6hZcWbI9j
 70VYds3Z1PKNgOyuDdlebWRtcdidp1WwlgWJ3pqvc+sgejz0GJF0Qb9fNpRsH8WkpcV5yqfw
X-Proofpoint-GUID: zz67u5IWvJWDO6E7YryxmoBAFXD0s7n9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220065

Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
uninitialized 'host' variable. The variable 'phy' is now assigned
after confirming 'host' is not NULL.

Call Stack:

[    6.448070] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    6.448449] ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
[    6.448466] ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142)
[    6.448477] ufshcd_init (drivers/ufs/core/ufshcd.c:9468)
[    6.448485] ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
[    6.448495] ufs_qcom_probe+0x28/0x68 ufs_qcom
[    6.448508] platform_probe (drivers/base/platform.c:1404)
[    6.448519] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
[    6.448526] __driver_probe_device (drivers/base/dd.c:799)
[    6.448532] driver_probe_device (drivers/base/dd.c:829)
[    6.448539] __driver_attach (drivers/base/dd.c:1216)
[    6.448545] bus_for_each_dev (drivers/base/bus.c:370)
[    6.448556] driver_attach (drivers/base/dd.c:1234)
[    6.448567] bus_add_driver (drivers/base/bus.c:678)
[    6.448577] driver_register (drivers/base/driver.c:249)
[    6.448584] __platform_driver_register (drivers/base/platform.c:868)
[    6.448592] ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
[    6.448605] do_one_initcall (init/main.c:1274)
[    6.448615] do_init_module (kernel/module/main.c:3041)
[    6.448626] load_module (kernel/module/main.c:3511)
[    6.448635] init_module_from_file (kernel/module/main.c:3704)
[    6.448644] __arm64_sys_finit_module (kernel/module/main.c:3715.

Fixes: 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off calls")

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Aishwarya <aishwarya.tcv@arm.com>
Closes: https://lore.kernel.org/lkml/20250620214408.11028-1-aishwarya.tcv@arm.com/
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linux-scsi/CA+G9fYuFQ2dBvYm1iB6rbwT=4b1c8e4NJ3yxqFPGZGUKH3GmMA@mail.gmail.com/T/#t
Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index ba4b2880279c..318dca7fe3d7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1124,7 +1124,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
+	struct phy *phy;
 	int err;

 	/*
@@ -1135,6 +1135,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 	if (!host)
 		return 0;

+	phy = host->generic_phy;
+
 	switch (status) {
 	case PRE_CHANGE:
 		if (on) {
--
2.48.1


