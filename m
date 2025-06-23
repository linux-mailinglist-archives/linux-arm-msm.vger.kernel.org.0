Return-Path: <linux-arm-msm+bounces-62081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C531AE456F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 15:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488591750A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DFC2517AF;
	Mon, 23 Jun 2025 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dOKJxFWY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668F248F5A;
	Mon, 23 Jun 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686520; cv=none; b=s0MQG6vaUADNGaR8V9XqAB4gO4WAK7MbaeZ5g0eOwpSxOX/uSdgCVsmdBDgFKrl7KL6Avsxl1fgV3Ssk8wy73qu3yPIg2rZhNK/HFeLTOrscCL55KyKhki7ic88TjqDYSK49i5vSDPCGs9C77KHjfnoM8BLLpXnMjkjokjXeHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686520; c=relaxed/simple;
	bh=rCljqgj9u0KOSlzhorgYidwdA17Dj2+2K9oDr7p+rrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHxtrDYkMDXNpKnnheTNBJ7rMlyAW/lfVCEVth+Qta+/wicbO5ZcQ8D6Lsm/pMzbARC2w6ifugCV4ESZEbL70vW/6732NCesDfnQ7ok16pbrn1pYOJTrUAnBwH1Z7AExWKSxhGf8RyQHAaBuZvW14OCFT7cAY8S2wzKWTaro+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dOKJxFWY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8Lfme005909;
	Mon, 23 Jun 2025 13:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OslTsRMCpfk1DbUN2g4TT3w/UujC7FSFBQE
	mwtRJqg8=; b=dOKJxFWYRSODWhx8/9RmdHVljIa6QzAWwfbvz1uN4ZNr9lrJr7M
	UyWp/m2/t3gh2st+bd5e0DldUXhMx/FM1s+pz2ML7qO36O4T69hZP1pbPf9E5kT3
	jMVMNvhEbo+n3ILYd3yQtAY8DWN0bAaB/e7jsYT5ss+uxE1OMRTZdx9w9J3sqzVn
	Y4coK5O7Gb13OskXkH0UCxagjCoXB7T/iOgr9ocQUmoOv9uAqhWkK9nuogjFWBjo
	21wQmA4sOsaU4uAUOXjCMoDNfex2XdD0ObiRbPTOfaX1nJCc/oz25qJ4/L4qPCEL
	0BQUga+VnFh3NZAOLV0RqOXlRIKr6ZpF2zA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8vqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 13:48:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55NDmDda020527;
	Mon, 23 Jun 2025 13:48:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47dntkrcj6-1;
	Mon, 23 Jun 2025 13:48:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NDmDAb020522;
	Mon, 23 Jun 2025 13:48:13 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 55NDmDr7020520;
	Mon, 23 Jun 2025 13:48:13 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 5051861C6AB; Mon, 23 Jun 2025 19:18:12 +0530 (+0530)
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
Subject: [PATCH V3] scsi: ufs: qcom : Fix NULL pointer dereference in ufs_qcom_setup_clocks
Date: Mon, 23 Jun 2025 19:18:09 +0530
Message-ID: <20250623134809.20405-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: J9G56p8VOYHZmQLrYe4biKsyCOAZejix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MiBTYWx0ZWRfX1jFkzZvBuQqj
 KhiqMKIOAzsJKOhEtmMe/Q3yLPNsrdxvDYaGsonxvd4Eu8hGOpS+LIkVymDMW/AuXTrX0f3uSpf
 wR3VTi+ZXbwCE95oA8AqxjvOL+tsZY7HkcTOVaGBQ3tW/2UBqqROVdMyx1AVadhn0hB5S6SNdah
 DmI07cfmQpZNp0gRpYAN4R4oFuAES2fv62zKDysTeIhwrqNwJSJQLOTT4FkNzrzSdfgTuU8h/yT
 Bge+wVF0+9huJL2h44hb9KNxRNczCPnY3jKjCuJvYhkE+PK3GJsunFCJdj1wN94+npbyna0SfyN
 5AhjdfTiQjlTeCWBFJ6jlBYpr/UPsh8ujZwqGPxia7afgbRWWwKhJ/Q2jtfy0mctL2LrPQqFOLr
 ihPyMPyh8OVyRcXN+aMpaEAi/teFk3aPB1TziOwSMMox1QWPRIsiSnKYdhyUoDVE1E5DVWOX
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=68595b21 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=GEESCAkq0iLmtVC71CkA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: J9G56p8VOYHZmQLrYe4biKsyCOAZejix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230082

Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
uninitialized 'host' variable. The variable 'phy' is now assigned
after confirming 'host' is not NULL.

Call Stack:

Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000

ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142)
ufshcd_init (drivers/ufs/core/ufshcd.c:9468)
ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
ufs_qcom_probe+0x28/0x68 ufs_qcom
platform_probe (drivers/base/platform.c:1404)
really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
__driver_probe_device (drivers/base/dd.c:799)
driver_probe_device (drivers/base/dd.c:829)
__driver_attach (drivers/base/dd.c:1216)
bus_for_each_dev (drivers/base/bus.c:370)
driver_attach (drivers/base/dd.c:1234)
bus_add_driver (drivers/base/bus.c:678)
driver_register (drivers/base/driver.c:249)
__platform_driver_register (drivers/base/platform.c:868)
ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
do_one_initcall (init/main.c:1274)
do_init_module (kernel/module/main.c:3041)
load_module (kernel/module/main.c:3511)
init_module_from_file (kernel/module/main.c:3704)
__arm64_sys_finit_module (kernel/module/main.c:3715.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Fixes: 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off calls")
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reported-by: Aishwarya <aishwarya.tcv@arm.com>
Closes: https://lore.kernel.org/lkml/20250620214408.11028-1-aishwarya.tcv@arm.com/
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linux-scsi/CA+G9fYuFQ2dBvYm1iB6rbwT=4b1c8e4NJ3yxqFPGZGUKH3GmMA@mail.gmail.com/T/#t
Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
Changes from v2:
1. Added tested-by and reviewed-by tag.

Changes from v1:
1. Addressed Manivannan's and Dmitry's comment to modify commit text.

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


