Return-Path: <linux-arm-msm+bounces-102768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBWsGdEC2mlJxwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:14:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C37383DEEB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4593057D70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC6312814;
	Sat, 11 Apr 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVU1Aaic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baj8Y9rC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360E3368BC
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895142; cv=none; b=nhbitmlEN5AgA3nZ55YIi/mCqULWPnJxIsgOvbXM3Rli8+4F86OCW5qvkXUnEInrKJzbRxBWHeZoFm+MygduYDzfPnAf5+DLUr0n0AZGJ8mSljEtg352/ckPAXzxJsLp2qTttzocONbehXiqeTP//EujY/97pv9HivYTgS0UMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895142; c=relaxed/simple;
	bh=oFmX0etKa9q0qVrDc4JrMi5cq1OxJxR+/pAtG0Eib6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SeF7fKlGzLxSu6p5vCkEOaC+gwRg8IgevURKUTMaiSB9jkIJNrrI0iwS0Pa8vU7Igf0yii67FQqugxt67XKwqBPwpOyKRUZ9FBdWCL11S/KvfUaAfP1H6F66egL7LG8fwZzVboB+GDauMvOgCm8yFdudWkbEVtRBcCMbXWgK8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVU1Aaic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baj8Y9rC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43DVv620989
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/j47VdgtRAxVx8hnHC2871a0F+/FGE4mT3c0Db1WFEU=; b=lVU1AaicBwP311sf
	eYAwBaeubluIC+KRRkYIynued0oR8F7Qznsr2WsN1io9y+HBH3qY2W8Eh1Lyxt25
	DkSaqAP2KxEr8S3HaEl8qD57J/tCoPq3hj0UPLTLBqxkPd2IHMzItE3lTFlrcrNK
	DIYACGS+Mge0466sHWTpPuXrA4J+AJUlQ8dGdL0bYHp1cS9aV3IQQLO5oFVsOEIf
	eWenT4s3OubhUYB+um5/vXajxBOKjKK45JdYYY2V+RB7+GTdVW6CVV1TjoTP9NGH
	WI6VRcE268X1ItRI4fKaFqgdhMwKUL0C16b2Ufd9NDp/stCqnpRpbGeebK327DmQ
	NE9qrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrc40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so1647894a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895138; x=1776499938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/j47VdgtRAxVx8hnHC2871a0F+/FGE4mT3c0Db1WFEU=;
        b=baj8Y9rC9QVJn6FGH3faafroq2vJrSf58ygKq4zclcFvzNcqSNUnhmFyGbMKZS49v+
         LyfG8e2hvA0sejXHT5NcnHWXC6QUGSyKTEwlh4wjDQMD6Pgk6yneG1PClx9AyYO6u+uW
         IyhQyHS3aaVw+hrAV/P8v6TYHkYr4ZT0h+o3WpzjzqexWhl1c5qv3QFn3UIjC3pfboYK
         2+auhr/ULSuxEqOMtXE0s3SkxSxdSmAYLsR65hWozPgCU9/v+ur8+ctx98i/jWKhc+3Y
         Ty4j/kcqSiQl4e7+8+FhT9e97596oZCKvuEhMXu3jJwAQ+j3+2p56PLYvLItxLeUrHti
         jo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895138; x=1776499938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/j47VdgtRAxVx8hnHC2871a0F+/FGE4mT3c0Db1WFEU=;
        b=SQynj/Q1XVPVALH9J15YkbNil86xe0OenAGcqw4Vz618DQ/f4HN5jeqMQjbThfKgAZ
         E3HCn1lpv/pUcBJ+jOMWpOSW4YywCia9zHoABWY3CNSR4qcAkaCUsRpider0PdIXt65G
         VI+9lddx5xI7ha4mNNE9lAQRuvauSWFyEu195nJUmJsJAp75OceN4Px6jkDjUnqPN1o7
         T9Zqrga14RhuT4wT5eDO5YmBBrh1tl/TqgKJ/oq4SRwYf2qZ9ncW0n5jIDwer05GygyB
         GCgeoHSE+B9sfrzhfSi62KmHc9a8yfdApz31SsOSC0FROCsJESinYXA70cUMHCYt3JHW
         34uw==
X-Forwarded-Encrypted: i=1; AJvYcCWp9XSO6KahkiOcOZkqNZhWRal8G2tvqKRkQl34+1ueCHIgKnNG+Q0rMnhXXJgeaHcRWQnB5+tRErP4dXz5@vger.kernel.org
X-Gm-Message-State: AOJu0YxPgdtAATKKcQMuWIZNoeeK1/aEB3VX2ssDm7ggIp4nlEKuZ2sF
	oYdO8CwFPLPHuonEQN79RYmEttDOg4yo3FASodxXkpUG8VEpA2W6mh15LTFOc1eQ43efRudLTn1
	pVPT9s+8Nu6CD+/Aa0XiI6ZdyVEdEOen7Ly2TRmuFM5abQIIkvABa+g35c6XVH5NYczxM
X-Gm-Gg: AeBDiev/qpKIl9ggkt7RVT0+4h3XWkKO8VS+ojCB/X7fCNUUvlcNnPtpl7tKuu2w+i4
	OpOwDP2FrW/Bmmy+emh65KbFPWUHYDSLf4KvX4FWWN0TaFsU78+ThocLqme7a+lIl5k6Iq8aFb0
	66gz0B1iwHcPOlUDNyNVMzW94z77fdzhdG+GutZfhAO8qBg/1w1GiOKHIQFji0lyEoQpq8Fc3Nn
	q7/gu7wKJKLsN8+88ojCsiknDGyElr/G1myhhqXVq6ogrwD8nGDbLHAVwHsWGpbyy/E8x8/S5N0
	zxxYP6lw1ZmUtHCFv2kg7oWUua/0mFuYBjdVpDsCDUeHhL43vkXHAG49Oa/fqnhqr2g4jLUE88E
	ujCfIT+DG+cdxoFhTgvE2HliOslbK68/FWH5FOjXWgKj18qC2RPnr+Gfu
X-Received: by 2002:a05:6a00:430b:b0:82f:238f:b5a8 with SMTP id d2e1a72fcca58-82f238fb94bmr1204019b3a.9.1775895137883;
        Sat, 11 Apr 2026 01:12:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:430b:b0:82f:238f:b5a8 with SMTP id d2e1a72fcca58-82f238fb94bmr1203988b3a.9.1775895137385;
        Sat, 11 Apr 2026 01:12:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:02 +0530
Subject: [PATCH v2 2/6] bus: mhi: host: Add support for non-posted TSC
 timesync feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-2-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=8703;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9IV3yxjkLYJ+Kgms4uNpbx5wIa6GWXAtXYd2BJBD9Bo=;
 b=6go9KeRGXGQFdPNAlwalKM+JFHq0BU0b7AkUTCYZtALo0KHOQ2+F5Jw/qMjIqC/J9G78mPrc6
 emKJdTx7FlWAbfw6WiPDHmXWnDj7jyt307TGZvGR4xUPCAj6xyAvl2X
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Q6w_4mypyPKwn4_-d8A9dAW4lJeOdqiu
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da0262 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=DQPGbgbYSupBwqSZGUIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q6w_4mypyPKwn4_-d8A9dAW4lJeOdqiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfXx3yvSQZfxiXV
 RUAXvcI+/OLmCMx2q8bIlpGv2hshqgMWrriHbZeTgh4M5XBOiqel6UQTbyV1im0efTWFoxJU3x1
 XznaI8yx6z0kAVwOA1rJlf431WyseMpixHwqr9Zrkg/BN3HNFqw+63ysGemgedxYjoQc5XDeOFB
 5d7XcJ6NrS5CcHtDHuqzE/cJd2lzd2VSCL9PvEbfCBrbEaPmku0gkmPrYJuIS0Qmae/7IXHJjM8
 XV2xDTCb7gKjS3lJyiSJZnGOjtRtIZM83+hflwn/etHc6qER6YQ63W2cPpLmEdoXw97yxWUrBuj
 nb0ieIbsYpiCgR2K4uIGAFq0TUSA4lxj7U+HCb0dzRo6IBfTebUOXu77PmETzCl3xuvD//abUF4
 aMl3rq0R2a8fv1gm8oPbXTf3gd73eidgpCyBDuXgfxErnEAwE6bZFd3f2oOPMQMp1IKNLXmYQYw
 z324sf0P/W8bjYx0BSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102768-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C37383DEEB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Implement non-posted time synchronization as described in section 5.1.1
of the MHI v1.2 specification. The host disables low-power link states
to minimize latency, reads the local time, issues a MMIO read to the
device's TIME register.

Add support for initializing this feature and export a function to be
used by the drivers which does the time synchronization.

MHI reads the device time registers in the MMIO address space pointed to
by the capability register after disabling all low power modes and keeping
MHI in M0. Before and after MHI reads, the local time is captured
and shared for processing.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h        |  4 +++
 drivers/bus/mhi/host/init.c     | 28 ++++++++++++++++
 drivers/bus/mhi/host/internal.h |  9 +++++
 drivers/bus/mhi/host/main.c     | 74 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h             | 37 +++++++++++++++++++++
 5 files changed, 152 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 4c316f3d5a68beb01f15cf575b03747096fdcf2c..64f9b2b94387a112bb6b5e20c634c3ba8d6bc78e 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -118,6 +118,10 @@
 #define CAP_CAPID_MASK			GENMASK(31, 24)
 #define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
+/* MHI TSC Timesync */
+#define TSC_TIMESYNC_TIME_LOW_OFFSET	(0x8)
+#define TSC_TIMESYNC_TIME_HIGH_OFFSET	(0xC)
+
 /* Command Ring Element macros */
 /* No operation command */
 #define MHI_TRE_CMD_NOOP_PTR		0
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index c2162aa04e810e45ccfbedd20aaa62f892420d31..eb720f671726d919646cbc450cd54bda655a1060 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -498,6 +498,30 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
 	return 0;
 }
 
+static int mhi_init_tsc_timesync(struct mhi_controller *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_timesync *mhi_tsc_tsync;
+	u32 time_offset;
+	int ret;
+
+	time_offset = mhi_find_capability(mhi_cntrl, MHI_CAP_ID_TSC_TIME_SYNC);
+	if (!time_offset)
+		return -ENXIO;
+
+	mhi_tsc_tsync = devm_kzalloc(dev, sizeof(*mhi_tsc_tsync), GFP_KERNEL);
+	if (!mhi_tsc_tsync)
+		return -ENOMEM;
+
+	mhi_cntrl->tsc_timesync = mhi_tsc_tsync;
+	mutex_init(&mhi_tsc_tsync->ts_mutex);
+
+	/* save time_offset for obtaining time via MMIO register reads */
+	mhi_tsc_tsync->time_reg = mhi_cntrl->regs + time_offset;
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;
@@ -635,6 +659,10 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		return ret;
 	}
 
+	ret = mhi_init_tsc_timesync(mhi_cntrl);
+	if (ret)
+		dev_dbg(dev, "TSC Time synchronization init failure\n");
+
 	return 0;
 }
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7b0ee5e3a12dd585064169b7b884750bf4d8c8db..a0e729e7a1198c1b82c70b6bfe3bc2ee24331229 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -15,6 +15,15 @@ extern const struct bus_type mhi_bus_type;
 #define MHI_SOC_RESET_REQ_OFFSET			0xb0
 #define MHI_SOC_RESET_REQ				BIT(0)
 
+/*
+ * With ASPM enabled, the link may enter a low power state, requiring
+ * a wake-up sequence. Use a short burst of back-to-back reads to
+ * transition the link to the active state. Based on testing,
+ * 4 iterations are necessary to ensure reliable wake-up without
+ * excess latency.
+ */
+#define MHI_NUM_BACK_TO_BACK_READS			4
+
 struct mhi_ctxt {
 	struct mhi_event_ctxt *er_ctxt;
 	struct mhi_chan_ctxt *chan_ctxt;
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe300702bcc3caa8fd9ea8086203c75b186..b7a727b1a5d1f20b570c62707a991ec5b85bfec7 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1626,3 +1626,77 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_timesync *mhi_tsync,
+			       struct mhi_timesync_info *time)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret, i;
+
+	if (!mhi_tsync && !mhi_tsync->time_reg) {
+		dev_err(dev, "Time sync is not supported\n");
+		return -EINVAL;
+	}
+
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
+		dev_err(dev, "MHI is not in active state, pm_state:%s\n",
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return -EIO;
+	}
+
+	/* bring to M0 state */
+	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&mhi_tsync->ts_mutex);
+	mhi_cntrl->runtime_get(mhi_cntrl);
+
+	/*
+	 * time critical code to fetch device time, delay between these two steps
+	 * should be deterministic as possible.
+	 */
+	preempt_disable();
+	local_irq_disable();
+
+	time->t_host_pre = ktime_get_real();
+
+	/*
+	 * To ensure the PCIe link is in L0 when ASPM is enabled, perform series
+	 * of back-to-back reads. This is necessary because the link may be in a
+	 * low-power state (e.g., L1 or L1ss), and need to be forced it to
+	 * transition to L0.
+	 */
+	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+	}
+
+	time->t_host_post = ktime_get_real();
+
+	local_irq_enable();
+	preempt_enable();
+
+	mhi_cntrl->runtime_put(mhi_cntrl);
+
+	mhi_device_put(mhi_cntrl->mhi_dev);
+
+	return 0;
+}
+
+int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_timesync *mhi_tsc_tsync = mhi_cntrl->tsc_timesync;
+	int ret;
+
+	ret = mhi_get_remote_time(mhi_cntrl, mhi_tsc_tsync, time);
+	if (ret)
+		dev_err(&mhi_dev->dev, "Failed to get TSC Time Sync value:%d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_get_remote_tsc_time_sync);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 88ccb3e14f481d6b85c2a314eb74ba960c2d4c81..f39c8ca7c251954f2d83c1227d206b600b88c75f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -286,6 +286,30 @@ struct mhi_controller_config {
 	bool m2_no_db;
 };
 
+/**
+ * struct mhi_timesync - MHI time synchronization structure
+ * @time_reg: Points to address of Timesync register
+ * @ts_mutex: Mutex for synchronization
+ */
+struct mhi_timesync {
+	void __iomem *time_reg;
+	struct mutex ts_mutex;
+};
+
+/**
+ * struct mhi_timesync_info - MHI time sync info structure
+ * @t_host_pre: Pre host soc time
+ * @t_host_post: Post host soc time
+ * @t_dev_lo: Mhi device time of lower dword
+ * @t_dev_hi: Mhi device time of higher dword
+ */
+struct mhi_timesync_info {
+	ktime_t t_host_pre;
+	ktime_t t_host_post;
+	u32 t_dev_lo;
+	u32 t_dev_hi;
+};
+
 /**
  * struct mhi_controller - Master MHI controller structure
  * @name: Device name of the MHI controller
@@ -323,6 +347,7 @@ struct mhi_controller_config {
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
+ * @tsc_timesync: MHI TSC timesync
  * @pm_mutex: Mutex for suspend/resume operation
  * @pm_lock: Lock for protecting MHI power management state
  * @timeout_ms: Timeout in ms for state transitions
@@ -401,6 +426,8 @@ struct mhi_controller {
 	struct mhi_cmd *mhi_cmd;
 	struct mhi_ctxt *mhi_ctxt;
 
+	struct mhi_timesync *tsc_timesync;
+
 	struct mutex pm_mutex;
 	rwlock_t pm_lock;
 	u32 timeout_ms;
@@ -795,4 +822,14 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
  */
 int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
 
+/**
+ * mhi_get_remote_tsc_time_sync - get external soc time relative to local soc
+ * time pre and post using MMIO method.
+ * @mhi_dev: Device associated with the channels
+ * @time: mhi_timesync_info to get device time details
+ *
+ * Returns:
+ * 0 for success, error code for failure
+ */
+int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time);
 #endif /* _MHI_H_ */

-- 
2.34.1


