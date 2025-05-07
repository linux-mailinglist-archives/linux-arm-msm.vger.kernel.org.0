Return-Path: <linux-arm-msm+bounces-57061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E40AAD636
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D977B1B6861B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3652101B7;
	Wed,  7 May 2025 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="je1iH+Ar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D87413AA3E;
	Wed,  7 May 2025 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599870; cv=none; b=dj81rUdR6Bgjny0/g/NTXwV26taPnXgjt6Ka14DDVZixm9luCYYkPwY/6YVnbVmRI+kDoP4SW74Ii20gNpNdyaSv4fXcpI6VPk/N/N6uYGuH/60K/fWZQuffNSBwgspF5LfQatS/veT09+/HUbEZS2r/xOWi/uiZNFMn7niPlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599870; c=relaxed/simple;
	bh=iAJ7LV3fUkX+l59adPf/ghUY2G26V+OK5mBCqKZooqU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lgwo4bwzEBWi5ZF9/VKxuhOst79t7prpnvZFvXem1wnx0f7NsX+mZsHERCxQP3tCU8IyoSxmjqETuqUeOVdHsuyS2sQKvkpuSiu+S7mSrjWHgpTSY/Rr/TsFAJhqRcDH5iuQkZtJUf4idNOiUPVYyB3mhQrCi37tm3/81xipv98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=je1iH+Ar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Gm5R020191;
	Wed, 7 May 2025 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8s6zgpzMhqDnLBMGCbmZv3
	IRmVux3wLiekXXgV1bFKM=; b=je1iH+ArY6sJiJgcb9Hn93xIzNjmCxhYDjYm7b
	bp47KNd5uttodcddrcci9c4Nxi4w/yaszfg9zhvjbYE4p/ORPDiLCkMh2Qn/EUfi
	4uyjT5zBparnaUF+2E4LV3H9Q3Nft/r3BFRyeEB5a7U1s3sVAR/l86V3/Yomvu5f
	kPBjCh3y+QyQFFKgX/+CEZKHKKwI8kksn+s58XlWykIpKnCsIUTQTB1tbu5mj2qk
	wetY31IGVnQS6anrc8vpPFtXDsp5jdxJv27q2fA6LKMtts7u0HCMYoflbt8KL2fs
	w/rT7y7U56K1qTKH04sPDLzd1STK+6bxy2p7WwpceUT7alJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epa5ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:37:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5476bSAa005099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 06:37:28 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 23:37:28 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v2] coresight: tmc: fix failure to disable/enable ETF after reading
Date: Tue, 6 May 2025 23:37:16 -0700
Message-ID: <20250507063716.1945213-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681affa9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=oqbhczGDPXGwOEN-XdEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: X2iSuHKEDtop_EhCju52Q-1Khqya7BNA
X-Proofpoint-GUID: X2iSuHKEDtop_EhCju52Q-1Khqya7BNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA1OSBTYWx0ZWRfXx7qWBQxuYO3X
 4Xk8E+kEoQRdDwHTFaD8sW+rI9XZUiAgCM+EfdSds/02GBuW1guREOeGIxNnBb+a8ZGODFV+qJX
 OG5f2gk57djmSSXlhD6LkKgXh31qP05uce952dZbH8VhDq2XxBNA6s9wBEwH9ZgqVEf1ycmhLvC
 ir46h1hR0NEo/Rf7yZ22u6svvRZm0fNk9YpbvQ530kE4nJuoWPNsKjzMu3lnVZKCZDPVctmj6WB
 ivYFuoXQYBLtXHWQWMT8w6+TGf/w/+evV8mmHh/MYEbb1vuCJmjeNW2pxORaYkkdsZFgnb760qI
 I7x7+rmNYchWTvdRz48OoCFyhGS9BaZTVA75rOYAPLKIkxYtrXvE927lyydauwlK3FhuTb7D9uu
 MluBh/bVDr9puB31jPoWakrODdEuMSHIc4W4cPsxBpY8HWOkHzx5+c7EVbJS+7TgZV6WLByp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=534 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070059

ETF may fail to re-enable after reading, and driver->reading will
not be set to false, this will cause failure to enable/disable to ETF.
This change set driver->reading to false even if re-enabling fail.

Fixes: 669c4614236a ("coresight: tmc: Don't enable TMC when it's not ready.")
Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d858740001c2..c9e2d95ae295 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -747,7 +747,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 	char *buf = NULL;
 	enum tmc_mode mode;
 	unsigned long flags;
-	int rc = 0;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
@@ -773,11 +772,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 		 * can't be NULL.
 		 */
 		memset(drvdata->buf, 0, drvdata->size);
-		rc = __tmc_etb_enable_hw(drvdata);
-		if (rc) {
-			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-			return rc;
-		}
+		__tmc_etb_enable_hw(drvdata);
 	} else {
 		/*
 		 * The ETB/ETF is not tracing and the buffer was just read.
-- 
2.25.1


