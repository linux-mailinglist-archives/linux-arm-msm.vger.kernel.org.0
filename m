Return-Path: <linux-arm-msm+bounces-45791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C8A18F16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0C4E3A2634
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C522916BE3A;
	Wed, 22 Jan 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kTBGf3qU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B8136A;
	Wed, 22 Jan 2025 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540192; cv=none; b=dLgyOuL2R9LhCexxshPSMqB+lmd6kGPi3KrjmIMpIDHLhDakDXB3SPc5MtEJ/UFo1TtUa43MAq/EAPYJUypq97UJmJzxR2L5smGbUFsVA2DbSvOTdYRu5xIGBq5MjiR6YpoP10uNeu15W1qTSl8TKo3FDw7K/9RGxxcTbKU/UU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540192; c=relaxed/simple;
	bh=UCJAnl2vBWJBu9pl42wXkxItxLEMO55w+0aQSAWRg+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qJWSwhEzompff3sF2bszc8bMtwtQuDji7JoqMFK2jpwiI/WM7/zeCEG0VbNat5S8cA1C48fH4fGdJQ48MFsRRyIZenWqFdMP/jm8BgF5JLmPz9DS87li5UXGOeeLZuRcnFhOVGIBnItH8rl+uRaaomv6chYzTxqHSqNzoL+9Egc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kTBGf3qU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6I5f2023262;
	Wed, 22 Jan 2025 10:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xl5+0tlZrLoM3ZeRbUgvSA4AIYam567wP93
	TMSoVT5s=; b=kTBGf3qUkJvZoUtED5yKsIO4yNr/L1sUefoIISyk+35pbOu9d3p
	JaCshhlnX726yqzrhTWXjryYK1w9TvpQM1oeUxM6hvWTpnS2ZyFe6jBG5EaOinBi
	kSrxRVDkFk7oA9/Ji3KKSviivEMmvSjIoya3hLsv4YfaGPQLkYEMpw7PhIzmKLzH
	qBWmc5FP6uwx7XV7sntDK7kmgTgaOLX6N/MUZGWcQa38BiqbSY39c7yvVTRA4Uny
	OahphmBlQ8qRuBP2tggbA3xg1YCLob6gCiRlgW91Pf64ioiUPhxH6mkQC+1hiA1o
	HKju7H5WIp3gKM72JULVg7M6NVV0ZgwQobQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44au9eghht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA2cRr006767;
	Wed, 22 Jan 2025 10:02:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4485cm3b5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:38 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA2cIZ006762;
	Wed, 22 Jan 2025 10:02:38 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50MA2btX006760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:38 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id C713840CE9; Wed, 22 Jan 2025 18:02:36 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v2 0/8] Support Multi-frequency scale for UFS
Date: Wed, 22 Jan 2025 18:02:06 +0800
Message-Id: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: agubquMuDltbqzngpxf_iB_hHI7oG_fn
X-Proofpoint-ORIG-GUID: agubquMuDltbqzngpxf_iB_hHI7oG_fn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073

With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
plans. However, the gear speed is only toggled between min and max during
clock scaling. Enable multi-level gear scaling by mapping clock frequencies
to gear speeds, so that when devfreq scales clock frequencies we can put
the UFS link at the appropraite gear speeds accordingly.

This series has been tested on below platforms -
sm8550 mtp + UFS3.1
SM8650 MTP + UFS3.1
SM8750 MTP + UFS4.0

v1 -> v2:
1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for UFS on SM8650"
2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes"
3. Modify commit message for  "scsi: ufs: core: Pass target_freq to clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change"
4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change", use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl()
5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", print out freq and gear info as debugging message
6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the lable "do_pmc" to "config_pwr_mode"
7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize the local variables "wb_en" as "false"

Can Guo (6):
  scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
  scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
  scsi: ufs: core: Add a vops to map clock frequency to gear speed
  scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
  scsi: ufs: core: Enable multi-level gear scaling
  scsi: ufs: core: Toggle Write Booster during clock scaling base on
    gear speed

Ziqi Chen (2):
  scsi: ufs: core: Check if scaling up is required when disable clkscale
  ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes

 Documentation/ABI/testing/sysfs-driver-ufs | 31 ++++++++++
 drivers/ufs/core/ufshcd-priv.h             | 17 +++++-
 drivers/ufs/core/ufshcd.c                  | 71 ++++++++++++++++------
 drivers/ufs/host/ufs-mediatek.c            |  1 +
 drivers/ufs/host/ufs-qcom.c                | 66 +++++++++++++++-----
 include/ufs/ufshcd.h                       |  8 ++-
 6 files changed, 159 insertions(+), 35 deletions(-)

-- 
2.34.1


