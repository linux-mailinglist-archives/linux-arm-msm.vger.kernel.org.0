Return-Path: <linux-arm-msm+bounces-108168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAR0KOLyCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:07:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2195456B3C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74C5303E6F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4169351C30;
	Mon, 18 May 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKcWyuyC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E8318BA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102308; cv=none; b=GzM0FalnMuLqEUx/XMRPzke0MhUeTOZOkgoIf/7BL6LccPlPFa4adsZNLLzHpVEhP313OrbhrzQck3iLa1gAgxV7E6GuBJgvb8GZs/+jRIgXim5RQuFKjnAnGMKYlPk4cY6yLqA8xUzNoWV7r/cwSCbWtG2VRhrmINyBS6qaT6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102308; c=relaxed/simple;
	bh=cVR6h3rkGrL9zNSGot5yOVYOujBEvnXGWmyJCWYxP7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUJSvzjTs16AbQ/8/Xnthz4WlF7VWlyi1uTAdbE4mOliHiHPVTLnG/9MvcLCoKafK5XfFjgk1/UtvJngMOFD65mnZlS9so9NSHI08XfXfyQ5bMqZXs6dCMI+tpcnxdzPhZbzOb22nBk4wkFkdNPFj/C8SILpCs2zlmFELsued/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKcWyuyC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8028fa6039so1425700a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102304; x=1779707104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=VKcWyuyCtX19H0w6MIFAeGxoZjbXf2GzIS7I4qWQRF62g+qsZJvUPHWDTrDHBw2yZY
         krJ5nUQC0JA3NNFFLXZDzYjlIiT2HNSOB5/+kq8b+P2+T3UpKC/ZUJK3yw6ZI/SQl4rZ
         oq+S3gVMY4g0m4KrSSSdEkqiiPYUPUJGO64q/Ix+9JNmGNUqNX97WvRrrWGfVxpkfWP2
         ZN6F4UZ7OZoUTfQhVMjk95Qb2kPf9smYqvQVsqjv/IXwShsU9JB0KMs9HNRUawlGUtNI
         3H56zNR+03gUP9loIzHVTJRL7+GFCwUv1UyjyEh8d6Ekf7zGZtlUci03UwWu+CNg0UL6
         baMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102304; x=1779707104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=qLif8i/VtM6mjMV7WJuUfCtTIbWuNmcg4WZB67U1Pz/QP7SuavidcvY2livHSOUfBq
         uP34WHCoHbKWCjrDtXzeSy/LZUJJrz9AK2vThwRQr3Flxs8Qm2Zz9UtV8z5gRLbPL6yQ
         kc7Wl96O4n2axIimtABwfuacaM7icROVb0lZf3H7HSZIiObKrSqEXtpYWmsWu2tFSMIb
         y9lUk2Gv2zjsecXMsUgcpqYm5qbj/sAcuQsAxFpoEh/4z/Sdw4Vp6X3c+H+pTQFSSshU
         4RUM9q0ICbb2Y+Kt2FNwI0wuZp6VwBx3WhW0Rz/CEiU2+akVmmcjUB9YsAVSjJb/KmYr
         hKlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OOx1RZTxIwNJqz2iHTkySBwG99sWp2JeBifBXQZolLeCWJKcW52rwurMzxxov19ALhSkz+KolzsKTi67O@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDFQMAlr6p5bDx1aWhp4CbjM5FYyu87BU8FvKql8XfNi5cl5M
	K8umZ+amWYyg+Cg+rma0sC8L2zbMrU3z40Ytin63XIyQAQbjdL+4acn6
X-Gm-Gg: Acq92OFGIn4Ld4FjII5I5yRdp3Jg8sTVcGtDd2hpRmA6ir4kipORMK69zqGgDzyvpxT
	kF4QGTGkgHW6FDSBYp63N7w8qUrjnB7kLNcQuGeFBNzueny/ZpiCiUn82PJt4I/yJ8gvNUH0GQ7
	x7LLcZC4a1ucu1/XsJMLHcugD94N9Yh5XxN6MN9rO6TQ8FPsR8ekkcL/6jtw1CBeFrjOkSOqThX
	p7tTRFwAojf1B6yuXqtfGXDufEeKezo1XYH0fgZlpY/pl7v3ftTGgEpCwgcNliqIDPcjjmC7HDI
	mwzEETXADxdg0Zd6c8CuwJy2w7ogRfqgpcJtwPw9bCItD+IkPSii86greKyZaLfAGVm8Vh+gAiq
	dgPNKwQOBTuws1Qn2kYEaOzv4GVwqsy5/Ldu3/xDuojrz3C7+rUJXqKxuOTrSq8bJY/oWBxFhnU
	dlBJwg84d0xHnzOuMdCi3JBfCvxHnL4GEShs1A3yghaxMR8OfZm/tqnnuPng==
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr14862573a91.17.1779102303755;
        Mon, 18 May 2026 04:05:03 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10866313a91.7.2026.05.18.04.04.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 04:05:03 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Mon, 18 May 2026 16:34:33 +0530
Message-ID: <20260518110435.16262-2-blfizzyy@gmail.com>
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
X-Rspamd-Queue-Id: 2195456B3C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108168-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


