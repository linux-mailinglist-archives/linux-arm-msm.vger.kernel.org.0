Return-Path: <linux-arm-msm+bounces-89870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OX6CsvYb2n8RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:34:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870D4A857
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1EF607E39D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E85844BC9A;
	Tue, 20 Jan 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0cASmcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1EB4418C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932070; cv=none; b=eFq7PemJTthPekyyJ4+3ntX6lfDFjwYb2aLOs39QQz5iV2RBMwFoBob1cmYkGQIQDlXekDqSrc6cPa2BP/BkQAXUnIaTOazAtrewneaG8WjsVOKEaRnIQn50kPGkGG1t12/lRnbQwLfxv5iFPBTzTKAIoDISCJ0kVgJsB7Rm9ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932070; c=relaxed/simple;
	bh=BqjRxPVs+l2t/oY8bGs1vah2fh77A0JL6orMy0PIsSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlO2q+IBBr4pby2ozKuV7XNNRFA9Bwc30CvbgVH8NpK7DV9wHx9/IN46NWkRPhox2jGvYgW0sz1uWGK96Nvu8PH/HAN84qUl/Ob2RCrjRHZ3GJ2XRdqg0Xja2isfVi9VzbGXd/4pdKaZ2+iyfMKbJtFGMrt3BoxTxf4EHPznuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0cASmcr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso53635985e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932067; x=1769536867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJg1/gJNpsv5EBSUYHpgWGZjPp3ptT1XENeTbHp6DeQ=;
        b=U0cASmcr4/WN7JWgL8plQVHiwXScvdGQXkmLivz1UsmyJH6I5q2NM8Mm99rrYumJst
         WHxjNq0w11B/CHMaQCfUi5PbHib9RLSWankOt5ze4E+QTmq7Svcm3QTj+93wAQ9T8axW
         Iauj7b1lMHF97nPBQ++koj3K0AJUzG4pDJ2yZb9kpF25ZWGgVk6XOGbpyxB4jb0sBsZs
         9clHqQaie62kOuQCY2/RxlNmTTqKmC4ekiHvDIa4ropvz0obtJkPIah2cEYv3HUOmRAL
         uL9Dx/nDDMYMrcWdL16eVEsfufBapYD7SY94QAtFtq9jAbwzssOsw8eAPgGoSLBeJVGO
         W5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932067; x=1769536867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJg1/gJNpsv5EBSUYHpgWGZjPp3ptT1XENeTbHp6DeQ=;
        b=Dw1fCvOnx315VUPT4Sf3rnW3zt4S6FHSSxurDWi6ElVx2YbqNZ1V4C6Veez1HYIRct
         JrGmTBbVTpe6zAY4Y7xd3U9fW2xqfbV1LZRH1C62HHrBzF/MVWqO8/lmkUUFfhoKto20
         kQYzj8QQVquRfUApCQ5VFdD5c3eTFAUrrj7MoOg5/kKSUAbD4lHeRLmJGF+09q6vHkj5
         8C/em3DAtGaEJLBmllNJWJ5IhwUcGXlP8w1p1oLcGGr5REqRiqSq0h8yhdbgamTHIcvb
         Xs7O7P8So8XcwKNUX4bxMghZL6RawTbfNKtEZm92qmWrshqYzJB0ilTo+FVv0QQWXKSZ
         bNSw==
X-Gm-Message-State: AOJu0YwDKyOEHt3ZfiO5+1487QUHy2wo2bh3LKrMpKbcND1gemNhdYRK
	NYxGltxzLUUTCRvHJNRM6RDV2Zvyh3ikaejHiDaEu7vtZEaNaCD3PD4eH1gnSdE4
X-Gm-Gg: AY/fxX5/kjhsnQHBIANqLpzb1DPLblKgJ/OAfT13DKneUwiZpgyy4uCNW91jU+QtH7e
	fWZBIam/wVhh6E3zv81oZQQ7C0RcqM3oVzoJPp1AHC6EHDa1fIMk6WfuWJZ95QEynZIca1iwZKk
	yvWpsm3BXLq57F9PhYPG5bwA0L773yKKltXk8Tn6NZ5BO7cuw89vcr64GNGOeOyDOczkxpLhEpZ
	d5APVKu/EpyfnIN6zSZxHj+zMjPGIgGY/pDhtWAus9N+9I3q1/n3QVtHlmobk2yqhntbNfdz9RI
	7a2iBWMm2pcaLtyZZxpG1cCnSflQJxm4ZoRmuAIx62LF0ZWcdiQ9ZvPSSEUo+vCMp0gCj+t75h3
	CZ3K2hTYhJeP3xdRuo+IkrX5aRYB7PkjpNgrz+3CR5wsMJY9hZmr41+UD6ez4VZZsfmDxzvVozl
	6X0qIJMDOOX/ICCLhEQ8Kl
X-Received: by 2002:a05:600c:81c8:b0:47e:e807:a042 with SMTP id 5b1f17b1804b1-4801eac800amr192158215e9.15.1768932066407;
        Tue, 20 Jan 2026 10:01:06 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm312013015e9.11.2026.01.20.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:01:05 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	david@ixit.cz,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 1/7] dt-bindings: arm: qcom: add Xiaomi SDM636/SDM660 devices
Date: Tue, 20 Jan 2026 19:00:46 +0100
Message-ID: <20260120180052.1031231-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120180052.1031231-1-morf3089@gmail.com>
References: <20260120180052.1031231-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89870-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1870D4A857
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for:
- Xiaomi Redmi Note 6 Pro (tulip) - SDM636
- Xiaomi Redmi Note 5 Pro (whyred) - SDM636
- Xiaomi Mi A2 (jasmine) - SDM660
- Xiaomi Mi 8 Lite (platina) - SDM660

These are Android-based smartphones that can boot mainline Linux
with simple-framebuffer and USB support.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..87562ec0b170 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -819,11 +819,15 @@ properties:
       - items:
           - enum:
               - sony,mermaid-row
+              - xiaomi,tulip
+              - xiaomi,whyred
           - const: qcom,sdm636
 
       - items:
           - enum:
+              - xiaomi,jasmine
               - xiaomi,lavender
+              - xiaomi,platina
           - const: qcom,sdm660
 
       - items:
-- 
2.52.0


