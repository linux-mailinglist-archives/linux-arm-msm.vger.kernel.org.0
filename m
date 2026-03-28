Return-Path: <linux-arm-msm+bounces-100525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FbJM+s4x2nSUQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:11:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0734D06F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B6B0305B08E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29249352C22;
	Sat, 28 Mar 2026 02:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqgo4Mgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C81358362
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663844; cv=none; b=HK4ipee/7Acb+ocAJVrQymibrfahs2xZwD4TKSQjAsDopZaXZ5moy3+UpQ363PB5l4gs+EmZmEUocUZ5Eakduw1epkO7WrjCjwDNlLd0YG1EbrrkR9TgAlGkr/gBGWGl3UUK9bb0m7nHAyKWnGau9l/b26VX+lix2K34JdlJ+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663844; c=relaxed/simple;
	bh=R69+L2JPeD1MP85dLFV01UZLGFMXU4a/hgYOgtTZilo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dToR+jVjFIJZYgSIh0R34q732aP9nM4hxa8+KO+ElYaHq8KngcU3fqpPx/LreVSVti6B9m2wu4/aBCTWMc3XBIRKYfja1PRb0QJn/HNouTWx5bASG3lnAsfZ//KMJbF08SlZAZqaL0TzDVYdeY2BltNg5PNN6952SrrvIbC5lf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqgo4Mgs; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89f1e767f92so461076d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663841; x=1775268641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLYu3/l3eIAYRmWYcKe3ElSedjx9TC854siA3A1aW2Q=;
        b=Mqgo4MgsTcUhLTvbXXSgHovg1o/GOnvAvEjlhSyfEoQh4s2RkqFBoesJ61+bINXHOi
         ipoE3OFQGAJLP83pX39LSOiuhKEFP/p5j2skY3F08FEpVKZ7WHRZBhwoDsnJZnbIYzOX
         bsY9BUhLI8vftVYObiWI0yboA5m7BWY84kBLLK9f+7M0iuowbDQGKtnWKwu1wrmlytKy
         Q3GKoCFWBL2N6TLTeqCwlePIRryggIAQLOh9Rv6tia0mitcB/+ej41d2PMoKaZBp8qVb
         /ZHcrevQBGQNjDkhhwZeG6Kql1MC+t/UVTqx6QvvOJ1sihJ5lIzfB24jTOx0eDNKsCUy
         hDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663841; x=1775268641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLYu3/l3eIAYRmWYcKe3ElSedjx9TC854siA3A1aW2Q=;
        b=WMgA4dIuj/Ikxkh+7ncvPpIlHfnZHE+enI8bi3L5NrnTTQWXxnQWpXZontgG11WE9A
         MMRJ1k9/Qkxf3RW5gvV8Ewyornsh+UOjK0GH2c8uu4jslXPfYMUgWrGwastZZpDar7yS
         DJFKbOPCcZP5otOBACQT1uYlXuw3zAJ8NLfJmK+snPseqcq0aQaFcIEQA5LqMEbOfw/2
         nqpDkyKsy09Usrohrt+a2mzyNuOJnqjAFT+cQzWQ016v7zhb6zLN/aEW7NID9Y94JYjY
         swIfCGBpg9q9ijxAha06M0fctpOTyWZYATgDU3/4YLQ6LkZw2ZY5MGKTlFy5eMbVByPn
         T52w==
X-Forwarded-Encrypted: i=1; AJvYcCXn0CutCBdVLXFSBZfStVVvLUiTgqz30QRu90eTqEa4NsfKNQZgeA2MFgwQJ5sjB33hzFx4pgz7lgmOFkbK@vger.kernel.org
X-Gm-Message-State: AOJu0YzXocCV8WOWyjg6ZapPjYCCZ4YQ3FTYWfbIbfpHbl5P3/h0z0Nj
	+Qwpitkkqi49lc22WlN1k9b/WCdJLdsOPxNy9k8YJMuPIFN4bSsF7fTD
X-Gm-Gg: ATEYQzzelEpMLukP2dUm2ktVuVTTEq1Iym5hbIquQoM9xnfzRRrUajrPApf9hpcc43/
	zToLips0e6L9v+WZJEN7wseLwEBsuqPXt0C8ivjRkDntMi98Bv6Uelp9l8F7lF31fuDgfdTo19o
	DZog9jWrin3RmH2uEdEukfGHc9qalPI2KFXJ0rv6tKb+D/RsWNM7MFF1LYqVY+euNoaIRQuAn1I
	V1/hNaR+UbRZ/oHchA9AHOCL8hKn3G1YZDNYA2Rr8uG/lpT9yloQKnBEGDZmpKoFMFo7Xtmdsnm
	YjIIiNM0fqMn35EPbU4ECicQ8P3lIm373fmOyc+Do7IAfvUjUPxk13ZIv5dhBKHU8njMzj1++Xw
	AK1RtsEJkqWsVSga8lKj2+gaywHLYfFvREpSkRtcDOApW/MEC3E+dFzVdUf/wQtS++1nYPDzhFR
	W81wPekog3SSOy5MCrHZHw/FtCzn9SCr3yA012wKBdA5j8HT8Nw1+D2Ho1g4G9Ijh2mxIEKqslD
	ZMEjJkkESp9HTw=
X-Received: by 2002:a05:622a:19a6:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50ba383ea86mr67519301cf.8.1774663840912;
        Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm8304811cf.16.2026.03.27.19.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Fri, 27 Mar 2026 22:10:36 -0400
Message-ID: <20260328021036.85945-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100525-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.12:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FE0734D06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index cf7b130ea0c4..b0da24fd1aee 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.53.0


