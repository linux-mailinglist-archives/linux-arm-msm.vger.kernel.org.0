Return-Path: <linux-arm-msm+bounces-62344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3558AE7C16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B844A1126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E0C2D8777;
	Wed, 25 Jun 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qJ0NtXLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC92D6624
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842800; cv=none; b=VdDiOQCiYxphfQ86zXy2+GPRFvlEKkSb9tiseBKl+0vxwBJPx5dCpsfrVyd++9F6Juc9Auh+8vaHwD22gxVbQ3Uz39zIGO0LLX6JURcSVqUz4JysvA1JcBuUlbqgjT6PHO+GeReDT87HQGEvySIpU5xWxOlgJtRyR1IOvMiDXYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842800; c=relaxed/simple;
	bh=JQ9w+7Zgo2FXC2Mpy+jdIS6f5XEOUQezkej2dK+ZYxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGg/TfV3/Hq9z1ummhPAfOpg6sPV5qEHEnOVAVki9kPgO2DtMRsJnJPMsS77iE2aiZ+btA3lRuVXyoV7AwGsDmderMepG6B3vfycKfz4Ips6QJ/UJiDFYGZzWlksNuov79giukfxNTKpbMr95O3yckbj9iqNXnLkS5vuyJpi1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qJ0NtXLG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so1219598a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842796; x=1751447596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMsHQKFydEWBAR4xJazzqmW53CI/637ZYZWhjeBquso=;
        b=qJ0NtXLGcOG9oFu62I93iwjHzg7UCklJqP+J5BRR38tcEJ6xCLV+BI04j7mcDRT7Sn
         ihotnq5jj1X5vnD3fSpw3I3z3VcR/Wzkssnx2IVqpg+3KCtLwcY+1UILNJtSbsyatcQ3
         Lqqlp+0bVuPFqVrdJehX8EO0W2HlU8H8B2FtacSvfB2kDFXR6xax3bb4NkPSSB+IYlRE
         IxEqWP004DfjgXiA6LFHIeajL28iGmextz8/ifrtfc2sRdQqSMTjN4GPLkpI0W6cDCLW
         a4HT8NkxZXmBAE0562UDrdhsFFibnBesDtQw3Lz9an1LVRphbBDdWbUGxJZCetRdV6Ir
         9gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842796; x=1751447596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMsHQKFydEWBAR4xJazzqmW53CI/637ZYZWhjeBquso=;
        b=iE1QoPaBvZP4eARC8oDXSi3jF1nJa5iG+IWuWWGVJZPiHSr1gid1ByivSLW89Du49i
         JTGgQMotbksHFrrSoKDE4oM9UFE4u1JHW/AqiEurW40WOfFK7ulrZdUMYsb2F33q8Luc
         ezIdfJqUrpaLZuL1YOs/EzVYINUlywS+vlmYDHfUxl3q5XOdbmnyG6EFaH98TkofppOP
         VZemOUioxNfq2MFMJfV7sFy+2F5X/oYDeyHQJtIa9YT18pWPoawoGqiqaXsJULRNPsiU
         iAguOwWbHSLAv9HYX9kZQ87fESuL4Z6IZ3B56UcGJ8ugNPbGo4jE5OgeeSVPz0QhhFnq
         gXjA==
X-Forwarded-Encrypted: i=1; AJvYcCVeJAz0EDR5Yo2uzcZVBtqo6Wz8WaZrNFzrgwIKYkW6EslWtINX+kBfWHJFvJ0l5fPPS1NdphexunFYa1lK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27OvZoOCjNRJfbd8ceeixI6RwEEBvsJ494g4ZedDrmlfSGwJC
	x3VDudACNfCvwKvexz6H3mPcwzmY6xmXZZ0YzzNvQGTGSli7NtEOx2tpPZ0zkFsE9rE=
X-Gm-Gg: ASbGnct6Nsp6UUaYdxfvRL0fT/HMyQB+GtvrgJB50STWJR2ZJuduv4C8PgWZfID1TFZ
	Qt/DPBZQrTNieOkWY1A9wIPZo4jbcWkEyLeYRUFcurid0Eh/JWCdaQR2a8HArRm5REUb9K2gs/3
	5hbTH/AdsJvlPFW4TyCxPoHhjUCgFxFYX9Uq+rvcyDCWtYDJ9Cccpc/ufiYOUwHJigDo7HO4Hcj
	sXdbV6Z3gg6S5pElOa0OslMURgaw3QdCZAQnWjolhq2Wx439hoU7YZQM1DZkIZLJyyjMyp3pEje
	Z8G6aJgaEbmcdtd7EhO6TzUeXzlpUbBh+j3PVgIvC2+l7YSwIRoKMKALSY/0IOFsmVLgJUAbFtM
	1L5xM32d9eJwg1Vu2Kf4zN7b/M4ih5WQq
X-Google-Smtp-Source: AGHT+IHqLUpjRRz2U5DvTK05gprNPcYkyY3qhvchJTvyKUvPYxRBNt7uhs3K836HbEKah1PslU0D8g==
X-Received: by 2002:a17:907:3e12:b0:adf:3cb9:e3b9 with SMTP id a640c23a62f3a-ae0c0621f50mr209003966b.3.1750842796305;
        Wed, 25 Jun 2025 02:13:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:50 +0200
Subject: [PATCH 4/4] clk: qcom: tcsrcc-sm8650: Add support for SM7635 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-4-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=1383;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JQ9w+7Zgo2FXC2Mpy+jdIS6f5XEOUQezkej2dK+ZYxE=;
 b=KYBHO9BrDI6wTp1yOWF8kGKqlw+3vOeKLlAUHZSfG+X/jL2hFROuM7mUcVR/4G/1cZmTk7/R2
 97m5sCBTseTBJy1sJfmDq+2JF8PFyvuLgz3qKPCRLGU1vJg9CqhMElp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The SM7635 has a very similar tcsrcc block, only TCSR_UFS_CLKREF_EN uses
different regs, and both TCSR_USB2_CLKREF_EN and TCSR_USB3_CLKREF_EN are
not present.

Modify these resources at probe if we're probing for sm7635.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/tcsrcc-sm8650.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/tcsrcc-sm8650.c b/drivers/clk/qcom/tcsrcc-sm8650.c
index 11c7d6df48c7b39f661cc4c2df30387836d2ca60..3829d4b283480b96cd0ec0d4bfa78777359730d9 100644
--- a/drivers/clk/qcom/tcsrcc-sm8650.c
+++ b/drivers/clk/qcom/tcsrcc-sm8650.c
@@ -148,6 +148,7 @@ static const struct qcom_cc_desc tcsr_cc_sm8650_desc = {
 };
 
 static const struct of_device_id tcsr_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm7635-tcsr" },
 	{ .compatible = "qcom,sm8650-tcsr" },
 	{ }
 };
@@ -155,6 +156,13 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_sm8650_match_table);
 
 static int tcsr_cc_sm8650_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm7635-tcsr")) {
+		tcsr_ufs_clkref_en.halt_reg = 0x31118;
+		tcsr_ufs_clkref_en.clkr.enable_reg = 0x31118;
+		tcsr_cc_sm8650_clocks[TCSR_USB2_CLKREF_EN] = NULL;
+		tcsr_cc_sm8650_clocks[TCSR_USB3_CLKREF_EN] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &tcsr_cc_sm8650_desc);
 }
 

-- 
2.50.0


