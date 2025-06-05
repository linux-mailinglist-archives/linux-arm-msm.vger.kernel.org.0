Return-Path: <linux-arm-msm+bounces-60363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C15ACF57E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 097EC17A505
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE3922A4E8;
	Thu,  5 Jun 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSZ4LwQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D513D521
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144977; cv=none; b=MFJTQ/vrMY5c2VJG4DP7INOHNz/ulkYNZ5vmYIMvBoYBJ87jilvFm+xbdCZ85+G5+UkPGMsWzyj6WpjRiaLNqaj+pkgcYwz3gHCr1V8imNH+W2uaY2QSufNDwpQ+YmfT8n3DVttA315b1eptwj8hoXBXfbBHmTY2hqXnPp6RJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144977; c=relaxed/simple;
	bh=dl8Jg60ElVh4ZYg5JYQyBSog9Gk/qp3bgu5GdVsMqhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpovoZWsy0aCl4vLMZbJt5ZmA+FM4VG4M08bw9JQiwQcBKsRi+eqE9LiX+Az64EbvdjNpS7YtpYp/EQTWKhXZA4HJvwIc3vvIRBt7EucdURMc/oYMui3gLrBmUWsPB0ECCojfPYxiNuLOfdVM+ZN9i3H1iOvZ217IqpgQ8K9onI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSZ4LwQs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a524caf77eso193805f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749144973; x=1749749773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMvfcfOLF48v1uRyKZXu/RrHT1jhYeWqfpahQ2X1A5Y=;
        b=cSZ4LwQswzcelV49WU5/Qwx25g1a7IC8Gw358XJS7u2Lm+pu9QERuzPhqjvkXDbBgr
         6kY+PpifncATswB0oKVrtu+EeG1ZkjA71C5ZDkO1KOHZR1GNn9NGrtqSunQ4u9YPm+mh
         GiOdBxefpbsAGXAvLeibRd6kixMuYQk77yXokemsh3l6G52BlCRhdO3WkwUaYDD5xFMD
         XaWr50y480TMXDMD1cQU4Vnc1pYQOdSgEPGABfIxB1JnKPPZBf2Rbnmz9GYLUL4lqEd2
         W+sah79nxQBEeZ9Vqa6O2KfzJlxNZOLTocQy5cnGf7BLPazg1v3QFdCM9YSSNKLlBQCe
         ZH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144973; x=1749749773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMvfcfOLF48v1uRyKZXu/RrHT1jhYeWqfpahQ2X1A5Y=;
        b=D0O18SDZBv0w4QetxZkZHvLFp1YC1FvoKUqOK0HgktTUfmtXVVcDYCEYdqhilMYooX
         lVfu+HaAHEKF2jeEr9C8haycRUs505P5f0F7QR6tupnCS8FxgvyxUYHttXycXdQKQljs
         8AP7dGJ+K5RrM25qtEHlLFOvX9F3j3lfMOQc7QK1WHKzNNgTwJUNVmezE643yOOdqhSS
         Eec6APk1bjx8BPFFunBvBqx2JySWpOBc4RaJ/aa+wXklCRckKKBOyfPexe3m40HLsxz8
         5XMbeYUE3/lREPF1oCyGMOXrPfCzeCeSHKyI2D60v5/MdTpAZfQjKNgXRJ2k8QXpnzUx
         AjRA==
X-Forwarded-Encrypted: i=1; AJvYcCWs3H5r6iVBAikYRkxqrI0DPFKIEBvHm03GpGhZARRPmEEI4XN32AZLOFhleKZmpGNemSouE/ll59cWX2AC@vger.kernel.org
X-Gm-Message-State: AOJu0YztJ2ugjhKDyuxv49pLrcltSJWjTObY97YmSqlp0w+OfSVX59gf
	SmJ2jkFxQ2TbGx7DmGVHRpsmt8u0LFRAR+kAoLV9SoW14wsoAAiIHB3hsSTFAKQ0tV49WHusB95
	xInJA
X-Gm-Gg: ASbGncvXinMc2OhVH4YAKgUOieZeWBINWtj42B77vtY5q5gV2ki3FpSNLrHHqgbtYKK
	2lyAyeOnYT6dpsL0ByfPXwcv+1VfIWXswZ8jSuGBzt0vLRzk84028DHoTeyaJebpmMxFza8s7ml
	Q2K5Xu+AncuVYp7bldAKbAUdzyjGxbuh6+VnW0FLA3zf/z47m/shZtYmoQicS1kl1h8yQMfQVJY
	HmTa5DPZvocJDpjV/KdiiW9UyPr2rjTvjaq5KKY9u6iVhpBX4dIncIlKpgm/Qk1l/9JiKNFJ+/5
	0qq2hnxbktfjpCUD+ii652tEPt7U0W/m3xfcruwzxcSITVI/ALs/ODOD6/wHYRbK4mS43V19
X-Google-Smtp-Source: AGHT+IETnhCupdaOviaQHK4ozrpKn6IIjf0eM/B64EnImOiA/1lyExI1946ZBaKtrzPDwgK4NXiOYw==
X-Received: by 2002:a05:6000:18a4:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a51d952bf0mr2560096f8f.10.1749144973112;
        Thu, 05 Jun 2025 10:36:13 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451febed5d7sm9711795e9.3.2025.06.05.10.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:36:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
Date: Thu,  5 Jun 2025 19:36:09 +0200
Message-ID: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=dl8Jg60ElVh4ZYg5JYQyBSog9Gk/qp3bgu5GdVsMqhQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoQdWIg0KFlLqP1FkVueD0UsRvJ00CqeHqO4uav
 Ac+lFcBHjWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEHViAAKCRDBN2bmhouD
 10vOD/0ZMt4+8X+Vjca4R+MkxyjOIH9VunlrWkdoS41xwOdrV2c4SMfXEGbYdA5fTDUKKOEVQee
 s4zBiNC9dWMQOqV4F8ybyJtA3ntvXGKZo3gjBVE1OVgG0yNT63xBE/R99O6eTF1DmB818Y5JEsZ
 G3xR7txsU9JJrqXxboShpg/QK3/lWD9bLIZ1FPaDqJ25GhMSTMaF2DyJTXkaVb/zBuL0siWMD7j
 ObtFLvnylLf22EseMJmBcRDBMHOnPjlVMrW84QcmoKZBfv1PZSXXQ5DgDhB5gnlEb5K+korOT08
 iQi6MEqmRppY9u0Gk0uQEPWgDMTfgoiGZUUFH3sI2UNTWcmcCnOfX2jzIwwzJdxz1DyLzvnAiw2
 NWkuYGP/xPDgN+IquvM/97zNSzcEqpPKwy3Lqitgc6uRDHZzOPbX2BxyONcs+d7PRwMDBhBFO00
 eSX+htPnWVKK8gRgf9vQWetqn0ZLfj5jEnIzZSL35JPB2OYzEadbjv1eFnJm6Q/uVl6eZqPHrO7
 fjsu0dDzeSGvuIKyLr7VNP62yJsy//S6eWxeeajQfU3Sd5Hsy/j5V3hQl04H4B1yuv+QJnDIafQ
 UqyZLZEK8y5w6cerptvRGjHofkFdBLsjsYSfmSGbRMtYVT4S/CJc8ISPpAg4GBsXRZsnNR2zKjI eXOyqfAD7b1dIuQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Enable the drivers for camera clock controllers on Qualcomm SM8550 and
SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
DTS).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resend because I forgot to CC right people.
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..2ffa590b962f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1404,6 +1404,8 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_CAMCC_8550=m
+CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
@@ -1431,6 +1433,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
+CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
-- 
2.45.2


