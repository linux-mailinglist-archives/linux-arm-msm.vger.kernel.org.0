Return-Path: <linux-arm-msm+bounces-52192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E1A6BC5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9BCC1894DF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71AA1DC9B8;
	Fri, 21 Mar 2025 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag5Bf0G2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF251D86DC;
	Fri, 21 Mar 2025 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565552; cv=none; b=pfDl2b2oQd1TDNZMPme5hg8LMJ1WZ3nP4vLxvF6lW20O8Ro2aExHy6LZJvAXOT6zt7gDRg+2i5lDYD/dRcNa9ClWlpFKFKpktdOuRSab/BUALg11zxGrFx0PFSI2UqV++KzYrwPR7mKmM+baLbDilNu6n1n5g7aOYO2YC5B4wpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565552; c=relaxed/simple;
	bh=aG9NoIWabNMfOTs0C2SDDYKzoP6m6WnbmaDWoB6bUR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Av0DubOIjYr3nJo9z5F6t7lNz6rbU5e/kDUdipDOvm+bYWRzwMxT4OEUHfWkfpmGAXMyxGMSl2IWfN1YT93nSUwc0/C+HPkTtjgv7m+ZzK+bFZuVeQ2wrhTnZeHP6jraLss54YqBdTfLU+NdWqwBrXgTTotTq5JzOx2ijB8o82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag5Bf0G2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399737f4fa4so1253374f8f.0;
        Fri, 21 Mar 2025 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565548; x=1743170348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uD97zpV+wlCAc5Dqa3CJHXuYAasrjMGVcgw8nIaOK+Y=;
        b=ag5Bf0G2GSH1Ct9DNjUZucPCehh4tECvIViBM49XPZpTNJe+ZafrClsvDEzrujSQLg
         VPjJrasNcSgM1iuMEw00EJRS4Mlj0zDRq6N3WxWsh+vBn+wxcBFFRE1LzgHnq1jr/Kkb
         B5Tic4JHPM64CKV3HiTzza2giIo5tNxLU4Hkql8nWjzuYdd1qaw+AhPzGFFlDJKilFAw
         QG93oEjgTjvrIQlovqmmqgz0EyZ6zJavy1rOZ1rcPhD7BJN07RktYHPpkgIE+vBf5yKS
         vKZXIreEpkGf87GZASS4sqW0A+32QFxWGKikp8b9+ldpJcG7S9jlW5j5XnlLVa91DQwx
         Ft6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565548; x=1743170348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uD97zpV+wlCAc5Dqa3CJHXuYAasrjMGVcgw8nIaOK+Y=;
        b=eFTZ9WD6E9Uf1B9u/NaMM97uJywGWbmFZf/lbn8bhSpSvOdZmdjM+wG0AMVZBNxZrJ
         2659tGeyyAiUdhtzshOyMXsQasfSYINilaLqJXzP3KlJQxudGyMVUeCKjxd+oTzbvVw7
         H5EtcL+C7LAA1uimuNAqz8lPVJqde8bHnQHBvul67Ha/QErMRB5z5cYNfePGKF1WZyOB
         5J1xEQxf2mSMCpMLyZovRTt59buMm3y2K/IACO0VrxEkP/Vs4y1hTX84qaBUh0iVTPw6
         JQvsvo4jc32jiksOdAIvTuDClFShSsRIEWMO+5g1tkZr84MD0vCCmpSPzWvJAD75AjEP
         4SaA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3ryfTMFwdrcy7EQ1ACqvvaJYrAzRhpAOOkdaOiVDuXcxI1rF5k7n2EgnbjW0lvIjMbbNWKzk5xrA@vger.kernel.org, AJvYcCV3qOSjz18SDBxHo365Lo7VytnaJ/g0hqzb7qdsA+QPzX5TPuLhuWJWQyu+vm8qbM5pN6wK2jHQNtBqyUKJ@vger.kernel.org, AJvYcCVzCAPkOtClafLU8r6CR+iKPM9ioX/fFmUDbbjcnqinz4R8Tx2LioxUTjLb+GM9cdUe874DpsEXXre/ng6FCXd9sD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWP+P+tkBfVEm5eQdV0IOQ8bQuolBqpA91xp45WutWRXnPmOA+
	89Ah2df9jePKvhZyXjAuZBSueDvPESNT3iALMKvxqHfQtcZw4U+ZxIq2NQ==
X-Gm-Gg: ASbGnctqHBvog0aAhsuAXRm6DX+6aseaUkFo9leADPKWxgWbndTFy22fqgwFS5K8ubm
	V3wqCAZAxCZIKx4SEz2w0L0XcaFGEyjWwg6Ym9C9BCiYiAno3Gqe3UmSjZ/yIKZwWVkYEaPk7Wu
	MAVAofSUDXShS8MlDYaDx+wHt9acTgSqEiD5Qxe4iaT8kFXpbmXEWOjx42Iuv8oJuqYUKEf2K5d
	cN87z5UgvdF17j1RrWQlKheu+frst8dghYmMiVfnL4rBgjQ1U/7jflZ8lGxWRwHH1fl8xHHOi3S
	ydL2eN6Y483Dha14wDWmpoMRdNedOv5tOtH8nFkckcl40ffPXK8rY7k1p4ayXeoGkC4fRkeH9KE
	OsFF0Q/vEyE2lJFx7tC+C
X-Google-Smtp-Source: AGHT+IHNglCQ4pfTDqUg0F9f2emm3ZLLUSteSk2Ug+yZnhnzh83HDlmHCb8q2+bgezMSK3osOJoQPw==
X-Received: by 2002:a5d:6d88:0:b0:391:1473:336a with SMTP id ffacd0b85a97d-3997f937d76mr3249245f8f.36.1742565547842;
        Fri, 21 Mar 2025 06:59:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 07/10] phy: phy-snps-eusb2: make reset control optional
Date: Fri, 21 Mar 2025 15:58:51 +0200
Message-ID: <20250321135854.1431375-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
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
index 8ccd432a0..1e7e75bbc 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -410,7 +410,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


