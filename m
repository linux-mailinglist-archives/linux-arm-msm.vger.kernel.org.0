Return-Path: <linux-arm-msm+bounces-109166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMuQO57yD2o2RwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F05AF5CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F16F53014373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9834362152;
	Fri, 22 May 2026 06:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJBaR5ID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB18235E921
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430044; cv=none; b=uawBapwFiZm+O3zJUeD7RRbQXGDliy7MS6bLyaHok1mkk5pR09KX9+DtgMhbU/cQpbCnKBKKvS5EMTqB8H5n0JnAcSv4kaLd4qwsYYD8E8kkVxVQVqqSlgrOO4wa/v4bHseTfZbZi3ol0nw9gaoSsZA042/t7FwP6ljrkRXHaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430044; c=relaxed/simple;
	bh=E0iQhNcseBf9fUV3GBqGktJpy+4e0unmKUUFS541458=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gyxn8VYfH9A85KjuuJVlGPq96JP/bFurM0T9p6pQZbOvTk4xb9Lpls1GG+r0i0mqBsJanVDCG6Mv76ErDMPw9J9sWvE1MVt+KWbk/njHbkh0edICryFwHHsKqiSDy13hBFG2Rju8Vazez1UhUnz8wTSYnX364NSfHL0tc8QgrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJBaR5ID; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-366330b6751so5427625a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430043; x=1780034843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erBAyPrO5roYO8QCyIMfGlSqzNtYHdtfH7kgf/9D/qI=;
        b=NJBaR5IDOHC6TdboMCEHZ8VzsjnTRfJiTigvtq6akHwbvGs2f9wWz2G+m5OOI2FbSa
         mYndjqRzndFaHslf8qAji5w6uE1S4kNgLBhvPq6rcNx9ecEe8koksl2BTnWO11USy9Ou
         OTb8k9f2od1e7xWmGMi9nGyAq7+A2ozyxDYXsXsOVKieg/4owMwpNcz0rjyXafW/1I/x
         UrfBCXoG+wftRyPLIv/8s8iCNplYO/MZg5rj8pjn2sKb1aWTnQZ8zibS6gvGFw2j3tdg
         VU3dJOCcaPkpbQ5/hZozi1dI4pXrssznyWk8Nf+U/cABputJJFr6/oOna6AgeYY+hA9W
         k0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430043; x=1780034843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=erBAyPrO5roYO8QCyIMfGlSqzNtYHdtfH7kgf/9D/qI=;
        b=tJiyVz7ANS6ifETPI0jOB/6yX3RoiPD7fDe695gMG+xABxJ56y8/KhzEZhCPJrm/O+
         i2jAcyARjXv8u0PIjcJQXBRByzq95vDJ3YcPG0jTOKbhJuGhauJIFQy0teFw9JPtN6lA
         oxz1wEU8XOELUUJ2s1BEYFji/LRgQV+kbZap2xfEARGn6+16WgXr9lPoVX3Xvrvv5Z4m
         Mm+pN2g+d4k470j+bIWvYiCqP503sylPCn61xEVf2oma49LzgaXDyUutNIegJwGs8fjz
         kyEZTu9pNlJPnJSeIpE6tHoOzkZVutYDkRa06OsfF+AJIX8VstZgS4aDaxQ/y0zpvTdg
         69lQ==
X-Gm-Message-State: AOJu0YwrVF4LfPoMW8i+XL5OPHkwIguX0zGsZerUuHkptgzemepvoXkc
	XJ7ODuy0JBdDbnQAcwl549cPNzn4sdtBjJReEr7XivnMqKPKKWcPpjGNyHo4zAvDv7Q=
X-Gm-Gg: Acq92OE0PHkgT3E3+Gch+r6+F7FNi9u747Rmd0KVJ5fYzqXiiOut9OkVBB9JpikJ3Hj
	URZmz57sEqyAPMPVrmlApuI9/ZGnP5UjYUkbr8ces2MO4bE1hofZGC+ZURiE6bMhbjgiC7nUcXG
	iyoVHRt82GZK+br0ay84Nhs56WjLLG8zSPc3ZCIGD4fBvu4WnlXkELN7f3OPt4L8uWKREXcOa7S
	2XEXd6gzsfvKjyHd3Nqu3hSsJcUukSRRgBApAbqjdovat6SY3TQQbB0l0XtivAUOuX2CVpIAJ9c
	0Jt1cLjhBjiK/oYdbrb1tCti31Eq0PpE0LJM4xoRxeu9F7UXR+LNje0h9zsB2kUZJS1fEKpwaUc
	jR+yabxAlabwdKEUlHNF8mamM5GWewy7fAQGS4YYGSaWhtEZKln3w8biQCXDnBdPXfMEzrahoA8
	gniRZpVHjBqEpzX44fU2CCyXUp1Uccduk3WamZTGNo3aCrRopzj2Yi3g45c0G/iyb2KQ==
X-Received: by 2002:a17:90b:5188:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-36a676dc303mr2283228a91.6.1779430042774;
        Thu, 21 May 2026 23:07:22 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:22 -0700 (PDT)
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
Subject: [PATCH 2/6] firmware: qcom: scm: Allow EFI variable access on Radxa Dragon Q6A
Date: Fri, 22 May 2026 18:06:41 +1200
Message-ID: <20260522060645.4399-3-graham.oconnor@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109166-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 955F05AF5CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Radxa Dragon Q6A compatible string to the SCM allowlist to
enable EFI variable access on this platform. Without this entry,
the SCM driver refuses to service EFI variable requests, preventing
the system from reading and writing UEFI variables.

Tested on Radxa Dragon Q6A (QCS6490)

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b8..4702ad898 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2320,6 +2320,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "radxa,dragon-q6a" },
 	{ }
 };
 
-- 
2.53.0


