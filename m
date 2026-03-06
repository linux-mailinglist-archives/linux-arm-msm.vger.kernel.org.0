Return-Path: <linux-arm-msm+bounces-95700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPyQK3YjqmkOMAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 01:44:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 425FD219EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 01:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F411730602D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 00:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB622E282B;
	Fri,  6 Mar 2026 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgKM4Ee1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E32E62B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757840; cv=none; b=EoK1yglyv5/dOhU3oM9OL7nLGQVhkhIRsat+mLIo1eBCV8oAhoA9OnN7ev+7pgpCPaesfiDfULZO0129fENAbKhakwP+D+r2Ky2XReq7ToaNTGDLxEpDeZZefPhDEgemXNtlOOEfuYZW54w/q/7Kq+Tcj2KylTH3mMv1S4DhNHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757840; c=relaxed/simple;
	bh=SlxNkWeYG2jC8F4dtE1l8oVL/VcZqLqk8x6VI232W0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIMuUMAO8EHcem2EfzuRZUPJHWheVHAF0ROG7qdDFkDkmtTdBXHtYMA2lYwnMQ1u7mzfkQvowTDjVCJ+kOdMk1fzLQMvlu3zsy2pHrg2Nr45WUKsfsjj/WzP1lSdU4CXMLG8xvLy4UQS6/sBYNzcGCiVJLCygakcn+N8Nt07fHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgKM4Ee1; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45f015a3259so3504081b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 16:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757838; x=1773362638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ8acXeUu2flgK+dNZrWf/T7XYkkUKe2qrxt7AXt0W8=;
        b=TgKM4Ee1shtqjFqAYX/Tvu24mMHzHYWDHwbcUrxByCXE9jIUgDEiA3Tgo6dYq+ifCc
         WDCcVvSagAULwIIo9hsBP0NVU0erG7BKNDwtloqo9r3vL3TZ2O/9lLAqEb/y7COLWUmi
         4GBwj02/d+o9dHsssatWS2WO18AWoxkwndEN/6R8W6r7G3YY925j9OwIeP8XKTdhAV1t
         D9SXQubmL5WElie9VbBc2GGiYtUvs8EyxLyH516nIDfgb7u0CkfVeLVd+HGGlmSW3jJT
         3lA+Kwn2jp3ZATM9bKtGTX0TMSqr0QYmTJo8LXDdmeRE+g3yLYMQQMqtWW6lAxRjfe6c
         GBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757838; x=1773362638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQ8acXeUu2flgK+dNZrWf/T7XYkkUKe2qrxt7AXt0W8=;
        b=gBlvEynFo9GuSTE741R6KXvVFsibgVSEFob5bzj9P78xcgF3J3lz5jzgvUhICdtTLZ
         0nHkkIKK2mn+rGGjxcKAt44MRSk8/anUV4RKh9eqYqlioO90lo2tD+tO3pae7BMjtQOZ
         Q/eLOPZZ3XfBrXhKjll1b54DO/OhP13fqnPjg9Sj4J5rsN/HQMEL3Yv69rvfsjZ+nOya
         xzWjjEZMdq8gq6+2S5N4735jOf5bk4lHOcz7Cxcs3rplHcnwxJcwyx3mwcmZ5Z+jek/Z
         pRGn6D5IbLaGVSQa2YIYqIJ4oqsB/mEJgO3556s2BnH/lmyqgy08dKxh2E6Fzjr4nj7W
         4WtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFlBjG2XQZ00irYlzbewE69sg1/xE6CezjDuV/afuADABp7S/s/0OnNHZsp7FDx2R80lEaO0A3xFmoh5fH@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtazOV+nEs6xEKb9MRBL5eZXkDViSY36XO8ujI5Br1TNgya/o
	pTVvaTmxybiHeqZYS1jYJYZe+bT2Cd/j9YMp+lBg7xwEzAlu1NkiGFnJ
X-Gm-Gg: ATEYQzwnOEPhjOcGqhXOxNBKyl6FBYIP5LCvEnOAsZEczOeT/y2mfJOaVnzy0WVPd4j
	alWPMnQVq2IKACqTEmVOCf2GO6WTAP/L2p/hN9TZ5PJZbe9+5gxfYEmRcTvSFWtqM8JieGPbnQC
	lBVhEwvRLVPfEy6FLAnoTlk7AcFQ6ukPvtxw0rePnlWb0zp+xhMDiRBV/hlXdwoAcBLaMMOEX+J
	nRWCrnr/aIaEr1qNsjGdGsxVg06ORenBxTBku4K8SWQqf8SyKmnGys1IJumfjIezCZq8XvP4jPd
	kqw4WVy50o+Vt5I54QDYKlQxFtE1KUyiSmWAZw1MIQ9QNFYYQ4IrXbXJprZmZAuGNYLaVzVOYYB
	BqQIT2rjS1EUTy3AC+2kSMs4OjJjSDCd/+cJkSrVs+1xG9ykObmiHT2thtIg756V173uXXJZQCp
	lg0UJD7/o71py0vgbedCk/VM4ItNsiBGq6d6yVrMFee+TIx+ALCvu/bdzajoztO9/JHoxYdKltH
	FXJaSIB1H93VfPIw/PJKb3TlzdD3v8PV/VgkP+vAQ==
X-Received: by 2002:a05:6808:1a1b:b0:45f:1387:973b with SMTP id 5614622812f47-466dca7e5aamr210025b6e.6.1772757838015;
        Thu, 05 Mar 2026 16:43:58 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm69335fac.5.2026.03.05.16.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:43:57 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for WCN3610
Date: Thu,  5 Mar 2026 18:43:43 -0600
Message-ID: <20260306004344.10968-3-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306004344.10968-1-kerigancreighton@gmail.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 425FD219EE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95700-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

WCN3610 has the same regulator requirements as
WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.

A separate compatible is needed for WCN3610 because the
wcn36xx driver uses it for chip-specific configuration.
Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
disables ENABLE_DYNAMIC_RA_START_RATE, and disables
STA_POWERSAVE for this specific chip for stable
functionality.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
 - Move remoteproc compatible string addition to the middle of
   the patch set.
 - Add Reviewed-by Dmitry (thanks!)

Changes in v3:
 - Describe why we need a new compatible in the remoteproc
   patch [Krzysztof].
---
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 2b89b4db6c..e58b59355f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
 }
 
 static const struct of_device_id iris_of_match[] = {
+	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
 	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
-- 
2.53.0


