Return-Path: <linux-arm-msm+bounces-79532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14185C1CB27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 19:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03F964E32EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E03304967;
	Wed, 29 Oct 2025 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqAQ1zUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846792FC892
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761272; cv=none; b=Bz0jiEkp1Xy90o2zmn2uxn7Pf9KocWrbDa/QXxT4KNljEndWJI1nbuLjeZnCytzVohmxi3HP1ODWgM3z96r2r2YNnzkMnjIIYazQk8FttWRbSYPTcKvC2DvD+2KexR7MdMfV3TmXUACD4fyJU4HVSo4wWM5hkPjL1seQ3Z0UpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761272; c=relaxed/simple;
	bh=UJ2DT1Tiu56DrBbBEh0/iWktyI9wRry2MbdlaBokZTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QHb8EThReRnaauOAUBkA7vG8uGhgQZmb7ioL+w/zhhOvCSRwcsmW0bvsqAs+iFp7dzUJMhfQb4WerWoKz2t4N625biriOScWWZTg795/etUMJrftmTfQADonXgTw4rIwjKBTPfubH2Swgj+H2I625a1LQsKaDAp/imnP8DosWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CqAQ1zUg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so547675e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761761269; x=1762366069; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNwV3kIKfmFe80QZSUe0lDX9k4qYiLpxE6LgR+ZybE0=;
        b=CqAQ1zUg817oJVlpv8g7bs+xLpZr/PYk2oyKhaAk4ZnalmPieNUfbH6dKT909FfWuf
         XX8A1l7w1D6Hat46MfThWR8pNXrwcym/ZwPZ3qUKAFMXkem4q/88Ld+UByPbGq2CDZRc
         bVE7e8fLorKjRahTDdrwGuXbZXytuz05ppYQPLKc3gYUrh7w2GsUkj2z2VrDa+sS1TkS
         qbsz7RRcxnaXuJixKqDCy8rLqmI1BF/N664ZHWEbqLz6blZ/B/Os4m7ty/GiJRyyBHRV
         Pvu8USwttJdSrVXi216QHNyoddQ8ZtJkCMJzjlYMXr69McKB6HcClGN2RSxn2ymsA/zg
         QK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761269; x=1762366069;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNwV3kIKfmFe80QZSUe0lDX9k4qYiLpxE6LgR+ZybE0=;
        b=hx1JmYHvxkgMkX38OCqEmNReU93huV1wSe8B+Byk5ehnBUQD0Ws1gRCiddMhPLcTic
         UPdoBhlUrC0B3ydemsc1/Jp1lP6WSBn61zzZQZE2n44F3/tlTG17I9zwdgm7WfoWVlRo
         3S9kEsMvyoqtvWGDmZiBa0Yj4U26YF8E7cyBQGbpaAx9oTkeKx9X6kPd2cKCroRFu8Su
         oY3g0Wh5XMWgnYXQU13WWH249MJl5tRgR4UYIkEZIqjcB5kgk1wbdFUQxwSQ5EcLMCUe
         NmnCBBjan9eIbniQsB1l90gTXPI0My7hNL64CLvHLV9oyzqDy72uG9cpgBPiunaADidw
         QVuw==
X-Gm-Message-State: AOJu0YxBIZ2b3ZPOjELclib9lQuKM53r6xWRYadhpheXuW80yeCMaJyi
	8/EML2aRhdukDIgsL5koJMCitjkYKQOemXhrKjxXesbouKn7ddk/fvWUrOFqXR31Qm4=
X-Gm-Gg: ASbGncukzQSe4CtXevw8ZjF5f/Bv+VirKWZrZSo3Tmn3XgA0SCs787qf7nAN1O4CnGP
	Sv3a4f7UbvOl/sWNWIF22BZ7l8GlyLMlhiJrtDmK0ciHlf7y36ZPoUVB+k7DZvZqCchSHFTDz0y
	LKeBhTgN2ZKHmRD9XwTz6uDKmwHToWIEsqs/L0RmBlkSA4f1x3OhuAPtaMUtyGz21sNmB/1MILy
	L/r+v2dnhSjtbUyL5Srs4hRGyh+XmNRIaMmNbUboA31G9obwxzgT3CwS3MVAHs4TbxilyR227Re
	mu/IhDQ9Aiy1LstJdd9fjzWw06yLTX3SEyjSSkNrzEdltWTnelJH/Bb0E0oSzS7HZlQMfDGlapL
	p0f+AC2TZuhm7n5MTsl+hsNwL0tt8dGQVCwuFpPFfTjkQGqbenrFh+OjLGlT6Vm67UtzVfuZsFI
	LhJLeKOlK87X6M/Y6wDLcz
X-Google-Smtp-Source: AGHT+IEtMPjVh9Zcm+7C9F/ERY97bz/iXjm8g8W+QKNDx62F94FG9cv5Huxi+liF2AyMpIvvFbv2hA==
X-Received: by 2002:a05:600c:4707:b0:475:dd04:128a with SMTP id 5b1f17b1804b1-4771e1e10b2mr35660565e9.31.1761761268523;
        Wed, 29 Oct 2025 11:07:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718427409sm49662015e9.1.2025.10.29.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 11:07:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 29 Oct 2025 19:07:42 +0100
Subject: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use SE
 DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO1XAmkC/x3NQQqDMBBG4avIrPtDMhBNe5XSRYyjzsJEkrYI4
 t0buvw2751UpahUenQnFflq1Zwa7K2juIa0CHRqJjbsrOE73nnXiLr5wxkskhTKEetnRMqYtgD
 vLbuhD72LI7XMXmTW4794vq7rB/dzaxxyAAAA
X-Change-ID: 20251029-topic-sm8x50-geni-i2c-hub-no-dma-8812576a65cb
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2132;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UJ2DT1Tiu56DrBbBEh0/iWktyI9wRry2MbdlaBokZTE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpAlfz8LKSj8+mAZ1QksgODZDbo1w7yGU4iVg2tYA9
 VBEcFOKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaQJX8wAKCRB33NvayMhJ0S2wD/
 sFxj0QkeV/duZgx4BgvFB456VI+EtWZMBJ3QVO9ZgwzJOGzQJplBMPxpyNBxWiRt1hSl5e/nOBUmXE
 R/tv8d5Na4+kXHgxezaH2dDB9hBVX8+7mKi6KJtH4KQChVQ5fsEwqPVeO6/dg5DTELvu6mDm+O3OF9
 Kzn2e3FgP2wbPrGCao5up8PR/wRUCP6zAbdYCWgf+D54nNkdZqLW90pRZxk8FGSPIW4AmSOs15Cc2R
 Te996h007PCHLoEEfRf0bAt5lweueUCL/vnRMNIArrJ2noAoclVA7YJ5NyRaJtJ1+p3DDzVAVbCgPT
 QxLDlvYyzc10fmx9aGlhqpRKmmrFjrI4RSO0swEpScsFdOGdnplAWs2lOKxKRhu3V65e5gIu0jNlBW
 keYbmpfQZ+vvPBlPwzL6AK3KDHuAEaRniwekbixKVm62NNXHPwyz3sBPnoNnsfI5qIP31l3I9/3cLR
 m/ywztQaFH3AWrdoSzWJrQkJueG2NgK7JveuZjlM4W0efx0ps8OIMbRnBcCg0k436Yt8tUspx8KZzw
 qVetRqhHG/LSK4XVa5fceQfGqVhLkJ+/8INRV4Mxji7EqSg63no5xELxabQZTg2RHF4edYk1rOSQrZ
 LmS4OPAo0UyyWqA3ZZ1hx2RX6tFe5s7yybh4qXJjkw0WzLOo2OswA6dki/aQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The I2C Hub controller is a simpler GENI I2C variant that doesn't
support DMA at all, add a no_dma flag to make sure it nevers selects
the SE DMA mode with mappable 32bytes long transfers.

Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 43fdd89b8beb..bfb352b04902 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -97,6 +97,7 @@ struct geni_i2c_dev {
 	dma_addr_t dma_addr;
 	struct dma_chan *tx_c;
 	struct dma_chan *rx_c;
+	bool no_dma;
 	bool gpi_mode;
 	bool abort_done;
 };
@@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	size_t len = msg->len;
 	struct i2c_msg *cur;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -464,7 +465,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	size_t len = msg->len;
 	struct i2c_msg *cur;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -880,10 +881,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		goto err_resources;
 	}
 
-	if (desc && desc->no_dma_support)
+	if (desc && desc->no_dma_support) {
 		fifo_disable = false;
-	else
+		gi2c->no_dma = true;
+	} else {
 		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	}
 
 	if (fifo_disable) {
 		/* FIFO is disabled, so we can only use GPI DMA */

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251029-topic-sm8x50-geni-i2c-hub-no-dma-8812576a65cb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


