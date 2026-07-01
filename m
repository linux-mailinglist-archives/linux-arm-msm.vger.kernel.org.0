Return-Path: <linux-arm-msm+bounces-115773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wixVHFxVRWqN+goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 19:58:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C86F078E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 19:58:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nvl4pc0e;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115773-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115773-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93C7302EEF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 17:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9537F4C0436;
	Wed,  1 Jul 2026 17:58:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9A31985C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 17:57:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928680; cv=none; b=cu04ggtgVUOxFWwLun+JhfVEL6nflGKf3A32w+6QqsnTzonpnBIbYrEU7kYAvV9Znjv5QMuwKDjHgXuILctz5CuImHTjKzsJgPLTmxgG96iMilj8kghpkVVbSXNdMh2CqNObB+D5dA+AQRC2s86ickg1LlIkmeBLXrxE3+5SS1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928680; c=relaxed/simple;
	bh=ESOuRtHjZy1hXdzAjoIyMynANTOZhaenHIm2iySL/XA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DpVgzk/WPNjsWIHG6agJZav+oHHDb0DIt6paWIHgCV13dkvGfCuNMTBqBzCx7F+IMgFcV+mr7FzwlD6hWR4tDwha3EMKo7mQCk/oGr0/bj610GruCEui4+oWktYefTOnI0Kz/nhxffjFITkAiGo4MjUk4UrgZ5Xymv5XW0pt3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvl4pc0e; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6770f12e4so545165ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782928677; x=1783533477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xabEEnPMeAsxiMp/uB8gvGoQlGBh1rxYbqUQL864RtQ=;
        b=nvl4pc0e/cZbbBGrJMUptrhiTDSrZgpHjjTbhcwaSj3FcDStWTEF8pk9RgezFYO3QR
         xSl1FByqST8J6lPcoCbmdAbsQoRwDa8DGavhZnV74jz96yr20np6W+O0E/tmMjM5M/sB
         7oAXsBT1SCOkB1iz+ms/PqeLy+pwkocANy7x5oRzLrZAfm62QFEsseW3QEluHjGhr7S+
         Q/7kepGxsGdItJK/TWQPhP2J4c6QdKPZ3wb1qraN6YicKM4tCXZCIyjyjyffvMuN447/
         m9Qux2Apjub6tPkZLJrHdeNjefVuZeqfsYtQ8nINKhK26ndts0ojOe/qL/28hhYOf66b
         LZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782928677; x=1783533477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xabEEnPMeAsxiMp/uB8gvGoQlGBh1rxYbqUQL864RtQ=;
        b=YPYKUQ5c7j8HmhU33vjo8pTeZFIEY32+cLyaly/b0V0jOFepC0U/nXdXV6d3nCP9Tv
         ZyhKZmL2VIUhCEwsB5NFGA7d5xSP3DXODuxZdx0ZmcSXf0P7LDOruGYacw4Ke2fbLv79
         qNq7X9uVlXU7CZob13QZQaO+T+2B6k9P9C5ODcf6Ik1hP1Av+TAaFqzXpRzayUQLDTeT
         BcFdCcUtX4VFqAMOyeMnOY26QBeWmajSdxGoM7ehjFGXqBYc87aoqsugyrPFTTsaQtXi
         9qxEU4uoRl4Rx0saApIUN8k9yvzTFv4DYL9RgLNQZ7n61K8CStHt1bjoZwE8yWdlG8Ak
         1d7A==
X-Forwarded-Encrypted: i=1; AHgh+RpGMCcYaOoahanDQGoba9jHenWFlJ2mY/c6FGuizhQc844997iwNgQnYksSSRp3ilHGtvm8VhaWBZiCVBba@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEqAZWAEmunxLfFcMeY5T5Die/1FvXJg0p08XM2MDraCqwquk
	hSqbBxAGIaDRYGe+jbPJJrHAg1+RWlQWhU9MeyFWgSYOSMW+uAsUP2fm
X-Gm-Gg: AfdE7cmHXUeultiGQndilUdJ3INPvgfKm4egqciR5m6b/NEJGT11wjllne8NTLAZ1Ta
	mPDuoU7D6VT9sCiSi0c9L/+6cw6LoZpJ+vNDqgxEDdrKVa0bG5XExmu7i9GfJ/FW3vszeCzlguz
	jo0XnW5xRdWp+ISTeN3wmuscYtT85o9XRbB4unUIjW+qxHrSCzjpYWHmqbpPkwTA7DOYlQJwCw1
	Sztv5Rv4+Fqe0D9MnRWgycrkmYLDhsL1/0DPG/uzx9EZcu9zLUxn3I0OGclyaZ1rPqwYntkqXMO
	YW6PZ/DBhD3Z9tKsGHdZw9wZMwomgFkN1o1J/wJmORJ7fiNHNG7ubuyBmIiGmZP6tUpN9KVA7gd
	m0JDj18pCNjLZ3Gbp3sngtE2XXdzXQYS3g9jBI6Rdi5VmEZLkgD3aPWuVVrMJUNg/MaWh/uEboQ
	SAkQMI5QJNCPkiIZoU92hiB2bzI85ukemwpmQP2TI=
X-Received: by 2002:a17:902:fc43:b0:2c9:f73d:4b48 with SMTP id d9443c01a7336-2ca7e912984mr17893065ad.6.1782928677045;
        Wed, 01 Jul 2026 10:57:57 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm145394c88.9.2026.07.01.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:57:56 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v3] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle and leak
Date: Wed,  1 Jul 2026 23:27:24 +0530
Message-Id: <20260701175724.1972-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115773-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:saileshnandanavanam@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[saileshnandanavanam@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[saileshnandanavanam@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF7C86F078E

DTB co-firmware was previously requested and loaded in
qcom_pas_load(), but its lifetime did not match the actual
start/stop lifecycle of the remoteproc. As a result, the firmware
reference could be retained across restart cycles, leading to a
leak for each successful boot.

Additionally, if qcom_pas_start() failed after loading the DTB
firmware, the remoteproc core would not invoke .stop(), leaving
no opportunity to release the associated firmware reference.

Fix this by moving DTB firmware request and loading into
qcom_pas_start(), so that its lifetime is strictly tied to the
remoteproc start sequence.

Update qcom_pas_start() to ensure proper cleanup on all paths:
- release PAS metadata on failure
- release DTB firmware on both success and failure paths
- unmap DTB carveout where applicable

Remove DTB firmware handling from qcom_pas_load(), as it does not
match the correct ownership and lifecycle model.

With this change, request_firmware() and release_firmware() are
properly paired within the start path, avoiding leaks and ensuring
consistent behavior across restart and failure scenarios.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
v3:
- Remove the unused release_dtb_firmware label
- Release DTB firmware under the existing dtb_pas_id check

v2:
- Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
- Fix firmware reference leak across restart cycles
- Handle start() failure paths where .stop() is not invoked
- Ensure firmware is released on all success and failure paths
- Remove DTB handling from load() and drop release from stop()
---
 drivers/remoteproc/qcom_q6v5_pas.c | 52 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..d0a12e5b2ff7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -232,28 +232,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
-		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
-			return ret;
-		}
-
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
-					&pas->dtb_mem_reloc);
-		if (ret)
-			goto release_dtb_metadata;
-	}
-
 	return 0;
-
-release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-	release_firmware(pas->dtb_firmware);
-
-	return ret;
 }
 
 static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
@@ -277,9 +256,24 @@ static int qcom_pas_start(struct rproc *rproc)
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+		if (ret) {
+			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
+				pas->dtb_firmware_name, ret);
+			return ret;
+		}
+
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, pas->dtb_mem_region,
+					&pas->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_metadata;
+	}
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
-		return ret;
+		goto release_dtb_metadata;
 
 	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
 	if (ret < 0)
@@ -350,15 +344,17 @@ static int qcom_pas_start(struct rproc *rproc)
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
+	if (pas->dtb_pas_id) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
 	return 0;
 
 unmap_carveout:
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
@@ -376,6 +372,12 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+release_dtb_metadata:
+	if (pas->dtb_pas_id) {
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
-- 
2.34.1


