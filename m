Return-Path: <linux-arm-msm+bounces-53207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1210A7B97A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 11:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398F2188A3AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DCB1A5B87;
	Fri,  4 Apr 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PMRy9ABx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4D19F133
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757286; cv=none; b=flq05XLFpkQI6Sc27TxPEAZDnb8qC4OKGs6QrhfgQaK9Bjhy8xH4lukTPp7/nIywJPK11p9NqLXK6WfcKgk5pXD3PnbAXaq+oQSHq2/YeZbVs3UgR7nXt7ed6mduh2BfjKTzb21TDh+QQhbqf7KUkyaJkW/x78BElm9nBZ/E4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757286; c=relaxed/simple;
	bh=YzcC/8IF6WlBpTBBJmagM6VLu/QII2dkapejxYRXF+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODudT2DpVSCeXRY0rSxOik3vvE0kRot5q0MEk7/K6ADKIuSCRSHEQHZmDyk49HPkUSH1fhcRedeEcb8aiiOR1g86pQEb8DOqhc2v+7yiChcyp9aS3CcmpOY/W1aga1ME2gU/+3odpWdZ6ONgG7s+MB2Stw8lpeFUSJXPfOBMgT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=PMRy9ABx; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C6A7F403F0
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757276;
	bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=PMRy9ABxH276AB/M3YmThknrnAF/dM8LHrH4US4GdoO4K6nE9CF8MAA8LFBlva0YH
	 56aO/KcmKJapwCwy/isvVkTyCZb8WxnXCJJVoWs+N8yxM2hK/KfqzyBpkmKj7AcnUI
	 N3Q4zekU4k0viRZhryzHkTkvAsxG22+8N/Qr6sXOZ1uP1NDPUmC1vJjpZtk5i9gZeZ
	 bJ0/ZzjOfSyjMmhd/VktYw1F6FWrzV0r/8NWxs0nY40gxRxKRUILzzkvV6ltXgG93l
	 qKOdyMpT9TIYY4jqn3mc3Kr2k2z0+gbkT2UT5sHVBZD2hUU2ijx8JkDS47LjiaC9Sd
	 Jzef4sMTtBqfQ==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so14009145e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 02:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757274; x=1744362074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
        b=YmyWGhjp71RGbIZW2xnwRpfvv4iM7HE6RSHopAp3w4MGb3SRPPv72sHiRxzJcwExEt
         9iV7V/OYPaodfWz6w9ycitSOjIpHCt5TYamVQ8c0AyaH9XDj933vsmu/mlbyL5f8Kn+g
         X/DDORdvMX2/Wq+eozTnzeg+gdcX2i4yvMw29+wR5OZbfXHVMXTPWVi6GdBpO6a8orev
         b/aA2lye+WhS9jnEQQGzoS7UOkaH2Ffpcj49em2SA0jO+7CbH75yc5H/05aDeIkBCw33
         bnNSEcdZM6vNHJhcobpdU5C2c2nAJkcaBRdTM3/VfuuhfIAbvuA4dxY0VMxmYAn6lVLy
         Rnvg==
X-Forwarded-Encrypted: i=1; AJvYcCUMnRMtVtTO7XguGdPo/kbTw0IqIo63DKMiBztLjASp5pImF38a6d4xtYkfLAvl79hxwD5TtH0/LoKTI6/u@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxGrrwArjk6eUXaivxTy0bSAU3JzYouIcEaG+3AhSkMrZx/W2
	ZHMRJkZrxPM4x1/ClA0LzbS8XPBEtNab8gbHmLaFaVKLHNg9xKzxZNRkWATAdY8o5bV6CKxBR9T
	botUQ+s8T3W+QxMP9DZhOAP0NVzUA3+XU9AP+rnztniMt1KLsew4hQ2vlFlI252egkA2xEaHTbN
	pONzx3+cPmEzk=
X-Gm-Gg: ASbGncsTE0ZLeN7xc+WGSF4SxStxYltFFKwtig9xm6lE1sunsWuFMtMroLPpfcBKgeM
	4LoTS8ZKMnoNDVvopOvCq0rCEUl5VzNPY9bpETVGQ0Wbhgb44puIup2UW9ZTUBF+KUia6bcnUuw
	iY3ODnk7JY8XMi2MA3X5IGv6ZBn3p8q+QG7Ql01y6SkUmOEO6YQ4aRiryTbPmA63uzxrpl1/cb3
	Id9xxstZg9KXgVpaTploIg3awg4V1OFRDSS257v0Cjj6PF3UV614bNXi2cmyBYoRFU4TXEDklsx
	5yEGVqb+E07CcMPjLlXSBjMLPlqg8aDPjV+Rp3QVtO3rxC8d8ejETgaXvgyv
X-Received: by 2002:a05:600c:3b13:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43ed0b481aemr19668105e9.4.1743757274438;
        Fri, 04 Apr 2025 02:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdpABidDuATXZ706ls87vLzgKf56I7dN2yooTu5/p7/hh9qVoP7Z4UPtu+CCEZh9am2E7ZrA==
X-Received: by 2002:a05:600c:3b13:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43ed0b481aemr19667775e9.4.1743757274077;
        Fri, 04 Apr 2025 02:01:14 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968a1sm3895816f8f.11.2025.04.04.02.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:13 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Fri,  4 Apr 2025 11:01:08 +0200
Message-ID: <20250404090108.3333211-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
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


