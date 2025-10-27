Return-Path: <linux-arm-msm+bounces-78980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D012C0F0FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE4EE4FB85B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670CA314B77;
	Mon, 27 Oct 2025 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VAs1RItZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFE313547
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579912; cv=none; b=WimIN9mMr2EwgYIpRCrtCMxMt58UDPtcyAst1YKFX++wl1TIluG5wOMP2AGgkZrKwCQDBN9OMCkqcPpgUx0fQx3NkDDkvNSZlj/QFCahVa/dgBrI34nhbymMSLSi/DmBvoj+nvDSgZPr/Zu+m5DwgaF2kbuwh9fWZpBb8kaIQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579912; c=relaxed/simple;
	bh=Rsilddn5Sk/PNb9loA2m4U6LcOVffhba4b6v0fmItZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqQSpdrodslYrJyVsUda80zXI+EA6g7crj9nCqb9GaDz2PiRupzQ1XWds5o1T2qhAMrOGxFN7QCXSKlqJ/ch+5VMEwunxe5LvgnDQBYnrxmGeHVzd5/tPsXPYYkY1Zqf8Ibcvo45OPej2qmfawpzciqjcWgyaAbT6sACy82+T7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VAs1RItZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711810948aso35215065e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579907; x=1762184707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=;
        b=VAs1RItZlhAN5Yi7DLju0yhgGx5itR+LbLkOaURUrlz3JI/EsULTlmfAwxndh2lbye
         HFiBDCjaWzg8/tpRai3pKt7e7KntzaNcJsaQVc6F/SO0ozI/U8W03t7CARUHYX8NsRZB
         lHJfjeYk2mEcSKs0tPr5LGdrF4m7/qF9DfAPRJQKBkNOVZ3wF0lHD6TA8NVK3bjkm2ic
         /AwEVMn4/of2CCUR5MT7TG8/5HZFS3vywfUvXmNCNj81eOVqUHJ5nAducpyhgnJy5jiF
         VbNwRM8B2afoI1dAWPx/mIMxpsXAlZ29yJ2zdukgV+QpCuoA7SFgU22z/V/dSoiLHdld
         SCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579907; x=1762184707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=;
        b=Lfwnu0nn1/4JSb/la9iRsql255jj7pE39g4to3WvsNU7tK231PBC66E6+7pCyvcrpd
         phnTC7dmTwKumCTPneQRZYpdmplPNbJdngZxqkOld8DLHrqWUhjbeSTESGBxI5sKaS83
         I4T4PagbvYcBtuA4w5rrpuWUy+g6lQucR/SyL4nFVLJBndaAiUGKup43I9+2lSRkIGhf
         xmc7zkxBQm/OvAhIJU50QlBadqd84L8mnGn12uahitcATNoQJ1HqLHifIHkaqSjJ4kdP
         S2xdc81cbNaXa7NPjy9PZGrhLXnKADpxN4IsrAhf0tzYffrQ5KmWu34Xtgwx9XBrhXPe
         bhoQ==
X-Gm-Message-State: AOJu0YxU2+Sox3R/8C9CB6guovEVS6BsjmWJ6Atd4OrFNKRmaRaZcKwT
	Iz3pgck0OFVll9ZK3yOPldbGUnTPyhLH8RLpadKXKTEUfPqelIdobjxOcWidEaAM0VQ=
X-Gm-Gg: ASbGncsJ/5e4eTqOKIY3q9tAVc8Pg4p0/ia6MQFHJk6yzkg00nYC9h2FmnW9J2dfHgU
	88tyKTtqGdivL1yUINcPM0fyvfm4EroUVzQJo5I30SH24Xb4BsMonLSYryByUz8xwUmTli9n7i7
	lnfQtGzIkfFK2GUBwP0JaomNLXSyn6dvIEXgXh4Fbr2ZYJp+qHRXZdojrxbR4K4HGVGLcZMxhHQ
	9d+AVQof2CgyuOvmZF0yFLMk9T+b7jHgdbtmw9UjRE476B4e8svOMbtHkICF2PwHcUspndUeOAQ
	dB42fxJYwsPPQLR/fEqdfNrSHwYzwsUCEZV7gbnjZjJRxRYDk4sqQxkCrcrUIvndIDUGHClW9Il
	37JrOG7WKIIGZpN88WfIY+Us0Y/6ubDcvcQoUBy77NKnxyZRmUv4CTe1HBumBXfaBLDdGTNJkh5
	CcHfuN6Q==
X-Google-Smtp-Source: AGHT+IECWyoE3V6eNyQ+Ni8Ig1arWy6NtdUV/t1u+09OLLf2glJJDnd/F8BXPUeWLSqyq4r2HXl0iw==
X-Received: by 2002:a05:600c:3b1c:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-47717e633acmr828955e9.36.1761579907219;
        Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:51 +0100
Subject: [PATCH v3 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-3-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
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
 bh=mTsLMd9S404QxSew2dDaObEMEcD+rURz88/DzU+Cui8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7EtUYevy0KNURGjAbWD3ayjri7A65CXIjY
 quz63CLKUGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 cpbXD/4rW59U3OyLKQKSjyyGQZLRkkV8UI/gn6+DtitezsllRAWiFL5xVrZxt57QxejnFAXi8D2
 ES0aolYvT57xfwVmbnieVs//EfL4Nq2ufUvnOJRYovEMS8cCxZ0FdtbrDV55ZFA2xHFcRUbpeGT
 +kcbYMDKWwu7pmV+biu9VEX6h1ZsuN6inepunZO6CYaGeUQOFyxJgf7ZY+nVWGvFsttL39Yai+d
 47t+qO1FSkpLxuakyURveQR1OsD0K1NInybeUmT5ApMUTKH2qNvpINsML4eTdL8yQN1zDL4mJjO
 zvN7lHjuKVJzogJnKQ078cHKC4hZ37wTHXuLwlHMG6URPvJbZj5MC8vvsU+tYoAnlNa5og0EUSZ
 R6gp5VYDQjzuERZnenBkmnx1WxQWAELVzPGpjwiUZ4J+UjIsk924po+ncs6LLXVCzuZx2uVzOEF
 y3FOVDZJSxf+vY7AR+vS8gkmZX/d1ZK8IqdnG5pOqB0wClGIfY1ZHo0Fqi+HqYfAvQocNAD6Bds
 m11j2pa6BtW2jcLPAxKE0gGZK397ZfEijSV/fIFP+LU609n2HiR5LiLaZc5BfPjYZgBAezW96l3
 0WyQf+SCZ6+fviTWrnZYwhzrLPFBH/4e4GWB1aWkoTnrXpLB9ivxHseQnnGvlI6MPkZ5n2/WLxJ
 /yj4Q1OMbOUwjFg==
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
index b24134923fdff0de8b608c140dfb8ffaccd19303..ed799da4e4079b4da4b555dd119cce8c6591aa39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -740,7 +740,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
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


