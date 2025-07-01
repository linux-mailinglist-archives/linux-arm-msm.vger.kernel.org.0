Return-Path: <linux-arm-msm+bounces-63178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F976AEF485
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B44D71889FE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFF7246784;
	Tue,  1 Jul 2025 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ga7vDnwa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6C222CBE9;
	Tue,  1 Jul 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364431; cv=none; b=Yq7yztC3NdswZhPDSWZWlxYeWbV1elsXUvw5DreETSpOoAdqd3DdiaiNr4B3QrrnKqvzV67QA+roxJCwx4f5axC/x03Rd33uUXK+Do0tl/Z02DKxlz+o15TdmGjrLzMNCGvEP0vR6FzJSrsKrmq53Q88AHo8HhZ5x2/gOFeweyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364431; c=relaxed/simple;
	bh=OZ2g5bk5l/ia5/l7WYOfBY70SUyoTBPtHB4C3xvBXCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=El7ACHW7ve00lUPbYh7AZR04i+pmZyGttrCCp2N7LP3tuSu6ik0qxbIub4GNkfx99tCDahDRpQVYjSkgRgv7hnfPW4z9/SBaHlhuT9nvzjrJOluk5bFTOh547B9RUXaYDE2uJUsJzY9PeJqG+pAtFWvW3Wi8/EOMC8SKiNPfEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ga7vDnwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A32wM025164;
	Tue, 1 Jul 2025 10:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FyK5LFBHHZqcYuq8mQ8N2H+f5O/FPp2fVyT
	E4wUpQaM=; b=ga7vDnwal7T3PMX/UFzD7lFG4CvkrpU4pD7IKz+/WVGPB4KO8LI
	t57+xKfib092rhxNU3UirQcZAoUcpw+XbGWVB4Wrhub1SYhhz43qbqMBvNzh3C+h
	l79WBnAfhM9uyYfBZX40Eo1HjODvzLgNIDYubbH7V459hJyNt4BDUqXvOQ+/zOcN
	8NIgL3PLfsgH6IP8sub3kJv0L//qU9KkAoR2ucd0cff5MSMF60GZmbReJREXCYSG
	q3cPWe6KVmsUrigGwtHItIYReqqtk8kvC2fpYs7dX7/a+Rk0K+iSYAV3k3+Ya+jp
	5mYM2/Ky/hLKF0J6OnnLpPQSwuSduzkGLiw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64nk8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:07:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 561A73QD003058;
	Tue, 1 Jul 2025 10:07:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fkur7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:07:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 561A726n003045;
	Tue, 1 Jul 2025 10:07:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 561A72Db003037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:07:02 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 8F9935C0; Tue,  1 Jul 2025 15:37:01 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V3] mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
Date: Tue,  1 Jul 2025 15:36:59 +0530
Message-Id: <20250701100659.3310386-1-quic_sartgarg@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863b34a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=JiSKitIezqfrhy8bwsYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MCBTYWx0ZWRfX+coWw37BS9aN
 h5uoeR56dZAFdCwdgSVpb+UoOVzLZAeNANBivLl1sZpqDDC2bawjJDFkv6f+uvh9jPxnSMOvFgg
 jkxLLXNZani04hwp2bR7ffkzx/OlJqN9AYQ+O1H43QM2fAutmoPDu4BeNygmyTUfRhD8zdPpjsK
 KQSyDkWOPTt59KeSci/eKNrDXuzIcyPvz0zMuaYYUGmBs5wQteGmCSk1jm7RydbAR9kJkoJAdQE
 VbpCuygYywgG7Fh2mTS6iDj5R4tWOdGFcses3wm8gGfBLQAxhOJEk2u4gGCbEUdKrPoOQtG9m92
 8e8rbfScJ/Ir9Jkcgnr9M7AvfiCvs6a86ED6Oy18Gs9YcUYTx8lrd73KPVOLTvZYylHuOFPy0tq
 o/4cRXGm4A2EUNTDZx3hl7a5f/VqBcnvpNxp97Oe80Sl/nzPp+hNl8zYxgvj9Odq9FcVmx+q
X-Proofpoint-GUID: xjRZCr_2Rhz4iyNpHov5fJ2wQB3KNMfQ
X-Proofpoint-ORIG-GUID: xjRZCr_2Rhz4iyNpHov5fJ2wQB3KNMfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010060

Many mobile phones feature multi-card tray designs, where the same
tray is used for both SD and SIM cards. If the SD card is placed
at the outermost location in the tray, the SIM card may come in
contact with SD card power-supply while removing the tray, possibly
resulting in SIM damage.

To prevent that, make sure the SD card is really inserted by reading
the Card Detect pin state. If it's not, turn off the power in
sdhci_msm_check_power_status() and also set the BUS_FAIL power state
on the controller as part of pwr_irq handling for BUS_ON request.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 Changes from v2:
 As per Konrad Dybcio's comment :
 - Updated commit text
 - Removed READ_ONCE as mmc->ops will be present always
 - Passed the parameter directly to msm_host_writel
 As per Adrian Hunter's comment :
 - Removed get_cd function as not much use now

 Changes from v1:
 As per Adrian Hunter's comment :
 - Removed unrelated changes
 - Created a separate function get_cd for cleaner code
 - Used READ_ONCE when getting mmc->ops to handle card removal cases
 - Reordered if check conditions
---
 drivers/mmc/host/sdhci-msm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index bf91cb96a0ea..f99fb3b096d6 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1579,6 +1579,7 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = host->mmc;
 	bool done = false;
 	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
 	const struct sdhci_msm_offset *msm_offset =
@@ -1636,6 +1637,12 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 				 "%s: pwr_irq for req: (%d) timed out\n",
 				 mmc_hostname(host->mmc), req_type);
 	}
+
+	if ((req_type & REQ_BUS_ON) && mmc->card && !mmc->ops->get_cd(mmc)) {
+		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
+		host->pwr = 0;
+	}
+
 	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
 			__func__, req_type);
 }
@@ -1694,6 +1701,13 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 		udelay(10);
 	}
 
+	if ((irq_status & CORE_PWRCTL_BUS_ON) && mmc->card &&
+	    !mmc->ops->get_cd(mmc)) {
+		msm_host_writel(msm_host, CORE_PWRCTL_BUS_FAIL, host,
+				msm_offset->core_pwrctl_ctl);
+		return;
+	}
+
 	/* Handle BUS ON/OFF*/
 	if (irq_status & CORE_PWRCTL_BUS_ON) {
 		pwr_state = REQ_BUS_ON;
-- 
2.34.1


