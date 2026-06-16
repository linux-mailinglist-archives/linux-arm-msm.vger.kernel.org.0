Return-Path: <linux-arm-msm+bounces-113406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tLsgBDtBMWoefgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:27:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A201268F4D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nPu58oFS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113406-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113406-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11F123026230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6E235E95E;
	Tue, 16 Jun 2026 12:27:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD86357D0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:27:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612857; cv=none; b=dLurSH+25S6MVEXE8mJq1/BxAsYPXRtngOjqPf5WAUD+c0RdlTDKojplpLyJYfJK+qTFwyFW3olHlMh6Ybm0J5Dh2uw/j1/ZZmAk4uQdG3t3I6itnHDrFlReAEWqkWgIEaSRca0g7226dKjlQSts2lJdr1i3aiCvTFICeKTvuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612857; c=relaxed/simple;
	bh=KNS1cKXInLQZxkR7LHfU2zXc7rmttuhI5LIzHA7EPoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gELCceohLjI0tnzkBcuwDQRJOa16InmpiEe4E0OaQVN0iMMRaY1cCVziazNeVHTEjlwYDw0gJ4A/lbSNINBRqsfzXRjCV/hjmLWXfP9qs2M/yVotiGIPJXr9EfXvovk4Hx0YGohiS7KqQkMkE4CEsF9elmQTOVEMFZLldGFoVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPu58oFS; arc=none smtp.client-ip=209.85.215.174
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c859878eb48so1801541a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612855; x=1782217655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2upLEhcEPsBGDX8WqyzO3sD02fVNZKxUDLDhAXzyQxU=;
        b=nPu58oFSvrHlfpFjoZwBRSL4woVNFL/IMCt1XehjI0U1VUdGs6s/lab8qG01kaiFXt
         Jk/Wu7zBIPsOVaF6V/0iV0uADtcI2prhiWYoE5ta3HuhESMQP82WKnm8hBGugaEgY8KD
         6YPVsZAa2cQ2rfX2rttPkgcSna3eARYHiGn11Vu4MmYdzMGbyCRM3y5LMNqZw4WhK3eT
         treeq/d++TAOINcnwHQQTuhLjd4qSpuX8d4nLRk9RCGGpSAlAI+kGioGjrmZmF6ILO2v
         9kej6YdhTwdPoXo4ri493iFtz7d/K3XtvSdi3ZKvLTwKSFxyjKS3jH9GsxvVKgsVknRK
         bjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612855; x=1782217655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2upLEhcEPsBGDX8WqyzO3sD02fVNZKxUDLDhAXzyQxU=;
        b=BHOuJ/LUhB0pVxQDU7xwoQFt/M6Qb2VPETePUvMHaCPbWm4J+2ra1waFEpY/eCytYm
         TIaTWrGVjtb6KvJ4phVK8mMVgbPohHrDwymgi1UZsbejgWg78av7MWvO6ewanD/uGAa+
         GUUa1+pAC1WEipISmcpu2D8jFp7BN/C583XcMIcdgJDS9exCtLutHDljZNd88w+FVIDM
         swTSh2Bn0aNIbBzf2wBzu06w0kCHaS9EVZ9KeYMFXN9qBCs1/KQob+TJlkAoINR0u4co
         l1GV+Wlo3z65NJWHQ4VLsuTfGogtHwni51x5ykqX/ATt4YCD1UL9SpA5wJ3/aHtrSnbx
         kqCg==
X-Gm-Message-State: AOJu0Yx6vmvVYBrwALO1wGQaqcpWEBtMH7tv89+ADfqcUfUoRwUFM16G
	EtEcd2r5Ti0vWhnN2qwx/x3nSKEsDJpozZKZilHbquzOXY2LnQcMdH4D
X-Gm-Gg: Acq92OHQVY643o1ZFz2sU1vNj4+hELNX1bNwuwcKtI7ekFG4PuHAPN9OA0pCFn/E+W0
	rFPQxVFHZ1CglsuEQ2HC7xdgtccQrzA/C9U7JInLiuzgy0bG5Nj52Dr/2ZtiRtDrTRR3bYpWe/2
	XlGInGtnHwRecAPelmNG4SD8Gtr6Qb1aN6kLfxK5PhTeL6n+8KAlIM6yUmVArqXYE5Kpe4EXf9G
	yINavr31xrJnBR6Jiah88uTOhuuc1J3mRoenDhLbEeMEU8UvB6Ui1wdhLcdnrrgKcXcN/mMZ1+V
	/WGLtCIwPsXQACtYEk5vvMAvdbLof41x9tI1v2XiPKw/zJppN5hz8fpfyxkjyIBVjRDD3KwTMCK
	D/+pidqaKI8E6gufw1Izwd6jDkcqH8YkxbG1/LzQ9vmDcLw9KNZPJxxpm2c5rL6gUxkpzAn43ah
	8UuDzlDr+KL6dmv6i1XjAz
X-Received: by 2002:a05:6a21:6190:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3b79642264bmr17424361637.40.1781612855241;
        Tue, 16 Jun 2026 05:27:35 -0700 (PDT)
Received: from nuvole ([2408:844c:a00:6006:ce44:869e:4d94:f839])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186828sm10663771a12.21.2026.06.16.05.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:27:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] spi: qcom-geni: Use GSI mode if DMA channels are available
Date: Tue, 16 Jun 2026 20:26:05 +0800
Message-ID: <20260616122605.668908-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113406-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A201268F4D3

Some devices (such as gaokun3) do not disable FIFO mode, causing the
driver to fallback to FIFO mode by default. However, these platforms
also support GSI mode, which is highly preferred for certain
peripherals like SPI touchscreens to improve performance.

So try GSI mode by getting DMA channels first, fallback to fifo mode
if it fails.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Determine mode by checking DMA channels. (Dmitry)
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260614083424.464132-1-mitltlatltl@gmail.com
---
 drivers/spi/spi-geni-qcom.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..d2fcd0bb0732 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -654,26 +654,21 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	else
 		mas->oversampling = 1;
 
-	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-	switch (fifo_disable) {
-	case 1:
-		ret = spi_geni_grab_gpi_chan(mas);
-		if (!ret) { /* success case */
-			mas->cur_xfer_mode = GENI_GPI_DMA;
-			geni_se_select_mode(se, GENI_GPI_DMA);
-			dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
-			break;
-		} else if (ret == -EPROBE_DEFER) {
-			goto out_pm;
-		}
-		/*
-		 * in case of failure to get gpi dma channel, we can still do the
-		 * FIFO mode, so fallthrough
-		 */
-		dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
-		fallthrough;
+	/* Try GPI DMA mode first, fallback to fifo mode if it fails. */
+	ret = spi_geni_grab_gpi_chan(mas);
+	if (!ret) { /* success case */
+		mas->cur_xfer_mode = GENI_GPI_DMA;
+		geni_se_select_mode(se, GENI_GPI_DMA);
+		dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
+	} else if (ret == -EPROBE_DEFER) {
+		goto out_pm;
+	} else {
+		fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+		if (fifo_disable)
+			dev_warn(mas->dev, "FIFO mode disabled, but couldn't get GPI DMA, fall back to FIFO mode\n");
+		else
+			dev_dbg(mas->dev, "Using FIFO mode for SPI\n");
 
-	case 0:
 		mas->cur_xfer_mode = GENI_SE_FIFO;
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		/* setup_fifo_params assumes that these registers start with a zero value */
@@ -683,7 +678,6 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(0, se->base + SE_SPI_CPOL);
 		writel(0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
 		ret = 0;
-		break;
 	}
 
 	/* We never control CS manually */
-- 
2.54.0


