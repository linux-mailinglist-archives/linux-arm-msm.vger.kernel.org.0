Return-Path: <linux-arm-msm+bounces-69093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 835DAB258AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 03:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14F35A801F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BB61922F5;
	Thu, 14 Aug 2025 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4omru8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C91552FA;
	Thu, 14 Aug 2025 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755133208; cv=none; b=BVnNviSll/BnwN/aHZ+4PH6i3gbpsGU8LwEmYiwYy7GBNAy6HrpBOH3JrSGw6XtOwUw1qTe3HEus2R3EyvAhnX7Am4fZOJXaI7Xjs0Siq5r2MsYqZrhYxZ4Ieiq87jN7l0oQCAHk/3rIShLyQG11Tc9lgDJLacZgFs+WgmlOCs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755133208; c=relaxed/simple;
	bh=joHzLwB0tI4eUsVNFbgaJ6JLw19JdxrZacb3tp+BNIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/UKEfYzPxXwqSDf3pQoDS1ZvS3PsoKshGNpAjhhOU75jciguvnyx0i0QyOmgDK5gI1IPKOcRunwTyf3i/c4zfxUL7fFCM4dvh2QKzngLeoaj0diKySWUBi+URoybU6v7pFDWKearK+w4YFrmf/sdnfnpkORQOPISnl15oxesus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4omru8z; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so500208b3a.1;
        Wed, 13 Aug 2025 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755133206; x=1755738006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nTzWFSPtkgXprasSk5PD3IWmtoaI6AUAN+qR6gSFNQ=;
        b=A4omru8zxvh+8FJWHDshHKrziNX6lPCbdV2ZYGwVVGTljRNjiKJHlvy6mTCIbhHm0g
         vomRvNYhzswiqzc1knRExyoW0IKqZSVFdhknzM6l/2mmeHajQOJ4cbC1BKa5Mw5uMR0e
         86yAl1Fexv/e8xDZKpLRY/9EcG8+W2fNU6bbDczap8KBsm1WE+YuBFVNipHDSlB76oZM
         qORQ3qdwTUN14RZ35egFkmXESuGWyFfORgUTRguCzD40e+vQT1oxXlKu4hxlVbznGTB3
         qKCgvjQicB0YlElUSg90HgOJsozQP5V6yoel5ccAyJ545fDP7tXnwA+JWHeza02BKhH1
         EvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755133206; x=1755738006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nTzWFSPtkgXprasSk5PD3IWmtoaI6AUAN+qR6gSFNQ=;
        b=qza7SXMtj95nctDJCciY0dstUuqAdZqGAxxXUw+2967dzBhW4avutORLDQGEfvIafb
         QmcPjm6EnSCxQHseDLO13GM1HczPcYn0bFtjj8Q9AGEdBpDcVT3tCwQ76h+XPOLlf4sj
         ncY23sYqSJ9/wy7GdObpeiaKAXYsmVK0Bup13UlLFVAru3ZM8xI/xH8hNcmi675O4vVz
         VNh1WlRv+11FR6A1xMakfAYu2T/j+3W9T8uETKt+GiCZnti9vHEEoJMg2nIMF/e7O01V
         7o37/GrEPdfObikvoCQVpi+xqCdSWtGUIdfYzAbC3+w9OokvMfVkoFvc/7b7yE7dHKeE
         tkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLi4BOf6FIC3g1Xme007tvOm1Kn5WGlmsiY6FBZaFyDF188lvHo0sFr3khnL70F8j4AwUbzG0rlIV91uHN1w==@vger.kernel.org, AJvYcCVeGYHfW0tlHMl9yqF4LK3DhJ0mPBVF01C4TPBpdC9vCgu43YVzqUsLpy1T3KakLzOFCYUOkWFSwOTDZuuL@vger.kernel.org, AJvYcCWgnEOCGUWv1bg2nJCN6gtdQw+PrIPSxwCwVzVF1XRfppRYfPxAgB4bmAzXH6tbj+jjmuhjgnlCdszN5Q==@vger.kernel.org, AJvYcCXTwn8xsJ4UtNje6EFm2om0P3On9Jj5uoh8i9Ju6M2qrV3gPXShPG946uO7A5QcJhPzt4oloyF+kXpU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt85/41avrlUJypol7NgahydQeOSO0Z/mFK1gLxFQYVh+hzmqs
	GjyFG+Y62LckKW0tEg6jrC54CcSAe/uvh3v2xpvpg9XZsqtrxM73a6dk
X-Gm-Gg: ASbGncuHa+XQlchifBrCP79qSCwghRg1ptCRNumXMetO0wPSPGpwcu8K3PAhv+IOq1Z
	I/KxogpWQK3vbH+8X0UK7oM54vkh0ewtydWaKLZU/A5kDgu+ZKM9rrzrLlPxjZlrURk+kXMfSBU
	XgGE6W3MyzzepqTz25kYn3XjfIJIs35t+0x2P5CAqf3sxOykmm7f8wXLeNvMkAZQjeQ3sEd8YT+
	SE9zOb1lVfM+1VB7VSy+desmQ1HyGnuYfgu192rVYtBf+Xd9yq+obsIcf6zQ4hUBd1N/GDf6H/9
	+gjiL3CC8sSqcGo0RSWuLRcXYUzxE1gJbZmiloPZCu0gWFWFrys7MF1Xoicn4+qrFxvu/R95ySZ
	vPGVXINLhK0ipUQUCPryAh9nmkTEQxuSl0uwq8BiA41Y3E3Mj0pbEFR0LorjMiox2X9BMyvIZPo
	EEumhMNfzUiS0RYTWfu3dn3A==
X-Google-Smtp-Source: AGHT+IGUTNv2vtfatYKgSGSfSkdaeiXz/5WLqor3OcUH2i0GMcqZHUMfDNbcr30LN5n4tC75z8GA1g==
X-Received: by 2002:a05:6a00:3999:b0:76b:c68e:1001 with SMTP id d2e1a72fcca58-76e32221c1bmr1143994b3a.5.1755133205632;
        Wed, 13 Aug 2025 18:00:05 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([101.178.35.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143983sm28875783b3a.1.2025.08.13.17.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:00:05 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: marcus@nazgul.ch,
	kirill@korins.ky,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	andersson@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH 2/3] ufs: ufs-qcom: describe x1e80100 quirks
Date: Thu, 14 Aug 2025 10:59:03 +1000
Message-ID: <20250814005904.39173-3-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe describe driver quirks for x1e80100 ufs device
Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 +++
 drivers/ufs/host/ufs-qcom.c             | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 9c69c77d10c8..b88cafac4da7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -2168,6 +2168,9 @@ static const struct of_device_id qmp_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8750-qmp-ufs-phy",
 		.data = &sm8750_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,x1e80100-qmp-ufs-phy",
+		.data = &sm8550_ufsphy_cfg,
 	},
 
 	{ },
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 76fc70503a62..2e143ccd1a03 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2282,6 +2282,7 @@ static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,ufshc" },
 	{ .compatible = "qcom,sm8550-ufshc", .data = &ufs_qcom_sm8550_drvdata },
 	{ .compatible = "qcom,sm8650-ufshc", .data = &ufs_qcom_sm8550_drvdata },
+	{ .compatible = "qcom,x1e80100-ufshc", .data = &ufs_qcom_sm8550_drvdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_qcom_of_match);
-- 
2.48.1


