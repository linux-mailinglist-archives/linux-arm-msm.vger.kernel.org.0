Return-Path: <linux-arm-msm+bounces-100862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOcINcipymkG/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:50:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E535F0CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC7D730628ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888C23DAC02;
	Mon, 30 Mar 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl3DTUSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5973DA7E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889191; cv=none; b=rK1I9i+HhU94ok4Xpggy6SNZ31cnBGq6aEbQpzYfE89RxvAXVL0EaskqNojjoVbZdOL/4AK+hYFQRlnHlO+FdN9NhpfbM4YQ4oQEjC+jN3wNT5nv7xLk+tpC13Y6oCq0PVKI7qddNbXOO3GnASJKHaW0Y0Wc9l1Hj4HTZDciykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889191; c=relaxed/simple;
	bh=F2jd4YlfKNnvFt29JpBxPwcNHTeYzsN7X8O4lT8zPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJ1/UsRCti9mw4kdjsN/LoJy3N6RQElWb4dxHRT0/yqxMryRd2JmlrWNASKv4YB4xy5GwIHykLt7A/VBOc8YY7hXIVxgId4bKee1y5GRbjGlqnaylO+wisE50yh9hrxlYPJnY5pq4tVtArd8bPznJldPGUiGbskFpHdFP0I//1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kl3DTUSO; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cd90401034so478604185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889189; x=1775493989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=Kl3DTUSO3NA80db7IqIuRaNjKikpPu505+SXwex8tv0D3uKUdgOBTWQyxiGHdfZvXY
         ip3Ua83vMetirgxF8moIsx0AtR48HqQ/t2gjmS8yhFGic6WmYq7eTX5h+F9pWCIYaFX7
         rR+EEM0vNfk+8k+GAJY3hGb9c8L/5G3/wTkOmTHbjv2Its6mehI34xuGZjwxX0U/9oAd
         klMvUF8/otYJ5VLogfLp2Zn1gFcr+E0Mk3ETj7orpHdLW5yFBf48+WsTGjy2InwLjTML
         5jxvzhbIwmVH3N7VCG8ZT5h7JzK5r+vMZfarLqOSB5RCkyq8V2tbGr/KkeIMPnKI6loi
         q4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889189; x=1775493989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=MMjumPeoJGsf9Cu6uyxj9ndWWgcNUBM82AWAcTanLaVD3IBQx1QJMxlsUin0/WxeQa
         kLqrz+a/z8x+5/j0eZCeLQmyBOO05k+Y+ox20Sp8Xcl9SkWkxevf7yUIk5onXgfKwmqt
         X1gqXxLFI2+EkjL5yFifdSKZVySq88uKapk1K9yY/htFsxxrbCVk70RhMwvhHqeyCxDl
         ZTwJsqUz5PaFAsVNqrYCEoXTv8lSWPHcEZTyDp/FeuQDS2OOFQ22omWUNpw0LqBMVxYH
         qcw01q43LULSWmyeBLJvJJVH8ud5XIFQYm2jO4G913pjmhWCx9M6rFZsZb/ZoAcC3OSP
         wOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi0nZBLmAApDbrFIDZ0R/+Fgt+nRopFWSIPViRPq1G/IxmTwMrCQW+lW1WAp3q0Xsm7IgZ9GsoqG032QKs@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRKkL3mr2F3O/fKfhTImrAtKeOVXYwrdbrYj7EVJPZILaM8ZK
	kZFuTLZiErFqCizanaylxRHngE7GBoQzcSXazhKbcvHRc2A/4u8a35bh
X-Gm-Gg: ATEYQzw/3VgEWO5T/xJ3+3R+xlSNiw8mfsMrTpH7RO+0UO3q1oC29pGvcqaybYCTgY3
	wKIleaDnA1PFalbcgfvFgYY8OD8dUyQgkWfMB+ujpwpysCbtmCOHKFM1BpTYs8x0/2K2DJ68cBm
	LSExt3DsQIhtK1CdUfWZ905SwvrYIqoQseIC5mdRWiRdeKA7wGRVRTrpprJWTuw7zcmoh4xZk2G
	J2WIYhh1ZDH59yxr2iv/OhHxPDJc+KY+Rc2MXuhtMGGsP4VdpavJzWwrJ60ic8ClBinjVLDX+sh
	KC6cOzqoISW7WdlxhE9bSNsCAQTkiaI2gmNomAjxuilv/YGJvjfNWINhgc4NgugGqppCVb9tAyz
	6mHGw0Hs3M0qIm9LZNsOGc9Jc83Mwg5J6L0DEyEGNxCJ6LECspFNt50xFfQm6+30WK+5+Dk4zSw
	kfGlR0vGReoazKQbWRKGVxjXM=
X-Received: by 2002:a05:6214:3f90:b0:89a:116b:e67c with SMTP id 6a1803df08f44-89ce8f05976mr186499446d6.45.1774889188937;
        Mon, 30 Mar 2026 09:46:28 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed051fdf6sm68357436d6.48.2026.03.30.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:28 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Mon, 30 Mar 2026 12:47:03 -0400
Message-ID: <20260330164707.87441-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7C3E535F0CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
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


