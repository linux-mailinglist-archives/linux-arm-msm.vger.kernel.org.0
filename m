Return-Path: <linux-arm-msm+bounces-89401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EDD31B03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AFE0307C5D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A7324E016;
	Fri, 16 Jan 2026 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mOjnHEaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117B267AF2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569453; cv=none; b=NVFQkAn55pldBa9OgxTAE1Y/V5k0JsAxJfk9QIUNlQ0Zga50ByHyjy+Kty4x2oIIj8wq8n+kae5KEK+/E0N5GTz84K/NT+dcFrG9RRX/dshZ09MKJUnurFz/1CG+8sHbjoXVlif63NT0DmCQ9XA6tuBO3HuVWo6yMURaXJvlU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569453; c=relaxed/simple;
	bh=5i0VsvUcS0SUwOVd0wGHGUe0uBItUE4uGBSE3yIgsYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUvetYnzHXSdnEPi1otxL3/+EFrqFZQFOoDZShkIA8mqLA+QaVJHXC31NSiFRXcPBJedesL6CUNoTA60LHuMOhoBvZrutYdctu51zf/69U3RZzRIf/nc/nxeb7RnLeJpzxvQG1QTjVh3da8qe16MwMxuwdzBqnyb8aAVxXp0t7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mOjnHEaQ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8765be29d6so291707666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569447; x=1769174247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duq39jBoqDFtabq63HAqX5adf5fdfb9r8RBQ2RPSZD0=;
        b=mOjnHEaQ0xxNRyxaRCwgz00PSnpOxde71MA1Cdyi1PZpG1XySlKbhbPekX1OJPrphr
         FBnSrVjmcOvp6VIwJxNpZkarwpgCNFaqwl7PUkzMNSG4VAIORELm6u0O+pw5p9Fe7uKv
         n76OKCHRioCRE3mJXgxGlZwM+tDreLGwshH9yNW7dikStHvDuIBm/qCRxG9hUipKtJV6
         SuMtQqasEkJsxY1h3k/YQBnJq2xQmQfXdmEP8/lfuwflQHgvKGcWPoHCZpbsJUGFTRSA
         FrcopB4CMrUQDykTUbPwZkIgIh4fK5NREzImnnXvShug82Tj82j8k9o3tPdYflJQzFqf
         fEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569447; x=1769174247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duq39jBoqDFtabq63HAqX5adf5fdfb9r8RBQ2RPSZD0=;
        b=XaBLSS1ICSbcgzL14bK+YlM8MMg33keA7XaB64fFxoXxntuPlJAAt2yhfrqRxNmrEp
         6fN8I2S2idjAVCeEqOZwIyM7fwtf1d56LSwlW27WUEbj2uDOaqnw05RBoqaDKCD7C4Hz
         pswf4uLA3Mbl428ESgFGzLTM9BvP512dA0Jas/hH9uC6SWL9tp8U00pzJIRszpooxk8B
         kkfgyD5Zsqi2D75Jmgyjg1XsGik7w1HVv4slWQlFIRNLRq4Uwyu9BWlI6X3nrnuaDlce
         9zy827wX7VIibuS8AGT1mK6Q6adU3cHs7qJmNieHePV1oKfjWcct9PRAzYT28faC0v79
         9LRA==
X-Forwarded-Encrypted: i=1; AJvYcCWn3zOmefwn8/BDXu732i3933ZumU7OTkNeXVaNOBgbdIJJ+Ue67ESBrjTSyxTelQI9safUjClrsGik+iup@vger.kernel.org
X-Gm-Message-State: AOJu0Yy31yKBKzV6piGJXua7I71PFyajHqviowFNBCgNf8e5rUF5ilBr
	wPkRshCdjdfWpHmiDb0q45LSV4NuK5WZeJi2HL0dOCzBWDtEMEm/W9D8NHM7CdKTaxO49VIKB2Z
	pdewN
X-Gm-Gg: AY/fxX4tKT/2hWg9hMZl1V42TtsTIXOxU+O9/xeGX44W/i3/5xDl33Q6KAm3m5i96DD
	VgjqzaExrDfzIX19XdlOFElQ4RaxKLS+FMErMuMpBtj21dpI0QiQGpX9ggW1gosBObI/al8XCI+
	s8FlLpp4tt3ADnHmHPajxwHPR3fBOYoQWviExA/V1BJCAW32VNmiY0WvHUUVi6wLszBclI5+t2w
	+1qwbT+Lt/GqOm/Aam7RE3TkPVAnmrCwpQVF1LMfhFCtu2rF6I+4aUDZph1ICGOc6RcwpMtySYW
	EetwFwCauTAZNIPDg8VCxl0h7Rn426b1Z6zsWyFrGg2PG6SsPaVuKss/lzLZCPWSulB0cp83dur
	A04HkYB7w+h99hkr15oOqH4lAbEAxuBPCsMWJKq2aWpAtjBXDojuFMk8no4BCb9EZNzLSEKURU+
	bW3M9aC2UY2bBuZBmfN4QRgiTXas6RHeZg0yFcavM/LHgiREmHe68Un9+p1NNC/sLM
X-Received: by 2002:a17:907:25c7:b0:b73:398c:c5a7 with SMTP id a640c23a62f3a-b8793008849mr255921666b.41.1768569447170;
        Fri, 16 Jan 2026 05:17:27 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:23 +0100
Subject: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=942;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5i0VsvUcS0SUwOVd0wGHGUe0uBItUE4uGBSE3yIgsYw=;
 b=pxIbdFvn4Pi8X4MwhDSzKXEcKRx9BJ2hA91ot6BC8vc+Xctsgq8QVNEsD4kc47w1mvuNfbMGT
 fbkIhmEQvCTC+X+GuHJJaZKe/3EgLXqaOD5082PO4UqZCO8X7y851YF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This GDSC requires an interconnect path to be enabled, otherwise the
GDSC will be stuck on 'off' and can't be enabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-milos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 0077c9c9249f..45e68165a2f0 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -30,6 +30,11 @@ enum {
 	DT_IFACE,
 };
 
+/* Need to match the order of interconnects in DT binding */
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -1971,6 +1976,8 @@ static struct gdsc cam_cc_camss_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct clk_regmap *cam_cc_milos_clocks[] = {

-- 
2.52.0


