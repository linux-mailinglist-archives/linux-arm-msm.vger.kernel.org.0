Return-Path: <linux-arm-msm+bounces-106959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKrGBkrsAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:48:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA851089B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD52430A52FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFF43FFAB2;
	Mon, 11 May 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEWkRIZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECFE37997E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510526; cv=none; b=cjOSnPMvOiMLclxDcwvSH9Nhlk2crKLXVcs6JzRhGsNC8r1uD35N+u5G8v0hTjMHsM8wtqQaz8QThOIvAeRgRRM6OdR4GPU5jI4fnuwG+fnTz+PnBHJT/1latZcs5pbZDy2YWi0Ui9Q08vshuWDSDSCWwgA5AWrEtr1+ovskvGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510526; c=relaxed/simple;
	bh=b06JLm8gnVAKmpUJsadPirCQrpBney0fBM/mUWRS0Zs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mo66m99s5V38T65PBnzoXZpvr+yLq/Gl/nzEiWj09JonDQf95T6y+1B+FuAN2enrOibc/xflTuI1teOk9jk3mOF/ComXMJ0pJlwnmL1iivBoGxwkWUZcAnP2vLhggkFpfmGvdWq+tpYZj3/0nt+3wT5Fy/5zsRDVSqJWRzrxV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEWkRIZ1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-83d5bbef760so1306558b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510524; x=1779115324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTnZGEOCziqxcZWijZLmnDR+/yLckOVoehWnSj1/JQg=;
        b=lEWkRIZ1h1nKffjoR56m4ZqP8hTfzw8pKwTcoBi1wnHqhAaC9WBEFYV2gL4zKVo6Og
         MNt4dHZQj93d/cKu4AgIjCXkDDYYfC75qtpJ1bq0kFzZpSK1ezNZNKerT6KJBoSyRFfA
         qd21UWDWjJ/nLWU+4ua67a/nREJunMon7S3EqoQN4tT7S36Ofm3ZJeLpwzH3iNgrsFW/
         u2Ny8dba3uWrMD9rIt7t59C4jhU5w++CVP3peibcCn4Pi6ODGLqXDXylekOQVxg4UoVg
         1j/DpDDafNCkiYd2IXGpMwAhLkgBMIL8loHTfAF8FTddZe4i7yslDnF/986ASYmnHrwG
         hFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510524; x=1779115324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XTnZGEOCziqxcZWijZLmnDR+/yLckOVoehWnSj1/JQg=;
        b=ooajCNEKGFTCGtG98CnfcKBMbYBrXstgUTXIS0imnspK6M7jEMRStdlN51KaVwSoCL
         cuaIAZDcJG9SEGFcCOsFXBn4Ns4FZK5Qs33jz6NwYAjz8a6Hm845BEblfnZIOt5OxdiD
         wU6EUT4ruHi7jSxf9zEaSo1MLv3hDBCOhtaMTuxjYgfAMXT0fooRyA7LI1VpbNNP+XA9
         HGS5I53mdeJuKh5R0SAFQmTs8jEgmHq/6MV0t/NpqkZz6hZJJwR4ED7ZX0Qoitf4uK5z
         /HIgCUYi9UTz6Qx4neV+2wFFJAsaEe2S8mUWyE6lmeruBGX1JH5Pmty+ltAO3U6z85qb
         aDEg==
X-Gm-Message-State: AOJu0Yw08oxkGCXkKj6NpCL6k2Wa8AnZ7sSVFREe4YQ5hIGdLb3tvwK4
	heHUy9Cnrkm6BSVKd119nbeHobExKNdhGaOPX9VX4GXpwXGwQ+/nE9GxPGoikEjl6hA=
X-Gm-Gg: Acq92OEKIMyqGUPZnC98q49gn927oR48sm4MRvANW3pdvqBVuPEOlSW0K3AJwon4gNZ
	Ha9V4R+PqTJMgwIpSaKnGfmvRIfG2iAwmPlBXxV1ZKb92NjU3XUZ0XjOnDyKrm+fCsqmhylMKXr
	24ysn64PQTv7TxzWFnXD7+I3PjhEjHs4qTIqje+7u3aGr1wAkJ5ZYZiTYIi+tc7tsgsXWRduGUg
	jrV6pYgtPfAzD5e2fDNLLMTQxWM3U+V1jevrOTnkbaykaEIMK8zFj/Yp+aPiXQHmerJasmIVzOl
	5gCuzEksY59JQlO5ekLVQHJe1VDipr4ljSm05KzHezUcAPf0kfIbrGkGNMAFIYWnAlJXcYr+0cZ
	A4PbAGiTXdNzatmxemWZJ4BLP6Feo0M7TrHD8cd4/tPS2k1aN1jxAGN3Zmzop9aeCXCBEdAtT+4
	gNBd1HtSPJW38cisl3wh7r3hLEfaTX9deUNvZMGaCG9eoYOiKbZXbPl4zTZdapYGRUDmvg502qF
	OGznRJXhaERdA==
X-Received: by 2002:a05:6a00:21ca:b0:82d:24f:2509 with SMTP id d2e1a72fcca58-83a5b0dbb5amr23694278b3a.1.1778510524535;
        Mon, 11 May 2026 07:42:04 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:42:04 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/8] firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
Date: Tue, 12 May 2026 00:40:53 +1000
Message-ID: <92171ad5e7851e6758dd205246b4289f32e12655.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B6AA851089B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106959-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add the Surface Pro 12in to the QSEECOM allowlist
so that the Qualcomm Secure Execution Environment
interface is available on this device.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..6b601a4b89db 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2306,6 +2306,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "medion,sprchrgd14s1" },
 	{ .compatible = "microsoft,arcata", },
+	{ .compatible = "microsoft,surface-pro-12in", },
 	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
-- 
2.53.0


