Return-Path: <linux-arm-msm+bounces-71751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB387B417CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CBF87C3EC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF00B2E975E;
	Wed,  3 Sep 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CkjSofV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13F2E7F19;
	Wed,  3 Sep 2025 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886666; cv=none; b=TpwtKJiOGFMQ4ZIxgjmXrbiJT5+aRjCZCo3N3oggYjJHZ9sssYQ7peFZ7EOHtLj+kMyMTERssV33l3XIO4zqzvU0ZBj8x9haVYQou24i4F/mBlDYI2Qutr5exwLQ8wJ7zaxYgG2N+rS1NAr3aAl8l/lxJFhXxFb0lSWbUqKNAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886666; c=relaxed/simple;
	bh=x0l1AOiE7rJ2voaMEUy6ISlKcbngGcnFKK6jVPKgQkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mEAtKesxhlFnR1ieK01gYjUqvI2V5RubfyF6djxFIKA4iG3bP2dLW+8odDyisOeG63B8uU7cIJ0skKQIE+dTHQ2bpkLA0i4LzKPtMKWAuzRAl0M1AwPhmSshDHr48ZASGRYbl4QVanNzmdUjvcURUy3sgHNOKHSqf4QIx/ILaaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CkjSofV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831s2rB004243;
	Wed, 3 Sep 2025 08:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nJHQ3XI2Tz+
	L0glSDNmz/OkI/wCHWppJMja5ThynGbU=; b=CkjSofV0vCtcnf5MgeeDlrTFFjz
	2HUthhd/EXygdm4Hfs3fKfwG5n4jNJPD8mt6uW6YUVIReV1f68WOeDK6vLrMOzq5
	lC6WZN2WCgChIXs+iCsQKzgbiRDW5tyEgtl6fRYLJWuwNv7m94wTH4g1vpconhC1
	THoDNr3Uh9oPR7ak/IkKaAmjyfLUndnfu4fNaTqNVdix1xNNYoDIObzXKgaL8E1X
	MrhR1QJks+5PgeY4xIB5eNgiY070X6ueAokSCX6l6OlQaJR5ogwP4k7ihpYcv+Oq
	ZinaFoa+sPnQGEcMF+1WFwuYDDWERJ28QnysLN+zxSCbV+caaWRWx4j7nAQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjjpp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58384GiY011546;
	Wed, 3 Sep 2025 08:04:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48utcm1wcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58384GKG011514;
	Wed, 3 Sep 2025 08:04:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58384FUg011501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:16 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 8C1D05CB; Wed,  3 Sep 2025 13:34:14 +0530 (+0530)
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
Subject: [PATCH V5 3/4] mmc: core: Introduce a new flag max-sd-hs-hz
Date: Wed,  3 Sep 2025 13:34:03 +0530
Message-Id: <20250903080404.3260135-4-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b7f684 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=Takt5cPIvt0sc2LuolQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0tOIQcJgl11E1lozhB2mO8qbPobcgQDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+5Mny+Vl6ANE
 hliDUSs7PcA4/TgXII8C215WQFvZUAY78N/Ls5Ald2VZDWuLscD9DbOcmPNrp2N4AfoDlMWF2dN
 uZxuhukRroF7JCnBJdJxNDp/objzCbyYQBl/OG8HgSTBJVBSS/TIaWSK4P7pzfJXiH9exqC2JJE
 qu0rIej5zgeWSxcWOS5DyYtnb3kLPRFL8Qsj+3n/uxwV9TzH8NqXE9qqtBpMdnKvuG3O7yDxl18
 i1Mu0n04svAk5iiPN8lbeV1d4PI4F7G8fAwTCKryGJYQCOwmdg2tukZI1113Qr5szTK7xTMvbz3
 ZhjLForD2TDHVFrljcUSYlwdSCSZ/62p6fEYTpkfuD2w6R573j/xPaOKDAAT7IAbFgDe0PQxF91
 tFVpSMTG
X-Proofpoint-ORIG-GUID: 0tOIQcJgl11E1lozhB2mO8qbPobcgQDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Introduce a new device tree flag to cap the maximum High-Speed (HS)
mode frequency for SD cards, accommodating board-specific
constraints such as the inclusion of a level shifter which cannot
support the default 50Mhz HS frequency and others.

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


