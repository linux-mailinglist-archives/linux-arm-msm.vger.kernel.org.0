Return-Path: <linux-arm-msm+bounces-76326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1862BC3CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93BE54F73F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81192F4A11;
	Wed,  8 Oct 2025 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AKeRO9cz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C52F3C1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759911489; cv=none; b=YitqfYjbsdKp2bB+yC/v8ATQFDt3fGaVYI5jgjoM1RPXewL2EGcskjgtj+gEkrkCRdWKH1mpyH9ASpJTb6dfpFtPIpmQo777amph7/7SSZYbnhazsCuUo0U6+D30KTVop6hZQ5QcssqrpAvlKcYO1G4d+TmfWra8j9hrRvEMQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759911489; c=relaxed/simple;
	bh=fwsfkO/edNU0K9G/U0ffbwq3ATl5oZ4mal9F1JcWMmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkDxrfs3/gIzD97X5bJVFtZio3+LlygaqgprWUxnZprlNXoE+nzHJct9/rxVJLWJ8VohQPLM1UrnF+Q0qFaQa+YIFgXp6eEWHRKERGjQvZz3DLk0lmh9jfDMH9Xq3J8dEjYGyMYqNxGqDKHIQmq5uR1Lvf1yPi2VMN9ibIaRwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AKeRO9cz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4060b4b1200so6177126f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911486; x=1760516286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=AKeRO9czjZv00Dn2+H0YSz8R5NTOJX9b1GgstI+U5Tls+1YkBSwmWjkJpjgNKKpq7J
         SK8J+kSC9NHeNZxYVDSRwSA5akgEUWvx8yoqfIdurubPD4vjFcZCa6gapcPX5iNFuDoI
         vzOQJYLDKyBvGqnL4nxDVmlzmfbOz0KUxebekf6MQwHhUCTig1wKbULIkcAvA+t+9U7e
         JLuPBW65qoN2ciELOuG5788WOr5/mRLYTVrpxsrAi9AYJuxqlSQsJDE2JBsOJslRs/PN
         uKCS1BiUVNhQFW/lSPaUlM94vy7buLAjGXlUsrpdlXpSKWUZqyXjO3mWp5Mk8RybHVfI
         qVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911486; x=1760516286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=wpYeh983/R0rGfGsqoAVLRS1M+9GScNviZMUzCKIG8t3CSIhtleyCBOR5S/JmvoraQ
         h+MF5zQ1VEVYOWL3a56D0XbaFKi10k1qxCF1IDYi2IUgoOo2CsmzWkHlJDnWct2zWbDr
         SxeEUzv6ZYsleq9Mhose6okm/F3n/+LC2ixyqzLp2zWsAaDEsRCgu34doLrjjOXf12NT
         6QCK+pZwIY/Q9LHlqRA0S3bW9lHWAr06vfetqBZMvg5U31qCxyovps+pTPW+sOeoi2NP
         iZZxkp8ceQiafEl6q9S08luemrv/Mlir/VmYzSx8wsGRzfXP8PDVTBEh8UJu9NdLpOJ+
         t4iA==
X-Gm-Message-State: AOJu0Yy9YQCnKVMXrUfGJyyNydQZzUYxHH8ITSL0q1LpaUmqDnV3YYZG
	OLKgP7YP9yNbh0mdh3mr8qTZNVKJneC5X6lUwV9F+y5WTGvCrWN5MvgXtxgg0SaiNPA=
X-Gm-Gg: ASbGncvzpQrLgsORF9ukHGxmq+2kcOzLZagebCu1ojtsuXAzNnpklvB1WTaJABP8aJR
	fHSHz5gUnwtzCNkINGXJy+dR5vLHwCIt5uw7fVJtJebdPsse4xGYJsiugTmgiqQlXz7jk06blkv
	dRy0wdz444atHK5M6zL38c9NyYDWx31Nt162ncl7wcbbz8CB9tQ8eatJeQHqhklTDuwYOw4S7EO
	Owyry9vpFurkmReHBuWaYwjV41duAPkGwxClDFm2SJIct702X6kZTjZwekWDvbmNiq9yVrnHEkQ
	2mvd6eTKQqPkVb5/ugJchWJbPvpvAsM6ERSCFGV4Q2AxlK0S5AO9gQuE+bxKVl63xq4xWix5x46
	LN67jhAtBSalU4mk+B7SH4EOTwAJnrJgsfYh2hIqn9A==
X-Google-Smtp-Source: AGHT+IFZ5tJ74Dd8NfGzTg8vtMg1MllO17lT82vWUmOq7OQ3gG3+s+nr7vbc7H7XnZcyQC4U55uDjQ==
X-Received: by 2002:a05:6000:2c0b:b0:3ff:17ac:a347 with SMTP id ffacd0b85a97d-4266e7e11c4mr1568045f8f.27.1759911486432;
        Wed, 08 Oct 2025 01:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:50 +0200
Subject: [PATCH v2 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-3-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XKd4Dvzw0ejsOil4omJOz8oD8d0/SZudynnYpUwSWG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h415mstwMbaW7Pd+AMIYxCLrUK+0mL13oDMj
 r/Lo2JcBn6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 ci4REAC4/wE7bcatuqkHrpg5e3HuhnTcns6CmyWz3AKa2/Puse4ECBVjst/2AarVW1uwOO54Y6w
 xuvwBtYsD5n/fFvMElHuDacPLVuUEKxPAGIvSa2rWXpQDz+/rDz02E618QKXcAOPAGP/udYMrGK
 pCNGnGHYbu3973QNtraN9l/qkIWonjrYC8j2DiHWxlmTG438f/ioYqBN8lGWNgB0gABdFc6nB4K
 8FAfZzZr12R3W/hHlSLye5wRbw86R8tPGuVI8fdB3hHo/EGTEZyhZf5VkYFIm0cVX3Dw+dkR9+G
 fZBw7gcfpi92uN9QetmOSiiFRvD13QpiD26EtbO74cinB72NGOXb6s3Fdnf5mvTa2Hwn87zUQme
 ftGnM2R2IZc8rxslO14U4tNEc5/bKHT/QX2nxSPQ+xA7riXel0xBu2VlP+oh+15E2H3jZ00CyN5
 zoBVnoXTTolGtT/AceoBTEsobWOnHMtodoxIBuwLDCQEn+URSm4esLLlTotDkCuD2dQVdY7MN7a
 dcpeDWTx6OCqZH2PLrk/Vl/mLsD6thI+Bw5BNhNO1pjh0g1zbI9+3Q/VvgEn4BCyowO1iS+6k59
 hoi68TOJV25dXJ73L0Os+xXL+7hQZDY2h5VBG0zeiFi1hNfB7oaUgC0GBMacCHqeveAb31UxRtI
 6gA8uKzLorgErgQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index aa4715bc0b3e7ebb8534f6456c29991d2ab3f917..0381026af0fd8baaefa767f7e0ef33efe41b0aa4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -742,7 +742,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.48.1


