Return-Path: <linux-arm-msm+bounces-69838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19358B2CFCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 01:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580B9189BA3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 23:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9462425BEF1;
	Tue, 19 Aug 2025 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhwcZ5QE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41D223DD1;
	Tue, 19 Aug 2025 23:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645462; cv=none; b=MnlQF8SoUJF5bHF8w9N6xwqRTn0cONjIEloGGTMSYNMOIgCdBTeFO0A8/UFu8FXG/noBw/sR+uanYAAoyleM7StvZuSQlVsgC9H//wvvqff4/1RiiA2ChPG1GRSendJo1hpPhicuBbl9yvsvCYXZwukRQH2gQJ/641k/o9UHmmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645462; c=relaxed/simple;
	bh=1kQJXxi8uPSvC/wNAX8jDhENGrCc0tvny2BV5cFDOFc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ATor40AqziJhKRTLOSAlNvLCSYvX1U8obupRbmLOYpcDNpwZ06aQerxsmzxXhumqVkTvajn8BtoX6KXAXGmwpk7ftRPYy4jPLCDLkZBhUeZNhpJ0krPPE2Aa23hs7KI5Q9xsjj3WxOpaq+k+LtmGZ38udosKJJrr+Mm/Afvzqrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhwcZ5QE; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e582bc3720so22050775ab.3;
        Tue, 19 Aug 2025 16:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755645459; x=1756250259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfg+/0iA7MeX1A93jxyLkNbqcGb7Dk0Q5+FiLHCKrdg=;
        b=MhwcZ5QEtVp0bjzu5JBj118hgmKJlDFlBoDKSS/KHyyaU6DKz0c5XiGMmyUHfSHvVA
         ifYlaQPlbELb1oIGhKRZywWpGAiIQqG+Z0z41GlD/pI+iyo2Vn1c0S1DfsTRH2xLEAU7
         HMquMChE5hzZzAAl5kxGX9yg/9aUVngOSiAHM+dlt9hlXS4MpSQlTcaWNeiSZx4U9eJe
         D8lvM630x+8yktrDLTh4GAVA+liVSLzRNNQb+ysTBrPt4SuryUNWYilHbufmbLr81nK+
         r426Q6oeA9mK6lO07MoaCjjeL9CbkcQdz9cIs4F1pbBGGrD35dWr8+Ypobqb8j7qxmZ/
         s0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645459; x=1756250259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfg+/0iA7MeX1A93jxyLkNbqcGb7Dk0Q5+FiLHCKrdg=;
        b=V4PgDuFNioOfTqEZIlz6r76V5sz8iW+E5wRSrnwpv9x2ds5rGOXpOwvoifS+9WscOL
         zM4Z/gyhytd45SSjC1kVa1b4xdGg/7Jh1nmWjkCQ+d0hOb8SXpLF/q9T1EXHvhXMhyGJ
         5GzBFopaDr0qa2FMdvJ08fy5pvamzYRmFLV/fDYqE07pJ+Jf0nNGNgByswT3Pm84tbEO
         plkzKdsJolxKWPutoq7AyYDsi/CBu8r/X9B9liD2rNVAXnIfdVZqDXGCL/Uacp7oHuoQ
         FKqHA1hu9xoxXacc7aC73rFDU+cBGjGl3eCxSj7ZQb0fLWvcd1shsqlm/Mmi7QglbZrO
         tgxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUagHmSeX/q9AKXcyrTaDloTc4P/9pkhFsRxXn2M/SVwHxG25FyA/R49ulSYz/teNw1zirtO6OMU6+fQmR@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhcmko4ol7j9ukrzfl+W9YRWuFDD9MIYEJmKa71KzkqiSOeqD
	LIE1jxBG8h2gL+eh1Vy4smTGeea0YHqlIr7+DdIdn2GtDJqNoXckHs1BbT/B8Q==
X-Gm-Gg: ASbGnctMR9HhzAjN93nmg5ipHSXqBObJvwSvJoQ5LwA/5jmv149REQKna2VYn1AvWdt
	FDQGLQBuYrr3XuKkM7anDpteUAddtYCriawZ1VOs2UZpSn8i/MOe9l0LPYdEa84302pPssJ80kv
	936s+u1O2gH7RR/raSk36ekTnhLPrLOpEvOYWSeNqPSkSpJb4hNAGsdK6B/tGQAd4hdlL+rZZyC
	6DrTuAv7A2YcC7kySEXt1mmjR6OnG/HRNJ/MbHUDojGd4hywdRxvjnzP8k39PKOYVFBEOEkWPQG
	Oh5b906TxvLWrSqtfeJdK18+7dyJ3f7k1tJdImOIx2Z6y9xUpZ9ZdZNbuXDLUXi4TMpi70G4O52
	S1k509IIMnarlrBahs0ZcXz8dspNyziGwUakWgt+UDklm1b5kkdFXooKVSaE4dHu6cQ==
X-Google-Smtp-Source: AGHT+IE26v7IsIWqO9h9jisXac4SVVQQIabrAjtx7a4C9+BQ7EZWbdBQ3yfPd/77Ao+xdaYOz2tglg==
X-Received: by 2002:a05:6e02:1705:b0:3e6:7bb6:74f with SMTP id e9e14a558f8ab-3e67ca88024mr17929785ab.20.1755645459281;
        Tue, 19 Aug 2025 16:17:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e67da67sm48388365ab.31.2025.08.19.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 16:17:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH] ARM: defconfig: cleanup orphaned CONFIGs
Date: Tue, 19 Aug 2025 19:16:30 -0400
Message-ID: <20250819231652.15938-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_ARCH_MSM8X60 and CONFIG_ARCH_MSM8960 which were removed in
commit 99497df59427 ("ARM: qcom: merge remaining subplatforms into sensible
Kconfig entry").

Drop CONFIG_ARCH_MSM8916 and CONFIG_ARCH_MSM8974 which were removed in
commit 85148df36835 ("ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ----
 arch/arm/configs/qcom_defconfig     | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f2822eeefb95..151f50b3b2d6 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -87,10 +87,6 @@ CONFIG_SOC_AM33XX=y
 CONFIG_SOC_AM43XX=y
 CONFIG_SOC_DRA7XX=y
 CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_MSM8X60=y
-CONFIG_ARCH_MSM8916=y
-CONFIG_ARCH_MSM8960=y
-CONFIG_ARCH_MSM8974=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ec52ccece0ca..aa23a13274f9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -10,9 +10,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_MSM8X60=y
-CONFIG_ARCH_MSM8960=y
-CONFIG_ARCH_MSM8974=y
 CONFIG_ARCH_MDM9615=y
 CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
-- 
2.44.0.501.g19981daefd7c


