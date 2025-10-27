Return-Path: <linux-arm-msm+bounces-78984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF1C0F0CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEF6219C57EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2552225FA29;
	Mon, 27 Oct 2025 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LlLW3+UP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A431618E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579918; cv=none; b=IiF15/dtZzLIO45NZKkYUqOIEwN6/DTYdEpxCMTdeuJffCDdhO3rK+YTp0cDwW5Qaw079yI7tcqBZL2tcFc0qY6xoee3OeUCGrJ/iIAOKpsOk0juLogcX4kLkdP8EfRI9SGQXnp5Pybd4n8Fh6I1iUdTJSGb+Em94zluUc8u6H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579918; c=relaxed/simple;
	bh=l9RtVNC5Fv9HEtVFzEnmdGSQ5TtnCI0n17QaytPVRuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQwm/ObC0px1ZTLNA0oRflzlMjlFLWZHHBklC08/ymMsh9iVJuddhSov+Urj+3bcBbv7K0ALZjmorf641k3J083jlvLTmswYXmVe8k/JpPCa9AQw9tPo4J8S/Yah6mwByttn5JNkx49OE26W1azmwera9FMSAumXS1Jz9jwqY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LlLW3+UP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47118259fd8so36393915e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579914; x=1762184714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=;
        b=LlLW3+UPRi1KYhTwqZ0LCfvUp3jVRc46PrvNQsVUjTwgLUQX0VrdAuo3QkeIZfMqiX
         jr3v2TNmwIYdOFxH3NiolvGVjqefMNfYzjYX2McVHaPl573T69NeAxtYfuWoRWARLzkk
         SPRsyYqDOAJziQb+7JBRlAjkoXmSxNl1CnWd79vDhrhXDd3BRlCyk4kGaq7ND8iyEdPZ
         1+eOUiuNEYNe3uO1d3MZUgxPrkOVSiXRzCRXIoPw0soM+1c2KdLruIK79RvMLpocex+G
         8PW91WO5UdkLw4/21sHpHc7CIaSDfYWV/ifgUKmvBlhTqeazfw15h8J6kZ753SQ1nIPO
         1/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579914; x=1762184714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=;
        b=n3i8slJSL56KAoiCwk863J8d51raSqNdK91V5JKDsicoPB3RP87WZp1jnpMc8fQXes
         utkgePRX8B/2JLvZolF0FqqikemyF/6DzH0O9zDjNCbrgtTh1NusUMPpQNEohNpvIhJJ
         74WBgEAF/1JGfXHSWmtaiuPTkgCSEIVH+SSupgio5q3bNW1MuWR8HgTi4+QK20jn0JJM
         gU7GZITzn+UpZilLVWdCbrc2E3dpfB2t+Dnq+CjSODkEGyorwpesn12+ovQ0KLUv+29X
         bHZkXIuRLL6QbvXlliK35nC2hnx9BINRQxinV0KHc73RMxO7f7FVRRXR/55MKlE5mEsF
         XTyQ==
X-Gm-Message-State: AOJu0Yw74uytAE6bnoTb+UYFV+pndtZqBJ1Dgm/kKMknd7E0h37dFEBW
	SCtTDXqDEtGo/n08HLfpX0s4T7/HeH4IRObwC8WPJ/vzjooo6LlrdKt7oiUVwwix/4c=
X-Gm-Gg: ASbGnctHFYyubtTa4cJ3c93Kvdx5U8b19dHiqhAmrF5W9/yNhHzOhT0gzdGfWcveR/7
	RQoRBD5qohnkhGKhr5+aNS12wZtq/O+wcMuzngD61lgWGcyzBDXx+2F1Nvusirm3lmhsIWymZ0b
	kPaCA6VqSyxPUVX8ASrKYMloq/VQUhngOZ0z6JqLbapkEJZv2kxz48iOuAwxZQ6SkG7usoRyMoI
	YNREslSCw4uj9Yj0uufCc2tyn4T/zNSKE78gZLe625QkCTBzNMVs0VYeDTPkEHEYkvwGeS/E3vY
	FTCNxak1nMLhuM9lvXx7H2cGsvegdl504mAI4ROqwAWp95RESRcP3C4STU9G2xSWtCkyMh1AP0L
	i7iqO6BRINYWdIrTB2G8BjVMfYcK9iwv7WbCXqiNE88D4SUxXjn0tua1En5nYoQrcFQodUV0=
X-Google-Smtp-Source: AGHT+IHRGKVi5MN0KlmP/QWn9GK7Gt4IncDu1UnMNHIlVsLNKr3cmM9451HaPofTrSWpTuM98bmS9w==
X-Received: by 2002:a05:600c:45c7:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-47717e30926mr964515e9.19.1761579914067;
        Mon, 27 Oct 2025 08:45:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:55 +0100
Subject: [PATCH v3 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-7-75767b9230ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5Gxjb/17qAbEtiGjyBW7mjBpKziLG21U9VH1r3QiV6U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N8BBE1xELlKYS4ZKFTuPBcaEPIPgSxudZ/m
 3UORCOMzZyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TfAAKCRARpy6gFHHX
 cmQWEADIxpsG6tmx74j0WRSxVrRH/JRNVBzM4zS/ZdSdSlQ4LxTy1mCDLEtm4Fi/6+WZ/SZiWXI
 1ZzMvymBFVn2D0iZPoYzpkAabamHrQrlQJe6noPUboVYrfR9EeQ+RKSVikMZ98pad0NLj2bT/Nd
 4a0XI3jAoeBjMPegufW4igZP+WeYXpxgIdkxP5b55+7iDHEpWwzDMAFklDLzMcQumr/YYWTAzD9
 mjGM4WGouN/jtGgNHac0Avwd5CJ704zorc5h0XENpiBH/YXCdg1xhJw5RkIUVk9lsQyWS86Hv/H
 P4OSHiq/vBYXZusrl6cMzGlolvc0S0PB4476vZC77MyWRhAzxLtSxRuM6CPLFVxDh7QLA3/kdmT
 iGGSDxGcgn6lvKEQGropggTfrMvRcxtQCSyScQ02aEw92XnTUtqE5sF/4o8R4DYIS6o2sd/RYFA
 eXK4HuFvPXD9fc3ykTGCtnvw+fkq35yCAxUFpNBpB3vgsIaRb3WV5CIS/o+IukZkU8YGX0bXfVu
 J3Plra45gnO0uIBzIJAGgU8uIyRtlqQM+BPBboMu/B9Mmm1UmgksrUDEMv3y36cJ74CwygQcivF
 fbOG3nv0FvGk6hBfzztxguJORGBB4Cepg2dnoMFUVeJK20HwbhY5inwbdsKL5uGhXchr63VTOD/
 KOj+W54h3X1BhaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index c25b4b4581f9cea6107a39f0bc6165be6955cc1b..840d44f052786a79b85d25d2181467aa96102ec8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -124,6 +124,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -644,11 +645,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -879,6 +885,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1


