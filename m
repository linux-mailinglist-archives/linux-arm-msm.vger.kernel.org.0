Return-Path: <linux-arm-msm+bounces-54117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98584A86F77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D667E17F3CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F0B23236D;
	Sat, 12 Apr 2025 20:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qgs4Q/zB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EFF230BDC;
	Sat, 12 Apr 2025 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489629; cv=none; b=oR4lfnWpnIZZ95ukke74nROCdWB/TsehkITsxpcIGiBXdeiUR66ZEXWIqnhie/8iCTWeRXGCQh9YMI751B88IlKiQoVLhRYQsT/kHHdeyZXa6AI9AooAxauIVEuHkVJ+WWVP1Azgop7tX55sQFztz2mPu8z9WNNBsm4UfF7mx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489629; c=relaxed/simple;
	bh=9jGBgw7X4dT0+5FklcYtTpf6XdRbcwhpMrfLuBnypSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lERb+Bc7fh4Fv44cJuCQO4K+voCBQ3QsVSy5a677fVnKpFxKYtk+BYMjilyC8HlbmnptN2PU1tKAIFZTA16573JXJe7/0EcmSSJXCg2X+tfNU+Kgfg4lbXrLc1lcSUWE7//vD2ufyiBri2+tos1xmPCOFvMI6nO8+XTMkB26TBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qgs4Q/zB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so21564845e9.0;
        Sat, 12 Apr 2025 13:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489626; x=1745094426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=Qgs4Q/zBC6q/9pEF1orjgmUBBvIWHrzeNkiIjqmwc2/RDp0kHHgwKR6MFX5UddN0bv
         TF6S9cDQFk98P87fc7XNeVIBkWPy4mjEjaLTOxYBJpNfb7KJWgaYxqKQ4slAnskgVTEy
         5tKyim3K3lUJg9X/Jxp03cciKIDRkMRgvOStv68TfJomFf6wYehXA+c8UUXA+J1TJJgy
         bm2mOHxdaMLmKW7EXuZTQiC8VuH4DmgI3ZAmPT74gU6TpVWOVPj5AmIPDHQKZIUpUxnq
         usKFPePBYysWaozoe5RL/pwFV87KWpxvGLQtldRUxm/RejR+W1TSan+xda8lO7SDUTpF
         1JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489626; x=1745094426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=EZGjXyPco2QasiCi6HL1XbiAy3Bv/NiXEV9JzzTH8wBjKGNfazBTZbXWD5ONrIoiuR
         Yf73kDBT9kBCJPVfcnB48+omT3lcuFGw3oFThsrGjTfHKqAyPpz+UFaMAqjJs0FVQtUf
         Ji91nV8i9mNSuMKzznAKO2moz537F0nHl5M1FgtIF3hkiZX/wcjEJuifqqc6ZCmQf4OG
         u1nGMOoIErirmtH/QNGxuBYWTD301P/oxyzZ0Af4OeswylL9h8uJdfqvYGNzIy9L6JLZ
         huheelqRs8OwtKE9+Z9wC3Om9tdDK1gizRFX7ZhQGEcaySN9mWxw1Sy9Khvjpxs7Jo2m
         91/g==
X-Forwarded-Encrypted: i=1; AJvYcCW5els2GtXE4q+B0YFs9eQCLFAKpvXyXx2BJ6lEkYsAFPCORO0LjAgsZd/t0htPtHqxXTbjMdT3m4RZHm5NYA==@vger.kernel.org, AJvYcCWaqVlV43LX9NebdeZZUZ9jA2zr6W33uGS4L9x4Bi7CzMTo5DxjG1yp7sUPCsFYF7jHQkIxRQw4hU8W@vger.kernel.org, AJvYcCWmgUC7evfrWuo076KoKhtLQG7wluMlvdNdHCsfreY+24dPXzuYpIwli+WShbTU6dbbJKexdJdrKIfYVmh8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxws7lpZgrE1fDDVGJd8KHVw7K1Wn2gnUijb1Tt6DdjnGTwFH5J
	M2THS5sduhqdDTM4YGLQoUy5EBdVz6ybjeLCs3kSL37lOhIEEIGawUSu9g==
X-Gm-Gg: ASbGnctmhgG7UbXNiqvmegQPaA/SlFzOL5U/1jnwEqAtFKTi3l0Oqvg0HzI24ayMq4e
	FySbhHlxZ9ctSlEw8wQ5ubbyV5XxL8rlCejbZvpW3bWI5jD69B0luWjlkGQEyNbUE2lM0/Etn9t
	9KV28mPLWdEtIR7of/xhXvuqbxgjFrLHOGjresaL0vHwoyhb5nS2FruENHodG0Q2Oe7VPQJMGhv
	OAZEVs3hGvSwGZlWZo3/9f4yr+DAFzjyuI7YIPO09Fa0TBFY1ucre+CURqb9Mja52Kol3fB4WQl
	a1XYxFkdJ3l9vwMNEdIyBq886PvUaJQFJ4p1clelQlItfztI2Aq87A4A5Qy4Z5h+P5lb4CbaphK
	mkxRjS5IvsfU7Abia
X-Google-Smtp-Source: AGHT+IF7eQA+y8Lqvzil16h/BZ20xtsseNQHcX3MasiH+W36JGiRILYfIiYVwPVlNIgUn3fdc+Vv5Q==
X-Received: by 2002:a05:600c:3ac6:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43f3a925e28mr71377265e9.4.1744489625722;
        Sat, 12 Apr 2025 13:27:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:05 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 07/10] phy: phy-snps-eusb2: make reset control optional
Date: Sat, 12 Apr 2025 23:26:17 +0300
Message-ID: <20250412202620.738150-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all SoCs expose the reset line controls to the kernel, so make them
optional.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 4094786d2..f05333901 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -408,7 +408,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


