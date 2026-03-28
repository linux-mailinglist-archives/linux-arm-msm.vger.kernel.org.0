Return-Path: <linux-arm-msm+bounces-100517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH/6J5Uxx2mNUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:40:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD634CF08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A04F8302FB19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9CA339853;
	Sat, 28 Mar 2026 01:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDpfsk8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15791ADC7E
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662033; cv=none; b=GuWirh94fsulybCXDdm0fyaNoBX3B2ELr45TgNdveDZkjNoQm1OvSdKMk51yIVKDE2o2j99dkoVrGI0Lgmy4voXWJuzCMVTmcr+Z/19WpD1t8jSO6ZJvVSESP4WvtTdzl4lVQEBl7/Fqw5TK1XE8wbxqK/umT+yKMAcNWJRZvxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662033; c=relaxed/simple;
	bh=YKU/DnmNIxKk/G4FaBPJrYaaIFx5k+4NkZwdBNpIKdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXJh4x2Qhop2h7nLji8boHa6fUfyiikkbLbVpYKzhxBBxxLU5g9qKqzUDPlmzTajtWKx+7QZilXWWjveE6YJ+bIO7EnpVo7IlnQL11kwVsDopaVhMeuQM2t5P3/AzGXxy5w/Gr6BYLhFpDLZ2coQ4Ue0oNqB4EBtFzSNKT61B4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDpfsk8h; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a000f5adeso40158486d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662032; x=1775266832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=RDpfsk8hWxIWsHxjL6W0kYjPUu+r37UPgSDgPJNBsU7h1sKwTEOpLbNQ7iOzWS5jkW
         NZqzBBnPYlZmK9T7VIudNhZE3AAIPwY5pASu4/ROS0BzlnaVaD5SsCZnxrt14dgY/q0z
         2S3HOUevslJK7nGrlNTm7vU1c6QDDn9b9u8k3eI8vN/7IymnmZqUwFGol3AZW2NSiOYG
         PskScbo9Ml+KUS/vmQpLlpVRVc61wO8pbQQaSe57S/vmtdfLII/meLw6W67bxvI0MY8e
         7uh94qFTW4rT4IefRa3FHR7L+xRSiQgypTWXwrgPF0SaYYgMDHcXNcvra5IPHRVgh7FG
         GyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662032; x=1775266832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=j8JI414cwjoArCyO7amAHdL/eYYDX1H2hvJini1d91JwEXW3PJXy/nXHjvpoVI1Ti/
         sEYgV20Mdu391M+WEmitDHbhvApEr+aLiqkVKDK0cE2SP/Af2c8x2AfK7SBPwvGEMZHh
         2WZ4gV0iuVOR6guvtUiHsqwObUYL1BUizrNip4pG4g6Rz5cvIeZVnFA/IYkDwXtSiBP4
         xslFSpPI3XG9jYMJE5gKMEA2DOTXjFc6oQWszJwGrKck6x3EzTfiyiz+/L+x6eqr7XxY
         1zNzX1Rm4y2ZjoBNolBVx4u5/Frk5fugJWQJKpXyYZUZkNWnFltqXCO5vbTyhrbU5/D9
         y55g==
X-Forwarded-Encrypted: i=1; AJvYcCWN8CcykTF7PYXu0ubxh1X/6hxUDKhk+Jatk6VEt0/G8Ipj7y5QjftgxCHwnycKNBSdOAU8vthOYooHUH6x@vger.kernel.org
X-Gm-Message-State: AOJu0YzRV4K2zPMgxd3Aehr1aPOt2usalx2b5iqfR84uT2g/HWsW3XIb
	J1hWWse6lEZRYXI+eArToQUFPRODdhXWhARTo11+M71NWNhoQbfK7PPc
X-Gm-Gg: ATEYQzyriVlnxyffzqepl258YXguxbSCTN9TRIMAjsMaf6qCRY8cIAA7wJ6tQQCUKDl
	oCJdUMBfVQNIXI/RKYqVRdbdLHKwyyB2apbNF3OOoqSfqTJpg0Y2yNDpG7sWHsR1HomVcqp8/j9
	ZQUd4Xl9jptZIhVEtR8KqV2GaUEDOihge3/6cRe6EhSo6TE4lweNvFa9ZUvq/20u5QRU+NC1hZ8
	5gtLZcKZDQ09J+8RdJPVzPxiQ5Ss3i+3+fYLPKd6w3FKcE4tipFAzQ2Ldat5al5vQmfdJuzEOMh
	jKFv3tUiFPY30wmUcBU1577qILJgZBqUToh65FZ/TsUaVR9xyfHVW9ocoVAnvVPhwgnszl29Y+R
	z8yXdQREKo+zrfFbWuwv1gSgEF7C7QlXZwEI4CJmpKtpw8AGMC1YOgJxPGbAuvNCqEEo5j7ob/8
	VUIoJPOVEGuW5xUS+DC/6nGrdAsT27OwCqXcA9
X-Received: by 2002:a05:6214:f2b:b0:89c:df61:7a10 with SMTP id 6a1803df08f44-89ce8f02e4bmr68450336d6.58.1774662031691;
        Fri, 27 Mar 2026 18:40:31 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf95f3c1sm6396276d6.40.2026.03.27.18.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:30 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/4] dt-bindings: thermal: lmh: Add SDM670 compatible
Date: Fri, 27 Mar 2026 21:40:39 -0400
Message-ID: <20260328014041.83777-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100517-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49FD634CF08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the SDM670 LMh.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index 1175bb358382..ce72347e29d1 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -22,6 +22,9 @@ properties:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
           - qcom,sm8150-lmh
+      - items:
+          - const: qcom,sdm670-lmh
+          - const: qcom,sdm845-lmh
       - items:
           - const: qcom,qcm2290-lmh
           - const: qcom,sm8150-lmh
-- 
2.53.0


