Return-Path: <linux-arm-msm+bounces-1470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 029977F4329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B741C20AB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7E04B5AB;
	Wed, 22 Nov 2023 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Scygxwai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82823DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:12 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-548d67d30bbso4182039a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647451; x=1701252251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLFPkW/MlV/uq+oo/Ao5FwA9Bhrcu1wf5pve2aYJzvE=;
        b=Scygxwai8F4ckcniCeXoe9mdtOthp1fM3jRHg/g3ZOxvjbozz6Z88lgnrkdGZHYnGH
         k3vXSSLHY5isAQWtV1plRFJzo44xxRlKuTEP7hoU0+UEvlG7Cr18Zv0ga/hqnPtA6gng
         IxWzmyQvU73LywUiCHROXbHipxTM2J3vauFomX8hG87/oGCckgIK1vLdnH6tkw/YfQFD
         iENcdBFPAori27qChhxEMBzOXbeW+I9ZijORtQyAxupFGco6snwSpvWK/9rR77bDWLk3
         VETIfdvo7ToCLBs0oNrK6kz6lAsYcLOCh/PeXUx/2nfa8f7Akbf6kaZ+JmRdyY7Flz6z
         qCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647451; x=1701252251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLFPkW/MlV/uq+oo/Ao5FwA9Bhrcu1wf5pve2aYJzvE=;
        b=Nya50yjWjqWbn3NvTWKxR1XYa7blXzsB1Gu356G2Is+AXJMbZtYOaazvMKlBOjYmW1
         4f3cV59gMnhqfxtYDKV22EJaLI2vPkI63PbnRcjLQ7nPfsrjEkONZ4Otw+xD9hUvAJ1l
         uTiKB//QFzo4mP4Hjy+hyjD8L31S/marWKAsOpX5M9W4jzbB7NnD2Trd3OekFxiU3/zC
         0PWOlDSZiiKIWC479RTHp9SbeqcFgI71u8wR75sRqqSIoZYxPe5PD7RKbwJ5GhxSVfl4
         OVI9mUcd5t/S2KNO+wgbQLrBwCUQqPk8bTzTYBOoxNyP2vd+PRIjUBU+DGKBqUoY/gK4
         pYqw==
X-Gm-Message-State: AOJu0Yy83XGuBMrQpBMbB6cqdVDyWy3J1fgFtaWu8ZYej/EFuNP3h6Gc
	R3RQJRfVYCqf2JaWV2lV0K+df9OzpS15jBtLX3E=
X-Google-Smtp-Source: AGHT+IHdDcR3jLfFw+Fnvj4HxUO8NreAp3BGyDjawRM1EQMcpq0SK4I6POFVvH6XkT4cIhsEVDApOw==
X-Received: by 2002:aa7:d158:0:b0:543:bd27:f4a9 with SMTP id r24-20020aa7d158000000b00543bd27f4a9mr1253990edo.12.1700647450974;
        Wed, 22 Nov 2023 02:04:10 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm6110456edi.28.2023.11.22.02.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:04:10 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 12:03:54 +0200
Subject: [PATCH 2/7] phy: qcom-qmp: qserdes-txrx: Add some more v6.20
 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=CQCC6Yo01m3EkX7DFbVM2rHCtyL2n/UNlvvZq6QHvbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdIQ4jXPQZSqmEmRr6E4lDxBv+hNol1XBRRHm
 GNjV4UYEnGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3SEAAKCRAbX0TJAJUV
 VipUD/9Ghzw1LnTe+JfhAgsUpLbfkWH/CvwFhlDdZj2Ql2+LcZnDvsCXImob65IsPx7BH3h4iM8
 Nl8Dk74jr4I56GaoQTtsnb9VInWu5AVn8Pf2R3JVBt2jwPdgOMgPZCm5PeD0ckBtpNj6lOiHpkj
 cYICPvKJ1YbR1WMusstk9LNrGT7qGN9y+WJQe2gZPJJjTtGN3PB9G4dbZaxIus0J3GbtoWJwAwc
 Wgf2DcfIYduPqw6kF/guL2IoqIDUs6g/gEWxpVVZt2Em2ifasBzxMYkLFpJcgHHbA+4iYfM8X1T
 jLOejesPOmcxsyaCgZDEQw8eujdwxeEZANUR/MHIO2Qa4J4Mr1ZBP4qQF2EqQQAb5iHp9vAE5Qi
 y4CWV1eoPjFooQx+LnycxqFYj1NC52t36jQabPWfy09s9lLeSTtsl8/iGpFbN/sfoo95Yuy37Yy
 SsN1QftljzDfqfV0Q4eIGrYy1++/F9uSiNWYJh5TW87A3hHzE1RIc9Tj5GFZ8RAIRpoNdxhO6f+
 C96Wrw5r8ukHi7FrdkbFXq3nT6XpG4aC3atWQvCs+CmFFTfRFCp+PKO8vK95FIQ0SYqA7GN8+Id
 ELzHiPPDbPGnDxFhF8jzPQ9df2L20fZqJd1oAMrAeCYg8VMjF3Pa2MhJkOIqUcJKNGKKs1T1Gdo
 U07zTLFhPs9S7Ww==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add some missing v6.20 registers offsets that are needed by the new
Snapdragon X Elite (X1E80100) platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
index 5385a8b60970..7402a94d1be8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
@@ -14,11 +14,14 @@
 #define QSERDES_V6_20_TX_LANE_MODE_3				0x80
 
 #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_2			0x08
+#define QSERDES_V6_20_RX_UCDR_SO_GAIN_RATE_2			0x18
 #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_3			0x0c
 #define QSERDES_V6_20_RX_UCDR_PI_CONTROLS			0x20
 #define QSERDES_V6_20_RX_UCDR_SO_ACC_DEFAULT_VAL_RATE3		0x34
 #define QSERDES_V6_20_RX_IVCM_CAL_CTRL2				0x9c
 #define QSERDES_V6_20_RX_IVCM_POSTCAL_OFFSET			0xa0
+#define QSERDES_V6_20_RX_DFE_1					0xac
+#define QSERDES_V6_20_RX_DFE_2					0xb0
 #define QSERDES_V6_20_RX_DFE_3					0xb4
 #define QSERDES_V6_20_RX_VGA_CAL_MAN_VAL			0xe8
 #define QSERDES_V6_20_RX_GM_CAL					0x10c
@@ -41,5 +44,6 @@
 #define QSERDES_V6_20_RX_MODE_RATE3_B4				0x220
 #define QSERDES_V6_20_RX_MODE_RATE3_B5				0x224
 #define QSERDES_V6_20_RX_MODE_RATE3_B6				0x228
+#define QSERDES_V6_20_RX_BKUP_CTRL1				0x22c
 
 #endif

-- 
2.34.1


