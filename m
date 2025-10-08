Return-Path: <linux-arm-msm+bounces-76323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06532BC3C88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03620189FCF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6F32F2616;
	Wed,  8 Oct 2025 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UM6eTLmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0810A1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759911484; cv=none; b=GR1hsICxxRCbpTaO3hnMMQakIguO8LTanoR/iajK05XU4/RiEF5wOKHbDJ/dWLnVMulsBR81WqXTU4Ms4qlKwIrhHME4psbOh5kX+2lTP8LTJMU3PugxMCS686nO2duV6eUEr3mNG+inGEJEYZsFK03DzHLVOUwnMJeVDF57hlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759911484; c=relaxed/simple;
	bh=o1H2LyxkkznherZmnKLQ/juvUP/chr9BjwiieBwZMm0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sT9CsSEJgI4hbN8FOYBECbq6Xyao5fUOCKzOHTknfuwz7Tjw+lx8guyi62xZJLWceIQR4wbvx6vdKj9w77hePvwinptLck8285s9gRKU/WqcUohdlWBG4zMoCqbFDBlvUbPJFPI6C6KlzQST2FWHtmQ5dK51A/axf4LtFrpkfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UM6eTLmq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4060b4b1200so6177052f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911481; x=1760516281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dilubts0+8D/Ytsohz9SJxbRH8BEfIuATOG8QPkhvs=;
        b=UM6eTLmq8ltgflHAHAuErZioH3ad0Ek5k6PBJy0pm1UopTkhOSIZGeoNVCb4C976M1
         gkUvaHmA2v2NM4w71urkWJVWuLBbRoO81yyVWibAwWI4jCimF9V6I5DhLvbAF6q+EkB0
         i+F1E+jEFxor5wFXOriAdGlSvcX0g8lIG8tpfMhLDZjFUXTn6OADD4nO1suqAL3r7zlL
         2424Gqp/q3Oq08IdkCDiYLXQOpz2WlLv+MQMuEdEt4Y7AHbRM4NOJz40gHEhbpoxhZPF
         +Hooudz4+B/g3RplH0fKwive7BeaBRCRH71oU3QGyhWItZgZzxGcK1V/+Lzyxz3h3aUT
         nuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911481; x=1760516281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Dilubts0+8D/Ytsohz9SJxbRH8BEfIuATOG8QPkhvs=;
        b=T8hFJQ+MLs7Ib6ss8sL+bw2u7Q1C/+0yjOdMMnd2ShiXJNDnNk2+lTINqmYigoXlbT
         Gncu8adr8Zdxej21aKdwH4N7lpbC6dGwRPB8apA82hcwKkbcGM3HNDkvTi79BnlAxcEf
         frsAU1rkClp9YwXQ66XuyksU5TCr+tNn7HUMAXct2bcdxhsNIW8dfHWy1xMNJ7iL30Uz
         sKIQOiwQaqqnLXiUlbGFzbst3Wi+r4KgVltzUeMGA2ijxGAfa4mdPQIiZ9ydDbp1EQ0I
         YkvmDWNliI70TnnCM/oNqurkiFtiSTAxYkCLBgIYVeqo6KV1qRe6pqlpmuFsa5aPT+2x
         p+QA==
X-Gm-Message-State: AOJu0Yz/vu2849XYWRqwldYrtuFQBHpMq0BLaQ/WsDJbscIRdQwtxtHx
	yRZFkrIWeHSPUHJVJuubvdkqRerTqPF40LYBD3IsM+geV5d7ybItAtHjlCa7/8/aEEY=
X-Gm-Gg: ASbGncvQladHMFyeQQ0cY1G3MJhf0K4WVNQF9AKouDmsk9sN1x5OGySa+56AHqFe5s+
	evXjVLkDa8mbncJD/qr69cUyH64gGHMtap2TOP0ytqdbrAIL5gX9kFo5PLV/75/OdL+s596Q6AX
	xXrHpv223b1nsxXL9GskvSN7lx5jUlV7Z4IfI1zIJB8bZXdrctldRIhLjZrm0k/T1Xx9gQKJb24
	1T6bakJyNvokM2I/WW52UXrK1cx1s51C1rnVmotYIQO0lzvi9KkwpNGBYfcTmSFyVvwq7gwvuXg
	hlnjDhsXbeAf0Dx+lX3EMxuoQDE88Zkkn22XOM2AeL93P+F4gQEVUkFQT0ZFjZ0zTvQaA7TE9En
	fPMpp1Z6GsW9Rq4V+BxdxYut9uKoCv9sHNKu2SPXkLA==
X-Google-Smtp-Source: AGHT+IGhQSUo3nz7xkAlyreI/mgAZYjtQto76cT/dauU+rLa2OKXc2WMdpidzyyhuEH2ethEy6bDVQ==
X-Received: by 2002:a05:6000:2305:b0:3e9:b7a5:5dc9 with SMTP id ffacd0b85a97d-4266e7d6bb2mr1369061f8f.23.1759911480551;
        Wed, 08 Oct 2025 01:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:17:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Wed, 08 Oct 2025 10:17:47 +0200
Message-Id: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACse5mgC/22Nyw6CMBBFf4XM2jHtQHm48j8Mi6YOMIlQaA3RE
 P7diluX5yT33A0iB+EIl2yDwKtE8VMCOmXgBjv1jHJPDKTIqEoVuDg/YrQ1GTMjj9ZhXZSKcmO
 d0QRpNwfu5HU0b23iQeLTh/dxseqv/dUarf7UVo0Kc7JV4zrNZVlfHzLZ4M8+9NDu+/4B6Qosr
 LMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o1H2LyxkkznherZmnKLQ/juvUP/chr9BjwiieBwZMm0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h4xiSWuokjcBTSXUsVyVtoVJYWA0324dAAkZ
 B1fTJbJqvqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeMQAKCRARpy6gFHHX
 cjPHEACvcI7a2/XCh7u6N5LVTP8wJojN8VL+jKNWBkslBISDhZDi0kgAEoh2Twhdlz/GVTDPowR
 4M9MKgucm548odFpPLgC3hcpMqR02PNK9wNwyrcubqc698ax+M/hCN6IPC9LOb/C5HoqQF64qtW
 IM8oNh0U4bYoLZdg5IgjBLUsgHlHPrdumId3uxyhbugtj9H3MmlT/qSXCFymTTUnPfLNLskrA0I
 iTnnG6hxduosllTHTdOkDQqlZ/Kyw60EX5VdTZo+0DOQqGNpJBvfN/BbjJynvtjNuVA12FxRHZa
 wb7QKAs/LlyXPSbb5Wl9sFw9Rrvt/JjqY6FU799h1uL4OSM47W8nfVSCpmAay3hwLmrRN3gbUfa
 jVUBZ0adu0wEYB7m9jTWsSvwUROyOho0lV6t8v2B7u5LnQhM8Pl5fukppy2PAW3fs2Bn7+/11fA
 44WxlqvTyTJ/sNXZnq2Qm5gKJHQGmvCbOcC6V+jHABUNIhI/E9c2Izyy6YNxplCQjXblrS+rwS6
 JiLhAH5BGaecPKm+OA8SVgZhUVK8rQvdd+3lY//Dqo7jZxUxdDnEYcnLQWAbBKxaxlHzEcff916
 wlcDvY7J6PWuIKRcM5hZ95jajGlxKL8Fvj7JDJ1uJTGetr1kSHMAT9ZLfRyZndnI5NBYh+G0c5O
 an4J82FVVwdpGEQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 345 +++++++++++++++++----
 5 files changed, 389 insertions(+), 65 deletions(-)
---
base-commit: fb6c63cf2231e895e4b0b4f3586cc0729f71f909
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


