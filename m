Return-Path: <linux-arm-msm+bounces-92938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCzmBpUIk2nO1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:07:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90054143377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFE1C301C973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D64830C62C;
	Mon, 16 Feb 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWHnPUTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5B30C37E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243650; cv=none; b=p4ULuQJy1XB4X5Dq7tm9JHBRuZaks4fgJK2M7hDLz6mdgSwrWWLy1arJVfnmwJRdqZscAhY1hVjomWHxDLp/Sk+T6oGea2oBV0a3Q84aNBhi8bWMtcp+0XLeaE56e6xP1vmsavzvbZ15QMa8k6E7C51pAH1t5du2+cOUXtr3ktM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243650; c=relaxed/simple;
	bh=ZCy68bKzBFZTZSfOpy3mDznqvrsWBJ+1U7/kAOyrhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktRQEN7qXTZMTMI0i9lpHRJJtMKwWUYLDMd6H9z7RROOdaNFmzWHbI19ITusPaREQL/CNnScp6pSoyeRfMIyIsq56oGGCRr/CrinPOhD8w+Kb+VTWC4E7T8AMVZy9Gu/2LBN8yZU472MPtuVEWgmSrCva+v150IZXarqGfrA89w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWHnPUTF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65a3c6f587cso4316535a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771243647; x=1771848447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=DWHnPUTFFtKmqz9yl6rcUSu8xKY4RxOa7d1D2Dzjl8pG1WgoA1nI4nb1mdFTBsxYG7
         Sy5BYvuklJhJa9Wx1kCPmHQR6bJ9/uoXCYQfLzKbo+wgWqLh5wQKg53C6peEsp7SRaAN
         kOnmxMcBML+KoT4hu93ODig1dctdA5B9m/VCksedAxpRgKbQ36kfDi3O7+a7A/KsDxQu
         0fcNRNpIEXQWmgYg/Eru/S14LQUnEkOApnD8Oc60JzHxlO5FGE7LhBKiK1eer9sG3GEy
         fg3fZP77UEDQmKe2xAsEjt34LME8ZaAleVMT/ZxOkjuyi223O8OzZ2xJ4s5RYdPkbnJm
         8UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771243647; x=1771848447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=WyeL3e2Oq6WaxCWZvw8R7/XPnYdICLWIfbUdKAl/GokaaiSA1TgnZeuzdmkg3gHwia
         oip6rHIlm1mN/YvYDRkOMT0ylF8yNUMioyEA+hNg8OuzTUA4BSfavAjZT2Pncg64IML+
         SpKUCotR1YXFLS786O9oLdnl36RYjaDJ7bcl6V2AZDBJ7Hp5YM7HHQpOZg18ai6Scr/z
         dlvXkXw0T9gZrwvazqBUYffWey2KhLg4pRBHkx5geEyoDEhDDNqyNAK1Ce6eFtMRzUtt
         42OaJkT2zpDx1CowWBUVNs8nbWhuVXf8MBf7ApXZ/Ipaaj+erdxinLanRQ8oNiLQEvr8
         r29Q==
X-Gm-Message-State: AOJu0YxcQyl9+IhIM7e3FQFwX4LuUWhEnWy6xblj1gUqve2BkeXAycM1
	98XJXIxZFyhiL5cbgzb4i1OQEA0ArJJZFnV0Q5XZcdb2Y6NmAgHb5trg
X-Gm-Gg: AZuq6aIBhE0wJGDLOD/FoVOpVlQ+RbeoVkgkxhhYYGkP5H300yb1wFOpQiq3QX4yayQ
	bjqEgTNj1qrpGIEiebUZhwuESm9gqonss/O3EGt7ncTS/HsqVqqMcKcYaXUMlOc7OatS0UUxnr7
	1uiS8FOzWjjwzLdjfhpCy2gaxSBgBDbH3KrUPufS0zjECooZ2Q9QGEa3LHwtzxDeTXBI4J/fEv7
	vGBKn8dUXXi1dFLrbcLUwI1SHRLyshQ9Z8/gTInPlJkbB+uLjhU3hngbae3lfrzemEVgLFa7bdd
	GVR9CNyMixFQJFQ5Z/qao6jS7qqld7bl51KIPin53ChYmON7elZZsMATCJDJF8g1zkGKGyLUyUR
	jBl12GJGUq89BPMUmhTcwPitGepa8x2FUZpttSvOR6yaqv+cqyRq+OYAmmU6fn5Ool6CMZgQkz6
	B9ivP5WVa6b+Pv0UEfykTRtM8jxTblx3c=
X-Received: by 2002:a05:6402:26cb:b0:65c:972:7073 with SMTP id 4fb4d7f45d1cf-65c09727503mr1641072a12.28.1771243647060;
        Mon, 16 Feb 2026 04:07:27 -0800 (PST)
Received: from workstation ([178.227.214.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0d09sm1867098a12.25.2026.02.16.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:07:25 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Mon, 16 Feb 2026 13:07:14 +0100
Message-ID: <20260216120715.3432191-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216120715.3432191-1-zstaseg@gmail.com>
References: <20260216120715.3432191-1-zstaseg@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-92938-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90054143377
X-Rspamd-Action: no action

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


