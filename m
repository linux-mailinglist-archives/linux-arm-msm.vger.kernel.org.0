Return-Path: <linux-arm-msm+bounces-47782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4640A32BA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EDD51885AB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07C43398A;
	Wed, 12 Feb 2025 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TR4QmaMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3A212B31
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377970; cv=none; b=f/6qWEMyduosLfZ7d+T7bzgnWhS1fLZs83K85LJjHeEYoEvHz+5m2fxz5bZ1H41CuYWUPzagQxW78nkRLuQ3kvVbVr6ukUU4PnMpIrUSZNI3jo2pD9aVUTYU7kC/XXuS25vBG6HY8u3eay4WNXEG7N9oPAWP+Tvlc00bdrM63AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377970; c=relaxed/simple;
	bh=uM+rgeiyIG3H/nI3hJGwzzxr1vwwAYELU/clwSlSP0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5ROplRa4vvtTvFWaGS4XQ/13u3hQLmjHrAfj8FJzlXqDXhMQG+f1Pn+4OcHPkAi6OgGDIIcURVgaN4dKPgEvyp9er+L/LfJxdlyJheuzqpxLPQCHTntO/ktLVUSEmQJ37/6xaEogW67XYV7J54EbhpyOKDcY0s2FwqUHNbhO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TR4QmaMS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7dd005cb0so40530166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739377967; x=1739982767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3+GwMSFhqocbDKQfg41i+abCZPRjFt/R7A5GSXrnUk=;
        b=TR4QmaMSTyI3dInttInKYSlUMSiQa/vAht7WqMRcncedRANOJeNfczhQbmODSlgbKV
         9StRjkTtPrf9EY/xCJOAPEHwmi7To1KHjkuKMnqxKmwdxBqllJKTGYhjWM8Iv+OdW80h
         hY4J1/wRRwVoVgm7gwc9k3QascxowxfyWXB8Fquc4P9rb+n6AOZ/N9sXxC2uUhaJmw27
         YPzHVqygaOwKCkuOp/SLN4epm3hd41pg5MITHfUyNbcvEbskgMqVR6gGyR8LlRrHs1Vb
         PhsSH+/DPGmXpu+PmQolSIBYya+tVwZstmWNLd9ODP32l1Y0f03QfXUIs2VJv5GN/Whz
         2Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377967; x=1739982767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3+GwMSFhqocbDKQfg41i+abCZPRjFt/R7A5GSXrnUk=;
        b=tQGStksiQt0A1sexqLh4Rxy5wWsdZaLIbu3GUZkBbmOdGsh7qvs1Tclrk74ck2J5sG
         lV30rY6zW+n7jUpE7mt82KEIzF+HFdomELV0WavfGmz52seTgQbQjk/WhUTgsF/m0Ua2
         aft/V7jh+uBCbutHnTWwt8Y6Qv4qKPg/BHxImS3xN3ziLfCHZN2UIJtJ9W59zu843a/E
         8xcoOeipX2xRgLz57fcEHQXqtlE6NcbvIRzIdnYQQwMYtujl6RCeJEqgi4B4K5u+wmjH
         9oimF3bze251KtvZoAUcLbR7JMXuDKHmuB6oiskqjy4kf0RH84IYDVU9bjH3ra2eLrqb
         r+mA==
X-Forwarded-Encrypted: i=1; AJvYcCWWQ1Wi1zKLHB9nIT7cXmdVSHAD26aF10haaN3xIC+AAjxFjXSwQMREcgI9GdpjlamTve7Vuli6iHTPn/WM@vger.kernel.org
X-Gm-Message-State: AOJu0YzixxG+ByCfjUr2qmaU/FemwvK1+vzUkhoVOJOLe1yw+Pqmh+Zd
	KZeH5wBe4HVShshYkMkmgKjXUyKGUZYbfXw7xoitO9um9lpfh829NRPx4Vx5/Lo=
X-Gm-Gg: ASbGncuDWQTENlbmw1YztU9RQcQCDms1hUHI1DuEsciTKI0I9+rgmP5rb/1yKnuNG8P
	tezwWlEAwoatYOIHfY2m8Xxs5iz4d+6nmEm6e8B0rZCZBPTIVx/LOPJL9QCDkM+NEulDAaPxqpO
	kJpZkivEtbdsxPac3oA4bHhQpLUtfk6XjHv9xP/5dSCO0TZkg6KuaVCESf8hlZ5Cs7BkG90a148
	DwOZQi9bu1Hu0cGKiykqmtdWAKDxRAoeVYfGQ3QHMx4X01dI1rsWFKINU+xR8T688F1MVv8zLFL
	Fc+Yvai2Aw/sNL8hexPR1nYC0UkYyA==
X-Google-Smtp-Source: AGHT+IF8u/EmJRpY1cgIvJEM+EbW+M73tl7S5R2stGgnFzaxNtA80WlogXUtJNIeXD6qOocbR1VfGg==
X-Received: by 2002:a17:907:9719:b0:aa6:9c29:86d1 with SMTP id a640c23a62f3a-ab7f334003emr129760866b.3.1739377966988;
        Wed, 12 Feb 2025 08:32:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a697c2besm917631366b.151.2025.02.12.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:32:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: qcom: dispcc-sm8750: Allow dumping regmap
Date: Wed, 12 Feb 2025 17:32:43 +0100
Message-ID: <20250212163243.237658-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
results in synchronous external abort, so limit the regmap to the last
readable register which allows dumping the regs for debugging.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index e9bca179998b..2c9714788739 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -1881,7 +1881,7 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x11014,
+	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
 	.fast_io = true,
 };
 
-- 
2.43.0


