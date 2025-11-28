Return-Path: <linux-arm-msm+bounces-83758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C30C91D49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89BD14E4733
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D816D30F921;
	Fri, 28 Nov 2025 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MQ5NLo8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9230F541
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330256; cv=none; b=uT6vtjRP3VkQ5rkzoB0NFCNe9wAJgsS13UTzsknbB73gHpnqpvOqwM0mZpugDDvINGnX5yCzTchIX39tzleUugOM9QRaFKh6dqW45Y5TQK2gG4LXYHdW5JhlA3NAsE/ZSH0muIc8lMSqQ7TxdTxa9xjgLlBYizgPcjdF0n2l9QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330256; c=relaxed/simple;
	bh=TUyr94Jtc33qfF1dHLVyC6XEZjaXwlAM1r5rnAPwmwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ia6RbMQOdKBLiRdD48baJJQkTSW7BSPzaU3CdeZU3PCQLIn79a2+UGkdpSz8FXS+ycnGNHxmu6xCucXahYx8RqlGbjxgrYd4WcM9SmdPOS0EiUMth7nXUhZrqdA2XY8Yz7tk8406atH3zmga6QS1P6TinGD7K85DJ43jhUBxDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MQ5NLo8R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so14035655e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330253; x=1764935053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsLkHPSXKJgPwvxtY/gmIzQjj9kLAJgCqTwY9k7v6bM=;
        b=MQ5NLo8RG4YGu+iv+0fBLa5akDVnyC4YJIToVoLtAGara/lMq+etDwx+MucK9jHu40
         c9K39umXd117hTOIBZqysN1Mmw/VP2yDPj27UL9oXBFhsSOivxR540fA/Awz0O9dVUcr
         IKqz0Q9TG4/uURqucdWAmU5HOcGYCfE1np0GL/fmniX+GgVLHp7t3548UeTx1wyEnmX/
         HUdJRpsJVRFFguifZBl/RaCbY6ktEZzLPn33oggYCv1W5aujx+cTZNltimwt1/co3cgo
         E7x4HbCyipKBRC0vWsP6+VY6Qz2FsQyFS13uwRt4gFPITRNlcLYQSbvokIkM1NyKApBO
         Y0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330253; x=1764935053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsLkHPSXKJgPwvxtY/gmIzQjj9kLAJgCqTwY9k7v6bM=;
        b=p/G41Va4T72zbXa6u/LEFJT9dmiFNxdIIodUEELkxksbOMOVxLa9PbnpUWOAv14MZ7
         noVQV0yAB3lNoKkHvfYOJ/MmkMcssf8c5K51zCK7zHzl7TbqMs9UCmJyULpNAKPxigN8
         H+z3QMqsbL+Goyf+HraWaKD6ffcxrlp4IgSUFhFG0PAyu3v718Ho7NZNhdy6YnaBJTbx
         niTXYiSeE+LbpvXcPMorNZnIr8+D7LaIjFIaHotT+CA2VAmZ9Q6aSqrK9ZJdRhtIUSmu
         np/sYGzwl0QmF6OQCrn13EXgOhFLM2UjiKin9uNTdxO03xokey7hKVH01jUZnL5nqvTx
         0tow==
X-Forwarded-Encrypted: i=1; AJvYcCWhjSD62qdtllHZaNhoymzndllr5xfCmlFNHdpnfNyBxMBB2J2FhMXl0Q9Uq+y4fEujckwiDY0LLISiZBoc@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4S/VxIaU/ztXkNJjNcPhrOJNLPCO6CtZPNAhWNU5xjA4hspB
	CiDvyO12TTUxYjYgVd5LrKaXtH1HH43bA+w7WfZPE5+sva1XkTfqtpdHBf1YJOGKdZGsHJ2jU/y
	7+Nql
X-Gm-Gg: ASbGncu1f+fs5fdoYMMwxy/9y1MxKsXpolpJwpEnKDmlDUU9QWq0U9tWePvex87lcrY
	xo2ss96x2Y/zrJwjMxRzpEMnwbouaIwhWWLLbRSvOb7obRYdABnbzavPDH+tcLrh7y18pXoIc5T
	07Hv/r0AVdB8wTAsNfFvCL2J+VxyGVY1OcCWtl4Val2tgD+hCPWfKLrS9xHRTdV3p/lXGQPilon
	0OVfA95IR8GHJDfqX48Qm37rXLXnieW8uPjJFGUtJOXKdnSOaFY7iP1A3mVQk0ksZeCpjVpYUN4
	nG/P9vJpN3r2iKeUfyLG4iJTM8HqmK1XodZ69G+WHQyQtqswOpd6cboDrVyDAq9HKznheAtCBiY
	qIQfURyfHN6kKtnCZnY451VV675flogRWvrzxJ+lzu5nrFLERaQq7vzsqOrAT3+bh/T6HJSzcZA
	uaOxEnuA==
X-Google-Smtp-Source: AGHT+IFSd8jIclsoKvcKNm3qGT/FEKyfyxGrRbEKlz3oiFEyjjtFmnavNU+aqDkyD9XhXLIvGRzzbQ==
X-Received: by 2002:a05:600c:4fce:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47904ad9438mr138361265e9.9.1764330253201;
        Fri, 28 Nov 2025 03:44:13 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:43:59 +0100
Subject: [PATCH v9 01/11] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-1-9a5f72b89722@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0woh03/bgCFE8ePGo1YBxXHVZW/UvQS3qBPjY4r3K2A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsGNDUf9Ng+dfUac05iglgaNCsKaY2Lrm/P4
 HhNOhG3EeeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLBgAKCRAFnS7L/zaE
 w4F9D/9BMJX/tFeUWAm1i3ry15M349LsqliUmWdcxq0xxLuIofu6Vx5Kas7waECTmxMM/pOaIyf
 cW+8672+vdSduCeRWD/aqJMAwbioj0G8jxYTQ5OcfqzHaImXCL2cvC3Ti4IeFCE0J6vnpaKeeeA
 NhkbZn5U8+p7ltLfZwYjD+J5ijbufnIXQOZyTYgVW8XwCiQq5hyEuny6KrboiKdtWNylznDIKMR
 M3XUfFmIbiyVkJgSuG9SJ15AR6mBssG6YEzi5zpP8P1sI7aKnMht//ukR5Nhyfu2pZdwhBZRueq
 KzOsoZyDNasf9Q/1EltdmlQOO5/j+mQ1rw6WvTYmWKmGsAJFn5TEQnzKNzmwn3tWfUcpnYtZaRF
 oXiHA82hXAzmuSV6Wu0MI/4dKmIju/yc6vhdje0Rj/BsRshC3m09SmbEi0bE9upb+fVJa6+rG7t
 RGsCuYlzpKTkAw8Bjo0hzzbX2h+sDOh293aMEkt3knnNNkQKI8cFF9fjBgCekLwwjwDtKXQcV70
 16fLZUbVdTqanbJtEUQ7aP2KRqz5AuN/dEGv9AEQwkcA6l2mnM9Xs89nBaQGD6j9OBxsJjKmkmW
 BGX/+NoI6vuFWAwvdoasuqKTRtInW3mr/kg9kX+SUtzr1oDg1Wlk+4oaB6eUn9i1WnZ+r5evaZ/
 cc/Of/cqn7I6M2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795fe326abaf053a7a7a10022455586..8861245314b1d13c1abb78f474fd0749fea52f06 100644
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
2.51.0


