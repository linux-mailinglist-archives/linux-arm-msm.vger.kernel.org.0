Return-Path: <linux-arm-msm+bounces-80587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DCC3AA72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 12:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C14A3467E0F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 11:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8635F310762;
	Thu,  6 Nov 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ma5hXJlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C230FC16
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428873; cv=none; b=HDyS32ns3kT5hVjdAdctGZK61LMMsqfpGEYOYf7HOfPdNc7i+JaGA+/TwbkeYWyI/61BK5sc7fL+BWLKcW7EwMI8QUzXYf1pu54HFnA+0WwvhS4AKUJZ+WzJutjdaXv9GP7utC3gNo/644SeqXjEyo/F8mmoNaP2ZEhAJHf7Ttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428873; c=relaxed/simple;
	bh=a7wQEf6egR4mPuv5cdjgCNZ6WeJSo3nSIgoNmPEuE3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQkYgCmLKrFbVney9SJkgCrz2xUmUJWDkQ8hriX6qrpKAZRPusKrvch30brqIvdJBa6YL91b4t6/93kcl/jbUB7+au+xPMhbnCbWNT9qHXQlwx/GWCZDw8tztKAvFvTkzrO42/yPcchKPSemWiAWldIaQtW3t0csgE/0iFNG4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ma5hXJlN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1110080f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428869; x=1763033669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD+rs5pOYQ8OCsF4o4tgFNdDCvK3XuPAT18E201qmow=;
        b=Ma5hXJlNfP9rAldaxbjYNN+Y6dJsEchEFnZMhMp/wzb74Nx8BUGeR4eonGeYeLDRzn
         s9Ar62qlMUQzWN47RiKnvvoIBhDSIrH3MPFiav7i/J2AMnv36NL0f5e0ETQElhVvbg8y
         NUeHGBnq7mXMpEST+vVzfvefTLif0DD99K25LOcGSzs1TdbsLlL6GkTXVKq7vCCQsIGF
         cfPHKCLf28sOXyGLFaIxsRgt3YolEE1HdKiSRCdOOwFaMHBo7yX6D8RCOxNpQuBnrmrV
         u737ornnnETJWfddlzyjIo5DimeOrzWgCjGJiwUH7wi+WSCRcFx6dv3+hM0qqX2TWOBH
         B6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428869; x=1763033669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PD+rs5pOYQ8OCsF4o4tgFNdDCvK3XuPAT18E201qmow=;
        b=wtTKVijmez5IrZe8gsjTgmNTbQd6JkVphLpkQxypYxmWaWuvnT0CNAuhpaNpO34uIA
         2Kt/ul96VCHEDcLQ2UKmhFMx+0d31u55iwnSR+h9NKlf6mo8ZeN+RWci/sqHqGgMVarz
         MqfFWqUkOBCFJP+s0BRhu2ViFW4ssw+Fa0qzTdV/dMkpBQBXNclCPDzzVz4ooqq/jEMh
         p7gPEnkWl/AktYimq/wpZVH9Nu7ZAC8Uesnq7nl4t3FuEhssmWx4ssy5AKd31sJBqbZR
         5iuYXWAU4cmllQ70vrusBDFrCbRJYruh8iXTWs+1kprzSwl6ld85qUBoHjvuwkrb4L8F
         T6cA==
X-Forwarded-Encrypted: i=1; AJvYcCWvQOzv++iyiNkU+f9uXJJgsaPHyNRNHkgmz0QphspJZgda4JGohbqJKO8/pMRm6nOW9FwRwrEXeTbyHIXV@vger.kernel.org
X-Gm-Message-State: AOJu0YxBvrNGDWLfzLSghb2CCSQQ8PdU9xbzQlW0St7Bte8FoW1qI0fz
	FYGHu8Et/5IMxJkOkHYTucLIiu1x4EpNvZWiEVesMPTpkJ5ulB+e6cGRjtxnmqF2UbM=
X-Gm-Gg: ASbGncvH+SL4s39J6v+hBCFsWax82ozx1ubhdSA6LWGubsWuCryo/9QTfuYrVa71TF2
	qBoEOPvQQMbAhfrvy1oh4Q+3pGQNnMzyDf+HEU8ZlGt97AUjc90UhAJKHfHuaRsi7VecaNga2s7
	NacvPpNWNmSqGzS/PBjF5JTO085+uRtHDME59WrhXrvIVUtaJhcvGmLfmvMa2l9g2EQMLg4GFaZ
	X6NPOjsDfjgLHw0S9r1DE7HAf/6aYuUKQyb/eWJ/nvmz6KxWXVfYLC6mjcJ7PV3ZPkp7ITwXT6x
	Oe4KnMP28gXqiWGFgRzYU8yw7xAc3UpcHfBXalO93qvkmwA4FBS5lI8R88TRGDxBgdsC6FC5g9D
	oxHnfMEnxYxxNmVzobxjDhfV2EfK8znhcRhGX7TM1XDM0FVHuZMpzp0nzUZiHZMCMb47EHxQoa2
	lp5EvrNG1GDo0SjA==
X-Google-Smtp-Source: AGHT+IFgtVKctrlOuzKQectqSEwKB2ayhahJJEey2N61I2W/lfSJB2I/53UnlfLzRQMvbCarVAJhsg==
X-Received: by 2002:a5d:64c4:0:b0:429:bc68:6ca0 with SMTP id ffacd0b85a97d-429eb12fb84mr2538324f8f.4.1762428868641;
        Thu, 06 Nov 2025 03:34:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:33:59 +0100
Subject: [PATCH v8 03/11] dmaengine: qcom: bam_dma: Add bam_pipe_lock flag
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-3-ecddca23ca26@linaro.org>
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
In-Reply-To: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3204;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qu1xfYVQtzlM9Gqzgkm1BqB5ZitfYYPCUMV4Og+CRDo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe89GdN/Ar44t5r8WnhaHrBfOPqYa8CKf7cs
 8exTYFLr9qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHvAAKCRARpy6gFHHX
 cqW2EADe+TsFJg+T/SYNyFg8jW7yGLupg/8qCkMSkRipiwwmuO5kMlhyTmSTWIb4cBBjjcXnyqI
 9iqwPS5Rl6+ZCdzHSJlhhGJTCbeMcraPicuujhsUjSFle5cb8M38heAJ2B2buD/2TCw/+oD8TZ6
 IeujESttv94uaR5D+8wYDT0SkrFxWnO2oJdEqoZ42w+I2CnIUoNkxEbAErInw/GbClt7CUjP+ys
 wrlzkgXZmx3+u3XZHftUWg3CkqC/IbQofwY6n/naqiIAWCsQ+QJqu/1w4sQBO/xQyEHoes5HZmV
 oCDJ3BJa+XGw9FYKD6NgxySFr6pE837fWhTCDOqnJ3JSvCWFxJtN+rs5f3rg9dqIiQBMWcburH7
 /vEWzjWcFS7RUVQH7D8RSypiAqUnZu4yyWvVtBq9wnwVjC3Uy/RNE4sqpgkQKdbvMsDETxrQAOW
 ahSW8FjL8H81NS3eqfIhxN5Vj+cFNMeo+VUdIyDky2XDzYG9t88agarsN6/mifiRT4CyDPrsqo3
 DV8Mg0qcZkAutoOkdgLS0ZGIjcVq/s8kzudJl09WOD4BgmJbdvFyg2vFAbbbHSDy6rHnrLiXAzV
 xvkdg2Ka9dm0mI+ZHmNJBzMrarkWX+GdTQLbbUSSRZ5WolvZJrP9hwl4udloyjQ44BDbSphivy3
 xxHtuqNAmDmKe6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8861245314b1d13c1abb78f474fd0749fea52f06..68921d22ad7abfef7059b1db78052ff48e842952 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -58,6 +58,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -113,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool bam_pipe_lock;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -179,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.bam_pipe_lock = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -212,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.bam_pipe_lock = true,
 };
 
 /* BAM CTRL */
@@ -386,6 +391,9 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* Is the BAM currently locked? */
+	bool locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -667,6 +675,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
 	u32 i;
@@ -707,9 +716,34 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		unsigned int curr_offset = 0;
 
 		do {
-			if (flags & DMA_PREP_CMD)
+			if (flags & DMA_PREP_CMD) {
+				if (!bdata->bam_pipe_lock &&
+				    (flags & (DMA_PREP_LOCK | DMA_PREP_UNLOCK))) {
+					dev_err(bdev->dev, "Device doesn't support BAM locking\n");
+					return NULL;
+				}
+
 				desc->flags |= cpu_to_le16(DESC_FLAG_CMD);
 
+				if (bdata->bam_pipe_lock && (flags & DMA_PREP_LOCK)) {
+					if (bchan->locked) {
+						dev_err(bdev->dev, "BAM already locked\n");
+						return NULL;
+					}
+
+					desc->flags |= cpu_to_le16(DESC_FLAG_LOCK);
+					bchan->locked = true;
+				} else if (bdata->bam_pipe_lock && (flags & DMA_PREP_UNLOCK)) {
+					if (!bchan->locked) {
+						dev_err(bdev->dev, "BAM is not locked\n");
+						return NULL;
+					}
+
+					desc->flags |= cpu_to_le16(DESC_FLAG_UNLOCK);
+					bchan->locked = false;
+				}
+			}
+
 			desc->addr = cpu_to_le32(sg_dma_address(sg) +
 						 curr_offset);
 

-- 
2.51.0


