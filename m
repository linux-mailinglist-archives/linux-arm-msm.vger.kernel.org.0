Return-Path: <linux-arm-msm+bounces-52081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11749A6A596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91141748A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5CC2206B8;
	Thu, 20 Mar 2025 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJwQIkHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8421CA18
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471805; cv=none; b=O/vuCFsbzqqMo/3CEbbpjcG0Hemv0+tuycjgnHng1B411RnPin4yr3fgf2OOlcV+Qe1HxK2IFzzC///WQKqScUylenMOhCSOKNy//XqV9GbXzyWHXEMZvUyAU1MSFlbxJjcdWe7vrhihUZ0vmBjYkU2iAVXWj+mMBZxftEqJ+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471805; c=relaxed/simple;
	bh=Aon4CSRLZAp00bOLv5cqnz1HdCAHQzSH1gGdjQ1+p2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YopogWRj7i5sBfCCMuUp3Y4zYqz3uuogvMqQ9rBHK3IOKgpVPLBfzbVKVKUEfR0AXrA0ePFtojP/JdX+QrSmluvi1ym6wkAW0nwPb79i2GxMbcBBg1SRJbkCwett+bi8yCvw6eY2WwTh+YUdtCGEibkLyx3urM+W+EJLwlikYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJwQIkHg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso6783485e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471802; x=1743076602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTBcwD7zMY77Gd6SVP9wN85Z8q1nB61DYTk+PAfaKwU=;
        b=SJwQIkHgEM7R1WTrjxpobSyb1vdk6Rz0QmdMccVtxj/JyReA8AwE217gHf/RAxD0kf
         yeqNsFxw/EvLoQ8/QZdgJozzsPBFfQcs11YRe/bfbPnPhJVG/cjxX8iM3CRgkJDsDJro
         7GVfCMkvz/OwuH6r7LCyr7Hc6+3SbAbUIy3jvL/LgeTZzO3ANr9SOWQ75GXsdKzSUxi0
         kuxM4uzz4iZW+nWICN+EsyLdexxtOIqTFZttRfrR3p9lSNapHqk/EAiIXEZ8+M8EJFUv
         JfrQAV+ntcUyLWVW5c6m2avoCH46AeC1eE/RW6f0CB/ncTOJ+NPhinuobkizybiYVFo4
         iXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471802; x=1743076602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTBcwD7zMY77Gd6SVP9wN85Z8q1nB61DYTk+PAfaKwU=;
        b=Ymm9c8rXevkkPY+7I5w8DeA6i5suCNjuf5HLBDzXm05OLnURWcRR8G/4MnN31/HRAO
         b/tM2cnYzQP7WYGOFYDzdjytddU7hkP3TN6D1Rkogr5pFvA+rIpGYcOOEsgFldY5R/pW
         Mtq7EAOZ5Ft9PtOxznItBRls8pKJRzz69lTDgDzSKsvUi7Q+Sr8Mhh9OIopX4M1jFrni
         lICexL69YdIInaO9LMxJnDLJ8X43fyH5J4i5VYoSu2oNKL9P08jckUzwhxf7bFDNK5T3
         jIyyRspU4/bNzWreVJ70RbO+3BXQbVz6+E5Wu73X/EMt0pAcuzIMfQr5cPb2Y49gMyAo
         9Flw==
X-Forwarded-Encrypted: i=1; AJvYcCWty9GjWV+a11K1JKUFBob66pPGKl5YTyqPE2Z5SHNmSE5CAE5jzvU3Rsmdv5FWmYJ5qlwgWSM/ietAq+id@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fSi5u+/FrbY+AY4xwYmZ6HzwIb26tA/nR3CIXW9Gn5D9Ai6Q
	CjePzccUFhUkOoF8KpHbkf4/MC6p5JhTGYZAa2bTO1uRFu7T3b0eEGL1Y/CHj6g=
X-Gm-Gg: ASbGnct8D0BUsjK3ohuMh/zwvaxPPu67fWkkirfW+Qm88pnRryKd7N8QEQTdCoJsdeA
	WVrgMnViMdCx85ET9C48vAA9ksYQzV2LUvrcgGbA3nofc0WxhpbXTcOckXBz3xFNE5WCE+Q4nvq
	b/VycwUjObFqklCVZYXCdrGfQXdEmU83R3O+ach+pJHupGz6lp5y7pNgmPS5yUCPlEEgRUpSsfV
	t+BueMP9XPf6rrA3Rk81P2kzKMJYOz2SRM1cQP0l18A4z+9PNCSP5nEWx0lRXoQD1edHAEKjEPP
	B4OZSAL17pMR2U/FwnN3Z6j5S0LoIW3gABFKDkRVxvuBsZA45h0+WSEVi5GfMJ+TYqE0tg==
X-Google-Smtp-Source: AGHT+IELSu1Fy0iTPGOQqguY/3CHrp5HN+wulAbklczgtP+/n5Gl76d1bxZyG2Z7RhRwAdDyddobKg==
X-Received: by 2002:a05:600c:1546:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43d49549405mr24419195e9.16.1742471801801;
        Thu, 20 Mar 2025 04:56:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:40 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Thu, 20 Mar 2025 11:56:29 +0000
Message-Id: <20250320115633.4248-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5


