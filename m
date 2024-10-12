Return-Path: <linux-arm-msm+bounces-34190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4699B36B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 13:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747711F22906
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129D41714A1;
	Sat, 12 Oct 2024 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+p/9AQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88E1170853;
	Sat, 12 Oct 2024 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728732388; cv=none; b=r3ZNDYYUPc+OEaUk2K5XJ7pErAnFllRAnX6EGoAMWMMvEw1wpLagT+pRqKHUvrBjyBxhaAtdwl6UBYTvASwpfpN7giI/Fjj8HkWfWob3kiZATvGmeFKe+3aD2S3CCcGvYnbZcWqaeuLef74IonTYsefl8EFNz9oOjtNJcrl6IdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728732388; c=relaxed/simple;
	bh=/bj2+BYAwK4IHYuyn/t/cCq7lHeoaQ8woj3Rk8/wplQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QU8pz2mD2zJdN6oc4cMW8I1kYpB7Kq3LZHM40d66kzKC0en5hw2FOTToBe/0ZzUIqi2rzCYDnmxjONW2z2O64HWK/bu9Ps26RDXdXuSQRyVwwng8DlfqSo2kpp6R1/GE9MIrPgXqkrtULXCeHYC5GkNER7qlXhX6Fi1IzwBviGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+p/9AQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08154C4CEC7;
	Sat, 12 Oct 2024 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732387;
	bh=/bj2+BYAwK4IHYuyn/t/cCq7lHeoaQ8woj3Rk8/wplQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+p/9AQUrKPRW4NZcLWtgAkH6odAA63cuv2lIrGsiFS7CWSQODPDiGlfs4gG7XrBQ
	 OKwupSQLtazOV+17SUzMMl9FrwQhWb2wyItguz4IFZNOxEC/NVda/8Ly4p5Q+Vxdco
	 ipcaFdFdcbaWHp4TQ6q+kqwQCMS2lqOlxBEj8Dm8N2qBgytMqygB74lKHHxYkKxRA1
	 NbSCofcSJDe5H5W0WM3zkKNwgA323r4yT2suTIItHYQMiyXVn7h+YXUVruu3ctiAWQ
	 kSiG52ooggr7vavc11egcVKVMX41D4a98k1Y91ZohgsbkIdK1HeiW0h/SCop8o3Z2I
	 A5iCcYiVJNtMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 03/16] ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
Date: Sat, 12 Oct 2024 07:25:59 -0400
Message-ID: <20241012112619.1762860-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112619.1762860-1-sashal@kernel.org>
References: <20241012112619.1762860-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.3
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit e249786b2188107a7c50e7174d35f955a60988a1 ]

CDC_RX_BCL_VBAT_RF_PROC1 is listed twice and its default value
is 0x2a which is overwriten by its next occurence in rx_defaults[].
The second one should be missing CDC_RX_BCL_VBAT_RF_PROC2 instead
and its default value is expected 0x0.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20240925043823.520218-2-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ce42749660c87..ac759f4a880d0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -958,7 +958,7 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_BCL_VBAT_PK_EST2, 0x01 },
 	{ CDC_RX_BCL_VBAT_PK_EST3, 0x40 },
 	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x2A },
-	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_RF_PROC2, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC1, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC2, 0x18 },
 	{ CDC_RX_BCL_VBAT_TAC3, 0x18 },
-- 
2.43.0


