Return-Path: <linux-arm-msm+bounces-110622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHH9FFSgHWq8cgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:08:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71B6215CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A879300B1A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A873D88E3;
	Mon,  1 Jun 2026 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU1BLnF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE63D25C2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326481; cv=none; b=aDngY1FoIyG567ejln8W5VBqYJ/2RJzqvex/5fsItUqdxuB2np3H+EunO6VyYMqkUrQlmvouSlYVfnSTBJFH4ES1LgRjFmLhy2pOIQOkICV+rbRZ9tfuM3mJrg2ZelG8wGXv3z0yuesk3DeBj1gttWTEPp/2ntl/ZqKL27J6aKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326481; c=relaxed/simple;
	bh=Qd0jDxwQNZbi1ul0ROIVUYj3DsQujXROy5T33O1q+w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7gy0ihKMvnaPfDPJSc2+n1TMO4CYcukQXM6SJkKvwcPaHvyEalsUv1DBJ+tumy94I5/KjlDAQiN/3EqEdWapjteAJUfEro/9OMywJSRRbEJBec6voOU053yxZXyz6EV89v7d4Ot1qTTDbdsuCMyBC7qT/IxmMdSiy1tazvJdGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gU1BLnF+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso17101773a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326478; x=1780931278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiUCmAGCnrYS6f22hVVaVmaPrbP2Cs5yaWaXidbeTmc=;
        b=gU1BLnF+7kK4dlXj0EI6VPfKa4568hZRsXjOG+7OrJQpsi4pRXZE5sSIYye21jo8Qa
         AYbgY4Yr0nXIDm7qMOO+qCdWkdCW3Xnp4Di3VObIZNzreKwUGOZEjazJeS7qeCelLQAn
         F874N3IE2Tl21r7ksM9uaTHfsjaLVkvi0YRYrssqUuL2X5Z1X5ZA7wmS4KU76Sscq9bn
         7UK9IWuoLkVu0FP0AAMpos+sv7XKKpIYuFx+hBlgPhWenVSdKmdagOHSQIDiU4J950xo
         dgO42he2Pme+TSzWDmwrsx21YF+RU2FkGWHc6a+sugfA3bXcm2vqgleLPZ10aWwTsXWW
         4TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326478; x=1780931278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiUCmAGCnrYS6f22hVVaVmaPrbP2Cs5yaWaXidbeTmc=;
        b=LhkKK2wIr4+fdVLVya2UAEDj0scHxvC2cmerZluF4xXdKV+xH4K3Bk2JZ7gv8hePZi
         mW4/6TDQxgZ5TjNVYA3N4epyVeVKRs/usq7eXuatctJgtGSutw7ztu+IgwPhxNPikDfj
         md2mMg2jXnp+jet9ZCjHraT2T9NgrdYewr08QiAkFQoNInIusf9Wr3o4yk4TCAjELDu5
         UNFyYSwXKbOOzVU1Ze0JxiGthycBrM1zIgGTzW5iJ3XGUIBvc/jqF9X0RASrYY7GSwMr
         rEagiT7fOAgpKANAtDOkt5oL/KhebAJ76TXELYyYytLitzL/dF1WUWvWWlj55MtFGi7K
         /0+A==
X-Gm-Message-State: AOJu0YzkQslIOfSkTXUoIyLl2tIzf8K/lThZAOqkLrpJWm4EKbxcrM1J
	I+QrClbokgiBFGBWMpS0q8q1lviXmEpBPj+cbJIKJdrUf3qHM23EfLTO
X-Gm-Gg: Acq92OErwjzaqdF+YtVRW6jz8rvRBnChU4iLnZyB/VnNiVSWMpPNX98qzdTJ70nPDXd
	RuQdLBUnu8AOm0Eysn5EUfblwJf17rOmQOUCMnP7H6eC5Vwv5ToZw/1sO1m9WADK0R6viJjQWFa
	aCohtyQwI7EnOKsSBB5naTLhZNDlGFxS02ore+Aqfv0FRexF8nid1gNtMPFW5hcdG7AXbFeUjM5
	orN3IcBqZPgJg3lpHsz6cH0sgrXqX71lz9JtjOQlGsYhOUi0dmSXYAgK9kSr11zv+CTb+MkJDU5
	6aIcSEq9e+HvovYBIua8a0xeRj+leVtR4+4Hyg3PjUSbN5zaEuxXvx8VTwqSo9oRIeG6kwXhZWH
	XQeqLogbH4pYw0MT7w42W+Zh60uFm3Xu7r2xnvUBrhxCpoL3H3lcEkkLDoCqTH+c2OrKuXkdL6l
	CGwZGddm0UU/wYm/LEL9f9yX013ay0n8LesCGuUjAfhtmquqqUdnwPLd9o9+qPLtkk0OQ+G6ywt
	jRtO2My8A==
X-Received: by 2002:a05:6402:a50e:b0:689:9d82:bb60 with SMTP id 4fb4d7f45d1cf-68c896de21cmr3614781a12.6.1780326478401;
        Mon, 01 Jun 2026 08:07:58 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb852272sm2085659a12.20.2026.06.01.08.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:07:57 -0700 (PDT)
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
Subject: [PATCH v8 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Mon,  1 Jun 2026 17:07:51 +0200
Message-ID: <20260601150752.666393-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601150752.666393-1-zstaseg@gmail.com>
References: <20260601150752.666393-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110622-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CF71B6215CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


