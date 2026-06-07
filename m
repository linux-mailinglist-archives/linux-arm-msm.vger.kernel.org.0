Return-Path: <linux-arm-msm+bounces-111568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2thIE5RYJWokHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E2650784
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WC2aK3OM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111568-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111568-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 305163026AAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8B1347FC0;
	Sun,  7 Jun 2026 11:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1F257855
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832239; cv=none; b=YEdCHm2qzupbfx3yYF0OPtrndJ2TlEKBsxlBrDkg+mpBUkPFsIV4TlT91ReroNxDTn6HdLbZtgtws0NH4VNYkt+Oofi7CN8nLWvjCo/IwIran+ZYuRuOaqH7daFfvucT+LLjboD7bFXFf5u7KJ2jqSurnPzjuAT+bSbwdBMsKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832239; c=relaxed/simple;
	bh=XUJDd4xUHVWu57IdXVomBU+JbtBGQJowIYaHzRYn3x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFNmGfsyPswUHPKWEp8+sjiPJk08YWvWm9NUXgMkFvvUu9loCTBxAxPNygnsTazHIvmRKh+NubeSPbzqtCd8BaNp++ZUeyWRe/ju8mz6RK0q6v5Ip6FTEWoyd0TvPRPQSgHS+PNJTpOipQu0m5uqt4XFsY/NlNk+Fl23NldC0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC2aK3OM; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2d792c8so22317955ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832238; x=1781437038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=WC2aK3OMvwIbfAX5jtk5QHX/YGiI+WOJmbfxf9GlEgeF+6Yv8zG4N8/MNKW+aYqCHw
         EJpEco8fWOxJFCqbNg4Sg/0yMv9JK9afFpeg1ufaMhQtIKBk7AuxjSVcnOpDvxnfN17R
         vyIVpWAs0QfNAN2FLYS+h9Qsd3NqvfjcoiSvPan8wFXYR4G7GFgfAS2Oq+okSH3A56P9
         L974t9KwmGHdx/wcqy2RyYy63Sv+QEj08DsUlU9AVsecrdiJsvcusoSoiTitYAZi6uuW
         8Xak92yk8hvgf/GnTjngDcugV0WvMH8vHaiKV0kN7zvX9dagDr2vCneupb/9ajJcykSd
         c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832238; x=1781437038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=XnVh96FdW2vhrrREemccYQJsKmicnTNVufF4ffH1KdLgB9zd1+QXXufhG4jGpAGVF3
         TdBC5NEKdZqUcjUvUcldgESvimWHq0aSwIEOva4l65Eit1/2yGJHbVaksYwsf3lTaVQM
         uYE4uJq76wH4rzD7HHGcmv8b9VodJq8IvMSp/02O5RAHlzq4WyecdY4r3BUS6Kpghxdg
         B6Z116z3yRaV9ZC02UV21zvzmkb8/oMj7Xe/6MbykUTsLdtYF6U+JPR2z0csJbOjWlT1
         mJYewIBwvGcF0G16pLOVDeeU0fAUMcIUBPNgnOLA7557xW+wmF0+FATSo4j3DlWO19Jf
         6CNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XGmC/sGI823t7ZrfvS+96nyZsMqnpSRhBDjWHomU5hyVSbzBSRcMbvmxViq9ITLBNTrQ2Dx9PpEvJlqln@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmORnFrhi5JzMcnuRWljhP59/bhUe5Na4FAEPCFj+NJkncfFL
	9qfeGjbd7hrOCCEnI2oKAUpt3gmJ9B23LmH4BHBifcOEHv/sH5GpX3T8
X-Gm-Gg: Acq92OFuF3RtHEysyir/RvpmXb9REXl1ZV+IvDUCLoLsi/rg1n/tPfO0bdLLG5Jk+VJ
	pJthbODNU6PUkC3bLNXIJUrZh65RqWx9sUNmp7Z/bTbDNPPIhnAdnHbq9dNl3ipkOjasL9vM+rA
	AF+S5xrhuEyfRMpbPBog+e72bLHZyY8MaOYRGsg+pehfdu8dQ16Z3d2s+PGrrlKGFeikI0JRCgN
	w8Azf8zQuvktUXdOcRha/8eU1DKicDrV9tFNYnB4VR7jxvTkEWE7m1NMOUzUnR8w8YKrnnzByqG
	0T8pM+J53jvcKcM/dRqHMwrMZO3ZAhlZIrtKyHsA41xXRs3zFbw+AiZmU04vfT87urbBenwcQLe
	qPOddLhiqzqFSU5O6ofZyPuun6PfIH3qehHK8f6UaWNPMf66TXeRlDLPzqRDjo0yOhd0IankD2c
	qunxvsCjLhb6oMLt/BqTRVOhNFJbMPm80fbqo1P5qP7ACj21HjhuCNNvHdSGZHjUomNsybhI2OH
	l2Mj29Ing==
X-Received: by 2002:a17:902:ce81:b0:2bf:2114:ecc2 with SMTP id d9443c01a7336-2c1e8214273mr128358685ad.35.1780832237704;
        Sun, 07 Jun 2026 04:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:17 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Sun,  7 Jun 2026 17:06:56 +0530
Message-ID: <20260607113658.25117-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607113658.25117-1-blfizzyy@gmail.com>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111568-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:blfizzyy@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,vicharak.in:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A86E2650784

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


