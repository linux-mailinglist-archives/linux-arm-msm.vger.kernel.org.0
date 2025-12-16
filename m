Return-Path: <linux-arm-msm+bounces-85406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429BCC4ED0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 19:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FFDE3006DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 18:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C06333434;
	Tue, 16 Dec 2025 18:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVhnoxoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413F3093DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765910320; cv=none; b=WJmuLnPWz8mdfdt74NnxMwG5zFNX0um7g2y6sVhgaUi8/goUyQhRLJMFNJXEBrv0MvIwosY5aJuaQ4vsEd5ipANE4L6dtlZ3GY3gSZdtBE1OjaEgnjdXN5sXgLxOF8Lw2ADya6UmLEuATvSBrLUMafrdwQkmA0unJFME5ibTUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765910320; c=relaxed/simple;
	bh=CZzKbhnTR8QMBDbIJ5b7gXs6lPvLCTOOrTggNIFNhgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NfzEXlDynQ27RIMJqvseLNenYHEvcTjrwNFDNsS8j7SLT/dHs9wDGITiQj0GbOYIiWFK/B/GFSYLYKsr7bflBMXySM1CWVXPuBv/15jSBwYN1uAXf9t6JtSkpHJNIbkqBZsmrariEj4e/w6RIzi6BsmdOC9Wu/YXqBInKAkIaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVhnoxoh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so53089435e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765910317; x=1766515117; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4kLxtqeeF1wE5hC2bTx+o584bKPJX+SdCXSIsBe5oo=;
        b=jVhnoxoht+hN+bzRF2krP7xLx365ZXvPmF27h87Y9UUytjZ+24ZsRwlDNwCegkUL4I
         1yKmlTD0c2MeMjzSdDPOXtfkzuGubpBt0FrDAHOhYSHQkIXY5cEQswXhwyMsugH9GkY0
         rqQmIMIY7ndP7jnMzPp01LE4PRwxM3kxs32H3HdA8a8hljkoBEoH0l9efd4ohe9EgmAD
         B4sYj5vOUlvdEZ7CCtOkMV5T/mbt37o3ueoeke0/3fcr/MMmH5h3+PntX8Zq7LyAo8wN
         r1+WU5ORHfIRx3iIN64Wkjs5uNtOIoOfZFyKzpbORfbELwoWPgp5cgRTwdXB+O2nIkSD
         9w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765910317; x=1766515117;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4kLxtqeeF1wE5hC2bTx+o584bKPJX+SdCXSIsBe5oo=;
        b=W+G94QyLPvQUklNG+CQ70jjqIZcUxxi/0VgSwKYUD8cvPxKsaNK9xD7geLeATmHNsl
         2BY9OzLEP5U4vIRjmNf///s6TDkCw2SmNFBLbYTPFZ0KI0PGOmSJvKUnuPu9UlCfvevS
         XdonjgKWnuG8mlZEyo/mAcZiL5mdG2B+oyWn6Yhy1iRigaGVRS+gNodRrDVCMSHjN47U
         I7juTMbdd3OhRVSq1JA57ZaWy9sA8b06AGVeSYQZMy3KW9KoRJTm7jWqviooAKxZ3aQf
         R6cYtsmrDFWXfy60l/I3a31F0yOVHxPAPYHSMUVkuC9/MesT2RLAibJcijvg7c1ErL/d
         yIvQ==
X-Gm-Message-State: AOJu0YxL4nExw64r9NrLShCPZ0n308gOCuCIv+h2InXOBI2Ukaa+KZbq
	ObnRxLIE1sgRWpfwkc8Twoix565uCZEtIzr/hfSjggo9/AucRplcvvSC
X-Gm-Gg: AY/fxX46xaqi6NoLvcsi/xJwbUf9z1Otc4mMs6BjnbwrRoj3FUQlgs6TkTzHLd4wwjM
	hchffW5evAdfIQxX79nkp+Kzlvkdy0qswg/SH9ggpH6+oSY16ySrZNgmge1/fGjkxaQHKH/Rqdq
	789tDBqPD9URD87yVdbc26rIzpLTS8gZpt/O1ypmlZAeyIhd+PHoOKE0AlpW8gjbL5CgfJqDaIw
	ctGI2uPj+vfLfbmKwkDZlVtaEi1l4QQei3GkPcbe71N4w6/oZUoh7uvj7tMwM8Q9A5lu57myJsY
	Z2NEaCgE06/14diPLXbIwGOCxdUVrU5/bxuKel3yWy/FD8tYQ3FRPFTdCafQ5ek20mo6KG+11DL
	7ovKUjvfjEv4SpFlWPEwGNyHgRbGYRQK+nlYhMq3v5eLMeATgbW+3Bb/rkVshC6JRoUr6mWr2WB
	uS7+QYy4XJAbfyHTUDlrB4UEIhliqkvqcjFw58e7DT
X-Google-Smtp-Source: AGHT+IHp0W50xaomreGJxxmmd88jtHxu/DuyG6bK1IIkwCYXxvWjTK/YO8x/knJ4/fkQxpsnMxCssg==
X-Received: by 2002:a05:600c:530c:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47a8f91289emr195667175e9.32.1765910317025;
        Tue, 16 Dec 2025 10:38:37 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47bd932a3e5sm14498885e9.0.2025.12.16.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:38:36 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 16 Dec 2025 19:38:29 +0100
Subject: [PATCH] regulator: qcom_smd: change MP5496 supply names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-qcom_smd-mp5496-supply-fix-v1-1-f9b5e70536de@gmail.com>
X-B4-Tracking: v=1; b=H4sIACSnQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ND3cLk/Nz44twU3dwCUxNLM93i0oKCnErdtMwKXUsDC7OUxBTj5KR
 kUyWgAQVFqUBhsOHRsbW1ADMpPUNsAAAA
X-Change-ID: 20251211-qcom_smd-mp5496-supply-fix-9086dad3cbc5
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Devi Priya <quic_devipriy@quicinc.com>, 
 Praveenkumar I <quic_ipkumar@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

In case of the MP5496 regulators, the driver uses the same name both for
the regulator and for its supply. Due to this, in some cases the supply
gets resolved to the regulator itself, and the regulator core code throwns
an error message.

For example, booting the kernel with the 'ipq9574-rdp433' device tree,
results in the following message in the log:

  [    1.710392] qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators: Supply for s1 (s1) resolved to itself

Additionally, the driver uses different supply names for the 's2' and for
the 'l2' regulators which is incorrect. Here is the supply map based on the
datasheet of the MP5496:

  VIN1 -> Buck1
  VIN2 -> Buck2, LDO2, LDO3
  VIN3 -> Buck3
  VIN4 -> Buck4
  VIN5 -> LDO4, LDO5

This indicates that both 's2' (Buck2) and 'l2' (LDO2) are connected
to the same supply internally within the PMIC, so those should use
the same supply name.

Change the supply names according to the naming schema used by the other
regulators in the same driver to fix the above problems.

Although this breaks backward compatibility, but the risk of causing
issues is quite low because none of the in-kernel device tree sources
are defining supplies with the removed names.

Fixes: ad663ce67804 ("regulator: qcom_smd: Add LDO5 MP5496 regulator")
Fixes: 60bbee7db43b ("regulator: qcom_smd: Add MP5496 S1 regulator")
Fixes: 47894c859479 ("regulator: qcom_smd: Add MP5496 regulators")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/regulator/qcom_smd-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 25ed9f713974ba25058c9dbf38d36e88f70a940b..91bfea06b98682fca3c41f49ac127884143d282f 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -792,10 +792,10 @@ struct rpm_regulator_data {
 };
 
 static const struct rpm_regulator_data rpm_mp5496_regulators[] = {
-	{ "s1", QCOM_SMD_RPM_SMPA, 1, &mp5496_smps, "s1" },
-	{ "s2", QCOM_SMD_RPM_SMPA, 2, &mp5496_smps, "s2" },
-	{ "l2", QCOM_SMD_RPM_LDOA, 2, &mp5496_ldoa2, "l2" },
-	{ "l5", QCOM_SMD_RPM_LDOA, 5, &mp5496_ldoa2, "l5" },
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &mp5496_smps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &mp5496_smps, "vdd_s2_l2_l3" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &mp5496_ldoa2, "vdd_s2_l2_l3" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &mp5496_ldoa2, "vdd_l4_l5" },
 	{}
 };
 

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251211-qcom_smd-mp5496-supply-fix-9086dad3cbc5

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


