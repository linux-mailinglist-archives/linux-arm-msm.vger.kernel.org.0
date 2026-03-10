Return-Path: <linux-arm-msm+bounces-96424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q0DNJ8Fyr2lYZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA392437FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2844305B946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB81526B098;
	Tue, 10 Mar 2026 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P24SiCoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED726ED59
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105850; cv=none; b=OQ4w1Ao4cBpL04/rSJDWtchzm18Ei6QQFGQpEspjFqxooSSL8/ntFPyCd6aMES1mc37GTFlN5r0gggxwr6viBXLiCjEj9MC6j0gGDH1IYYBFZ9Nncg9+0c7DSOMmBC119hqiu8as4jxwAE3x3q4eIBPbpm7xaqPTn2HCVtzkQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105850; c=relaxed/simple;
	bh=TqqVjcOwxXhrFcWZZUIMRtdny0Tnu1HnL/f3vQhwcP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W13QPIAKk3jXsSqIHMTBL+creNvvXavGQR6KN7IM63npQgB8BM5rHujvgrYXiVO7pAueODVjE0b77FCHWmrt3xqZq5jp9JOPTC+fnSHxavu9EduO693ZjySMbeXkR+5L/roORk7d4yH4yrJ9psOgLycW67zY6oPUngA/8mg+Bm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P24SiCoe; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd830404c2so198281485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 18:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105848; x=1773710648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QjZymS/A18myIOLroyWLFVI0pqNuQMdW1+eVNlgX5Y=;
        b=P24SiCoe2KIkxL3w5cTmMAbn/VbOTSQKYPVaMQN9M4C+R1Rw115Q+KV1SYS1Y2CHb7
         1T1Z6tB9LmeYHoECrpC40fPvcX61be1pHqDO93TfjOLbxq6ZATKmxAB/2cx/Pxdp8kRE
         N5xht/DAsY9bG7KQECyfbG8XAOZAC0nAnt7p07oFIYdEYVvVqSFqZ0CwrM5Z0lIayDmN
         DhWvc/30BWFKK25I2D5slczk5vK9EiBjD9kMw5/gfSkAjNw/od+CUkc3ZJv0+ICquF/L
         peJfNOdlr9nA6QI6ippzpw2UZrdJZCU1B2GPp81AOiL3gs03prMvkjabxfta05GT65Np
         TqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105848; x=1773710648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9QjZymS/A18myIOLroyWLFVI0pqNuQMdW1+eVNlgX5Y=;
        b=GTg1CmzlD9psq4ZiBF7FXP0vNoFwv0BQwjyQkpK/JUDfXAd3L+jYStOUmKT5qnBAnS
         D11YGm4hfUHIdHcVIuTmzlU8nqx2NIgPylIclmC5s/UULPQEUwE1fD545+LITGmToxbw
         3Ro8qpiVoHwjz1jy0CbAJInovx5rmarN8jHv4nyLgt/Ba6e7ZJNn65KiYB294AKR+QEO
         UOE6HCON/VSE69XvcpQnwRfM3u2nnjt5lVPCVFRlRdSXP69/GP6d8o5NYxAazkCNzvhf
         B/etl1ejX0jgG5whWcG82Zu7fD5lnzY4X8az97HixiPeiuwUQbTMZXg4U2XZiriHdpb4
         i5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWPe5dRn9kUAPRYUd8qN6s1JwM3arhiKj18Nv3Bdx35xzwACclHIPehgkGf/Sx69GgkEnrdQoPtwT73ai8@vger.kernel.org
X-Gm-Message-State: AOJu0YxITjeS6MfsJ0I5KYmUjCv6DFIkEp4zsYG1IwU6oQwIbSm1e16q
	931FTE1ebjVW2AThQDm9G/gZMPtnhvrJdSs5t4514c0OCXoPEhb0/NZe
X-Gm-Gg: ATEYQzxuMR3ZW19DYltWDB2wGeWMS6H/jTNUrjR5y5SsFsSy7xxwn+bSM+mE5TD3p4K
	00GRN1Q+TaQd6DrYRnyEiNqA0B22j3S2mLANzoNCx9cAFU7L7DHl/CVEYdZ3GS/AgYb2W/lzvRQ
	i4388d7cUnOHaYaM69TEc4ZTgrgr2/HZsmiulc13D4OCxyQ06PMMdQ6PgxNnf95B06bJzR3+6pQ
	Eq5F+ilFO5qzxAuFknq1G2mlkhPk3gxadtpQdE4K2sNhCgoKnNKHlRItSKyLzM9xg/xSN3MFPI3
	kVw6r3/ve20B+AtPIVf8tBsnxPg3LIML1/GD3bop19CW212hsIyxLDLGhFqaUAhetw7S59hnxog
	TsjmNvJQliufSvPHIORrYH3EO3ZIPuJKlqws3CodrTMw/jm3TVCNE3npXDhFn7wT8VARNZe3UAW
	D/5MMnY6zRvD0yUyi9tJMtmbQadFEYLq2DmieonUyDlnG+TR4emXk/2q2LG5mt+OlmjFjGF+WK2
	NLVTwU+ci4QOD0=
X-Received: by 2002:a05:620a:4147:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cd6d441630mr1568727085a.40.1773105848148;
        Mon, 09 Mar 2026 18:24:08 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7e857037sm488823185a.20.2026.03.09.18.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Mon,  9 Mar 2026 21:24:42 -0400
Message-ID: <20260310012446.32226-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3CA392437FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96424-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..0c3fa5d597e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,12 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0


