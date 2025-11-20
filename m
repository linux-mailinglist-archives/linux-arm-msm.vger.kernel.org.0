Return-Path: <linux-arm-msm+bounces-82755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD9C7656F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 22:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 6796F2C56F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 21:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E7A30DD16;
	Thu, 20 Nov 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="VSqwrmj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4953064A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763673231; cv=none; b=iwr1xUPtZvLy/R6o/BoaKwbI8YdamkPergaHG2Ne8M68PWJNQQ98PzdsTGl5D0TY9OUKmdlvs9BSqV6gyfLE+5YvAsVLxhUTOR51pzCJXH2QmRGsg67NedddUsR9XorwfTGNVgCE+1wqgxSIJxm6hhmP4QjQTDMvRs9FYG4peHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763673231; c=relaxed/simple;
	bh=/QBHhu5/mf5VqkoFrsU7ZBKAZLJ0DAd9JGOgESKJEj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yca7Tl7WtnCrI2AxAn6L2T2brHN1DWnuRExIoHC8zq6Vtc5xUqegigK2UQ5tyoU0tpmP5w9kbAKmvHatHijWmda64b7p8Y+TOg3RUojHUjDgnTvUF/zeWWJwg9Hv+ErA5GZLGNiK9YwfrteQdlYej7BcdX+w/rDUfFq6wHvgLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=VSqwrmj3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b1b8264c86so126304585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763673228; x=1764278028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKI5rd+bNks7evkZ2sb5RD79CIhkTakhfZrmrMaIYvc=;
        b=VSqwrmj3U6kuX6Lxhl4OVVv6+R9iqunUDz9euDYO3DbVzivYR/MAdgWSNOrzMhTHd9
         LZRnWnVCIyqTGsvHHza/xdIZEcvVq7AiOPDg52qZWOtw3urzEhGWeUl6R2P9fY3SAaZM
         /lS5b/vQLFBTKY1FniDMUNx9RLN171LlDUrdsnRtqhiYcdgOZzcBa7rCDp9hn/uljZkp
         O7uv+MX5IVrYfWRXwNsYmyCrcVW1HHohKeJFhsqcvBodJQztQTdASbYMWsMImiJxPi0d
         wVwiQJ8MEEl96P+Kfj6StCyLdNT3BaEYIt+f45nwBXuffMeOpOymmF+axXmwhtiTuk+R
         Gw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763673228; x=1764278028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKI5rd+bNks7evkZ2sb5RD79CIhkTakhfZrmrMaIYvc=;
        b=QZGGiOvtB62hlHjEtxWEr9WUe3F+o7tsGOscsmjqGvE9fjRxPWRA5GMy3Ts1rhZiom
         pORndb99KB/dbMOJ2AAmvLmsjwvlTS2gd6VhfiWhAB4wNFEY9nisRh/UJc0ReD65lupI
         aB1IaDmxIKoziuGSCRuj4xuUT/mIv2SJUPVXgy58EbQOo0p1OeeHWkWPetmRqSR2CCi2
         N343TgB7MUNyVssd0uSVvwflBgFannSFazhkYN++GrBmcwlqI8cIZ+43jtnXo90MM/Kf
         pTZH5ovEjS91tHhDEKWiK7MDWuksnH0JoX/lDT65CAC8rvah3U47LSKF+qycC7TiXKEZ
         bneQ==
X-Gm-Message-State: AOJu0YwIL6KNAU6H9dc8OTYS5gP3uJpNJDdZMZeExDgeT1PHvI4gQOJj
	hEl/Bx7Dy/+I94BYTZL5GNgx4MA02NSjat4lvcbmRHPJYoD+Olx1iTbg4O/4k/R/cOv2h8POlua
	+TJ+9
X-Gm-Gg: ASbGncvP2RptHrXVjTo6HOwW+CMZC/GAuxLWTKAU34vKAtU5SUQEO2ofAwJFhjG5GJg
	U2tu2S3w6wcOhOBlQ4/Hd/JSl2YgQ7iBdpr6fPp03AFxVxMYRXSEf8eZf8YtyXTmcNproSPk/ES
	Y+xGjmsAJjp4HPLLdoQ6byvmWiMNNMighcAwautqaHeBTKJkSaF68itlbHX72g9BxyImhBHtlHM
	BkJTHP7YQK5+pooyupElMH/CYbki4Z6DjlzsX7iDCz5vn7KG/VB2o/NP96Rz/fjF6JOAGqafVh6
	0wNEUFSjptqfcBwnk8iote4UR3AYN1hDSZNls0JEnVdcEezHXRdzpnB9IiiSEaCgZ1D9ajZYmhf
	SQzb3BNSk41fS+bT8ZFMaerOPBB0YuXew9IA6zRgvdmk0hl00DiE5nQRcv62ENc+9uBfNaWLLvQ
	i8CeHl6jdmmXysmmCSgxfJ8FPyM1ziZjoQNM/fZgc36tum7mLASWUJywWuhbVgVQxQTA==
X-Google-Smtp-Source: AGHT+IGvwgDIhs39jzthQlsKnE3PoNiaSD7wWyoE+gOYX6zCfolKtDiYjS30zyf3wqexvj4RjVflig==
X-Received: by 2002:a05:620a:29d6:b0:865:916b:2751 with SMTP id af79cd13be357-8b3385e943emr162330185a.14.1763673227980;
        Thu, 20 Nov 2025 13:13:47 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b32953735dsm225958685a.24.2025.11.20.13.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:13:47 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] spi-geni-qcom: initialize mode related registers to 0
Date: Thu, 20 Nov 2025 16:12:01 -0500
Message-ID: <20251120211204.24078-4-jonathan@marek.ca>
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

setup_fifo_params assumes these will be zero, it won't write these
registers if the initial mode is zero.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/spi/spi-geni-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 575b112d4acb1..53229150b86b5 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -675,6 +675,12 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	case 0:
 		mas->cur_xfer_mode = GENI_SE_FIFO;
 		geni_se_select_mode(se, GENI_SE_FIFO);
+		/* setup_fifo_params assumes that these registers start with a zero value */
+		writel(0, se->base + SE_SPI_LOOPBACK);
+		writel(0, se->base + SE_SPI_DEMUX_SEL);
+		writel(0, se->base + SE_SPI_CPHA);
+		writel(0, se->base + SE_SPI_CPOL);
+		writel(0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
 		ret = 0;
 		break;
 	}
-- 
2.51.0


