Return-Path: <linux-arm-msm+bounces-71857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D770B41F35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C8D11BA3171
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609222FF147;
	Wed,  3 Sep 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKQdomgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A82FE04B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903081; cv=none; b=WcalxA84nZxyeHly5qjQlXukuix16NzojuNutdqyH8kZR2QZq1cDM1GkE2WNNOg2axUF325NFvojJjU4buteBS3qCxjhXi5d5iDJcKVad2RQjPn2MP2FlFtmXO3U/DFyPvU8ObhSOCqruB4lgRQwwdDSF/ZmttyMV7BLSQ64nnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903081; c=relaxed/simple;
	bh=XG7Td7DnuGT+1Ocz1z2HpzJyJWMqBqprM9ptfTxtNt0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jr0RArdlonp7Ga3JwUwKpxEqoGLUgP7TYFm5WG/CIGa9+Q0T3GWjq6JWHEt/gQpcmxz9xQqaVIHfRfMg9dVtTDmVTQobxlSnK+4/CHCeAxTkuOm3lifC2YKs5jjdMLOasLkJR1tAFowGQwafWvX+JgQKES5+QIWcyse78rM8h84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKQdomgR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3d48b45f9deso2347179f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756903076; x=1757507876; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5M5u+eDt1aXKVkCfHjL06cHPXZqsdO0dil/if3E7tuk=;
        b=TKQdomgRjSElJp+ihJB1fAvKPHuage3m7rIfmQyhbRRh9YZ7z2ScAmySA+wUlZfcNV
         BypNK4WUP4aE0HqZQbmNczIq6J00x7YnZGoF88DvsfO1wRGtu4/Bxg0NjTqK5chNI2wM
         LDgjuaeCf5S1cKoPQ262osNdeETHBxywzAdL9SvWYMznVAnS8Q4mIuEwbT0lPSBUIoA8
         iJSDaAVc6t8hjAQA3NVCLBoqkEBCEMrdMrEfzKsnlxZLY4Q9rx1x4emGYENEayodowNS
         PB6qFFEowOwxorZ42PsIzQUYpNrGpdWC9lI+sGwFCRHbbwXhQ54LOcSSLZLznMja+Ij7
         FTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756903076; x=1757507876;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5M5u+eDt1aXKVkCfHjL06cHPXZqsdO0dil/if3E7tuk=;
        b=qod4VAumS+kAMJToVfuVeT4hOL2z9bcLRNiFF9Fs4df5yHndumnXuidrsFAfh668hY
         NJmev9QTtB6Owux+Y5fQvWkHwlUJmA/OdTIrDNpNG0r8wq2SgBKz8Ijm7H9yleMa30J7
         nUI1frTr/BWoH1xl6AnL8nKXTrjnuBTvBvn406JQz0nkOXv0Fl1ddpCLuvyqZRyP4YsI
         FIw1oisVlZ84nOfSy+TMpc6JoGKO5GdbVLQ1A9DujFlOmwlVAQRZJrUtMjY8epnCc/xx
         kDLkYV8RD6y4+C+7OVJRwWnb5rAloO+FWErKe/+5wF5+E0A4W/4ZDdImtylVZO6ohdOi
         DWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwrllnXXQjwFn8nAyJ/NhNtG86V24kkdzElEq08eCNjTgqv8xL5yYz/70d5KwUgfK74d9yrQkM+eIkAjbj@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSWKdhFATKTrgBHEDqW3Xk5jE3MqNErLObydQuS8iJgFo5iTD
	9dcDJn/2b5dwtaD+OzMBjrWbPU/TVtnSzTPFwtulX+Mw6ZCjQBT7N95Bw5Q97Gc41UQ=
X-Gm-Gg: ASbGncvGQ7BEJ1zZUNjsjTE8JnDhzmITOFSHr59UobYWcU35pT0q6hwC7kpP7ka/jGq
	f4WelwCSNGZKrHJb6qiVkRxUsxGPe5+12peacBNSnjxnUbb4/XyOOFVy8LCFgOySLn5LMV5JQUT
	5R4WHMl460IHubb7WY80Y5d+dN7zxrAPdPsBnhe4U00A8oxTW7syhl3/irdzymHkFzyse+1UxBa
	/aS0inu1fxwKQOMM2QUjfpr4D32d/pCJKZu8nle645MKWUb8SUdj/PNc/oUaJ9we/Fi7U8mEARg
	j8vn6dmXos6u+2caW5RAkkEshjgch0Tw1H6fdyZJ6AleNTAU+OpWPCC5CQZoWLPE0QgGxNFE8bH
	89pGBzpnjVkCXYtysxVIjuB3Po3AjPVNIfw==
X-Google-Smtp-Source: AGHT+IGb4o433CWFzfVQncJkmuar8Ua2Hy06zrH/E8rwKkyk3fo5kKZxbUD43Tb3esauui3f/nzHnQ==
X-Received: by 2002:a05:6000:2dc7:b0:3c0:7e02:8677 with SMTP id ffacd0b85a97d-3d1df53ba96mr11331667f8f.62.1756903075798;
        Wed, 03 Sep 2025 05:37:55 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a7691340sm22526782f8f.39.2025.09.03.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:37:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/3] phy: qcom: edp: Add missing refclk clock to
 x1e80100
Date: Wed, 03 Sep 2025 15:37:41 +0300
Message-Id: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJU2uGgC/42NQQ6CMBBFr0Jm7ZhSgxBX3sOwKO20TIQWW9NIC
 He3cgLzV+8v3tsgUWRKcKs2iJQ5cfAF5KkCPSrvCNkUBilkI9qLwGVc8aXDjGQWVMbgzCmxdxj
 J6umJjRo6WWY7aqFYlvLz5yg8+sIjp3eI6xHM9e/9351rFHi1bacsKTNoe5/YqxjOITro933/A
 pXOxfbPAAAA
X-Change-ID: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XG7Td7DnuGT+1Ocz1z2HpzJyJWMqBqprM9ptfTxtNt0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBouDaZsWCF4HhmlC9eeABt1PuH8cib26mo1idcY
 /8t9u1p0GyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaLg2mQAKCRAbX0TJAJUV
 VrwAD/4xi5bzb2H/sPLviUBuIQnHt7NPTSpjGPdZuNGUV1R33H7KcEu0FvufrDai8iCYGpZVYXd
 F9WserD49eWmwg5U4tGktvXY7dRQDZSMz/8E5acfkeNAJSQ+c92VKHcx7cxeZV9C91UYhjzKvdm
 cw+DZF2ZkopRC+qQIMcP+g1SlvS4uQoTdh/o6UvtJbrwWn0RVUmJcDUm9FTdhdF/AzE4H654g9p
 JDrvisfub8w2QXd0SMaO93bHGxICkmSjkceMjTD1VP+MWKD+BaQXkrN/XI8NIJhFUGxh9aufOE5
 kzKOLMgou/LjSCTiUZF8xwBw8LyOsZmveFS37rmD+KCjJuvNytDaKh/t158HFFx9haIdACiSvG+
 xBB3Fq2z1Cq4fskqbv6ElUvl4JEc5ITGctgTXWFJ7fUiT3Gx6WyFmvqRaoEG1G++mlG1aXDsoZ6
 FkEHfkvwxOScnurozcwW6XoEKIr2OvnftorYwQi9sfK/QfQ69d65ZMDcQi5uP3G90AZom3QoWv1
 T/iic/+BW+gIh2nBz0bu7BrZilc/V+5eXThNy/EGnaJW4YE9g9GqQdQ80Iy3h9yfaSoBK3ttuvl
 wN2NnMJp1hIDbt0ZkL3WfvlH18RQApCbT95cvku3XYLfIGd+7X87HA9SvCFj9wBFZYVpuRE/kQu
 6frqR/vPm2/KzMQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to documentation, the DP PHY on x1e80100 has another clock
called refclk. Rework the driver to allow different number of clocks.
Fix the dt-bindings schema and add the clock to the DT node as well.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Fix schema by adding the minItems, as suggested by Krzysztof.
- Use devm_clk_bulk_get_all, as suggested by Konrad.
- Rephrase the commit messages to reflect the flexible number of clocks.
- Link to v1: https://lore.kernel.org/r/20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org

---
Abel Vesa (3):
      dt-bindings: phy: qcom-edp: Add missing clock for X Elite
      phy: qcom: edp: Make the number of clocks flexible
      arm64: dts: qcom: Add missing TCSR refclk to the DP PHYs

 .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 12 ++++++----
 drivers/phy/qualcomm/phy-qcom-edp.c                | 18 +++++++-------
 3 files changed, 45 insertions(+), 13 deletions(-)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


