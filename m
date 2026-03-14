Return-Path: <linux-arm-msm+bounces-97657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGbfOSC6tGl7sQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:30:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA40D28B3D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F101D306D8A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92F9299948;
	Sat, 14 Mar 2026 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bynXUyNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6150D2DCBEC
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773451782; cv=none; b=VHQjH4LUO+8QYofLzAG3Hj8dsDjUZ/4DVjwvvxmT24Ccyo05p6/9OPUemtRWHn3DxAyn/mHDUJydI+Zz2M3cIVSzQXPL4ImiahSxsUyTWVxDZTNq8fw9E+cXyVaGF15qZFmC/u0oVfP/HvefT60/r4EFocE4nGUwgUAPNI584bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773451782; c=relaxed/simple;
	bh=dV3jg1+DOv7fEiiK4J/r4Umlo5KMXsltUg3usnZprSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bq/bMKcQpa/MWpNuV2wQ6npp/R45nPicz4LAH4LYqe6Cx+mX53GXXSTe8F4GgJvrhRwaXMf8Yfg3WQePa2IeJGUJMXiGmQbobEWIMIIzuNMDBFyMnMVTTWTIJ6/snE2KOXLZ9OX5TwyrhmoMAKnJH/kQRLqdFeZHopYhakW3POU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bynXUyNC; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a428745e2so1160211fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773451779; x=1774056579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=67czfmKo1V3NOWlO5mwtLHdHMMu/0CVjSbVaqAfW2I0=;
        b=bynXUyNCM/wFVUkOgWM1++yX6spCa+BKMGmHfkSNTWrTFDoRGUiEEdM9CBrjDlJ3AD
         k2h3Sm8NLltaGaFEmw8wOVaKbR8hdwKa1A5VQhtIDf95E8Qbm3wFvgmjsfvDhbgJdx4r
         bFii9x138wTTwDAZY1HpU3zwdfSdfAQNloU5qLJg5y1VxAAEBxG8All5qwSAtGpoF4vc
         m9IxOfVsF8KvDr+OgnHKIa81UPtGoL4pIPNg7MtSYtYr7xWu34Otr4Q2Q64De0szTqgK
         CnE5DEL13U4hK9ru3/Xlx0KZr1NCMiGjBqS+s4PA45YuuMN/rooqGTAHo4OAcuRG2GIv
         sv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773451779; x=1774056579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67czfmKo1V3NOWlO5mwtLHdHMMu/0CVjSbVaqAfW2I0=;
        b=SuqHkmgEUU18o8xA3KxJes3ZDSF6t486H8teica7NNmiVD3ZWOPQ/gQ5fB4c9W0MQU
         338u6w4gedWbqEqdvdBi3sBcCFGWeck7TRa/Q6BPAFv/4jhQqEWa5f8CifXPQWrzq95l
         vLIR2khHE3pPegtVR3lrglYcMYCvEdApMeX4xTMzRUKVSQuKdN/9xgFQNr2NqDvj006S
         9IehaqMZHx91LR7vsbl0OV1eMlWnnhXQAVAt6PxvlqJ+Qx2FOC6WjQp0ws617RC6gvvd
         dATssjxo1R4xfctazntcaSToh/yNTq+wf7gFfnfLnlvAQ3+t/1YbdjGnCVCXm6J3hFvR
         OxAQ==
X-Gm-Message-State: AOJu0YyqzgcWvK5P7k+Vd9aXKMUa3rrytXIGIMU13DDOlGgJvy+e6M3x
	eS+FAHUHbW43Va+0FSlVUW0WXIIVnmnZqoRNqR9CLDkAfuIMi+natleCBig3phgXh/gPPxO6syw
	oWaVb
X-Gm-Gg: ATEYQzwrFJjL/kbm/vu6pRk5jCtid0gyT7isL7cUyZ3gKGAxTLOKi+BkJ3sP1f0zjnL
	FdtcdWyjZ0DClxuG5TNJlJqguF2FjSdQTPuLjrViOyzPfnH4ZXgwhoae2QIUChcDSJNYH4qPEsE
	+FqafHQUaHvlC6htfcb4YXqbnoApnSeJJ+rYZqhIwXToaEbeNNGOSPUNPycAOlgqjEf/zKam2MZ
	8uPEjhwYiaKSeTTw9rzR4dVI92Ys1diSUaUDhQ87ERG2ACe6Vhk+UFOPqNVaN/bpN8GK72rfLex
	YjDgfkdMesbbS/n7vMrNzqzYCBEyK0bLTrkO4bYMDuHUtyF/xlvw2IO20X4gIIlm7No4kvG6ctr
	05wHBWJgEoyboQilJz2kkPwpg5PVXZBZo2dgsFDeDsGcQzafh9ZkOyFuFhKXK3gprypVlusQp0/
	+P6y4TRTwM46fn9QGpxGVH6yO0A699nGGPhhQNoMCgDtWeFyqXSet/uFFI+RloSSv8Bw==
X-Received: by 2002:a05:651c:4211:b0:38a:80eb:58c0 with SMTP id 38308e7fff4ca-38a897a7cb2mr7685871fa.5.1773451779401;
        Fri, 13 Mar 2026 18:29:39 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a764b182asm11752201fa.37.2026.03.13.18.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:29:37 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Georgi Djakov <djakov@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] interconnect: qcom: sm8450: Fix NULL pointer dereference in icc_link_nodes()
Date: Sat, 14 Mar 2026 03:29:33 +0200
Message-ID: <20260314012933.350644-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97657-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: AA40D28B3D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The change to dynamic IDs for SM8450 platform interconnects left two links
unconverted, fix it to avoid the NULL pointer dereference in runtime,
when a pointer to a destination interconnect is not valid:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
    <...>
    Call trace:
      icc_link_nodes+0x3c/0x100 (P)
      qcom_icc_rpmh_probe+0x1b4/0x528
      platform_probe+0x64/0xc0
      really_probe+0xc4/0x2a8
      __driver_probe_device+0x80/0x140
      driver_probe_device+0x48/0x170
      __device_attach_driver+0xc0/0x148
      bus_for_each_drv+0x88/0xf0
      __device_attach+0xb0/0x1c0
      device_initial_probe+0x58/0x68
      bus_probe_device+0x40/0xb8
      deferred_probe_work_func+0x90/0xd0
      process_one_work+0x15c/0x3c0
      worker_thread+0x2e8/0x400
      kthread+0x150/0x208
      ret_from_fork+0x10/0x20
     Code: 900310f4 911d6294 91008280 94176078 (f94002a0)
     ---[ end trace 0000000000000000 ]---
     Kernel panic - not syncing: Oops: Fatal exception

Fixes: 51513bec806f ("interconnect: qcom: sm8450: convert to dynamic IDs")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/interconnect/qcom/sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8450.c b/drivers/interconnect/qcom/sm8450.c
index 669a638bf3ef..c88327d200ac 100644
--- a/drivers/interconnect/qcom/sm8450.c
+++ b/drivers/interconnect/qcom/sm8450.c
@@ -800,7 +800,7 @@ static struct qcom_icc_node qhs_compute_cfg = {
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.link_nodes = { MASTER_CDSP_NOC_CFG },
+	.link_nodes = { &qhm_nsp_noc_config },
 };
 
 static struct qcom_icc_node qhs_cpr_cx = {
@@ -874,7 +874,7 @@ static struct qcom_icc_node qhs_lpass_cfg = {
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.link_nodes = { MASTER_CNOC_LPASS_AG_NOC },
+	.link_nodes = { &qhm_config_noc },
 };
 
 static struct qcom_icc_node qhs_mss_cfg = {
-- 
2.49.0


