Return-Path: <linux-arm-msm+bounces-36660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24939B89C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01FF01C2122E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C59B13FD83;
	Fri,  1 Nov 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hxVeykOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1A14A32;
	Fri,  1 Nov 2024 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430950; cv=none; b=CLE+VxxevbV2dDTOv218uz8UYLA3YsugaEgYGJaW+KPfUW3xaEwYKcgf2Vk7eSeJAnoa7yKhYNADTwiHRpMM5sfb7VZYJyfBfhOohrxXaUFGOa51ttEpMayQVs0o487AU/pUjgA+AYCKjkPOvpDKnb6w6P2RgIVelJr0lK/iQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430950; c=relaxed/simple;
	bh=y6nERgIabAfub2KaXbeDDy0nqzjPTegHcWIn9Z4AFKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=g7thmY4qc5fWQk37fNkJwMD31bbcqQF7kgimIErEXahLGRv7pUga1zlDNdXQtMWMh9Qd8BmxGlANrOdH3qV8uz7jkErKye0XYwkdu58JqU968HfiuFfeDi1P+ptbIJE8zrCbQwtIXtyAw7KJrQwHmLhHBhFFS5+O2qcA6JxknKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hxVeykOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VLjTH9018957;
	Fri, 1 Nov 2024 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=9jP4DTwPqev3gJ+iefMaVX/xYDm3p8x7qnDkjaWFUOw=; b=hx
	VeykOlShr9CWirv9yWo7limW5GGr9/w07SOgUTxte11WUhZTtMuwkJo/zqvSKKOG
	jRgtT6PvTHaYq8RQM1QMTm1O0T6vMO5mV122v0QepFtIYcNNS/rCAUD72eDP9Swi
	Wl8gBghypJkw3hwPlt80DyYG9yPvCkPaDx7xeYFmlX8F5Wtb459nR2c7vVV9TTse
	FZFdOlbg1Nkws5GdsEEvf9Y3kfVMbW6u2Aq5c510BrSvbO9Bx1bMrNVnP7cg3RFC
	IMA/x8ik/FhCmC8GEVWbLtANMf3RShFD7bzajvg8o6SwJisIOZFivCE/ozj0k6BK
	WWL3VRhRRBGzJutvOGWQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpqwqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13Fen0010609;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:40 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13Fe2A010584;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13Fe8L010580;
	Fri, 01 Nov 2024 03:15:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 7E08A5006D4; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 1/6] mmc: host: support wrapped keys in mmc
Date: Fri,  1 Nov 2024 08:45:34 +0530
Message-Id: <20241101031539.13285-2-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241101031539.13285-1-quic_spuppala@quicinc.com>
References: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lzztYrSkVKLGOFatPZTwKVLBxwkYaroH
X-Proofpoint-GUID: lzztYrSkVKLGOFatPZTwKVLBxwkYaroH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Since wrapped keys are not part of the MMC specifications,
it needs to be treated as a supported quirk of the MMC
controller. This way, based on the quirk set during a host
probe, MMC crypto can choose to register either standard or
wrapped keys with block crypto profile.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/mmc/host/cqhci-crypto.c | 23 +++++++++++++++--------
 drivers/mmc/host/cqhci.h        |  6 ++++++
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
index 91da6de1d650..c4e7ae95bc7d 100644
--- a/drivers/mmc/host/cqhci-crypto.c
+++ b/drivers/mmc/host/cqhci-crypto.c
@@ -91,13 +91,15 @@ static int cqhci_crypto_keyslot_program(struct blk_crypto_profile *profile,
 	cfg.crypto_cap_idx = cap_idx;
 	cfg.config_enable = CQHCI_CRYPTO_CONFIGURATION_ENABLE;
 
-	if (ccap_array[cap_idx].algorithm_id == CQHCI_CRYPTO_ALG_AES_XTS) {
-		/* In XTS mode, the blk_crypto_key's size is already doubled */
-		memcpy(cfg.crypto_key, key->raw, key->size/2);
-		memcpy(cfg.crypto_key + CQHCI_CRYPTO_KEY_MAX_SIZE/2,
-		       key->raw + key->size/2, key->size/2);
-	} else {
-		memcpy(cfg.crypto_key, key->raw, key->size);
+	if (key->crypto_cfg.key_type != BLK_CRYPTO_KEY_TYPE_HW_WRAPPED) {
+		if (ccap_array[cap_idx].algorithm_id == CQHCI_CRYPTO_ALG_AES_XTS) {
+			/* In XTS mode, the blk_crypto_key's size is already doubled */
+			memcpy(cfg.crypto_key, key->raw, key->size/2);
+			memcpy(cfg.crypto_key + CQHCI_CRYPTO_KEY_MAX_SIZE/2,
+			       key->raw + key->size/2, key->size/2);
+		} else {
+			memcpy(cfg.crypto_key, key->raw, key->size);
+		}
 	}
 
 	err = cqhci_crypto_program_key(cq_host, key, &cfg, slot);
@@ -211,7 +213,12 @@ int cqhci_crypto_init(struct cqhci_host *cq_host)
 	/* Unfortunately, CQHCI crypto only supports 32 DUN bits. */
 	profile->max_dun_bytes_supported = 4;
 
-	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_STANDARD;
+	if (cq_host->quirks & CQHCI_QUIRK_USES_WRAPPED_CRYPTO_KEYS)
+		profile->key_types_supported =
+			BLK_CRYPTO_KEY_TYPE_HW_WRAPPED;
+	else
+		profile->key_types_supported =
+			BLK_CRYPTO_KEY_TYPE_STANDARD;
 
 	/*
 	 * Cache all the crypto capabilities and advertise the supported crypto
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index 06099fd32f23..f6bc66bc6418 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -241,6 +241,12 @@ struct cqhci_host {
 	u32 quirks;
 #define CQHCI_QUIRK_SHORT_TXFR_DESC_SZ	0x1
 
+	/*
+	 * This quirk indicates that EMMC will be using HW wrapped keys
+	 * when using inline encryption.
+	 */
+#define CQHCI_QUIRK_USES_WRAPPED_CRYPTO_KEYS	0x2
+
 	bool enabled;
 	bool halted;
 	bool init_done;
-- 
2.17.1


