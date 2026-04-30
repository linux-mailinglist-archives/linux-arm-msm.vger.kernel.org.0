Return-Path: <linux-arm-msm+bounces-105404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJNJONKV82nD5AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:48:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230D4A6926
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B491302204C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8BB478846;
	Thu, 30 Apr 2026 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Wd1Aj/ro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F5472794
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571266; cv=none; b=KQuYReYA9FDhfVQkDO2eQtt+pDSDoHFhr9Hf/dWE4ntEHLa830+jhfYpSz2WP+VPvjfROgtI8pywx3ohWvuIYDGaSLjZbM6kna7PgjMzFC2sZYsE0nIgSlRAiUeYBSEPUFBx7VHs7hva0UNTKph7LnLbYcsNB0nFnzn4ExGXf80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571266; c=relaxed/simple;
	bh=eWyFo6wtcwjcGn72c1H93Yp+EkyaoRZ7SE6IqiBOBuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlS2dy8UuF/QQvLWhuf0ldo6ngC1ghPuVx6IYHgXYKq1UgillJc4Pv1knS1k5Yhw9Yl8OTcs196UjmQNMPNrJ4CZVtesMb4e7k59PnVNXdm/yzX1ikdYPELln3H6M5VW90e0IjoAdd4xYwgoWKjBkll/+Itawo1PItObPPKnNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Wd1Aj/ro; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso7128855e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777571264; x=1778176064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gbkbiFxStV52q4s9W7vmjcqc2PkrySXx7kVEFbo+QI=;
        b=Wd1Aj/roBKasuMdcYbPquAiufq5cWkzAf6ieBw/SkL+4FBaDfukP13+FifJ5aRfyOe
         out9ZiDm4i3UIfh/AqeCKTAWesoc94b/DyTbijsI3X9WjQRzXqyS94O0QTrLKtT5E1D0
         6HXwid76Hre6hFBzONViXTHcyZovEiNcwJp0Ei85J5W+lhH5k/PRyxc1wjKrm84q+kso
         aAoNAKuRVnDggqc22Kmlh3FNuIdaxlWBbS1ZqNn15MXaE2YXQdBoIv+uVD5MAwDC8kLu
         1m47jpzVJ2Yh9LjrF9COuHME0QXuSSiTbCY+CPVMvfWUMp7ktevwtkY2iNEetiYR3wpw
         0RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571264; x=1778176064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gbkbiFxStV52q4s9W7vmjcqc2PkrySXx7kVEFbo+QI=;
        b=H5xDAWy2VHA7ApUBUzAAlhmDqdFNgX6qlocaRuPOT7evlfpK+AKRLpsjYDlShVlWBO
         y1o4aJrZJtS471o49p8HV6KzUKbAoVc8tbRdzxfGHTjMXUrc2AnbD8xqmCXQ/4m5kPtU
         1VRINeaHmIh0oGFDp9dZdIu7m3bvVMQcOlQ5uyFops655npyorVdkjWkUTxgJMTIIjlm
         4I31h23yn55h/Pq2lrQ2+l2dCgxt04G3ybds4yPhYwYyUFgKWPWM25zZu9AvxpTuJ20g
         /h7WR6pGAA4kvy8TiBF1vbExO4cnX5af2cbNptTBfYR1O4G4t460yQ2JSrb6pkBVgyYh
         f35A==
X-Forwarded-Encrypted: i=1; AFNElJ88Xx4AMfvGmlEXZ/mKksu+VZDg+LBfAJ/rTzGIlloGS8RdtWRxFW74th++kquYtfpylPP1lRvEzae/xZqV@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKVvWGLF63/fk6CrApMAcBwqj8N0L7+xx5M/8NBd7ysPmMmpc
	cVlvULS/0kdZ0fA7a1rOOZeb2nUKb5CuLYi3Lr0U8nGerEPo2RiH0O7Sc5VKB2kVI00=
X-Gm-Gg: AeBDievJVe394acILU8L4Ba5beM1Zg9ZDNJUNCOXU0hXCv2Bv9Wc+Zy7afEsGLmOvjY
	gciiMvivMqqMyQHs7mLyrtBPLQJhWxLOHoVURAQsCmGt5RmxHgzVF59ulXZHtRHH5LNjrJRm/Qf
	QWCEu3KK2qUqqvxe/HkGaLXkUN+DYgNjnNxDNMmo+MizBKBdD7Cbl0M7cl+X2EmDscuXTsb1wLS
	l2hi02//wpt/KgOLEzweXfLoPEMUzmhbHoiyuAsKzEF4nb8Tf6u7Yk7BOTECcgE8ci0Dc+M/tGE
	R8VGXSCo3HCwcm6bCmadC2+GJYyZKYY5X0Q78KGjKUj7tEB3/1r1r2pgZ9gnI9cQBrAbXDG5u6T
	ZWhMKAjcAXSF3SCHILW1yL3erxfcaA9GoyaUf1++58TLeB2/CY0JHcWd8Y1MAiLOSGCDhqq+1k/
	zX2LlWIoNGJ/9HSHrGfFl+rVQy884AO+Qn7q8ZZqydKKcoCt5MRkQpXWFeZTx/x7VSpYQX/lRIs
	kA6wvUdeaBlpLNf9T3eZJcbpYTNp/DyG7k=
X-Received: by 2002:a05:600c:8b84:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-48a84460ab3mr68015285e9.24.1777571263279;
        Thu, 30 Apr 2026 10:47:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fd90:2598:5764:5f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm174449435e9.2.2026.04.30.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:47:42 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 30 Apr 2026 18:47:01 +0100
Subject: [PATCH RFC 1/3] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-imdt-qcs8550-sbc-rfc-v1-1-4d2b6675eaa3@imd-tec.com>
References: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
In-Reply-To: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4230D4A6926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105404-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add IMDT (IMD Technologies Ltd) to the vendor prefixes
list.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2db12a1cb6e1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -769,6 +769,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0


