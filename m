Return-Path: <linux-arm-msm+bounces-14368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27887E6E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C733A1F21DB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFF72EAE6;
	Mon, 18 Mar 2024 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYKdEo0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEAE2D04A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710756592; cv=none; b=SaKm1/0nRjpniVSXehJsCrBwc1S7H7mZEQQIKsXyFrl1m5KNdDzHraiROPu7Txdd8emV0IJOFqXnNXlSY5gFEFMd+3VMXiZsWta9DLB5GTEvsdv4J3YiCO8V5l9XeNiYSC50tFuRlIMl5A6w6rqeyZ1QcNt8HpwDtEjyqnfnoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710756592; c=relaxed/simple;
	bh=DeCjsQ5PeUHD/88dui7ovRM6BI8RHH6wgjgJJFECq5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=raEyMaOyRY7baN4TbwVXxKZrwPxNtoSjngEC/d15bg3XwTe4kdqhCox653RKtQm/x06HuwBGRkbUlpJi6fokffdWAnIOkgqaLqiT7rO2kPRmVIUrTN5f+XP/sTyqLmuZ5EBMedlMciZHqQqOK8IU49Vab57Qb6aX8DaJtfOHOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYKdEo0N; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4141341f1a8so2288445e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710756589; x=1711361389; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtF+yOpQNOONuCDI9st+IRtoz02DBxkMt0iLKp20R94=;
        b=RYKdEo0N7T9Mo/lXstqU//RUK68+Bq727NzD6aPz+SO9ZqQu4aSK37airE/0p2blr/
         0QUg1b/6bV2VO5jxTG4FfOoVmo++oM0CS4cPs5FNfi/CN+/q49DUIBKGji6AetFnPojV
         ta3GdGfqQMf3v2VxLJA6Z0eK6PlAwHhb2HAhcMh0YySlSc2/wZIlV/Pb/EQFIpFlzlh2
         MBMZ9kuvALHUSyftycMB31pc3MqjWvvPzeEMhcLxP5AQ46Swr6NgJC6kkvkMbV9Ji4aC
         ZSCJb0ik48oI44aRWcNTfv6031x9SzLEmwWXw/EnPwacDNhRxmtwHx/dhtBH5PzrMWpd
         zu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710756589; x=1711361389;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtF+yOpQNOONuCDI9st+IRtoz02DBxkMt0iLKp20R94=;
        b=kQyg7J+IbE0MLZx4/AsvKkSB3y0ybmuZ7pzgLNWPXWGKZVWH8molV0faplTUpJ/CaR
         fjzdzgkgBMpb5UnwM4FIxuvo0PD5g9iQMNqpZUBq+OVYWf1HAAtnzwtl2nNmwPfqBErx
         ayFez1lo74YHxkYO64aijrobkho5+rpk3L11LSUYb98xBxf5dAbEGKFY/7Dux2FCM3EG
         deZo3fZGww2pEthoszef6B4UpUG4yGR/YvBpZNWG7Du0ncILPP0P6IaEUxXE68m8atru
         EQjNH+idAakP9yocK0xSgB3tO7hQCwzX5ZWaOXusr3qJ0d7EaR3f60FsoZjAv2YMfp8Y
         k+Pw==
X-Gm-Message-State: AOJu0Yx69KkO1cuMEtH/k6mbNkHB8OxnK3lOcAiDs9FIu9LxJVGAQn8y
	6MlzjdkJt11jvmTi3s6iDBliDL1mh8sLYcudP71IGfNpVJa3wFgyGRrFcgz3Mfw=
X-Google-Smtp-Source: AGHT+IGrmFGae4/Uj6knMxX6VTIGWLmk7JssTL3V9B1ps4GVTQlVFxnDV8ZF7QJEqx3JNQ+rJyyytw==
X-Received: by 2002:a05:600c:3502:b0:413:f3b2:d807 with SMTP id h2-20020a05600c350200b00413f3b2d807mr10948169wmq.3.1710756589242;
        Mon, 18 Mar 2024 03:09:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d4688000000b0033e3c4e600asm9533734wrq.7.2024.03.18.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:09:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] drm/msm: Add support for the A750 GPU found on the
 SM8650 platform
Date: Mon, 18 Mar 2024 11:09:44 +0100
Message-Id: <20240318-topic-sm8650-gpu-v4-0-206eb0d31694@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgS+GUC/23NQQ6CMBCF4auQrq2ZDgWKK+9hXFAYoIlS0iLRE
 O5uIS4wsPxfMt9MzJMz5Nklmpij0XhjuxDyFLGyLbqGuKlCMwSUgKD4YHtTcv9UaQK86V9cqrx
 KCEvUImPhrHdUm/dK3u6hW+MH6z7rh1Es6w8TuMdGwYFnoAoJOpOZTq4P0xXOnq1r2KKNuBWSA
 wGDkGoCLXWNBPlOiLdCeiDEQSAtaqlVWqkq/hPmef4CdYMrfTUBAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DeCjsQ5PeUHD/88dui7ovRM6BI8RHH6wgjgJJFECq5A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl+BLrFtKzhRfGH+VhbqFZ9LTZzSBtoBd9SJ/FUub/
 qCq1V5eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZfgS6wAKCRB33NvayMhJ0aDTD/
 9TzlYynsUyricEAWZDDbmK8g2H8cO8gdT7sowQKDJY+hgxpdr3HxAB8tBU5aKSJyuHy69ZbrK9gB/S
 t96GXyTFK2L5zzZ6GBfZQ0id7kmf5kfxXMXXuOHtDqmXok3oCaQAltJMRqgLoCVgmFdJG/m3ncE72J
 clISP9wNBkE7N6IPgIGT0J5SAJ5iOGlPYo7WNgfRjvIFZ9GWjHj4hRvCrg0v7JzvWuSPLQZpqTfsV0
 VSvVzVagSbQJjUFsvHfd2aCSGRgdeQxqaETTS9CLeZSJ/QyU1Dbnq+AZPAjG82O6xmusEKssvdhR2b
 HR8DBnB7PKVj7j1CBlwte4U2DS39G6weHi8hrbqGEbtnZcSE8R6k8pIbUkqIN9xsPVPyJQie2goGuP
 Ve5wB+iPExlbhf0KwXb3nYnzwWJ672Al7N3hCIksnPFbMfcqbFza/FKPUEjvkTnhAVzIu3VN/8NGaB
 8w+RTL7TCIXbYUhm8RUb4uEEZr4eq/LK3qZCtI8bJhAcPsqvQNkC45WmHD61OPRDQAOvEbr+nqr9v7
 +S/7E8TnTVo+u0G/DxSSaE8ptPI0zOEeulk6f/85aEL5Sle3zAwpptFHfvfwPmKMXGWVlCDsZMkkYg
 n9S6BMFkKX7Qx9krEOXWIC8xkw3iYaxEL5C0/KNM0YmORFsyCFzdE21ROHcg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
doesn't have an HWCFG block but a separate register set.

The missing registers are added in the a6xx.xml.h file that would
require a subsequent sync and the non-existent hwcfg is handled
in a6xx_set_hwcg().

The A750 GPU info are added under the adreno_is_a750() macro and
the ADRENO_7XX_GEN3 family id.

This adds:
- DT nodes

Dependencies: None

Tested using Mesa's main branch on the SM8650-QRD
and with kmscube & vkcube to test basic rendering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Dropped applied patches
- Added a few more OPPs that are safe on all SKUs
- Re-ordered the OPPs
- Link to v3: https://lore.kernel.org/r/20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org

Changes in v3:
- Fixed smmu bindings if condition for GMU smmu
- Collected reviews
- Link to v2: https://lore.kernel.org/r/20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org

Changes in v2:
- Added separate a6xx.xml.h sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27576
- Collected review tags
- Inlined skip_programming
- Use A7XX_RBBM_CGC_P2S_STATUS_TXDONE instead of BIT(0)
- Drop now useless placeholder comment
- Removed interconnect properties
- Rebased on current linux-next
- Link to v1: https://lore.kernel.org/r/20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org

---
Neil Armstrong (2):
      arm64: dts: qcom: sm8650: add GPU nodes
      arm64: dts: qcom: sm8650-qrd: enable GPU

 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |   8 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 181 ++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+)
---
base-commit: 2e93f143ca010a5013528e1cfdc895f024fe8c21
change-id: 20240208-topic-sm8650-gpu-489d5e2c2b17

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


