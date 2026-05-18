Return-Path: <linux-arm-msm+bounces-108253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J5VJPRMC2rhFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:31:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB210571A36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACB44300E390
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAD4382365;
	Mon, 18 May 2026 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amVoc7Az"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6F2E22B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125456; cv=none; b=jvy8DPcOYGnDkuuk8R25ghp9lmoNs6zt4zX93wL7991XZ7KUJCAKGL8jWFP1hxrOJWHJSQ0ywHU/uMMk8L/7QLyayEXuJfkc1pMJMRqpsVgTGB3D9+HvqVCkXaZAPMwsjQjHcadNAJVLC/R+wsxDKDH3hRyuopd2LLhrvBE8b3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125456; c=relaxed/simple;
	bh=cVR6h3rkGrL9zNSGot5yOVYOujBEvnXGWmyJCWYxP7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iz72mAxm+Y97FDy9oLXL+f2xB6s35ALh2wG7eA1mbE1JfkACEHJV+rimL4W8w9ib+CipPew86AVBSl1uLeYMjLYD2+AaBv1g1nPSzkuWN38w1qJi66wmjgiANU785ixLQqTgo0hcCkBaxGZSGDAtYA8+f+LO9jUXvQSxZ0OFiM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amVoc7Az; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so2449550a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125454; x=1779730254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=amVoc7Azj6n8G/WN8yGXwY0tUOGp2ZpHr6g2ctq+vjwitrL8DNpEJH+YqAF/jhmfoB
         CW4F7Sdr/04Ls8pxS40FaTHRm6nXaXgLWUH5aGMxgN6ooDqxl1NwmLxsVKlgyOpkBuIh
         bWEPQiPFNY9jLz32Yij0NcxJlxQXxrPDVOL+1GEqiKoMr92NCAwqBVTnwObmfIvG3BRY
         XunkTAs2q1TciGTo/vF/OQH9/FxSPqwMne4wsrc9DJwmSDIbxea35mRVLrlXslBwWBQD
         ym/j5AQu8uCF5aiXXKzyfX7RBtf1GtXJ2QMeRr+7sTHbZGjnfeAaiiw3gUxbhuI0229C
         LRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125454; x=1779730254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=kUWbyMqSojJTrZurLfc7NNoaUGiBluxi3gQwPbAx0b8n1W5qFBkNRF2S3TVT4eeKLS
         GxifCHLVbr5XXGx3xUNhHogIPSXGLvbfvxRVKx8zPdxTYAGZMiMU8XpNo3RQGq9yPQ/x
         OAXLH3ewU9hYAcDktv49vTTXK/hbBNOV0FTW5DBWdo8OnfSU3kf4s0fnDMKFWzP5vc8B
         wZxgJ7yhZkwVsvBZhbMnJN6AFqN+hSiGfdCrzdlM/e+t2ZA9n7LLUqw5CLQZb2PxWZja
         766i9nn7vZx4kKc3nUJ14qFV5NV6p2R3TJQGsscqw9wcFunUfdbsO1PnnYa+5nOu7qpb
         bNMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/t/vdwHH8/ZzXujubTjBoRnhlaxabj2sxkGw0ARfqLOeZGQ+xSzdgKMX3Q/muudHM6vboj3IxOavQkQf2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5qXdB3i29agHsS7cFlS4lmF4bLQbfJN+dxGhl+2hGWTit2Eo
	kCjw1zpILj4Jwx7g1ipVSBuuBfpONDY93LTQ/SOYqUR2QruAkNz42LIW
X-Gm-Gg: Acq92OEKeTZqg31bK4Izq8HQ3YPGaiDrHlkVqH3d9kSTNzGn/NnhiUGiyzdlBA+tDM+
	bbeYhwox+psC7n3Hg6gt98FKejD4BqSMIEPWCbc/HkAQAL8e46xecXRxF+410Iof5AUSwywyWGb
	zyW7ycsyMMwkYK8IV5CwFw2aNWyrXdoXNa1adwCNIf/veHO7+gO+xrDQpn7JipngY/EU5RkF1mR
	9GKZxCvUOKIlzBsfC8kwKuAgG+6XwQaN+CL2hkIk/h6jfGMVAOkJb6N2BgA695HFWEnkgTK6cqA
	ZdLHyXGRlCnrpVysZ5sKPTPM1A0gXm3qUImzy6VKzDKXLIpGFc5hWFL7HwhASxdgp/knthjupLG
	l2ibVRs+n3IGbX3EKbaJPLGPtTQqpyruZb22ZcGlxubyj9AEYnfAd0rxNd8IwbVPLMHYj50dGr2
	FF6ss4DQZzfERKts3RsuOJXMYpbyV9FQ3cXQ8AZTuwVYjG59Xk0DEBno7QeTfiWFrGCgp19q4=
X-Received: by 2002:a17:90b:5904:b0:369:1dcf:4a56 with SMTP id 98e67ed59e1d1-36951ca8d1amr16086188a91.21.1779125454436;
        Mon, 18 May 2026 10:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b5:f305:5cbe:64f9:8c32:7cd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14118696a12.25.2026.05.18.10.30.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 10:30:53 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Mon, 18 May 2026 23:00:37 +0530
Message-ID: <20260518173039.20592-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108253-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vicharak.in:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EB210571A36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..1948356337b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1767,6 +1767,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.50.1 (Apple Git-155)


