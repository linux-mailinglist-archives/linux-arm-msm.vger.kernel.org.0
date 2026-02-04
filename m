Return-Path: <linux-arm-msm+bounces-91795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMVGKVs0g2kwjAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 12:58:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6EE5676
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 12:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DE023035AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 11:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63CC3ECBDF;
	Wed,  4 Feb 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMBbl4vZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD83ECBDA
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206218; cv=none; b=E9SfWt9c1sXD2ueBDdbwaJX17gfUqiIINLgu/sAEMbQRbgd0zZu1jwbFuy7XPru5sX9qma4MFpwlTgftIrPjSZL/SeDSy5pIPGxldulhmKPSg02G+Lcz/1OpnDe5I2hWBYHJ71Qar/CkKyLA5aW7gjoDCLdJVxTN5PQlVWcl5pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206218; c=relaxed/simple;
	bh=t+q1OtYw3NSqNZqw+otDHeOjPw1vYBykU7C6UBtoko4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmJo0SN6C+cC8aw1E+cRzJJV5k4cLEx3JZCBlkU/bZPtQUE/gWYvLdR+dyWAwuZgcX5cz9kfaOHf5l3hcQ9Wg0pgkbTdgCqVj/B9iSdyq46oPQ5I5OJ1wUwbRC2MDUo6GAO2O8hVlhygaFjgdNX5FB6TgQ8OJDogvxdaKuqX51Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMBbl4vZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8e526081ceso129320566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 03:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206217; x=1770811017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m09wfrjFx1l8ertNZbRzjHoSM6akl8BT4c9JtIcxqqI=;
        b=EMBbl4vZ1VU2FTOgaoEz4tms4djr9qQipZwCP2S0sfbtfAWvQsU4xkl4b/UfMJxGF2
         L5Okr1xUvT9g1ekCBkhJJxP/aj4eA0zjWHAowNoMaYWGP8bwaZ2TfuNfaandmqQPRyGn
         5lcFHQ7/uvHS/d4w7k5x5YIzhY4g72ThXV+QNEMD6herM1YJtTdV0EnugrGm6wGRooV8
         m9K+HZczYuXf5QkMb4vTy/q5TlWHI12udDWy5cmVwnvDktgPUaXqlqtwFZm8b/SEtv+4
         8DNvb/gNyFqYVVIQg7JWvU69E+1AAHbJkK7Kx5IyBGj+J5/Ww6S45AIVP0SBjSE5nomi
         4waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206217; x=1770811017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m09wfrjFx1l8ertNZbRzjHoSM6akl8BT4c9JtIcxqqI=;
        b=iPB3tc71rm8A3u5BbCR9E/q8+7PeyVRb1PNvooXOABLDOdV39XkR9oUq2Bt4s72omg
         TNJ1Bzyps83iYP8sG0HV8X9S2TR/UFYCQybB/vMyTL8877lg4/ShY0XtYP2s8LN2d131
         UymWupH2+vhBtH2TcFoAfdlkm3YmPXS04UGIvzR5e26lShw88mVCV4MctjgiWHe9gZ2R
         sd1Ts6vg23PqvtYP2rae2Th1sb//A3rVd+Tf4bm501FmdoGvXzMKRb358nsMwUB4eLk9
         IoKweKx0WpnOmzIMNwqtAaflitxnf7qAIuiSeMuiaotjIHknz5UPVpMUc2nrALvy+6L5
         f/RQ==
X-Gm-Message-State: AOJu0YzE1i132Z3TfIeHQtsi+s4Dezrb7MLs5oJGNpFVVbu5PXQUCXkw
	zT56XMJ/BfSnRgb09AeFN4rsAIadry6lVGzhrtNDCcFUtpaIes3iUOOa
X-Gm-Gg: AZuq6aLqvwOYohORbbe4Ugj5P3PbpR8BIukYh/T/A1YlTWYFdy7VfDwmTP0oAZseCmX
	viR1EEW0nc9aXQZXTpuWyhSaz1zTSGZ2LDm2DIZcX3XT5MHS7CdsHWO4a1pvR2srra1wnvKk8yV
	GluT2YUeXVhvvTr8KQG8cfwc6zU4BRj2KF394Ph7rN2Bwg+6ee7MgEm9Qjecyq17xMINkEXDtL4
	wAJsi+S3v84I7iOucCqJqL6aOSFHnrQMnDl+bNx7JxzQ5O9vFYilQTJtifmAOZIrbuWwiZKu2Wi
	ZFmgxxTSqFhQO+aa9oLw/1GOYIanVNnTbqe/YgJkOiCBqKvAW5j5n56KwhoWSETAZmkbYmgrokg
	Cj9SPKpwzSzEUHwFcXXdA82rEUMFTo//qg2kIIhIm85N+waBSg19ExZbfSlCusCU6iq3JoF2oak
	+jKpVydcEiVxJZ8u4=
X-Received: by 2002:a17:907:930d:b0:b88:20c0:d37f with SMTP id a640c23a62f3a-b8e9f95d993mr206861266b.9.1770206216715;
        Wed, 04 Feb 2026 03:56:56 -0800 (PST)
Received: from workstation.home ([178.228.161.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feefffbsm116457666b.37.2026.02.04.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:56:56 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Wed,  4 Feb 2026 12:56:44 +0100
Message-ID: <20260204115645.1343750-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204115645.1343750-1-zstaseg@gmail.com>
References: <20260204115645.1343750-1-zstaseg@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-91795-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18F6EE5676
X-Rspamd-Action: no action

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..711cf3bba6e8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0


