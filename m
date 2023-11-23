Return-Path: <linux-arm-msm+bounces-1646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10C7F5A5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 09:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10CA51F20D22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1F311C87;
	Thu, 23 Nov 2023 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i9NofE63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47378BC;
	Thu, 23 Nov 2023 00:47:06 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN5q7B9019400;
	Thu, 23 Nov 2023 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=jpPNjtbFq54UX+LJMlI2ATd3HcoEWd0fPFi2EKnyjyg=;
 b=i9NofE63Sm8XJYUz14cbQN7Mjxj0EQ0bBbjXlPR8q3whXfeSqGqwzInUwQe+TIKak/rL
 9Eu/Q0diEVM7c7ktRv2xpl+7PZ1cfLYr/me9m1ulS4mZ1K8aKVmoHPk8CfbOubs0xb7y
 njnYvBeOO3LTEg3xnaiYpVJTfmHP/J9HzFli3MCxvnpWG6+ll0YHzMVatBsjyVwdbYMZ
 Japj/0Lv/8cQL2XSmA/EXfUszw+8Gsi/b4BuIZf0BMPWvlqcQQTZqMUzn6sDefC8M64k
 woWvn1AM9mriVd2YCj1bKaPNSC2ijB5zvkEkpZJZnEVhL0EbT3PMKoQV7/KdzjRTtz9y IQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhgajtndu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 08:46:49 +0000
Received: from pps.filterd (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AN8WDQY024629;
	Thu, 23 Nov 2023 08:46:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3uhwcrkk8y-1;
	Thu, 23 Nov 2023 08:46:48 +0000
Received: from NASANPPMTA03.qualcomm.com (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AN8anao029807;
	Thu, 23 Nov 2023 08:46:48 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3AN8klgv011366;
	Thu, 23 Nov 2023 08:46:48 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id A6EE020A68; Thu, 23 Nov 2023 00:46:47 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
        junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v5 00/10] Enable HS-G5 support on SM8550
Date: Thu, 23 Nov 2023 00:46:20 -0800
Message-Id: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wdr-4dnwV2WVW0s-DacmwJWP3QaRkEYT
X-Proofpoint-ORIG-GUID: Wdr-4dnwV2WVW0s-DacmwJWP3QaRkEYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_06,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230062
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series enables HS-G5 support on SM8550.

This series is rebased on below changes from Mani -
https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-1-manivannan.sadhasivam@linaro.org/
https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-2-manivannan.sadhasivam@linaro.org/

This series is tested on below HW combinations -
SM8550 MTP + UFS4.0
SM8550 QRD + UFS3.1
SM8450 MTP + UFS3.1 (for regression test)
SM8350 MTP + UFS3.1 (for regression test)

Note that during reboot test on above platforms, I occasinally hit PA (PHY)
error during the 2nd init, this is not related with this series. A fix for
this is mentioned in below patchwork -

https://patchwork.kernel.org/project/linux-scsi/patch/1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com/

Also note that on platforms, which have two sets of UFS PHY settings are
provided (say G4 and no-G4, G5 and no-G5). The two sets of PHY settings are
basically programming different values to different registers, mixing the
two sets and/or overwriting one set with another set is definitely not
blessed by UFS PHY designers. For SM8550, this series will make sure we
honor the rule. However, for old targets Mani and I will fix them in
another series in future.

v4 -> v5:
Removed two useless debug prints in patch #9

v3 -> v4:
1. Used .tbls_hs_overlay array instead of adding more tables with different names like .tbls_hs_g5

v2 -> v3:
1. Addressed comments from Andrew, Mani and Bart in patch #1
2. Added patch #2 as per request from Andrew and Mani
3. Added patch #4 to fix a common issue on old targets, it is not necessary
   for this series, but put in this series only because it would be easier
   to maintain and no need to rebase
4. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c

v1 -> v2:
1. Removed 2 changes which were exposing power info in sysfs
2. Removed 1 change which was moving data structs to phy-qcom-qmp-ufs.h
3. Added one new change (the 1st one) to clean up usage of ufs_dev_params based on comments from Mani
4. Adjusted the logic of UFS device version detection according to comments from Mani:
	4.1 For HW version < 0x5, go through dual init
 	4.2 For HW version >= 0x5
		a. If UFS device version is populated, one init is required
		b. If UFS device version is not populated, go through dual init

Bao D. Nguyen (1):
  scsi: ufs: ufs-qcom: Add support for UFS device version detection

Can Guo (9):
  scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
  scsi: ufs: ufs-qcom: No need to set hs_rate after
    ufshcd_init_host_param()
  scsi: ufs: ufs-qcom: Setup host power mode during init
  scsi: ufs: ufs-qcom: Limit negotiated gear to selected PHY gear
  scsi: ufs: ufs-qcom: Allow the first init start with the maximum
    supported gear
  scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts with HW version 5
  scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 5
    and newer
  phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550 UFS HS-G4 PHY Settings
  phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed Gear 5 support for
    SM8550

 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  12 ++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 196 ++++++++++++++++++---
 drivers/ufs/host/ufs-exynos.c                      |   7 +-
 drivers/ufs/host/ufs-hisi.c                        |  11 +-
 drivers/ufs/host/ufs-mediatek.c                    |  12 +-
 drivers/ufs/host/ufs-qcom.c                        |  92 +++++++---
 drivers/ufs/host/ufs-qcom.h                        |   5 +-
 drivers/ufs/host/ufshcd-pltfrm.c                   |  69 ++++----
 drivers/ufs/host/ufshcd-pltfrm.h                   |  10 +-
 11 files changed, 311 insertions(+), 107 deletions(-)

-- 
2.7.4


