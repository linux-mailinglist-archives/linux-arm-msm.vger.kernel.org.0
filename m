Return-Path: <linux-arm-msm+bounces-72553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589FB48A67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DB43C5764
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926662FC030;
	Mon,  8 Sep 2025 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nfgjh4OA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F882FB0BD;
	Mon,  8 Sep 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328095; cv=none; b=Ia+GLaKq0fo6pM/QJzsWCTE/3A7c+ktqIp+Mn4k8PTO2BlM2KfvSd58h/YjwtBOzX202B7X0bP0zVzhkisBydShKC5Ty4pyV2NheKhoaFkI/7aC3v5mgoOTLKLmnAseMX5ffpWtkcIZbWhUn4rr8lVDEac62rWHCsMSgqcR8CqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328095; c=relaxed/simple;
	bh=FUARRciX/lPOwb+u/k38sbdjrKuteCm6oV+eHj81ni8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uA6inEc2/C7FfGO7udqs/z9fcLmUwc3UchB0NvbXhqKnQjEkFeBCbrs4LdMR+mDJ6B/mT+5VcuBUDo8EeKvsq5hg5COWpnOrlwZGFp5h6C2Rou0pYvnqmm0edoeiakb8BvnMb9xxZ/SV5wD0KalE8bFXGc0XktLHPsTIC0WCmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nfgjh4OA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5883kcRW012371;
	Mon, 8 Sep 2025 10:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z5Pg/8OyOGs
	N0BbJ4qq7Ha+TDpVFClfhMtzwnjCGRQY=; b=Nfgjh4OAQ2hYJ48IeYWkNdhKXQv
	3qoTVGhUZJbOd6/fu72Qfwd4WqDgI7CcJXQrB8dpCy/jl8GNfdL1XrkOizqtzu+Y
	pgtodsLyh+tCsxlxZpgrzD0PQmqHlGHQ539bwPYze+wMOT+7rAHHCQCIf4QUGvI0
	GdtEPkKVNz8zkAcIgOhcVAKSAjBzJcLSbzu49ejcnceNhMM/nmxNHb1RQDtc0rNm
	Sm1NLzqXsB+PNKhp041HCnCsfjP7xcfDxh8YjRmcWS7I4KJUTf+zlLvsGPk4Fbh/
	oi848vxE0GyTE6jfJnJ1SHMUi9SDTfGtYgjvIWu1/yLRSNpecAWVliCXoJA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhds435-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 588Aadep005911;
	Mon, 8 Sep 2025 10:41:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 490e1kh0pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 588AfQdF011965;
	Mon, 8 Sep 2025 10:41:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 588AfQdK011956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 899505C5; Mon,  8 Sep 2025 16:11:25 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V6 3/4] mmc: core: Introduce a new flag max-sd-hs-hz
Date: Mon,  8 Sep 2025 16:11:21 +0530
Message-Id: <20250908104122.2062653-4-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
References: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-GUID: AOVhWyhSPIrpS9ddr-EgXNTtYzPNhrd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXz7ccATqxzyIj
 b/8eVnF1WLv0+FSqlIdW1MQ1lwi9MPYwX216/O2Ru7n6OA6T1xR7ge9tWu2OAnQkaPk1U/ChmIg
 KVAbz9gzqtXCZTlsVz1l9x3yGbYuwoiBENwRh5/dGOU1bLnemhirzySPMlQ7mx3qbQk2JIDOkC5
 o2vhnQfGMqdW3vZ6ZzeUGEZJohw0pDnBIA6UpfIeT7eeHHrYu3OVIHtbrBGYMDH/87zTg6cChra
 FTJ9Qxlzz4XcO8GY0VYRsBcb+Ru1TdBWfhNa7Xcaq2fJWcTKvec8VIExO31Mwyr0Zvesb3cnSYH
 Q5mlh2T7ztCFTBNtip3udKYb//8X2NJ1fd8PX7KJJqjE4Fvtiqn+H5Oc/jOTRK5NAqcKbz5ewlT
 wlEh2CBB
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68beb2da cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=Takt5cPIvt0sc2LuolQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AOVhWyhSPIrpS9ddr-EgXNTtYzPNhrd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Introduce a new device tree flag to cap the maximum High-Speed (HS)
mode frequency for SD cards, accommodating board-specific
electrical limitations which cannot support the default 50Mhz HS
frequency and others.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/core/host.c  | 2 ++
 drivers/mmc/core/sd.c    | 2 +-
 include/linux/mmc/host.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index dacb5bd9bb71..3fe6ae56a6ae 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -302,6 +302,8 @@ int mmc_of_parse(struct mmc_host *host)
 	/* f_max is obtained from the optional "max-frequency" property */
 	device_property_read_u32(dev, "max-frequency", &host->f_max);
 
+	device_property_read_u32(dev, "max-sd-hs-hz", &host->max_sd_hs_hz);
+
 	/*
 	 * Configure CD and WP pins. They are both by default active low to
 	 * match the SDHCI spec. If GPIOs are provided for CD and / or WP, the
diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index ec02067f03c5..67cd63004829 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -359,7 +359,7 @@ static int mmc_read_switch(struct mmc_card *card)
 	}
 
 	if (status[13] & SD_MODE_HIGH_SPEED)
-		card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
+		card->sw_caps.hs_max_dtr = card->host->max_sd_hs_hz ?: HIGH_SPEED_MAX_DTR;
 
 	if (card->scr.sda_spec3) {
 		card->sw_caps.sd3_bus_mode = status[13];
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..a698b4b02d95 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -565,6 +565,7 @@ struct mmc_host {
 	int			hsq_depth;
 
 	u32			err_stats[MMC_ERR_MAX];
+	unsigned int		max_sd_hs_hz;
 	unsigned long		private[] ____cacheline_aligned;
 };
 
-- 
2.34.1


