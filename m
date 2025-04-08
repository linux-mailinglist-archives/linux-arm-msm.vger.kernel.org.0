Return-Path: <linux-arm-msm+bounces-53552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85538A80F03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 16:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1451F19E2537
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0A4226CE4;
	Tue,  8 Apr 2025 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="WIRJLmQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B66222597
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123990; cv=none; b=L77uAZ/NfTSF/gF5LnsJOQ787cB2z2GIDzI/uZHNHTE1VkCLAOWcl7nEKdQTzVju8EUJbAP/RWERdYYpBQRcdajjlSvgSEQ7FgOATXF82kTHqDaviyaV4BnyUThsmg9vUIEMagPW1aN5BmxrzToixbc5jHaXLpptSsD4trguHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123990; c=relaxed/simple;
	bh=YzcC/8IF6WlBpTBBJmagM6VLu/QII2dkapejxYRXF+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3YaR6lTXP2pVQKhh3A5xOIPxroEOSPVBhFShkHk4mab6MO5TS3U0Tsy5l2OYChLg9nFa6nSB4ekZwT1ahJH1HDd+ZjTcD//AQtbmsfSp1Rw+zN2MR7FlBelrWEjdHJAkjAbPPXqSQGW/tfwYNSr9uygDNQUlylLZA+rk6thi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=WIRJLmQC; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7F7E93FB6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123980;
	bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=WIRJLmQCCZ3X7yxKIL0b2kC16Sh1MivgKMCkF7Ca2A+g5vwe9wYr+9zR7AL/6DccR
	 j/0fgj4rjOOTBaYnBtmKZAYpUDEDiONm+B98QxDjZ7A9LU9yASSmpvut8YiEd7s/ia
	 k8T3190koHLO/qE3XZaCepY1Z7jFU4ZsIHUdjFORiRoaNRLjwpBe/q5XCwLn7F1wwn
	 5lWvv6qzuBGJFYG+/piGOWs9RXzM/cTFGvuYY2vT6j4wHiyhsJGEZ/KxEU9LYUX0mz
	 YG5sKapB9AMGAdxqDBUNMDrjBRSqPvw+cXgHRMZyRsQQd1pSOZKjc+k3XOnvlOUPI+
	 wYCXCn5ZkA1iA==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f1fso5042119a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 07:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123977; x=1744728777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
        b=SKfzpkJlwd0C4ujc0kR2rV/f5WZ5At8ObeF3JXV/Mt1/QO4XyxagnaDG1uy2NzMTVg
         DTT9jkxGiL2CF0XYdmHoVEt1qvGroFCzvkNQqPTB0Q8so6OprYtORO3P8U/ZZwgVJjDh
         jpejFwGuLdGkBJ7svBFIKnX0l2diZQQ0IbjohpkSuTJoDzVHaPO7xeSCybj0TdEwukof
         X2ixdu1VLV5z80ZOLQ8lih7WPvDuWuH21qumLH7UBd0q1mFEF9Kk2X1eu1bzNOeCOD2P
         150tnoo18xjkEIut/jB/0edKLD9aD1xXzNfzyZE8iSNrKaR7auGRrhsURHr+hVATSUNq
         wlFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX83hGEu6/fkDecmqlWHOw3b7O7FnNP3qNmcO7DRkmMQK28dsxy9P07p0VpccAU6qw10yCQXGiAL/nqzSTg@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0Gw7YsLwlljbKvvDANfZB4VfZ+e0/h8zLGSt4Y/gjZCebE2d
	Amapjg91idAkl+fNgSKX7fVN22rqh81e/hlEfMj2favoLZT0MMU2jKe55wf77SCTrKlKVpgCyea
	6Pu3vBAwj09fNUFqoejnSKCoUVOWEx0Y6oB+1bRVAC8s32KIkvgP8u+KyTpVUdaTzzX6wI15nSh
	7bn8s=
X-Gm-Gg: ASbGnctkw3he+KJKdq0DjIGpARgliZSN29ZSq2TRIjY6jvYHmhMDNzDDMq2rn2MrZyr
	QfnNGRYCRxtr9XYZzyfyDFQwltdHDhXk+SvWKOdi1D8CZEmn+kBkizf+WfxhJA5qprljbwwyjv3
	ns0O/ZM1n+asYdR0oBvB3QgdZNrdEe7CZrPhhmIx3hthot4sTbkq64kCRgD3G65P1hbI5ZofIcH
	pm6mVJIxdJfWxc2vmYI85pITFBHdmOBoDIA4EXYu+NZGJSxyo/6WSLIjb5yn89ccXfwrMX+JdZd
	4LEwizOpeuigXsjc8O0DOAgV3cBwoH6p5ZNfGC6iXXmBUrNTS8fZAM1n+W2k
X-Received: by 2002:a17:907:86a2:b0:ac7:b48f:4cd6 with SMTP id a640c23a62f3a-ac7d6d567bemr1490493966b.24.1744123977082;
        Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1rJL2oh3cfUJLk5my47t8hoQCjxMJuINUXBfM8HYiul6ras4kK+imNaCIKqnjSFm48aaaEA==
X-Received: by 2002:a17:907:86a2:b0:ac7:b48f:4cd6 with SMTP id a640c23a62f3a-ac7d6d567bemr1490490666b.24.1744123976620;
        Tue, 08 Apr 2025 07:52:56 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c1085sm916323066b.183.2025.04.08.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:56 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Tue,  8 Apr 2025 16:52:50 +0200
Message-ID: <20250408145252.581060-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 6260839fe972..1f2a26ac33b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
-- 
2.43.0


