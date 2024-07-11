Return-Path: <linux-arm-msm+bounces-25954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9509492E564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6AC41C21BE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19727156237;
	Thu, 11 Jul 2024 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZKWLQib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53673158DAC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696033; cv=none; b=cg2eTt7RHa6Ls7zvrLqmYKc+OBRhJzEYtmmAieKgBLFpxhgzzGMJsrVsvSuLd8pIZO/obW6MSpQXV9lJUufCuiXxKWAYgD9ltXJ2c/vimsYi7JeegAvWMmOkVGG1nObCRT6vKEDQVnPWvOCIt5tOqZHRYoU5PsNvPXbr2gVXLqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696033; c=relaxed/simple;
	bh=DXiyJvnZaoXMSX7dmB8Mx+Bw81ZcG1UbxSGB35kWLl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhxShZlnkNohHL6DTSI05CkH8IBiEbX1Ii8QeI/dnIwlXGM+Bq9UMn+NrsqdK3wogwRJXz2aNaK2se+tA+BDoBB+Ha9wMrq08sSMBVfNLAb89Aeh1a4cejqDRaFZBLB0cG7WPvbDa55Jdg38rYVHBmqQCK2rV4pnOVynn2LElYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZKWLQib; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso10952495e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720696029; x=1721300829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAbKmOiNIkgQtdozoam3aD9572Bcc6PrMc/2R0CeN18=;
        b=jZKWLQibqPe7CHxoj7mOuKWn7d5GQk2nNreRn8YWzedXuH/JqZGtGpnSTZHnuIU64X
         5v/dZVJuPihZ34hc0Ca3gGIE5qshBwWt9Roc1w7KGjcZOV0hBCU+YOzJaFdOS30byzOm
         u0hjdo8TgvUGyC4NjgSRhxM+ADXxWxBMH0MDPIQH7g3r8wEEvT8vpe1XxFBgXpt1BRqZ
         QKoT28zYrLa9jkmOvgVA8GESoWtzn8JYwiNZbk+ENUXEMutUw5lmIfH5SGZ0DgLZ+8OR
         Eg04JXZpN3O4TV9bmGVkg5K6AnAhoq44SNyEhQWClDhTLjP26zuGxST6tZSHe+RGk206
         7yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696029; x=1721300829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAbKmOiNIkgQtdozoam3aD9572Bcc6PrMc/2R0CeN18=;
        b=pwKJ8NbNi17itKxnn7ZlNC49GT7bd9ICQ7uf5tswg8Mj5v3XDgutBiTrndMh+YUZB+
         c8Uy5F2TuQrpZASPsn7thRte4gu5EokSkw0SlbRxsh+bLYK6szTzql9MJ62Mm3LpQzXA
         UZ1anGmz/BYrrmUGoVv77CB6xFXM7+bLNCNsGzVvM0cNfgWYtVxctIjB5/4oNU2NjLS9
         3sZ2EbCxkp/vm+5Rv6p4qDs8r/4c9uelBa+JaX585fRHBOrB/L9zGViFqBd96dmamfWn
         u+aImH0G8wBShxdjDmBt8dfi3Bjccgtxgy/fNseOw7oAf7modUc14csGlTLrlaB+1m7P
         J4Gg==
X-Gm-Message-State: AOJu0YydDPTqqv9wcdSIUt92HGEZ7nKuMXkQiWxk6ngDdmS/AowFxHqK
	34yu6De7KUBccBvF867BSdxLtE19ducFpCXGov3AVThcd/cgJE6H++YN+HOg6BmT3Gvbc3kANHt
	D
X-Google-Smtp-Source: AGHT+IFojqfVrVy4buGmCYzQG8sYbeFjwl9PTyhMXZHY8rqQdHfhqHTIZrZEeL+UTqbEW2AI511d6g==
X-Received: by 2002:a05:600c:1c99:b0:426:63bc:f031 with SMTP id 5b1f17b1804b1-427981b4c8fmr20806045e9.1.1720696029395;
        Thu, 11 Jul 2024 04:07:09 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e097bsm115686685e9.6.2024.07.11.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:07:05 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/5] ARM: dts: qcom: adhere to pinctrl dt schema
Date: Thu, 11 Jul 2024 12:01:37 +0100
Message-ID: <20240711110545.31641-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
The following patches make the device trees compliant with the pinctrl
text to dt schema conversion here:
https://lore.kernel.org/all/20240709162009.5166-1-rayyan.ansari@linaro.org/

v1: https://lore.kernel.org/all/20240710084250.11342-1-rayyan.ansari@linaro.org/

Thanks,
Rayyan

Rayyan Ansari (5):
  ARM: dts: qcom: apq8064-pins: correct error in drive-strength property
  ARM: dts: qcom: asus,nexus7-flo: remove duplicate pinctrl handle in
    i2c nodes
  ARM: dts: qcom: apq8064: adhere to pinctrl dtschema
  ARM: dts: qcom: ipq8064: adhere to pinctrl dtschema
  ARM: dts: qcom: ipq4019: adhere to pinctrl dtschema

 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   4 -
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  25 +-
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  25 +-
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi | 362 +++++++-----------
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |  10 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      |  34 +-
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |  34 +-
 .../boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |  27 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi |  26 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |  14 +-
 .../dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts    |   8 +-
 .../dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts    |   2 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |   6 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts |  11 +-
 .../arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts |  76 ++--
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi      | 114 +++---
 16 files changed, 309 insertions(+), 469 deletions(-)

-- 
2.45.2


