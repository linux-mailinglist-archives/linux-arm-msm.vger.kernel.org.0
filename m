Return-Path: <linux-arm-msm+bounces-110483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BFdI4nJHGp4SgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 01:51:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EB761855E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 01:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8F0030120D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 23:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B054376BC2;
	Sun, 31 May 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMhrJlMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE373603EF;
	Sun, 31 May 2026 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780271488; cv=none; b=SVrbhV4+FDEeZRbHvTYCy1PpcrKzdBm732BJNwX6L/PuZAOBESIfDw9eJZqHxiCZM7jcxUfk6QNvAtNabt/xSiZfH8FOooH5PmEjnTTe2U/4jkXbS2BssWVyk8KIFWoOM+zlW39qSp0IHv4KGo7qSTjh+RnVm8JizllZEmkzFQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780271488; c=relaxed/simple;
	bh=USWYhZGRa2R7RDbF9RBquLvBrwNSeb1Y4LrYpCDI6Pw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oxyy058aoo7LtLQg5NQ074CcMvKlbisyxzPP+w0uRvSKRhu6hr8o9T2XCv2xQ5sJN493Fu3fKbIkTZ2tU/fRvGOPbM9q40Bfnxy/QL+NdxQeyQu5odWxwvyYdcAwP2a6KLTMOxrIKCiR3po8bB3mjan8QkCjBQ7EEQZx3Jg02EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMhrJlMF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VJUGvG3838769;
	Sun, 31 May 2026 23:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YUKxUX9UHqP
	UcjOStYk74PJ5jj3MakW/GTJelLi6lSU=; b=fMhrJlMFb8I+bmOtcy4U5AY5Gkf
	KKxM6492mDXOTTsU6IL5MEj7CpjlVr4rY0+Fnpuz/Hadb5Ir2YPCOAHQSP1aCF7s
	ijNaU1x0DLW0lJi/6m7JCAxvWdbkPEZVCZxE7KB/PISyVX0FsPovr0jkZye27GUD
	bFqWpj98ikuo2SP60/vZiFrs3ULmxql0xnSSmQi11K6yelxTwTbLyrdzeqxcclBU
	HGOCdkK5XTKnqQGtNlBKFM+UOrw6LptFQjN1v0xNguZSOtzqry0SaIZJTU4CbCv5
	h094j3zo4VllV1Dd4Q7BxTgx/X+8lMtaa7WYIsar3CQ02s2tq5+jFZs+ung==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fd042-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:51:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64VNowvZ008828;
	Sun, 31 May 2026 23:50:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4efryj04bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:50:58 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64VNovoj008810;
	Sun, 31 May 2026 23:50:58 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64VNowTg008823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:50:58 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id DD747625; Mon,  1 Jun 2026 05:20:57 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1 2/2] scsi: ufs: ufs-qcom: Enable SKIP DEVICE RESET Quirk
Date: Mon,  1 Jun 2026 05:20:11 +0530
Message-Id: <20260531235011.1052706-3-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
References: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: ScOiyB3NDfBflTQTwGr-cyNHAvDaTFo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDI2MSBTYWx0ZWRfX9l5+juXe6ENP
 OdFn5qVCShZTbiE7byA0ylrM3BcbgbYBLsE3BDh3xx9MDwBf+T3zWoCTlc3ZZsRd9UMBuMv9Bfk
 6AcAcYmZIiPmpqjtyoWY0HIwGIt29Gt10geYVcrRII3XrhR2DwBZCWf0p09Ph7Lc9Mg58x5ju4b
 Mauhy2+9zVpdMi+wb2CV/qEDJVJJZxJTOWJwzKi3+0ZBw4Psnp2klOB1VX78AxMxFtqy1jkyuvg
 DKVssXOBEb+ni2QYRjVYUBxASpap29FRcnXKJuun5HPEHiZ726qdKY2yajZwReG35Cj8zVLXnqC
 OBFK+Xnx+ocufabnN+pvG4rJabg6BuswBwR4GlC9KNnaRV8hG6FSRcNb+vHMwUZQohJct78Lsyo
 OawWhzmN7ajGRkUyGu1S+nvrMJrvDgdzfSXy1KAiHkgmQWrETySGu8bz8iSqXkLJUu2Cq/prPkA
 DyrgYfbsrgSKCW712Xg==
X-Proofpoint-GUID: ScOiyB3NDfBflTQTwGr-cyNHAvDaTFo2
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1cc966 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=y5UFWkHqcRnmusbZrT0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605310261
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-110483-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 34EB761855E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A previous fix [1] addressed an OCP (Over Current Protection) issue
during UFS power down (PC=3) by adding a 10ms delay after asserting
HWRST. The delay allows the UFS device to complete its reset routine
before the power rail transitions to LPM (Low Power Mode).

However, this fix is insufficient for certain Micron UFS parts. Unlike
other vendors whose reset routine completes within ~10ms, Micron parts
continue to draw current beyond the LPM threshold for a longer duration
after reset is asserted, specifically until the reset is deasserted
(RST_N goes high). No fixed delay can reliably cover this window since
there is currently no mechanism for the host to query whether the
device reset routine has completed.

Enable the UFSHCD_QUIRK_SKIP_DEVICE_RESET quirk to skip device assert
reset during UFS power down for Micron parts. For all other vendors,
the existing behavior (assert reset + 10ms delay) is preserved.

This quirk is applicable only during shutdown. The device reset
will be asserted as part of the platform shutdown sequences.

[1] commit 5127be409c6c ("scsi: ufs: ufs-qcom: Fix UFS OCP issue during
    UFS power down (PC=3)")

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 291c43448764..d0ad1e47c31d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -770,9 +770,17 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (!ufs_qcom_is_link_active(hba))
 		ufs_qcom_disable_lane_clks(host);

-
-	/* reset the connected UFS device during power down */
-	if (ufs_qcom_is_link_off(hba) && host->device_reset) {
+	/*
+	 * For some UFS vendors, skip asserting device reset here.
+	 * These vendor parts keep drawing larger current after reset
+	 * is asserted until it is deasserted, and the 10ms delay is
+	 * not sufficient to prevent OCP (Over Current Protection)
+	 * on the regulator. This is for the powerdown case, so
+	 * the device reset can be asserted later as part of the
+	 * platform shutdown sequence.
+	 */
+	if (ufs_qcom_is_link_off(hba) && host->device_reset &&
+	    !(hba->quirks & UFSHCD_QUIRK_SKIP_DEVICE_RESET)) {
 		ufs_qcom_device_reset_ctrl(hba, true);
 		/*
 		 * After sending the SSU command, asserting the rst_n
@@ -1288,6 +1296,19 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 static void ufs_qcom_fixup_dev_quirks(struct ufs_hba *hba)
 {
 	ufshcd_fixup_dev_quirks(hba, ufs_qcom_dev_fixups);
+
+	/*
+	 * Some UFS parts keep drawing larger current after reset is asserted
+	 * until it is deasserted. The 10ms delay added after asserting HWRST
+	 * (as done for other vendors) is not sufficient for these parts.
+	 *
+	 * Skip asserting device reset during UFS power down for these parts
+	 * to prevent OCP (Over Current Protection) fault on the regulator.
+	 * This is handled only in shutdown; the device reset will be asserted
+	 * as part of the platform shutdown sequence.
+	 */
+	if (hba->dev_info.wmanufacturerid == UFS_VENDOR_MICRON)
+		hba->quirks |= UFSHCD_QUIRK_SKIP_DEVICE_RESET;
 }

 static u32 ufs_qcom_get_ufs_hci_version(struct ufs_hba *hba)
--
2.34.1


