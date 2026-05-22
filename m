Return-Path: <linux-arm-msm+bounces-109165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ+ME5ryD2o2RwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 032F65AF5C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBB0D301D953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC403A5E66;
	Fri, 22 May 2026 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYPwAef4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1447D35E921
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430038; cv=none; b=Pew7KbkESMg3rpIWJ1Kyy+VtEPvf8HEKT7QzxDNfgRklkPkGFA9sPHCB2vL0lCJA5e10IghvRz06L4bWJK6aEPzzgXH5ZE04Zg3g4NlO4i7Dhra01arKHoveqWh3/caqOzqZQeOrtlptt2OxhQ5stw2XXVEiJh6KytggqOtYzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430038; c=relaxed/simple;
	bh=/ew0ue031WYpDsaevXnTSZrIhbBeG5akyBwpldODkdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVcPnS3gk2eHuEo4Go2cOKLu1M2gIPfQFKmS+naw7oEWR/wkBci2tqeL9ZC7DsZiSebMfXb4dEUY8bC7yw9n8EnU5s2XZCPORa03fZx/vfGWqXEY5vM1VhYIZ7zD5KigLIIt4YV92vCj9PyzEZ3swqpNXouPOqdgKdcMKa4uLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYPwAef4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso4408241a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430035; x=1780034835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyiX7MahC/TLGYvEVYll4nFlnUYS5AzNMKFJNf8jQZw=;
        b=bYPwAef4rahhBRKw+zntmEBECIBLCvbERpWI4kNFgFck84VvfdPABk6WB5JJRNlpSl
         bTmvFOmF95L3dq7bh4h1mZeBfV9zBafQFDmzW741h0/duQJqrZ6s7edd4M00cwKLdZME
         j1xh51vtC06+i7GZUvXB9I0fOnAYxwXgCon4Mm5SM3zhhkNE9YejB2veHrh2+vIumiF9
         9gZryLr9a3D1oYWFRiNpraKLUOqicX0j4Oa8kAjvH1mwHk/HW8PXyO3juHpGyVH+TCw7
         dnDqc7sCPGpnG1o9J0XrHpaoNnpoX86H6WK1lLSV3tVGrWfPkPp01h68EkKRUqKiKLJ0
         v+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430035; x=1780034835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyiX7MahC/TLGYvEVYll4nFlnUYS5AzNMKFJNf8jQZw=;
        b=A/MNyjBungIpAfPqTdluHLh1RvALhTwo9/WnTCeM4g9UIFaaFnR1D1HOdy0PCS30wX
         K0hbUSUAyIUmX9yUySs56zf7v9Tdubbon5WHLQpeIbW2kr0ONz07MMp7tq/wettisZ/K
         mFk3++FdZy/lN78iB0fEXpmshyjKdd1mMdlKaIxGHeU8HC+FIvy7OFrzB14O1L2RNOE4
         U2M7d3DJYOXBZUZONyEmRqn1yDufPwaahQ7iydWXTXLhDx9Ceknxq/A/6zhYvZceelJz
         P9RnADrmJmQDd137pJmEvjcWOrY6nGvIxMXuVocSs+tPpl2lLOZyvhR9fJQVh97C50BC
         lwgw==
X-Gm-Message-State: AOJu0YycN/NTuJu51eX4rKQSI02GG9gzpW4XPITWqUBFjSCAPgKZGq47
	shN2/0AYsH6dIEeSo/fmxIL/0draxQv1f+cg/dOX1fU0Hs7wjFdxffSb7IAdqECE7kg=
X-Gm-Gg: Acq92OGqClIswwZGRmD2N6G7D95Bguk01XXEOEj20gEwrLnSpA0CcHdM6DNffR2Iim0
	sC24Ij2A9Cpn3KZIBeKlXv/FbkvfLRRhQwopbEWYvq4aa7uuf5PvaAPHf66wi5F3KIebLYAAJ/L
	26TOBvBYjq/jA5k9HtqI7H0wetBBnjpYcSFgHfNd2uK2G/JMktfWKwHtRYTYJ9YkhMi8IX139zS
	v1jCdNiHtVcuUQvQqmGfr8OUPZYiQ0iH9RHiA6pKcA0k290Saby2sAhXDtu/sCRYHzqeMxU13u7
	D5vxmD6wyE9vWf91QN2RSonNktldQGo1/hgU78+BDPt/WJJBowlDoJZALhX/PvxrfDTdto2vJSU
	SEE0Aa64CdrhShxqSPj21snk0M2iUZr3UPyf81MtY94q8bfocK+i74IkYA91XY7Fki+5OK6R9Z5
	Upt/G/0O7vBVf869/e9sCzkKPEPdDtxfP5DsnXptBxnjxBbLTdJUleGNQ=
X-Received: by 2002:a17:90a:d885:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-36a6782a785mr2028386a91.20.1779430035353;
        Thu, 21 May 2026 23:07:15 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:14 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is managed by firmware
Date: Fri, 22 May 2026 18:06:40 +1200
Message-ID: <20260522060645.4399-2-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109165-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 032F65AF5C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On QCS6490-based platforms booting via UEFI, the RSC hardware solver
is already active when the kernel takes over from the firmware. Calling
rpmh_probe_tcs_config() in this state reinitializes the controller
while the firmware is actively managing it, causing a security
violation and system reset.

Check whether the hardware solver is already enabled via the
DRV_SOLVER_CONFIG register before calling rpmh_probe_tcs_config().
If the solver is active, skip TCS initialization and return early
after setting the driver data, allowing other drivers to find the
controller without disrupting the firmware-managed state.

Tested on Radxa Dragon Q6A (QCS6490)

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c..7915f12de 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1074,6 +1074,20 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	else
 		drv->regs = rpmh_rsc_reg_offset_ver_2_7;
 
+	/*
+	 * On some platforms the RSC is already managed by the firmware
+	 * when the kernel boots. Calling rpmh_probe_tcs_config() in this
+	 * state would reinitialize the controller and cause a security
+	 * violation. Skip TCS initialization if the hardware solver is
+	 * already active.
+	 */
+	if (readl_relaxed(drv->base + drv->regs[DRV_SOLVER_CONFIG]) &
+	    (DRV_HW_SOLVER_MASK << DRV_HW_SOLVER_SHIFT)) {
+		dev_dbg(&pdev->dev, "RSC already managed by firmware, skipping TCS init\n");
+		platform_set_drvdata(pdev, drv);
+		return 0;
+	}
+
 	ret = rpmh_probe_tcs_config(pdev, drv);
 	if (ret)
 		return ret;
-- 
2.53.0


