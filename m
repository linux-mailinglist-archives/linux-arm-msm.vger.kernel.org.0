Return-Path: <linux-arm-msm+bounces-54461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F569A8AC67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 02:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 141647A7629
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 00:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE171922F5;
	Wed, 16 Apr 2025 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iip1LbTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67FA38FA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761739; cv=none; b=dE2xCBFmQ3mMUu3Jiw9xaiUoVyMpIuViCWGQ4ZyBKb/63mxWT/ahU+9etAiKBtu2dmLUO9S+2Ts+0BL6sp4zDvjJuS0jUfliJn+hmu4mlZzP3RQgZLThecq/HGeXZ38W8c0iY7VZKazL1dsuBn22jtyiF1h5MoERwouu1Reht/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761739; c=relaxed/simple;
	bh=X73kg4tdW06GAOX2zu95FNoOmd3sHwKiCictodfiuao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbCVBjYCgVsSoAQLrPdet0LKjirQ7tRDBb4wnpLa0K2drf3TDea3CE6tknCcgPXCsjmbD0dUvVFwBS03mXtuuby/oEgWh++UHMGmTDXfwT8U1ywXp+Ww0tt2iAlpfl2wx5x+OSHh7DSWfl49p+Wnkef7FEz+kONaAqhhG/WM/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iip1LbTe; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b34a71a1so7162205b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761735; x=1745366535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=;
        b=Iip1LbTelo/dFDgaCB7aH39IJa2T0r6QRpjefrchYJ2GLfppOm6HEMBe/MCpIQBe7t
         sgs7w01FbVfctXxeqzUhERu4j5c/EzQl2TTMIMQ0C0ddjZj/mtVZrO+ICFyDhPyDUWjT
         fNT1AxGGmQtyzC6AGcMUt87HtO004pxKLkcFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761735; x=1745366535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=;
        b=LjMzxvb44lg7NYPWqVPFwNDSzrywWc6IZUt8nxo+8o1J1la2HaNIElu8LD0jzJb/qK
         3/Z68ROOxzahPZ2foqPDlD3xRx0pWAI/+Sp17xBbnqGGmws+Ou8BDy3sL+SKgRm/SclL
         FmhU3VyiAQTWpwix78xoj73xCWSGoo7sKDyHI9UfDPtGX2U5it+CED1GDNvBNcsuZL5b
         14VQZkmpo4264B1CO32BlfC77mde1RF5grXRKatiiT4ZwkLsI9rXPftQEboHdnKLAgeb
         Otwpr0aAzR+tLJeCGqSG+x/L9vHjMyBMnVR24qCBnxVLqbI0LOE12AcwE62sen0U0f6p
         U2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUofh1aRuOlH9YNxaWtUVO8XtCyP7E1d34ZuAObydrKWhnHktcJtGhOelMEp4AqvCu/3Fo6fBSsD4hl4K67@vger.kernel.org
X-Gm-Message-State: AOJu0YyICxlnV8SLunyHIpC7UprjS8f86DZctSrcX1q00nTBrltsNIr/
	+6EYxmFt0W9g/IOdYv9ij0nC62wOhQsq/WaYYyn0PY5LCItF9Xm4sT2eZfGFZQ==
X-Gm-Gg: ASbGncuBetapjOSy15A1URDQ6z8Txt4+/MM9DI/fnNzgf90a1r4gkMyWZq5iQ1j6O83
	o5qSsXxS7KyXh/y+iOusjmwuHsbfyk92P1vA2n6QiYz8qGA9m9GNhoBoPRoZgokt8KWHdjViLSa
	Xugh6UzjickPvLuY8UYQzUv3zHRjTi8fkEDF/nHbonu0wyGw6r4gI3TaYMMgJCHUlgJOf/L2ph/
	5YN1ah5p/RDVRY+fQT41axaG+Cd99kxTiRRwalfxZrN8YgV7ReiDkUdAteCJDdSr1hIz7Gvs43M
	AmT2KR0NJZoK2lpSJSLtDExD7RV1YvkSXcN768vNnhgmSHvWxCyAIZVVhhLwLgmxY1ZiCYM7Chl
	Vpg==
X-Google-Smtp-Source: AGHT+IHkUQNhj55ArcxMsqdZ9goNzK1iX/oCF1gdLXwsnONXGZV+o45RA+2MeBctZXHEWSSuaXlJnA==
X-Received: by 2002:a05:6a00:2e29:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-73c1f90d688mr1947843b3a.7.1744761735002;
        Tue, 15 Apr 2025 17:02:15 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd21c3216sm9157830b3a.49.2025.04.15.17.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:14 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to work
Date: Tue, 15 Apr 2025 17:02:02 -0700
Message-ID: <20250416000208.3568635-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DP altmode driver fails the configure stage because the status VDO
that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
them so that the configure succeeds. This has the nice side effect of
properly reflecting the pin assignment and configuration of the DP
altmode in sysfs.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 6ee182101bc9..2cbe29f08064 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	}
 
 	/* Status VDO. */
-	dp_data.status = DP_STATUS_ENABLED;
+	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
 	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
 		dp_data.status |= DP_STATUS_IRQ_HPD;
 	if (port->mux_flags & USB_PD_MUX_HPD_LVL)
-- 
https://chromeos.dev


