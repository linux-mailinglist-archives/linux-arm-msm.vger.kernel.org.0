Return-Path: <linux-arm-msm+bounces-113038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jLZfHQ1oLmoPvgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:36:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4E680AC9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:36:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=S3PtJMUi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113038-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113038-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6B39300B61E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E649D34041E;
	Sun, 14 Jun 2026 08:36:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF181B4257
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:36:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426163; cv=none; b=jG56t2UCmHv9sDmT3ZNpO2UeSLhKAIp7SakbjU+6c5vVEtb+u2QRHtTv3JUeAC5ebAjAf/rjldrt80Y3INJORrw+KWEXkWEqSWJRouOlKkvcf+N7VTh4k0ARt2vj7KU6+wwrz/FwNzSjngdYzNRy1d8vz87nxxgVnulpIZhebk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426163; c=relaxed/simple;
	bh=s4L4ukk0KyujJ0HblA0DbVk6Hm5VHHVGY6UKqtf8+Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fg30+oy0CYPeW2qxEotI5Tb7Tyj5W4sxUNE2Cj9p6jOvnWAhHc2JhDbkwgef/yW9Bn31i6a3yKMGCPGD9bFxPvru19e4R3roDkvZY84V3eccxnD/yNmKA4EfH4al0tGZ2Fe39P0Tuv/Xlz+1um0OI/KTj/7Fw4CbyZoHhryC5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3PtJMUi; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8589498839so905039a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781426162; x=1782030962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAITfEL9UqrO9L8OmSD1zMxFdEqiUvJMm9blfi4uSXM=;
        b=S3PtJMUiS69D2k614mFzce4tH101RiTzfiLa6MNdtGYTKbLUH2MyZX4iRptmSwkRkq
         Ynjs+HSRlIo3jYfkUFSAOgVCzJNIJ2PhTTaQGnNCCcWerqAvaQiWB6FhTgrySRzBqYhO
         VuFuRecYUA2i94dScZopATd8ceW21jYU56EeOxmEFVwaFT0ML4cIZGzaMF6vclzr61w9
         jf6PhVLQHayy5QxuNEnZzedbCnYzQQxwAtPTpttiBU2MzySW2sKbpENJG9lk8nO+JNZY
         eTkLw/hpX2kn9fLcjaSV2BmL0rbmehs24xF3kIbpUnrA29IZ7WctWCpRD/N2uh+UT7p6
         KleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781426162; x=1782030962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAITfEL9UqrO9L8OmSD1zMxFdEqiUvJMm9blfi4uSXM=;
        b=ejlfwD1nAaUb3LuZIOltkLrnf3spQ/GsT9uFI0QAzc+VcouMd0QOtQfcHVGqmW+IbV
         mxG81gn9nph9F8idJpTLzVTgRLijI56dtMTclVSbKvnOHcuVD8ekirABIG/e1E3ok9nG
         ehzQFAVChW979b5m2/rhQ4G2BIuLHgSFjsqCoPb4kwsb9u1yjpyxflAEQZciZdn7PB9U
         s/dKFmab29+hEyoyBPNMJsuzFP1j+UCRpqaD9bE6z6qX9d45KvWIEyHIyijrVH7hjFVy
         mtzF0Kr8UutdstF1BQ0xDr2xwSEtugqM4hp+l3xVncIlqPEAZteSzD+o57CgsgM82vBf
         xmkA==
X-Gm-Message-State: AOJu0YybEK1Ob/i6GQiTR4YYGl/BOhSo8QjcW0N0VpcbjrPgxiWWSLUF
	MI4lZilbl4F9uj4DQ6lIqGa4x4kWIeF7OpCXOh5sp0h4pV6fCbqLMn3n
X-Gm-Gg: Acq92OFZyzyDHSh3euxAJBgKlgw/FTzCoF732tHVCUobzNZ3jYUr3E6V0cnz4hUpVRp
	r8sT9C4Dl0dUCUfn3XsyIvSK4LucD7rkp+BPkeR2H+cmHZZogYcrXGhEBAtaQkPV560QZmF9fjr
	QF7oagBI3vg0bN7+0O5zS6+l6GWvNYJzJlgqqhPiiv1VBPdBUXP+Kcynv104CCDpalyY0N6VHth
	vok7ui6REasNRS/ZzE0Iq3rR1rzgzHBKjmg7Qvj7KBpA667IuJJ+jyfe4JjI1R2wL+1yGB1cWZa
	QsDuajyJsbU1tv5T1Nx209L3p+OdHLL/dk/whkcszS21W4VxaTFhbazFAS1/gb3jmiLcjq6eoLm
	MAW8lj0Yhes0WuZBtXbjECeu2u0KNjATSdS1OFW0X6OYy5wXnLi8x1uk4sbJERmjEeyfbZyXEbA
	6uAnG+b2aQCLgbl1DmkDGT4A==
X-Received: by 2002:a05:6a00:3390:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-844e199926amr6606163b3a.19.1781426162161;
        Sun, 14 Jun 2026 01:36:02 -0700 (PDT)
Received: from nuvole ([2408:844f:2361:d7cd:deb7:4e0e:26d0:4076])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm7263053b3a.37.2026.06.14.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:36:01 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
Date: Sun, 14 Jun 2026 16:34:24 +0800
Message-ID: <20260614083424.464132-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614083424.464132-1-mitltlatltl@gmail.com>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113038-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FC4E680AC9

Some devices (such as gaokun3) do not disable FIFO mode, causing the
driver to fallback to FIFO mode by default. However, these platforms
also support GSI mode, which is highly preferred for certain
peripherals like SPI touchscreens to improve performance.

Introduce the "qcom,force-gsi-mode" device property to hint and force
the controller into GSI mode during initialization.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/spi/spi-geni-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..eece7312f780 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -102,6 +102,7 @@ struct spi_geni_master {
 	int irq;
 	bool cs_flag;
 	bool abort_failed;
+	bool force_gsi_mode;
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
@@ -655,6 +656,9 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		mas->oversampling = 1;
 
 	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	if (mas->force_gsi_mode)
+		fifo_disable = 1;
+
 	switch (fifo_disable) {
 	case 1:
 		ret = spi_geni_grab_gpi_chan(mas);
@@ -1133,6 +1137,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (device_property_read_bool(&pdev->dev, "qcom,force-gsi-mode"))
+		mas->force_gsi_mode = true;
+
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;
-- 
2.54.0


