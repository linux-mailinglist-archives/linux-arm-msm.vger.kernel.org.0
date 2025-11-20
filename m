Return-Path: <linux-arm-msm+bounces-82754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE7C76578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 22:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78A124E0311
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 21:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CB830BF67;
	Thu, 20 Nov 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ei53bGW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59493305946
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763673230; cv=none; b=VBUvDTc4q11rrnn2MgtP7r30Wda/Ukt1hKX8OxB+BE4Pq7MFII5FdkLiwbW494WhfdDa5HRurD3M/OopoZTp2xZtbgRJmKbogo3kN9T6kwFDK3k6N9avQFKDe6I6sIbgsHAx192oSh4RDj7MHbRClEiwoYDPnwhsJldLATFfuj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763673230; c=relaxed/simple;
	bh=Ncr3R3kiVMaRI941uPnNlKBZzB9t5eYETF9gVPClg8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvCi4/nGBe0SNBa43UyjlrSiXG7vZoeuxUDhVDFcs1brVDddn0kNJ3nox3RkhJiKNcTbhf+qqX8bW443uzheVJvFc40A1l+EzSOqqmIE42ePeZKgi3IAaRk8gaJSBfHbjL813I745b5mDsKrO6M1kZbENkEidROpRF2eH3PFNpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ei53bGW3; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b22b1d3e7fso126676485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763673228; x=1764278028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVTYOQ3QWD4eKEz3wLcBWIsCXGJvwPkc7ixkByGQUus=;
        b=ei53bGW3MAKcEVvmfM3aX8D7MDUaTeulUUesPqgnIpoNCTjhVlA6wD8m2ozCTGdsP5
         7xjBfwJQvYPqw0rwJwaOjByhyem3VbfR//HNsJx2y97sLDyfNqLUfHGwDrPg28oW+Oq4
         wOXtQTczkqEnRoNaSV3xq/IGlUrFeJ9IuSF5FkBJUoB9SzR2Q4DDMpeS5UHr9PpsxeYf
         qW3RTFJF+mp/iY1ROkH0yabOWIlZEwyntrQtXY/KmpxIqp8tVYdfw/R9yMAmidSON0Yy
         UUuSphHwys970kGdeE7E2R74S44elp4o+e9wo3RUWyLFAblflcs2ziWhh9xxcuGutLru
         aNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763673228; x=1764278028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVTYOQ3QWD4eKEz3wLcBWIsCXGJvwPkc7ixkByGQUus=;
        b=iGg1i6p4DsAxLCEyxV1QHV5YJ+Dke+NE0ZIOYGu9pn/gvJAnfTlRm2HkuC8mOGG95O
         dGfJ1/ivXI4u23gnEH3qrDrhhLlAkJO29ZbpYGS9abFpXNhK+8P2qKg7Y2WJwic/AOTx
         PD6Bn9np8BHYvKotcsZFmhn8Wt3bP0cqQDGUMhzv6GhV3ANNbClHohGGcicmkdxOtNUG
         Sje/vUEtl+Zq12g9+YS6OH1rTF0hLCvwl2nPFrC0g+aBsgwftfJE++QjUxFG6rLNbwwB
         eZaIHIpy7p4UGq+HaE/Ue5q/lK2vtIqFl1xcJ1iIfCj+xm6C9vecrS+K+ZokoohTSGx8
         7crA==
X-Gm-Message-State: AOJu0YxLVhG79LbPtxliBG+L53PdE1Fpd8XhGWy/itOsr0i6dWlb97Hq
	KyB+SeIJU8sTxrjvZ68oV7ZQsnQYgMpYfuK3iSjOS+PO8jGqo6i5Z+LCisJJarwZTtLdiJK4QG1
	kbxQ9
X-Gm-Gg: ASbGncvE0Yz/7tI4yCNbrDv79tThJ7YrmjKBs1goK6on8M/gSqKRM7SKfTJadgn1s3o
	W8tw6BrhJ8rGcEB6CtL1J73dksso9oSHjBVSaHXPUe4HCseZnX2R07BNRSUs4tgXVp6SueUxxgE
	XECwbKaUYPwbFOQq2ne24YiLMfigMLV6m3mqneROw9eMzEgYTxXlMw7KHZQ5eYEwbaAsSzJD8Sg
	n5XKZIPXdLYF2z8LsbwpFQnYK7A6vDb+0vjxhABiCg/3Yc8AlHZMDCJuRrRXvZ7GEO/2ahfluLc
	fUPByfG+RTsoN1W4rn5PsAAMIfYicHL8eutYWJtR9u1Yg/YZxlxXq5Qp1lG9+CZcoxr9JP7tlJp
	JFuez8Gr/xiSGypwe4HtrK8pg54G0pMtGGDi8u6pMmMrmecXJQJybHIfnStRZa9wmDi6UyYAzOd
	gYYvjy8DUds9xs8h+6LfEbLzsHdKN4EY/Lt0obmfqQNgvycAuNDN07uEDg2Efv4O7q+g==
X-Google-Smtp-Source: AGHT+IHhLrKwzSUA1bNd+dPQLHWxvxkUjlw7qu6qycMRLUEdp8icnfz7Y6GJY43AdSETsMFXRXs+JA==
X-Received: by 2002:a05:620a:2a03:b0:8b2:f1f0:5b87 with SMTP id af79cd13be357-8b3272fd01cmr556804485a.3.1763673226952;
        Thu, 20 Nov 2025 13:13:46 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b32953735dsm225958685a.24.2025.11.20.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:13:46 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] spi-geni-qcom: use xfer->bits_per_word for can_dma()
Date: Thu, 20 Nov 2025 16:12:00 -0500
Message-ID: <20251120211204.24078-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120211204.24078-1-jonathan@marek.ca>
References: <20251120211204.24078-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mas->cur_bits_per_word may not reflect the value of xfer->bits_per_word
when can_dma() is called. Use the right value instead.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/spi/spi-geni-qcom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index c33d79d9afaf8..575b112d4acb1 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -499,10 +499,10 @@ static u32 get_xfer_len_in_words(struct spi_transfer *xfer,
 {
 	u32 len;
 
-	if (!(mas->cur_bits_per_word % MIN_WORD_LEN))
-		len = xfer->len * BITS_PER_BYTE / mas->cur_bits_per_word;
+	if (!(xfer->bits_per_word % MIN_WORD_LEN))
+		len = xfer->len * BITS_PER_BYTE / xfer->bits_per_word;
 	else
-		len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
+		len = xfer->len / (xfer->bits_per_word / BITS_PER_BYTE + 1);
 	len &= TRANS_LEN_MSK;
 
 	return len;
@@ -522,7 +522,7 @@ static bool geni_can_dma(struct spi_controller *ctlr,
 		return true;
 
 	len = get_xfer_len_in_words(xfer, mas);
-	fifo_size = mas->tx_fifo_depth * mas->fifo_width_bits / mas->cur_bits_per_word;
+	fifo_size = mas->tx_fifo_depth * mas->fifo_width_bits / xfer->bits_per_word;
 
 	if (len > fifo_size)
 		return true;
-- 
2.51.0


