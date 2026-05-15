Return-Path: <linux-arm-msm+bounces-107944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFCUCis8B2ottwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E9552271
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 117AB3065084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFF3492502;
	Fri, 15 May 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G8mGfBh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC03BB671
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858413; cv=none; b=bSooym1BEP8ttcrL9UK1e0Ylqy4IF9ztPlH1CD6jxxk+jYWgENOJCi6X3UQmAQwNwExFIm1h7HVpFaV+9QF6OmCx6ct/Q4AUW5ngzfDQD3l9vA3rEtqo9A6yxHgut3i3D7QRjUtZiPHKfGo0o7gU3esxw0/o7bUakP/kyRQn0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858413; c=relaxed/simple;
	bh=aw//OWk7ekdLqz6+NXAqRiETHV/evtXwY9fM3TOle1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1lSPk2aaboSw1LtnFSQW8DrWFX9x90qIrJ3icB8m8xPgcD/AwIlOMjS9sZYcqqO1Lvw2avyn4crgVo4g8gNQAR3KZAIQ05OYb2QxkfP7QaI/ESYzBgDA+pQzfAyHpws+vJPKRu4e3YNFEqePjNiNHJtbvDhN2KmsnjCws6XvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8mGfBh4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8e387baaaso364256e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778858407; x=1779463207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y5rcd8ol/OODf2w+e7bAV3jzDI3zj+SkdCDhFbr/Ws=;
        b=G8mGfBh42HfbS3e+GzglYgRjH3oiGbEHsUeERP1PNRtGWfANbQTkEqHx4q/Hkx5zMR
         EXGEL7pCPUc74jGJVb8VWe0VLMVvX/TQn5NDopGTkeE7NA8bFEWUJLobKbANB9YyDEvw
         6MNq41dn8vI0YeTA1NMwCdKx97yoBFff0/vVbA2netgPywXe+fYJAX8+0+bmelNhmyCR
         8GC8kzS2Ku17WGrxSsUfRXsTGpZHb9vt6Mi6o+djUA+8y+Gh3p7jrOcCgPNTKWoM6aQi
         akBek8BJ0oeW3XOUEoP0TJrkHraWDP2tvZ0emYehqSsJ6jTwsbGaH9uUqeSv1vOec/GJ
         OAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858407; x=1779463207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Y5rcd8ol/OODf2w+e7bAV3jzDI3zj+SkdCDhFbr/Ws=;
        b=folSz9PFTd3xQ2Di2N3rAYaBlxnoSVhKwimlGF2oGITG69kzjsrGk5/3pG6uyFOydf
         8Onr9+PzQyfzLHD78BWr2KZEOZjXt6fh2S4sKML4ESX51zUiG2s8he2kSvbmJPVbgWnT
         b4DoHg0rBMaj2yE3Xuef4O6u1DtWh2RhJfmBR5ZjsfPaQEVy2zx617kFebCR6sCqop9w
         kduiv+t1dciQUnyiVHmx7lyujMfRytWlStEQV44OKahQuEq6kv6+hGLjVE1GEYrVFU5G
         susO/hfgz2myaWMy2OD8LoobRXAxjMyzTFq4UnmJuCbvbHmNGCkc/MQL+4hhWOhNT3KV
         Ym6g==
X-Forwarded-Encrypted: i=1; AFNElJ/IRkbSeXKCAlsgvI9vmsxExuo14bAv744nALgs5ocyaFgTMGBR1LTYDq/P74tGiIFg1sMiuKzyoyUi2gcl@vger.kernel.org
X-Gm-Message-State: AOJu0YwcqLXf4k0SBTYXdSvaDRZ0zYNCD73tZIQUVjGIzqcQLicasNz4
	vREBOudAXNQHRJysNfVdcORoR/Wzl3tFvSKeoFDojpB4C3HcqB4/nnVfP7lY3QF76CHOPUNHyR7
	L0/sr
X-Gm-Gg: Acq92OGmnJbzzJ8NuInsumXc9b8h6ZSJOjHIlR3x1AYxAT7++mNjZfaoWSoWC2FBp//
	l2IjiVZLKyZFUT66UGuX1UPyL3RGp/brJr7jjssm80/BhFiKVd3vraJrJputAQNxv1kQJZY8ajm
	w/Ro8YD4hoJEXRj2Jw1OUExRsmLq6AalR0xQ7K53hvGLFIHBXHP28UXL4IOVYlSYVTDGqLxTa2K
	SUlMYtiAOahjf1fhGzVXlGKpHPdQuBQMXlYcPVcCZxb/t98JPEL1/lw1wtli8ghjA82Kb0A/MQ+
	nN6mouw21lqfawULVjGsZDQN6VQAcLnYIJP3QPznj1NrAQKlIBLwhkCY2+WQQ34aSGDx0DiTMuD
	GfAKcfTs7RuTQ1A/8vehkBOJJwserid7Ct0pn+uQFxj1jn6qFpabBCBYspL3/q1s0EqNaol5Mmk
	3HLIaPr3PnAp0ywS25ePO7KYhYja+hHM6Iw5SeSvAij2KPMp2Zny+9l7scDbBbon7c/0UZWNnUZ
	4id
X-Received: by 2002:a05:6512:1249:b0:5a4:a4c:6595 with SMTP id 2adb3069b0e04-5aa0e74584fmr853988e87.4.1778858406883;
        Fri, 15 May 2026 08:20:06 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm1392418e87.43.2026.05.15.08.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:20:06 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/4] i2c: qcom-cci: Do not check return value of cci_init()
Date: Fri, 15 May 2026 18:20:01 +0300
Message-ID: <20260515152003.1604187-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
References: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 918E9552271
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107944-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

The cci_init() function is not supposed to fail, and it never returns
a non-zero, so it'd make sense to convert its signature to void.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 01e440b6585d..be41a53e30c6 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -243,7 +243,7 @@ static int cci_reset(struct cci *cci)
 	return 0;
 }
 
-static int cci_init(struct cci *cci)
+static void cci_init(struct cci *cci)
 {
 	u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
 			CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
@@ -284,8 +284,6 @@ static int cci_init(struct cci *cci)
 		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
 	}
-
-	return 0;
 }
 
 static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
@@ -611,9 +609,7 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
-	ret = cci_init(cci);
-	if (ret < 0)
-		goto error;
+	cci_init(cci);
 
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
-- 
2.49.0


