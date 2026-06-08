Return-Path: <linux-arm-msm+bounces-111920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o7r1AKXUJmphlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:41:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D8657676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:41:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jZ+Bjsj9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBFC13042FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259613CFF56;
	Mon,  8 Jun 2026 14:33:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF33CB2C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:33:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929217; cv=none; b=puFcMYHhAFAN3AX0RIWgKyeyJMbqsent9NQ35gpoFPshkuyC71eFK65amgeJg/1cjYvylreMMlUl4EA4K4RUkaAkr2JffaEoLxl/3AlNe96QQb8Vh7DpDnuWKf6CpwqTVsU7KeaAVpIuY148X8laC9Si2b5qXwmWMFhob2i+VlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929217; c=relaxed/simple;
	bh=Qd0jDxwQNZbi1ul0ROIVUYj3DsQujXROy5T33O1q+w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2ZiDRj8euSNx9pZJGyr+a4qtF2Kii0GbXh37oHAtETm1IEV+4xIfPgSbN94S+egPHnTOsOT3FYnCP0DjPcovhkDOJuoqbWEb1rygbvucYZGEx0Zck9La81OclS1zrnGrAmt4l2yJMcHiwiF9rrGwLNiM4pqzBQjzSUfaFadjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ+Bjsj9; arc=none smtp.client-ip=209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so630639166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929213; x=1781534013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiUCmAGCnrYS6f22hVVaVmaPrbP2Cs5yaWaXidbeTmc=;
        b=jZ+Bjsj909YxLR6cvqfX1ZVr4iehj0qjus4RhUiYwuxooxwE2e8M4uLxjCZqu2CTVh
         foJEzKjyPN04qO4UbY6S7EXs4uV/RurIwqR84GNlAmsOhjFNHyqqpcbZfD9g7RIRyh+P
         5lF7FUnQ/8Hlf6+mXPBExb+TmsXCO2+anCwGlnae8o0I3T/bIxwelfhj4+4zTOvV+7ZT
         rFbXsdehJiso5LgARdO4Z1w/q/jyCaMVkgc8HGhB+IDjTpjpjQMXT1mtsnlaf3egSsP3
         L50ln/ZmxWghe11HwXKe+zeyEjEhCTgyRDM3Bpin2OYA6DQdb/fj/MftO6/YNrJ+Fscf
         HTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929213; x=1781534013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiUCmAGCnrYS6f22hVVaVmaPrbP2Cs5yaWaXidbeTmc=;
        b=GJboUNRlMVpbvuzqKO4HVBQlhby7y9Gn9fgbSO6MxMz4IEUdYI3TKgqtnelU9CVIN1
         uhb/AoGqcio588mICkLOApi8ehfoLvhcll6+DufDfwxWF++MLQtf7aRp6KQuMXjjiLOF
         EFi5fROSffaPwFz6/WYYr+MlVRFsLqmqxCUrWqfLlSgDdv0RSdwFjEbSU4WH3yzor/Qw
         pBkltuf7+yKDv7zqOTlp+aRtQihjhv1ZnCv5SXVZbTkK9KK7LfCmuccWArMtoUDmY5RY
         fAANT/zFVvZ5bxV54ie3NfoPDB5a9YGPus2Nkz6QniU3Pc5TifoC/FhAkBQ3wb6Wxp9B
         J/Fw==
X-Gm-Message-State: AOJu0Yx+tr0XH4RoHazN2ABmpl/woB4raeE48BlyoaK2COTuJFIJjJLb
	BVjqFmcH7lUuebUKnezJWa73HqV0/rJPEGHkqzcPhNyZQLY/YkSDGGegiAZT7Azy
X-Gm-Gg: Acq92OHYZBRpool8dtw6qHbDGnLIqu9jqyYJKSxaKg1O5zx/x04R4oS2z+0rBP6xQEi
	Z6HSPkfz94o2DSXjNUDwJmYFkQt+P/sgXjCmFDFrPfivg+4XyKZb312QG9wlx7YBRAqqm4ObHIP
	3BfxDC+5/Q77TwQ70HREbOY6avCC8vrNiym3qrzIEW1VSFoQOZjHsDe+MFfWFDA98FW1tQenGYv
	eLUziAM6X1DLaxLI1SP7oQatSKKkqbDbA50jOhH2djo4Hjs0QWIfvOP6ZDjGw6EEErCQx8qvb8Z
	nDlrAMfHsd6NDvGruXAfGhgYVONtXgKjnbw0GO3uXyO+PdhkQmOSz+Jj45jjoRpGfzQ+n4HukgA
	umnwvJXvfGZYWpwaZl9JL1aWNrOkjpyyYSfFJpugzm4OfidImAO8tsskAg1ubE4hCBSteCUvmye
	e0xBAqzca4+HTsv1hL8nXWSo5wKHzndpdnPnwOaUnCQPzGfXXPUBoI3H6it8rGhzE9XiQ=
X-Received: by 2002:a17:907:7212:b0:bec:1632:ece8 with SMTP id a640c23a62f3a-bf3a840d953mr705250866b.15.1780929213175;
        Mon, 08 Jun 2026 07:33:33 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a31sm897743666b.19.2026.06.08.07.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:33:32 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Mon,  8 Jun 2026 16:33:28 +0200
Message-ID: <20260608143329.252033-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608143329.252033-1-zstaseg@gmail.com>
References: <20260608143329.252033-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111920-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:zstaseg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A7D8657676

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..575ca67c940a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1041,6 +1041,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.53.0


