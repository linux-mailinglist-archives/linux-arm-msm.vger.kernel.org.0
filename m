Return-Path: <linux-arm-msm+bounces-83847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595EC93C07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 11:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 278C64E1978
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 10:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875082737E0;
	Sat, 29 Nov 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US8FPeQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18E1D5CC6
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764412176; cv=none; b=Z/mms2yYkTEcxwC6ttK059ZPEex3mCXPS+jHMwTayH7n9npDoMeLfaKCLZs9annJ//GNkxCJtBQUM7TgHF2fL4iSndWFQYFeCHIFj9341HBOZXzZdP+zee7L4v51XXF2OPTTPlsd1d4PrVfig0jb+CjXIbZwGd7TeksFeerJSeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764412176; c=relaxed/simple;
	bh=EXIAZkX9JbCZEV40QF6tt5G/xP6fu5FJr2BYKTQr4tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pM5gagQ1l2sMp18TTcl9kSLm9kZLDnIdGnlW/6OmumWaatEqbQvxkDTSFETTPgf7NiytntFD8zCpTVPpfgnN6h1/xpdJdb9hf3rDWmKWcZ9goCSOoySKhhkpiNodgd1KCr08r2Ou3vEyq/vXFzwogTdVb4xs5hj4JwA15M5PtSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=US8FPeQ0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso2447971f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 02:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764412172; x=1765016972; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XB8ojDLPmRPjgdbiNqqeSPVDfEQQay9vSxKvQQfS0ls=;
        b=US8FPeQ05vlOd8gQODpXBhwYuCM/mO7vzxuPEHHukdEDD2zn3/RoG6LVb+6zo8RqdH
         q3sZUUMsUR84Kf06K+K19b3MyaoOk8fvsOt+SnRrh+xhViNql1BjpXVpUBdU0CCekrlk
         qrdFIIpmYbrSjppsqiLcTWONtuKgLRNbAvmd4RIhFe3A1sLUF7ZeHWc3zVwJrFOD5ZMs
         oIb89v6lr/2+JS9k6LaO4h44PujWed+okdl6FuMZLpcl06s3VGjX++aoDUB6T8N58r8J
         TDFwj2ZW2zBJoZiJ//k5IL/ZM5Rsh8fJx9Zgk7LOzqNR7cRsKjR/4WDiNDuFlEKrUy3H
         pnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764412172; x=1765016972;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB8ojDLPmRPjgdbiNqqeSPVDfEQQay9vSxKvQQfS0ls=;
        b=K8rwhqnynR4nr4ymbsvNkOzkngtIl7OJrg5iSxQ5NV5RvgLh3qVFZ8qTuy5OLGrZHO
         vL16gP8gXwCyN7jmzaC8WUWwG+iAN4Fh+zA6+nBLig1dlXDQgeUvw4eUZ6aXXQYEEeJk
         OKUqh29UTVB2KFSrFYmqp4ccWPM+V4OqUygaeJXx1VgeQRA+Woflvdd+5cJrzJ49Hqso
         /1226HVs7snX/mCh0APbwSD1ERWMLYoNAcJ+yBtohEijWBYMdeSHdLFARZ5m3C0jcxUb
         1zIkTnl4RSWgTmoDN3FlvaIbbGn1GyVHhHRzaomkR2y+IM+wdJT+VHSIk3QCWgRfxO8P
         UV0g==
X-Forwarded-Encrypted: i=1; AJvYcCX2pBfvtWKYHbmdeH6JH84HoTABkun9/PZaSkBIfLJUSmKJSnoJbUDaOlnoz13/bko2Iv5pNW5I2OSvA2gi@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgCmJH25CnoOt/prv12GoELniTCjwYrw+gVOEKb8Sgi+31HsK
	qUe5lkx1qlWGVhpd+ewFDwAwCvpt8n2iTTp8daXQefJjvm32idwu47Yu
X-Gm-Gg: ASbGncuURrljsoJft96wS35AIScB9DIj/TALKT9VCFAgrkHNcbWysiVwd99PCfsP5GN
	GX0ARSym/DFdbXGxrrgIDxK8AzSd71TjGzIIkI2UiM7Y6lPxSIR2OvWubbt8rYLsDhQZq0k4JuA
	Am7XYRjWY6BKNLj1lvXJwL0ghmJrSXkhHSB5yftzTGmiNjmeTUuC+OA+cYE7xUQqHOX1LJiyMpC
	hpiI55mVTIPQE6HjIHm5RVWEBM5AVbfTMHdy/X83xtaWtJqZYe9r5Yj3WJU+A5+P2A6RUpRM0bC
	+2G1PgUYb4LQbj+wRL39MWGMHhmEm/hm4lRKjYWhX0WSWIGm2BJRZoc90tLU7PW8Wdy/Uz2Xfhy
	iJwGPx7HcGX4v3XnsIXfFjoRppHqi11CfmtVrP+eUQ6KyNIof9Dr+aV7xIPMG5FWNboc5Kgx1//
	i7+kvD7w4ZGnXmEYgS4M+rpHqvTt9RS4wUS5YKsfk4hOSPYXbKpjw=
X-Google-Smtp-Source: AGHT+IFF8NfCPDZoCDRvd2e/3m3f9IuNEk2//VmqY35vg4vwN/ox68TOxm1dPHp0YHoIW6ze/wYpJw==
X-Received: by 2002:a05:6000:4026:b0:42b:2c54:d9ba with SMTP id ffacd0b85a97d-42cc1cbd449mr38035756f8f.20.1764412172508;
        Sat, 29 Nov 2025 02:29:32 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30b8sm14740128f8f.7.2025.11.29.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 02:29:32 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 29 Nov 2025 11:29:27 +0100
Subject: [PATCH] spi: spi-qpic-snand: remove superfluous
 qcom_spi_set_read_loc() calls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-qpic-snand-superfluous-readloc-v1-1-b84ca17095d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAbLKmkC/x3NwQrCMAyA4VcZORtYy6biq4iHkGYaGG1NqAhj7
 76y43f5/w1cTMXhMWxg8lPXkjvCZQD+UH4LauqGOMY5hHjHb1VGz5QTeqtiy9pKczShtBZGvnG
 cZoojTVfokWqy6P8cPF/7fgAo3rvCcAAAAA==
X-Change-ID: 20251128-qpic-snand-superfluous-readloc-c7c245a20a46
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Before configuring the registers related to page read, both the
qcom_spi_read_page_ecc() and the qcom_spi_read_page_oob() functions
are calling qcom_spi_set_read_loc() to set the read location for the
first codeword.

However the qcom_spi_set_read_loc() function puts the passed value
into the register write cache only, from where those gets written
to the corresponding register later via DMA.

Yet, the qcom_spi_set_read_loc() is also gets called within the
internal loops, and during the first iteration the read location
register values written by the initial call gets overwritten in
the register cache.

This means that the values written by the first calls are never
getting used in practice, so remove the calls as those are
superfluous.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7681a91d67d563fd21fcbd69d223b6e846e97787..0334ba738bef2811e3458d20ce69bd3a213cb20b 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -850,8 +850,6 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_set_read_loc(snandc, 0, 0, 0, ecc_cfg->cw_data, 1);
-
 	qcom_clear_bam_transaction(snandc);
 
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
@@ -941,8 +939,6 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_set_read_loc(snandc, 0, 0, 0, ecc_cfg->cw_data, 1);
-
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,

---
base-commit: cb5c2eb459f4c98d584eaf3d3ea7c3612385d081
change-id: 20251128-qpic-snand-superfluous-readloc-c7c245a20a46

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


