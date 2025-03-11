Return-Path: <linux-arm-msm+bounces-50925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA1A5BC22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0820B172EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A832823370D;
	Tue, 11 Mar 2025 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="agggFf28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8122FAC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685151; cv=none; b=PdUMoTZ+oJQdxSBgDtJ97OwDtRcg3gif0l8jeTyvhZa/jobjyL3cPABMmrnr1V/yqB4esg83jl2E3F+UFD6gGOjAQeIA1PydyzAQpPZnrIKw9N/HYWYrXoleANqfLpFeTpp0Y0H8H9FQ01+kUVLbp3W2bDYX2o5WJAqgHP3I9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685151; c=relaxed/simple;
	bh=3byXgp4P/O/ND2QbeLx+RU+FGOviEZdPuLQWMQhYWyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FiF9p+EX67uKuy1twg5xaeGnQzEizqxKWvcibhsryLZOYDcULfyy8Ww+DczPHzTripq1xhD1/Cpc/KCH2iIuOGRxpnNd4TMeuT3DmQMgIucoMboVWU6uvAvv3zswEGz8C+yOnzwBbXKMmeQW47SkpR/7BcEnSoGAMrJE/u51He0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=agggFf28; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39143200ddaso1337768f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685146; x=1742289946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlP1aFnu/CDXSr/k7ULiiydiHqpcTMvKfeRj+DO5m9I=;
        b=agggFf28mKJu2Iw1KoojJHNS5bPH9YnQ0ZKl9w73bi15l7gPrU87RxuG09PRalMfGA
         XByG4OLfpwSRxF0fu7Ra4RUEdG/3ndVDdkmNa/kTXD/NJlgKSUZiY5W7XzNdSXzcFeTO
         uiw8pA44eeQeDEtv8scjYbyuKhLyQEAGbIz9EbzGsTsu3bbxr6CyMTIde8OMREh23rSf
         S/tWvppRoG2y6DEr0cxURIGcmx/ZNFzXGOI05hNUlg3ca+XjUuyOdOjm/jLOCkNgg2kO
         dQ+y17b+mHZV9BQ+2prxu78cuH24MkCZEbjxaJ2aE5lJ8VhGwPe2011gKSeNkuCcecaf
         84kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685146; x=1742289946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlP1aFnu/CDXSr/k7ULiiydiHqpcTMvKfeRj+DO5m9I=;
        b=aiGx/HTD8k1akrmShIwgyTK8A5FB+NX9o4VR1L8OHMUCrQWVA63i9TqPlSBdhizf5J
         /dRmxZPw4C0bxjBGkyPvF1tVqAG78FeT5pOCSN2C56eFRk4oxVr2A9MwC9h5Lkmj6odV
         HvfDTxCirSw7rrKrq0Qt+I5Rb8g+Bmdebx5I5cZ4DH/tP+cQJCvTMbmAy0mucLvNdtCz
         UJFbIYg5gCZyxYeVymHOll2mKL41zLtRPampkHNUvhEFpOHISe02kX8hYA46hPXodTwM
         VThLDN4pxjhadCDT+oMj6Y4g1qrlC4tbVzJ5s8g/lcIwzoJouH6wmph3z/p5JUnrdzGg
         TMdg==
X-Forwarded-Encrypted: i=1; AJvYcCVFhjg4bZf8vS2BTdsxzMwMASMNS7vQbWEm9Wlw7ehq5T5RZPZZ36cABp81tiLnhIlmM6vcWNb95lpIeQQg@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5oNwht6FYT9mca62cjQYMGKUU1Szi6s3xvpbJ7+9Li3qJJKT
	sieRp7bRqtTpwGE8mORmgDVvszHq1KHfOLN5Rr+uqd8bFTiJfbQGK63uCJGLw1k=
X-Gm-Gg: ASbGncuAu8z5JB+NM4/EDP7ExNMv4mb5KoaO1+N/cOjrBmGZzm34xZQoHO6POTkItOf
	DH1a7fHihzN4zorWE/YgWRIjT1vK3eV1V0z2CN+s6/Ue6Hu9zSUp9SCcvfkFAP7vPGgePM1RYy0
	DQQb9psLfmubiE76NPgS0aCOA7GYaIiRCe6JQsvZkC9+4+kv7W2308UE+Sc1LvQbm93roLgrXvU
	HqOG5kPdzPaN8Q2ewbhzrjD4bIYxU22+svQym5WbM4mvzOsVL5H0qpkO5wxgBFrP8o6goWG1n3l
	epg975U/c1J5Pfug4LXGB+Ep1vSJ/wFcp5Sz
X-Google-Smtp-Source: AGHT+IEFonuMUsv5t7RMkQ8iEA9Po7UEbOofnFEQRO86TnGyuTu9OQAPv+aswdukrUC/lL8XbNZzxQ==
X-Received: by 2002:a05:6000:2a5:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-392646936demr3632369f8f.26.1741685145889;
        Tue, 11 Mar 2025 02:25:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 10:25:33 +0100
Subject: [PATCH v7 2/8] dmaengine: qcom: bam_dma: extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-qce-cmd-descr-v7-2-db613f5d9c9f@linaro.org>
References: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
In-Reply-To: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3543;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Pg4kQtSGs2f8BpuZiVEMtvVvzRRbqxcmk7ypHqWY96M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGVl3C5lSeEdfpfP+zIBEzDJCcFCX2vmzasU
 gOKZib0fpaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlQAKCRARpy6gFHHX
 chhBD/wIRjW/QOjQXff90g8HVICSDdXkKD5BRJH+wautyIX+duSZp1IFDylvKfYIMy5QHl3mTXA
 NTYdCzfKfzTze5I89ENDmJ+OsVC8tnYN7Qn+kPwfwYEZVFsMg9LOJHBAAOFV26FljVkgRCmImL6
 WHhu6e5mJFZrqmmZLZTLGRPhO2MkzHi/QzqnFmRkILhrjaOq0rNMRtoky8jyIA10i7c98vSbUNj
 05A0K55UIiNCd9o+jrsZeXG3zus+Fk+BYi0ai+cTWVBdTHYBAapa9MPPc5pCXT97mH3mJ52LzQl
 FVK+JbAYbRrs5A0OEiiTbkPtUNQIFUc7BUTOaPs6T1rde8MpuUi7b2+g2UhP0XmTIE1Pp0QKpIG
 cH7nucGIbu6fIjTG7TG9WO/+dmbd+SheIslA0pV17/0NFf7XF2FBYsMBxT/9yKMw9TOy0JCui8I
 Jn1jwBI3kY9AuUogPDDztpNoH5odNstKWFndGe2zgNQKEYKdyc7r7zt0ipC8e42XzsWZxU8bWXS
 a9mrdwihu61+tkiIuBmfVBSkeY3jRvnwTHtmcnT4tgiIsaLlZ4uX2buJg8EADfrpNq57XUPZ4Pd
 n/ybHmqcs/IEInA7ifOjGoq+bMe77cfKHL+wh2sNuSiEdcllYVbSTyx/HaAnO+JIYDCY6dPZV1p
 at4UvxJfshZDpkA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795..8861245314b1 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -111,6 +111,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -140,6 +144,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -169,6 +177,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -198,6 +210,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -391,7 +407,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -409,7 +425,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1225,9 +1241,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1251,7 +1267,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.45.2


