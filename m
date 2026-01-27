Return-Path: <linux-arm-msm+bounces-90866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHgoG+4LeWnyugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:03:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0E998DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB18D3055120
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE5D32C31B;
	Tue, 27 Jan 2026 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxdiPK0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171A32C309
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540550; cv=none; b=lC05oisAlI53UukqrKFn6QH+fbIKvLt9MCHr1RL8F9GWGzoQwg8Vbkrbb5zZx7RTSzIJGDqrCyknCXEWoSbWmHta98uPtgKOngqjXkLx0/jgbjcDS22HfTk/BFVorr2bvQL/dUVuyIWkUaZrgDzZ8F/irwHzYBLLOYPLGDVfmCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540550; c=relaxed/simple;
	bh=067vjQ95YiJmSTxarxB/jUcvEJrOjHt9gS+NBCpSPr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN0ZalsFW56dSLCFVK8uJzOV4kWWeJ455t5F+1pJOml7WcXb+u8PRJEIUddIaqC7fF/RQTDm9ReCnAPaesDoBqyZRXsx619wvGRR8Ij0PK9iqCRH+SoYSRDxNuWfBubIOUCsi8ffGEt/VlJF+QHydzqSiZEvy+KaFBUWCNKYCkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxdiPK0k; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0834769f0so39682915ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540548; x=1770145348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntt2rfV8hMto7YcInonRn0opftxJUWY1ejh2aUP7PTc=;
        b=lxdiPK0kGgKsVlvhdQgi3WjpNDsMgZcnJjEGjzmuWnbcV6P+DFnXqKkK3U5CGdEAxO
         0GaUlO73bU/MXkzplhRv+t/EDHwkIZhh0kVD+LYa+2kp4UszIiOYdbgzdrUNglD0Z1RG
         gQt8uPRqFNkmIdhzetGG7yDKIVRoBVGufFZ1FGAIBU6+h9Z68qO0Dl+hhtEN2IaQz4dC
         ZYqImcB8Y3pibthX6nc+TXo2oVoRTdx/Edww6Ur8BCLdb/YMJ/Bm2TqvvzlUdfRmv+2h
         GARyib+m0ZGeR8ZDC+Utxrmt7SdtPWpvQIJ8mUXWjIrOKCfLnL0JblS7bZmnvohtdT9H
         JhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540548; x=1770145348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ntt2rfV8hMto7YcInonRn0opftxJUWY1ejh2aUP7PTc=;
        b=YazCOwV3AP7QsDuk/qWiKLGqu3Z2JlfgEXRl9Y5//7tL7Tiu30zH66555XXYrBqzIz
         fZNS4dkd4poSluLNS0mBbEN3fsVuPep24ZRL0fVSfXqJMjINgl/K9pZcVUlgpD+Eo5wl
         2aYHk8TXsRAd5VNXovrtiifrMPW5Rh0ihyi2Fdu9gLdYpSLRHvNHBwkqBmyKpyVfTWHc
         qCUMrDtFFN65RjPZPYlWkT0gg2oS5tH+fIp6cIsucGy5ZENSkLOznfBP8HEYqr+r6iOS
         /aWjUaf4S8OrffiIoZZRcAx9ObLaLUfad2AuDjd1i78MIb7nsVuMlV4XZX6pHAOUERkN
         a+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU+DgD3Os86kbyDQ5rYoYc4HJE90wNh1gIqcOBj0dkKPO8ZAl+ZWWiawNj60Vg/H76vL/8MVLDxOSOt8QMN@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAZIPBHJnlca5aX4hrD1S0Xij+jsKrbUZeSsRoLwJJ1lHKK07
	dUdyXhASGPGp/EaG9bRkp1sjg0kkVCeRyGKrJJ6hJjAZ2JDPnLWThM3T
X-Gm-Gg: AZuq6aJcclQW5kmIr6X+k+NX7OHJz+pECAuWaNOedgLKUpqCcTs0E+5QjMPLUZ+iPue
	3tgXSf1WRssutv3w5/oQrBSH6k+2UAk1FVMf4NUJJ8GKFGeqDGVzK/4IgP7CyfJFNWNYpwEcn6J
	mPFUFikQ7ApQWUl5SIi0f1z7DtVEgIV4e8GTW+ok4Q/z4VCkGbsib3K7/0XIeXNlN3SPecX7izn
	9GMcHSSDsVE9bSFwBG5RvPSjKMsxhMW8Bd+bRIxyAxoqDU/xsPqMJvfdVnd4E1asYQVr87dQWCQ
	r5MGqBgpG6R1A6bKTCltFVyuHnXgZ/OzbPiwVuekPcd759PxVXozetManujCSlyJc2pSNPGrHi0
	dm/B9k0CnPx90g1FgkRYg7ZXkIxGGQLhIUDAv9lJsh7XLSffhAdGnwPffHDuBOGEbtSlp15doW4
	zGuaePkNUn+YnmSYJlEssHCAFxwnAuDfO+KFXw
X-Received: by 2002:a17:902:d4c2:b0:2a7:f369:4de8 with SMTP id d9443c01a7336-2a870dee533mr26178455ad.42.1769540548235;
        Tue, 27 Jan 2026 11:02:28 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:6ecf:d9ab:b640:78c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d4csm938105ad.56.2026.01.27.11.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:02:27 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: andersson@kernel.org,
	konrad.dybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v3 2/2] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
Date: Wed, 28 Jan 2026 00:32:11 +0530
Message-ID: <20260127190211.14312-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127190211.14312-1-bjsaikiran@gmail.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90866-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16C0E998DA
X-Rspamd-Action: no action

The core regulator framework supports enforcing a physical off-time via
standard properties, but the `qcom-rpmh-regulator` driver currently ignores
them.

The issue is platform-specific: The Lenovo Yoga Slim 7x (Snapdragon X Elite)
has large bulk capacitors on the camera rails (LDO1, LDO3, LDO7). When these
regulators are disabled, the voltage decays very slowly (passive discharge).

If the rail is re-enabled before this discharge completes, the sensor
experiences a brownout and fails to initialize.

Add support for parsing the 'regulator-off-on-delay-us' property from
the device tree to enforce this physical constraint.

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..aafba61551b3 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -503,6 +503,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	vreg->always_wait_for_ack = of_property_read_bool(node,
 						"qcom,always-wait-for-ack");
 
+	of_property_read_u32(node, "regulator-off-on-delay-us",
+			     &vreg->rdesc.off_on_delay);
+
 	vreg->rdesc.owner	= THIS_MODULE;
 	vreg->rdesc.type	= REGULATOR_VOLTAGE;
 	vreg->rdesc.ops		= vreg->hw_data->ops;
-- 
2.51.0


