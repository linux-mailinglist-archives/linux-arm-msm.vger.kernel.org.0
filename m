Return-Path: <linux-arm-msm+bounces-110683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEKzBUATHmrugwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 01:18:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 702D9626459
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 01:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38F81301DCD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 23:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D0438945D;
	Mon,  1 Jun 2026 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et3aWNAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A4388E74
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355748; cv=none; b=KEo08j6/WY4bV0i434B/ufV00wr90C09ajuajrch7eVFATM2t82qFn6kCfOAWDOWQYpipr5WZgjw7tg7963dr0yMfcIDHutAW9ASBqsiXuv8cn93nB34oXj61MawUkLWKmb/65eKjjTuSwCQ1dYT+FQqek95rd8vkzntjUDjmfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355748; c=relaxed/simple;
	bh=pEOFktyEdDrmsMq+VxhyWtZQC/mdnC1YCF3iTCL9224=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G59sBfPuRW3r6Hd2klfFGk9KNnc19avTnl9tbxRbB1RBUZuQNWm1CC8dx2qfXgxns9thMqWugzYBuFC/tFXZvEcTe3Ntbri3mZAPd6BLZlND6bKitqHa9eIFDmiKgYo9JUVKngZZma3wdAohAD48zD8DULnKy9+PMUwiCzQychY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et3aWNAB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf3781ca51so26315355ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 16:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355746; x=1780960546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQhwbUv75riwhJ2xHnBk5bpyd72x1+FfpjxIgAuZhAc=;
        b=et3aWNABTQ80KblQvTDfx1fppju0qciGXnI8ZWmoLtkAYX3QQxrvPRRVI9oaZ+s9dj
         RWoWVLZvaf9v5o9Hlvuol8nTXW593VXYx6a9H+H+QptUVtebnP4yJLp9Tak5PNe2cXvo
         P9v3fgjkk2flPzs2vlki98uZxr3eBmp0w3TDG55LPDT7qpcgwUy/Wy9/7PGaXZV6zc8j
         cC6UsZshHWwbtcp0EZRILCiXPPSpi9jXYmYj/i4B9BQOGJu8kHBhrtvCVP7uHSlauMmk
         BtbFXTdgAK8V48gBCQA8rHL2tEkWcyverHPkqNQu3LXl1mVHhpjRplFZvi3eF27lX1cW
         39Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355746; x=1780960546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQhwbUv75riwhJ2xHnBk5bpyd72x1+FfpjxIgAuZhAc=;
        b=EM508d7hzSGFxxO6c+HX4m8Pejfagd/B+cHbsfdw8i+pgrr7abtzil1neuGD/IrsLN
         trGfAbIG6zkLyFYXRVYAHCp4hLSNG0tDkcjPnlQ/s1XtSOlEFVwGI8/MAHzqYCfv7vRe
         wVX3Ve59/Pyzzl5+nlzSDwhgxpMbPIkS57UjXhBQfh0zg2fq2kPUoxGGZi4fz7COi3xc
         j+rR3wzerrvY4p+FjsuDRRPKGLK9lPGmmnVawbYzjb3x2afooQ7XpBuRRNMabB2GOMYR
         6c5jO4AAtejp9uLrRJhEvMVGA6/1Dx6kjlRoyjJKaqfB1JJnqT//2/Ji2soYn6YEUI/m
         hOUA==
X-Forwarded-Encrypted: i=1; AFNElJ8GNbmWSRpQAAm+2vP8aq0cPEoFM1EGzaBoxLELIzGSyVTQRmK2VtFAv8wEALqSbFEcIp1MzqWf0o/ZsoSi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtg41FShiwjaejYGJwKSQxOwCw3oFUrv/6LupFvnWNbOookUSC
	hu3OVLK/sOJiN2vjp2dV5fCfGrB18bFdJTgdRTOoPTdxpsL1hfHheekl
X-Gm-Gg: Acq92OFQiBXceaxjKnJY1Zd8fCrnxAeD5aeVloBsIA9I7DVJKxNaT9chpoF1JlyVoFb
	HTe4p7WBBozNKxuzh6ngxoh949v72OG2uu0RLm7qUS/JiCr0SyZSQv4t7VJpf7RYtWyRk8vR5+v
	4FZ54aHQEBs/C9uWHQq5G9oMH0eCMauYYfXRm0z3c98qOCOhz89O4LfvXRSKHyee/3UBo127KRI
	xQRXgEnlVWISTstmqmtW9P4ElQWVcsZ3jB9Bgr3f+bqRN9b8xNJVBZkm2zLrj2JPqEI4ERk+i5k
	TQ/C+Kk2RhI2jv/O43eaxyv/fniJP6PrytWO4CMgs5xtSCgqMgHGLkwwG8IRkXKSB+LXkBcXO7H
	+07bz3lx4dLxp5hhE4qqNkAGkQDg08nXrwTCrgdQErs+23+KwROHLpAR5wNjfMTYqtkrUtutwFp
	0NmJuBYVjChtAHrKL4DNHSQc7WmTgSqcsZCzPWwDSTg6obrgwOWKaxu0iOdnaGktOjhyqgpGAax
	sZHEXuNdkk7jLXVC0bT
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr145407195ad.29.1780355746509;
        Mon, 01 Jun 2026 16:15:46 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:46 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
Date: Tue,  2 Jun 2026 11:12:34 +1200
Message-ID: <20260601231236.20402-2-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-110683-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 702D9626459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the documentation for the 'snps,reinit-phy-on-resume' boolean
property. When set, the DWC3 core will perform a full phy_exit() +
phy_init() cycle on each USB2 PHY during the host-mode fast resume
path. This is needed on platforms where the USB2 PHY power domain
is gated during deep sleep even when device_may_wakeup is true.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..d12f6ae81ab8 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -212,6 +212,16 @@ properties:
       When set, run the SOF/ITP counter based on ref_clk.
     type: boolean
 
+  snps,reinit-phy-on-resume:
+    description:
+      When set, the DWC3 will re-initialize the USB2 PHYs during the
+      host-mode fast resume path (device_may_wakeup). Some platforms
+      cut PHY power during deep sleep even when USB wake is enabled,
+      and the standard PHY runtime PM resume is insufficient to restore
+      the PHY register state. This quirk forces a full phy_exit() +
+      phy_init() cycle on each USB2 PHY.
+    type: boolean
+
   snps,resume-hs-terminations:
     description:
       Fix the issue of HS terminations CRC error on resume by enabling this
-- 
2.53.0


