Return-Path: <linux-arm-msm+bounces-36662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052729B89C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B920F282DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F36142903;
	Fri,  1 Nov 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MKlfGn7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A357487BE;
	Fri,  1 Nov 2024 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430950; cv=none; b=TrEAlEUU8R43k9x3bGZhUcq/oqsPa30I3VSI8Ys28Uf8BsK5JGJDOYjwLlw0Odg0f0eNt80M19X9XSq/mPImz8+dvNr1a5+OERhqQz4tMJ8U/VWTDIHK8aXr1MlNfEu9Q7+wsUP493ujY5vOSbEvdSlc1UlFMtCATgzosfLijOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430950; c=relaxed/simple;
	bh=BXNQBM6G//BrKa1YcI8JgufjQszQqzdvYvQMktRzmaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ufqsCF89qBxKXrrTMApjpscEWh+L+/2K5hrXKXiy8ZCU2z+H+tKGrzFxS9sRrJ7UnBxAuPFhXUrg3w22Rww99X97Vz3xOu5hnraz3+HfzzmhsB058pSc1y1m+pXAe7g54hCRq+mNSVTNIWo0rpV1zv6BlMiL/eo2q+5nTVFpecU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MKlfGn7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A10jlEB009603;
	Fri, 1 Nov 2024 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=wJir/rIBeE779G+3/i9b0ZwypdjmGHuZwTf+UAYLSzk=; b=MK
	lfGn7pXMNFpjqFShvOu1nyUZu+lDU8dcXniH1lsyWGOwm7OcFF0Ufdtw8rXE5JhO
	HRfLheyIl+hT5Ev0czgsMcmmyuKzgYqKPBR+Lp3rRZwBGu+AI/p9FjS/2OeZlZxp
	yCk3/+CCaaj7VddsHAWmON7Bv1B4K2YYtI4YCfjs17uLW2RSTjGiXQMnN1Y2as+x
	bUTav4I/yPjoUoNrCGsKk123fj1qktQ9sgDEAtoRJgcQ4kf79rmT3L+oFnlLY7l+
	94HlmpmPRbEm6Fdas3v4s/kMZMUUeKhyXGhitBJ634BpcCjRWuYwJM6phEiHRXOn
	OcPPewPtBgG4jl6xYg2w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kjm1e09e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13Ff9W010612;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:40 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13FeNC010587;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13FeVv010581;
	Fri, 01 Nov 2024 03:15:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 7F3155006D5; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 2/6] mmc: host: add support to derive software secret
Date: Fri,  1 Nov 2024 08:45:35 +0530
Message-Id: <20241101031539.13285-3-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241101031539.13285-1-quic_spuppala@quicinc.com>
References: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ezw1nIAHbb5kSMANJs-rKadhV2HWSYSU
X-Proofpoint-ORIG-GUID: ezw1nIAHbb5kSMANJs-rKadhV2HWSYSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Block crypto allows storage controllers like MMC to
register an op derive a software secret from wrapped
keys added to the kernel.

Wrapped keys in most cases will have vendor specific
implementations, which means this op would need to have
a corresponding MMC variant op.
This change adds hooks in MMC to support this variant
ops and tie them to the blk crypto op.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/mmc/host/cqhci-crypto.c | 14 ++++++++++++++
 drivers/mmc/host/cqhci.h        |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
index c4e7ae95bc7d..e2a4700f3153 100644
--- a/drivers/mmc/host/cqhci-crypto.c
+++ b/drivers/mmc/host/cqhci-crypto.c
@@ -128,6 +128,19 @@ static int cqhci_crypto_keyslot_evict(struct blk_crypto_profile *profile,
 	return cqhci_crypto_clear_keyslot(cq_host, slot);
 }
 
+static int cqhci_crypto_derive_sw_secret(struct blk_crypto_profile *profile,
+					  const u8 wkey[], size_t wkey_size,
+					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	struct cqhci_host *cq_host = cqhci_host_from_crypto_profile(profile);
+
+	if (cq_host->ops && cq_host->ops->derive_sw_secret)
+		return  cq_host->ops->derive_sw_secret(cq_host, wkey, wkey_size,
+						    sw_secret);
+
+	return -EOPNOTSUPP;
+}
+
 /*
  * The keyslot management operations for CQHCI crypto.
  *
@@ -139,6 +152,7 @@ static int cqhci_crypto_keyslot_evict(struct blk_crypto_profile *profile,
 static const struct blk_crypto_ll_ops cqhci_crypto_ops = {
 	.keyslot_program	= cqhci_crypto_keyslot_program,
 	.keyslot_evict		= cqhci_crypto_keyslot_evict,
+	.derive_sw_secret	= cqhci_crypto_derive_sw_secret,
 };
 
 static enum blk_crypto_mode_num
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index f6bc66bc6418..77368fb97eba 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -286,6 +286,8 @@ struct cqhci_host {
 #endif
 };
 
+/* @derive_sw_secret: derive sw secret from a wrapped key
+ */
 struct cqhci_host_ops {
 	void (*dumpregs)(struct mmc_host *mmc);
 	void (*write_l)(struct cqhci_host *host, u32 val, int reg);
@@ -300,6 +302,9 @@ struct cqhci_host_ops {
 	int (*program_key)(struct cqhci_host *cq_host,
 			   const struct blk_crypto_key *bkey,
 			   const union cqhci_crypto_cfg_entry *cfg, int slot);
+	int (*derive_sw_secret)(struct cqhci_host *cq_host, const u8 wkey[],
+				unsigned int wkey_size,
+				u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
 #endif
 	void (*set_tran_desc)(struct cqhci_host *cq_host, u8 **desc,
 			      dma_addr_t addr, int len, bool end, bool dma64);
-- 
2.17.1


