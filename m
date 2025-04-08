Return-Path: <linux-arm-msm+bounces-53517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5EA803B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398F918989BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BB3268C66;
	Tue,  8 Apr 2025 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V7StSMTp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/+C339bX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IDXHgWz7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L1Mvf1M5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16026A0C5
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113369; cv=none; b=nTvGXAyXAA2auWTvCM0BuD0/+hzX/MZIfm3Fbk+v/PulgwQwnKn6EyNfvjgWBY9FmpLMxAaeV+F1MvtxS1kxWnQkieLlVsqlYOsuUGPfBStR0QcwzZ6JcjBW6me8PNYvvyzIFwopfXtLfgYU8CNHgsqGan8Sc961rfpfaqWf0Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113369; c=relaxed/simple;
	bh=l8g+uNiWjSij/y6GvCrKb7VczrZgC4fORXo37ld58A8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHY6jP4ynVy86pkYbjn9FtS5wP8Bx4cnMuFEyDXFJqZtF407Bw/S9O+xtTydf9IEdRblBgrD/3pMgzHyqKJHiRbxJ/O9B1C0zzQQwaBs1OOoDNuhasr6mFhYDsXbxsC14DkkhScq+VDCPNT8aSK+ays1Iuai1JsyhKCn8PRrrTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V7StSMTp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/+C339bX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IDXHgWz7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L1Mvf1M5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0C591F388;
	Tue,  8 Apr 2025 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744113364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UFcSj3h5hXgWtyVacqalTzRzU71quHaMvlcjM2f1JNE=;
	b=V7StSMTpJ8/aojCCaJg545UHBft/+NS70CNV+PEzpsY5PRHFntkThg8vJQfKt2VmOyaKAA
	vLGzBOfizrLxy8DcteVSrNqJ06tcPIFZYAxUAmR9Y6uYJN3meXkqr1Sqg/OxwAKU9EHMTo
	4ZGuDIEKjEDPEoorlQXB6QWECOuyMRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744113364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UFcSj3h5hXgWtyVacqalTzRzU71quHaMvlcjM2f1JNE=;
	b=/+C339bX8wHFR9063nyu3zEJqTktmNpfA8E5HRmJHsEZDac17YLFmwDWHbsXQHjp5EZjV7
	6QTCvW3fFEtoyGBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IDXHgWz7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L1Mvf1M5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744113363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UFcSj3h5hXgWtyVacqalTzRzU71quHaMvlcjM2f1JNE=;
	b=IDXHgWz7a49tLV1dNp7zMJ10loTorqnpMoKhFy5aF3kR2gW5grIbzHqc1byYt9w7IFHqyZ
	z28cZnmLArAK8YPg1ZJBOvuPVSk91zeKjblyDQn71oYdQHiRG5oyj64d0F12TS0cskhGp6
	1kWjAUmJBvS3hhNeN2OZ24B+EHneLDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744113363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UFcSj3h5hXgWtyVacqalTzRzU71quHaMvlcjM2f1JNE=;
	b=L1Mvf1M52Frkg0X6BfhEcRNQwPVjlT5L33cRWZuq+VdJRT+UAFGg4wuYbMe1odE1mOOH9C
	bcl/jMDayuoXDaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0EC113A1E;
	Tue,  8 Apr 2025 11:56:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6pIPJtMO9WctFAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 11:56:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jeff.hugo@oss.qualcomm.com,
	quic_carlv@quicinc.com,
	ogabbay@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] accel/qaic: Test for imported buffers with drm_gem_is_imported()
Date: Tue,  8 Apr 2025 13:52:22 +0200
Message-ID: <20250408115237.428985-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D0C591F388
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/accel/qaic/qaic_data.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 43aba57b48f05..1bce1af7c72c3 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -609,7 +609,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 	struct scatterlist *sg;
 	int ret = 0;
 
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		return -EINVAL;
 
 	for (sg = bo->sgt->sgl; sg; sg = sg_next(sg)) {
@@ -630,7 +630,7 @@ static void qaic_free_object(struct drm_gem_object *obj)
 {
 	struct qaic_bo *bo = to_qaic_bo(obj);
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		/* DMABUF/PRIME Path */
 		drm_prime_gem_destroy(obj, NULL);
 	} else {
@@ -870,7 +870,7 @@ static int qaic_prepare_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 {
 	int ret;
 
-	if (bo->base.import_attach)
+	if (drm_gem_is_imported(&bo->base))
 		ret = qaic_prepare_import_bo(bo, hdr);
 	else
 		ret = qaic_prepare_export_bo(qdev, bo, hdr);
@@ -894,7 +894,7 @@ static void qaic_unprepare_export_bo(struct qaic_device *qdev, struct qaic_bo *b
 
 static void qaic_unprepare_bo(struct qaic_device *qdev, struct qaic_bo *bo)
 {
-	if (bo->base.import_attach)
+	if (drm_gem_is_imported(&bo->base))
 		qaic_unprepare_import_bo(bo);
 	else
 		qaic_unprepare_export_bo(qdev, bo);
-- 
2.49.0


