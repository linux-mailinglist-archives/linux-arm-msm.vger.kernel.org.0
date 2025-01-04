Return-Path: <linux-arm-msm+bounces-43929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C17A012A9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 07:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B079B164251
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 06:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7C014A0A4;
	Sat,  4 Jan 2025 06:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHa86SQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2804E146A9B
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735971561; cv=none; b=huN4YP8d/pODfOKfO5BOznrr6OVhG01yHEyb8bSD/+3lTuRsV9FlXiSuBRXEwIGAkBhI2a1H8qtL1Jpi4Tf/3jVC6l+yWoFkxcqMQcX+WU93aDParWVV5GtRCFU1I8Ig3gJat1LdpqJdWHqs3GF0OqhU+ryFyer9D4mNcjpO+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735971561; c=relaxed/simple;
	bh=Oz0H4e7GoqhxzEIBu57EARlMsG1wASXpX7bzm3iCJak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wed7IKYSkEEwKjPgivTikx33I+NFa7YqZ2GZZwy78TmqDnKUNcFk8ehI0pqWvw2BbIQq63IkTvxYnBTQUk386XMXSAjqFhmB4pecfsWjef1xEQmn3QzTOS9O8tbQM0+fvjyZEl7INmHDiN9ECWqWESbcbg/zoe8QMwqIuYMSZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHa86SQY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso15301515e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 22:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735971557; x=1736576357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RekATTNT0K3xDrKztm4vmRfnU/FaM/rblunrkf5bg4=;
        b=zHa86SQYAwQ/OZbOwFSTHL+smHbJg+UVhwDzLvlk0/2AURQBFS1vbx88v7MlTnWj6R
         AqpeZxSZZ5Hks7mvsQEsN4E8FE/xQu/trFg7ibpKNxWY2GK305JXxOsQVAyuVtwPjTak
         nX7UIBQub6z8dKmly7ckk+WLuWdu/NVzy/cw3bIaPWOKr2O3pvniS719lkRH3y3lruvr
         wJWUuU6InMRfkn+uW94u+rMCJhVQgAetOgtf/DOHT5PlwJxiNnS283Q0hZxxEOXxntN2
         +rMamEa4FvyupT+hEFcSQIrHXaCj4zoeKzNKy/RM86zm7R/GbFo+R1xA5FkgZnDN9abZ
         V9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735971557; x=1736576357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RekATTNT0K3xDrKztm4vmRfnU/FaM/rblunrkf5bg4=;
        b=sphVBMbH+PamTaWzP8nhEQFYJkNIZfSQmX1ZoC1Tb3HhFQAc0BS6mUAW/Vh/lRO9Z1
         aUswvDnv2u4Cc4N/fB2/kUtKmzbls4Njb+nNOcJnvUTRdTRHONlMpBLDceljKFKfsn/+
         TwV2dH7i7i5hPUYEh0t9+4/EeOFaQxVhgUhUxUfa0ifeRNFJBhZIrPn1zXeLC/u74hmC
         cl5h2W+oq2/ARAX3KdxROFLOHLmZt4Z3+PDxQzrzGcM2fn2SM5KBHnXfQqRU5COvPokc
         AlwbPcQZbsc+mnMQwWCSIaJvPTaSjwnQ7988eAAQyyyLeY5SJopITm4WpfJ7XJYgzI3j
         WSSg==
X-Forwarded-Encrypted: i=1; AJvYcCVuYxd9/ZRvBGe72jgOEUvzvm0/8BRWhqEXrfTueO48MR2/ETTt9nNc3JK4eDzkuke+t1T6HVJv9ruKmqJp@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnZLjoSAv180JO1gI/xtuoEOcZO//EaDeNv4B0P3VewXsFi9E
	Y3QbAbTS1V68bR96a1lgavaEcgcHWwNn/USzvl52y3PdKoVj7esSsX/nV1f8qK9sEUlsr0ERP6K
	lQjU=
X-Gm-Gg: ASbGncsdA4EpQGQ7EwQ+T2xpLJfyxY2Dyqnj4+CERJKuL/Lte4V3am0yY0Qz/9Svoyc
	B0gELUgPjwseEFyyhBxYLCGN5ShhxtRr9Z4FYhudD1L1KHJZf7klMhkj5D3+OISRab5Q/8BYDyl
	pmwD8YdP2cCAZv5urql8GTFbtzy0sRqgy2YELe1Hr+lrSWR9XXEytPQUYHNi2iUYO8PMj2tnKc9
	mZiHl0syPWh9/7yyT4j8Su1bdR2gi2W9uA1k14dNPl6g2A99qjDFfwBj0dCneCo9GoukOEbsvgF
	fZBF9TP1zWDsv6nb1QxmFsLs
X-Google-Smtp-Source: AGHT+IHXDr6PAmMIYv5f089ZNqXdfOolV7A0etQ7HsJWisbWnWUYgR1MuNzk75VFpFYl76zqArfGrw==
X-Received: by 2002:a05:6512:1281:b0:542:21ff:c31b with SMTP id 2adb3069b0e04-54221ffcc53mr15907638e87.13.1735971557173;
        Fri, 03 Jan 2025 22:19:17 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm4261655e87.280.2025.01.03.22.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 22:19:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/5] nvmem: qfprom: add Qualcomm SAR2130P support
Date: Sat, 04 Jan 2025 08:19:11 +0200
Message-Id: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/SeGcC/3WMQQ7CIBAAv2I4i2GXtrSe/IfxABRaEgsNGKJp+
 ndpTxrjcSaZWUgy0ZlEzoeFRJNdcsEX4McD0aP0g6GuL0yQYQUMBE0yInA2U58nM9HatnXTd51
 SSpASzdFY99yH11vh0aVHiK/9n2Gzf1cZKNBGa46i7aTVzeXuvIzhFOJAtlfGjx5/e6SMioprQ
 AHKYv/Vr+v6Bh+Zo2btAAAA
X-Change-ID: 20241017-sar2130p-nvmem-5f856d99bbb7
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Oz0H4e7GoqhxzEIBu57EARlMsG1wASXpX7bzm3iCJak=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBneNLgeD0FoTmWNyH3RfEVZbMcU6CzfTbYsJezd
 SQiQplC0bCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ3jS4AAKCRAU23LtvoBl
 uMJIEACYjnoOiWYAHNRB4vH/iGe+PRlfL6lb8vR1X0GLhIYpv9Fi4l6ZmIKrq66B/RxQZO5wLrs
 WSdNl5vpot3424e1SncCR5BRYjyvvvyvaHM9zzWUwaNM/ICq4IS1B+IbIUHl1/Z+T84wVv2/Vir
 LHCArrS3sEynSvd2rAoowwWBQ5s3VX5BzI2sh3jwFapn8aiXF5yL+UTyrolkvn9Ft0TxWFsOrpV
 M26QJFlBSPsVhgrO+683KFDdCZlovN/1Av+PkQ37atH+aoAoJlpGIXhIwHS+iZC81bn6QiUYG/x
 Qo8nhBJqfCSjhGCNHtozuMe63oX+Q1SmxX5ycFUtKGoucgIz6E5YYvc18oxj9mxJUQmuR1rM/la
 gov3GmFOwAmYMexDihoervMR7Lkmn4zOiAsD/TnMjRUD5ftcma7iaDRyoODxkkrK28TCPpsWkRw
 +0rPEwNNGPBd41d2tTmC+FcsPPmx9/kmP4ptZ7TuIMiqm7vNribgKPiiq7VM8kJqGHCgRSO9C7z
 g4lokKqMm8xVdtsyr4VL5WnuPQFW3q0Swlg8ZdqpZZlfkD2BD6KXvVvJkq3HCnVRJ3ITe4iOd1L
 OC44g0P2mvg0YVZiiRKfq7LrzmlY0I66qwy5bbpTsmteupZj3uJk5kEIrrz5afMVJiynrurSBMf
 SmaEM1nBM25YU5w==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm SAR2130P is one of the platforms which require 4-byte reads
when accessing the QFPROM data. Fix several omission in the NVMEM core,
rework the QFPROM driver to use readl() instead of readb() and finally
add compatible string for the QFPROM as present on the Qualcomm
SAR2130P.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Reworked the qfprom driver to specify stride and word size (Srinivas)
- Link to v2: https://lore.kernel.org/r/20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org

Changes in v2:
- Picked up required patch from QCLinux.
- Link to v1: https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org

---
Dmitry Baryshkov (5):
      nvmem: core: fix bit offsets of more than one byte
      nvmem: core: verify cell's raw_len
      nvmem: core: update raw_len if the bit reading is required
      nvmem: qfprom: switch to 4-byte aligned reads
      dt-bindings: nvmem: qcom,qfprom: Add SAR2130P compatible

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 drivers/nvmem/core.c                               | 36 +++++++++++++++++-----
 drivers/nvmem/qfprom.c                             | 26 ++++++++++++----
 3 files changed, 49 insertions(+), 14 deletions(-)
---
base-commit: f8bde2c106663ee2398a16bf6500f1cc8f5cf64e
change-id: 20241017-sar2130p-nvmem-5f856d99bbb7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


