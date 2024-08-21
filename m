Return-Path: <linux-arm-msm+bounces-29184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33232959798
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 12:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 653721C20AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 10:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624B419ABC0;
	Wed, 21 Aug 2024 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fa21Ij7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607F199FD2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724229562; cv=none; b=f7S+17IJL3LVLjrsS1yV7GQfqiZ3SzGKaiEFMn1u0aKvoKAf3eDp5LcdPW3f1nMDi1jt0j4ZMD5UEsouQaNxrJDhrhWvJvKjZMOaCXYcaXaJ26wlnDLZb0jKhAWon3Aisdjtmg0Y05/dcmpqTXQPW4n1MHbHnQnlbH2yr50S9L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724229562; c=relaxed/simple;
	bh=9FVwu4pJOklFTnZIWwVB/0zj0Lw5GkvoPp1jvnSF/bw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hkqL5AYxGypDxBQNvzlb5rCFCEkhaDKZc1oWDkIzHWyiDJG5pqFKJpcAoo8Rs1QKWx51h99FtFh44kOEwUkduKbH2C0efxomttC7dxEwp/rss51C7CGRf4YFaFVeT2eXvgYCC2gpcZu2DmoK5S54p3JHCb8XQxWasOxhrVTzWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fa21Ij7a; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso72585781fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724229558; x=1724834358; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Me8QiB6xyaZlcbL2CCoVp22MMqKHiaQrWWtzVJ9JT8U=;
        b=fa21Ij7aC9+HyZcdYNbwnQMxRzMX28Vra+Nz8W679Dfw1l07GKp89LPfntfAIWqP5c
         4USHonGpF6IlLedb/zSA+qXaU2XJ43Kwc3SMpXFLD6pl0fR7DyvNem7n/7v61iKExiYz
         xN1vcpTpkcd7+SGNBgf324cQI71Q5kAH4PNkUcqeAcuXhFI4BFVUyhPetR/yp0lH2B3Z
         PQ6TbnBMZMrf7AGdFWJ1zb0Je2jsqwecr8MkyNCTbdKALx2NYu9qZ5wAVSOZYKrSK4kG
         wIxXycXelhrV390KaOY+M/+RyMD1UQMh4ub6n7R3t709kZVgZf1z112nuL0I4QJSpEkN
         wFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724229558; x=1724834358;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me8QiB6xyaZlcbL2CCoVp22MMqKHiaQrWWtzVJ9JT8U=;
        b=iiCdWOIrbl0o7Y2Y/a8SEWWKIVwuUWDqevEZlx5BWq6ggbqG5S0CGTBpmyWquBnos0
         +yno7KhavQw+pbYsQYl97cXTgRcIPxT7AR3apn9sZPl22bSmyoufOlRiJc6QX5e5oQtL
         ThqgFEfDv8NxVcpvVseUneiC4KBLn+0u2EiiQ7Xci9DZIyvuAFiAxlrU3LJmA2luYjmW
         X/2wy3J9QOLgTChsQdMksjMPNJTLaYuMs37F8DWkoTzxf6TgP/D6PahxEMxS2XQex36Y
         hpDAbFLHQpaKW+sx90h7VvZlaEz4di4GH8adkGUTW0B2zcoijK9ToJ18hJphX3Ysap0C
         i/aw==
X-Forwarded-Encrypted: i=1; AJvYcCXbMnUqUm+9M7pfqUtckPhNpMZDtIZCBWxz4UwLQVmUX7+ARGu8hoiRCSuDsbRWDIqqYl2i5CZaArW/SQgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxO9DsZVH3OTFu89hw7jnXTAqvn9rlqIgHiygVwe5f+ualR5h
	VX6/OjGkk74ZDnkQjxzuJztVTWCGpNH+BJJ1RPlf+giFWHrYN6A5xof7jByohUgJifO9jBGBDg/
	e
X-Google-Smtp-Source: AGHT+IGj+hXZYBllOsX/kgCr//z3RQ8wmghc3L1/myZ0YR48vdXPJJn0GqAwPLWXTU3Dh0QVdCiOEg==
X-Received: by 2002:a2e:b8cb:0:b0:2f3:e2f0:f79 with SMTP id 38308e7fff4ca-2f3f893f8famr11704031fa.38.1724229558336;
        Wed, 21 Aug 2024 01:39:18 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc0817a8sm7785019a12.84.2024.08.21.01.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:39:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] phy: qcom: qmp-pcie: Add support for Gen4 4-lane
 mode for X1E80100
Date: Wed, 21 Aug 2024 11:38:59 +0300
Message-Id: <20240821-x1e80100-phy-add-gen4x4-v2-0-c34db42230e9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKOnxWYC/4WNQQqDMBBFryKz7pSJJm3oynsUF6kZdaAkkhRRx
 Ls39QJdvgf//R0yJ+EMj2qHxItkiaFAfamgn1wYGcUXhppqTaZRuCq2pIhwnjZ03uPIQa8aB2c
 bcsaQed2grOfEg6xn+dkVniR/YtrOo0X97P/mopDQ9FYr7/huDbVvCS7Fa0wjdMdxfAEN+0Oxv
 wAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=9FVwu4pJOklFTnZIWwVB/0zj0Lw5GkvoPp1jvnSF/bw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmxaeuAmocwiEhNdbEfhgTpBcxB8g7XdnzMbZqY
 BkoDb8QsNqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZsWnrgAKCRAbX0TJAJUV
 VuvOD/9k/CnVQSL37cU5HkAresKxzN2+M8H1F+kjdbyt3zJjgvQ1vHdq7RtWXnlsYrJk8Xggkdg
 AvVYThqKkOAPnOWT7E77CedOdHxs4PwOW2HHD6VDEfBX+6mB2IM+QnHC5X6lXy5dGZjC3wnS7yI
 +DK7EwBjc1wq4mEQ3QV0HEM+kclWvsx9HWJFzzvrAc80KAIiL2/rH1X8dQDpN5fqLCgqQDSRKvG
 aINa9OpAir9l8Wgpwu7r9xYcJtBYD+B7ENYZFXuIa0kKXyvvcUudXzbaVV62LLfKiRNcBVztsRl
 h5RP2wj8tq3axh6zhhPCqocKeNOmNS9kgtVW0d44eV8IQhxbnukwimPjLOjJz+tFlmRFCyiS7kt
 aCtsKU463SVKiaxAU8oKbJRAQ1G7rjTqyS9ansvGekgejEZeU3uUMBQK8951knMNwWUiISxvE3M
 CIs92q2AN80+ZMT51ck1BSFiNvpi8KjAQhIEfpEZq/GiyKVeoUofi/dJ+e1DxjkEnHrcHkZWVHk
 WGEaq/jLc25EjDLH5U+sL5rDVu3OX/3UTe4miflWXRHLaPVjF2hgFFPd+UzDUrJ76gGrHTkVa1D
 qA2LyUFJjV8vaafKn1v6pn9602zbOcKal236qY8XHEBLmkeqP7AQZ/B9wB0jb6y+1lOCfD41UZv
 xrU7PIFNHxJYMhw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On all X Elite boards currently supported upstream, the NVMe sits
on the PCIe 6. Until now that has been configured in dual lane mode
only. The schematics reveal that the NVMe is actually using 4 lanes.
So add support for the 4-lane mode and document the compatible for it.

This patchset depends on:
https://lore.kernel.org/all/20240805-phy-qcom-qmp-pcie-write-all-tbls-second-port-v3-1-6967c6bf61d1@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit message following Johan's suggestions.
- Picked up Krzysztof's R-b tag for the bindings patch
- Link to v1: https://lore.kernel.org/r/20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org

---
Abel Vesa (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4
      phy: qcom: qmp-pcie: Add Gen4 4-lanes mode for X1E80100

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 42 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 81528d2de965dafd6911a0f9a975fc30b25e7080
change-id: 20240531-x1e80100-phy-add-gen4x4-fa830a5505b6

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


