Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C592A782403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 08:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbjHUGvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 02:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjHUGvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 02:51:18 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DCAB8;
        Sun, 20 Aug 2023 23:51:12 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37L5wNdu009422;
        Mon, 21 Aug 2023 06:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=di6Tt1gnzwfMZ8GCMunHUWzH+NvbvNGfF66QYbkwU3k=;
 b=U2BIRXPeAQ6Jz5AmjBuWYN6VGHSvYggkdveM4ogYAElgQi6n5bi6nOsm53nRynCz6/DV
 O8w+m3QqO/ocTnarNG53FYJ2hvbfL6TtOChvCQXDlCbD85COtUepwaMSBHG0HrAZb1I9
 EihAx7miYQczfVWeC4fm+l8FNu5qSEfmh3Z4wyvAKpV+XJ30LCr3QBlS7EgyCbH7kSq1
 toZGOG78m/e+avz8BOD3vOyVVBYqQ5uzmCYVeHuQwoy6wGWrpAFF92kg1F7a3+eIGW4w
 zBwFmR9NAZbpNHF15dSospiyIdY4JcJ4iZSVBeJ0p55RZJHcyJuwoXcNzpBYGHu16oAh eg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sjken36r3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Aug 2023 06:50:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37L6oxQJ011999
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Aug 2023 06:50:59 GMT
Received: from hu-omprsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 20 Aug 2023 23:50:56 -0700
From:   Om Prakash Singh <quic_omprsing@quicinc.com>
To:     <ebiggers@kernel.org>, <andersson@kernel.org>
CC:     <linux-mmc@vger.kernel.org>, <satyaprateek2357@gmail.com>,
        <ulf.hansson@linaro.org>, <agross@kernel.org>,
        <adrian.hunter@intel.com>, <quic_omprsing@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] mmc: core: crypto: Add MMC_CAP2_CRYPTO_RETAIN_KEY
Date:   Mon, 21 Aug 2023 12:20:37 +0530
Message-ID: <20230821065037.1146977-1-quic_omprsing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: elue6zeWhpREqPGcOEKelOtWL601IrKp
X-Proofpoint-GUID: elue6zeWhpREqPGcOEKelOtWL601IrKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210063
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new capability MMC_CAP2_CRYPTO_RETAIN_KEY for mmc host that
support inline crypto key retention and doesn't need reinitialization
of all keys after mmc host has reinitialized.

Signed-off-by: Om Prakash Singh <quic_omprsing@quicinc.com>
---
 drivers/mmc/core/crypto.c    | 3 ++-
 drivers/mmc/host/sdhci-msm.c | 1 +
 include/linux/mmc/host.h     | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..f8ce7c2295f6 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,8 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if ((host->caps2 & MMC_CAP2_CRYPTO) &&
+	    !(host->caps2 & MMC_CAP2_CRYPTO_RETAIN_KEY))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 1c935b5bafe1..cfc2328f90ed 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1828,6 +1828,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	msm_host->ice = ice;
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_CRYPTO_RETAIN_KEY;
 
 	return 0;
 }
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 461d1543893b..74c69415746d 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -417,8 +417,10 @@ struct mmc_host {
 #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
 #ifdef CONFIG_MMC_CRYPTO
 #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
+#define MMC_CAP2_CRYPTO_RETAIN_KEY (1 << 28)	/* Host doesn't need inline encryption key reinitialization */
 #else
 #define MMC_CAP2_CRYPTO		0
+#define MMC_CAP2_CRYPTO_RETAIN_KEY 0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
 
-- 
2.25.1

