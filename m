Return-Path: <linux-arm-msm+bounces-61977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B16AE313C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 19:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6863F188E48C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 17:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABF518B47E;
	Sun, 22 Jun 2025 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hu55d6Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9B73C0C;
	Sun, 22 Jun 2025 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614744; cv=none; b=PVhKEoZx9aNAKZR7lINmwuq7t5NJ8w2OT0EgT/ke7ANFY+pz2dv5UP0WLxWkHQ8XcjLSYacmZqbN1OPyGPpAIHdlquiOWam8tIDFligqzXVGbq4OiQbrgqo4qG8h1WbJAMsCQ/BDYBKmEfSiwO1TSmBKcSVgSriRFi//ltJAeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614744; c=relaxed/simple;
	bh=2ySbfvowmGyVdShZeOrCyc7ENx6FiVyD4Zyff7UgliI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RITLl0aSHL4abbkPtB7+eGO7b1K+GItVE83nDxadmwaeHK/uKVjSFOalQKFm4iUtNXPiNarFJ6fPMqq5IkbCyDgXK/CMU2sYxyYpvHT1ejIvXpQQx+8q/YUbg3grdTo8Uy+YMIYWpL8KVHV6udeihABZQ3Lz8t7NFh6L2GXWRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hu55d6Pk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCEp9T005772;
	Sun, 22 Jun 2025 17:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bEXHaYmDWX15yhX9P8pzH4iO6nQh8BF0Gm4
	umihiL14=; b=Hu55d6Pkp0vtQlnIcJMG8RGcalx3/j8Fs/kCxThZpef7h5lzn5J
	2UjbOaXMQoz8KbKerMfgGGYWX3C7q6U5dzb9z5WOCCeFsXpO0i6/SZL0Xi7qXNwF
	7scfbICcmTnjrmom8eCKp8fCEuz+E1p5mlw1ejpJyK+e+2uvDOT+Qszqr0YlMT61
	ZiHsr9o+soN5i2fRpeDQMIEGfA8VwbCkqiFVaHE7DvsU/myZ2JirCwWELceUZtVn
	V1uGfqA4KG6CZmB+iKqdfQqOOC5MEY0m618Q95v3wDFP4VFpppuZAZMUKqeW1qcf
	wuIbxv570aYoQHuGkp5Zw6FHNglqdE7TDNA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdgn4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 17:51:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55MHpoXs024348;
	Sun, 22 Jun 2025 17:51:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47dntkjh95-1;
	Sun, 22 Jun 2025 17:51:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MHpoYi024342;
	Sun, 22 Jun 2025 17:51:50 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 55MHpofs024341;
	Sun, 22 Jun 2025 17:51:50 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8BB0361C6BD; Sun, 22 Jun 2025 23:21:49 +0530 (+0530)
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
Subject: [PATCH V2] scsi: ufs: qcom : Fix NULL pointer dereference in ufs_qcom_setup_clocks
Date: Sun, 22 Jun 2025 23:21:48 +0530
Message-ID: <20250622175148.15978-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=685842ba cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=GEESCAkq0iLmtVC71CkA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tPpPFcLpflMB3ALJ2oJZC2CagTNh9zJo
X-Proofpoint-ORIG-GUID: tPpPFcLpflMB3ALJ2oJZC2CagTNh9zJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDExMyBTYWx0ZWRfX5Y3033DbUPko
 sITrigtoRzSzRHTTt3T5aQwFkYWH9fb0Qq+IX3Vee5124yET0mjnOreEg+6RbdW4VnXExkW5aHp
 t7S/nucioHdexnu1kM/dFti/rhA/m4b7NbeD4G9xbgKbfe1Oo5D0yfthQANXqaXFPj8ksCZ8uJn
 QdOSyEl95kvhEuzVXgWI8+/amwa0hFJ+VwGj0iqublb6Gs5mIe/nnC0Blqc9ltzvQoxLzFZrBWQ
 ZZwTaeFPYpFlIdYi+ijyVSgFlMiCfFiH6b/80OI2v08sijRNpRkfN1CcM8I2CvDI1TTSPr7hD4+
 n6k97Wyj5cq6WvGeyN/X7FAtyZPnZFrt9Q8KjmE1zqnNSziGo3geVp3P550ijs1J9diCqA2sxT/
 3mlePPQbvYatrkWpr5AST8608NDejceyhcoS/fq561R5uCdUPGINfCBo18qPShWON/FEAxz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506220113

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
Fixes: 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off calls")
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # sc8180x-primus
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


