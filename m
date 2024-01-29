Return-Path: <linux-arm-msm+bounces-8821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A6840388
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 12:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C126284B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E282E5BAC6;
	Mon, 29 Jan 2024 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yW7XWvmY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC975B206
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706526640; cv=none; b=Z3c+IYCnMVW4JZR51H6dczwFb6Hx3GQ2VdGMY0k4SWG2V6/NYQo2KFCmwapILIWdyV+sevAhD0wKRSO4z5H7gQXF1TH8lX3cAIfVcP3aL0VTHAI162Uw4z3m+zZm478V21iemFFQFUlcfNaGUOHAhIqvKrqZYtNg98euXQvQjQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706526640; c=relaxed/simple;
	bh=kaq0OgPo/9vol1D2bYM76Ta9GssTvOOm0ZJv+0O3b8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EchzwCi8zFhqQU4OqGS08mTJpE+kt4VGihzpJMIdUB3FHBRi7vMK2z9NGv5WLhTA943ay4DSiHRUPFivr0c7qMbe1NP7aX3Q6aBPeCdQHDMzyE85h+877RUXuCstgDQdpAJfGYOgQRHWQRr4LtXy503Gp+g+rH0KyG8PJtamDtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yW7XWvmY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2a17f3217aso359774866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 03:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706526637; x=1707131437; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRaRfDbDYLX14FrKlogP0cv2vAUvFXFj6eUZ8j21eOw=;
        b=yW7XWvmY3sJ/v0QjhdlNvwLFrrtHMa8wv7xSAvEnPCRqo7VbmtFED0p6Q0vpuX/wqv
         JZ9lbXUVhMpgX1r+57LS1msVvFY4WjHr/3Z4LKv2ueLDBb8vnqNhCU7KUaBj0mPPYszR
         4aJ+oeYTv9m5Q4te5vc5XI/RrjPJINv4XjjxEhjx0CXHDcnY4ARMLt/YE452vlj6Myjs
         dGIC8iUMlDjSBCeyb+QWde2ExFg1WbB42exAjnmV2/v7U2E8qbz2eC703foXEnSj4fRO
         zLVKAvb8rKR3ZqLcTVUAa1uE2n1Z/mpl2qelfmS73Fa1MxYwO5fJ5vikeTWvm8hJLfWN
         hNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706526637; x=1707131437;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRaRfDbDYLX14FrKlogP0cv2vAUvFXFj6eUZ8j21eOw=;
        b=eL0LQsoh1D72XwJi8qfE2A4fvLfDdgmBmhSj+zCznR6l+jOsdUtOxd6xgvkFIw88sA
         Gbn8Eup8XCnHwPEk0pIjmrJYPQ7FmS/W7BQw78YFSR0nSgTf05TNjUb+crsdvdP1c1E9
         xvxZg9CYsD/S/SWVsDyyq5yDR1ZYc/7YOJb/isYT2as6/BnBS+gwJtwPM5hO/E/SPCfF
         3mrHcE6ESo//tiQRh9lYct9HZCpPkWmVYqnMibHaYYDCQTsyWFzbA52FZOSw2yza3idb
         6jyZlDFgpe9nxdRDPipr7QoGDT5/J+RSLv7uocNkha56fL17Gzhy1N0gdBgkgnMKOqpf
         L3LQ==
X-Gm-Message-State: AOJu0Ywe1tczTNk1sBG5k+nfkeshKoJccfzEfE7aRxvUIWQcJMJQd0pE
	h52V63thrk0qbkMkTX082pBbKtWkHglgccFfiz8spr02I3na32nJiW+/rueN4Oh1qKbpu4xdyk0
	V
X-Google-Smtp-Source: AGHT+IFdGR7DwC3V+AcNwApIE6x6SYSmmC81K54nXEd72Ad4K9TD5UyxiF2+FW9bIvC7KDOu9MPpPw==
X-Received: by 2002:a17:906:454d:b0:a31:29fc:6ef2 with SMTP id s13-20020a170906454d00b00a3129fc6ef2mr4747444ejq.41.1706526637312;
        Mon, 29 Jan 2024 03:10:37 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tj4-20020a170907c24400b00a352f7a57a4sm2934620ejc.178.2024.01.29.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:10:36 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] PCI: qcom: Add PCIe support for X1E80100
Date: Mon, 29 Jan 2024 13:10:25 +0200
Message-Id: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGHt2UC/1WNQQ6CMBBFr2K6tmamgIAr72FYtDDAJKQlUyUYw
 t0t7Fy+n7z/NhVJmKJ6XDYltHDk4BOY60W1o/UDae4SKwMmQwOoV6QKEEDPLWvKbFdjUTlncpU
 UZyNpJ9a3Y5L8Z5rSOAv1vJ6NV5N45PgO8j2TCx7r8Z4Dmvr/fUGNmvquL4uqLu8Ez4m9lXALM
 qhm3/cfLlogyb4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=kaq0OgPo/9vol1D2bYM76Ta9GssTvOOm0ZJv+0O3b8M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt4ekpsF3X7YJyrnDVqN+171lOsGtT2eIe4S4c
 n5g7+WGKWqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbeHpAAKCRAbX0TJAJUV
 Vp8lD/0VzRSzxozsfLD/lTH+A26kdlKd+ybLr23ujjxI6fClzrK2JNl7SWLRArBXpN8tOe8fCix
 4ygHZJOjDfgo1cX9IqOGh2IVf4+fwU6mDCygLos3qcDW4nf2+OwIi4pS4TQk7CKJUN/hjmWGG2H
 5pbYSq9z/xqp0u0JiOm3A78xynvYK1isXtksSlrh2a0ShG+ToUqHw4w7r95Unzbi7GKgmJShSr8
 Jpt+J/+XJE+yny5lkwdrkEr5qgEtqWrE53EtALEdH5ZeYReKLQ4a3bKsxpflSaoqc4OCYEBKmTz
 zNpR+t4RpM1bxY2ah4AMTqoxv8RrL2MhEHHsNWTe+EF98E2OXaQdhq66jeSba9AfCfcZb/Juzbv
 F86g++xrmZaHJsgKqc1EGSGmgnKt1NZ0XwUv8kZG+ZmemzU8kzt1gEGQ0zE2IGfp9XInrgrQG5W
 XutOdgqmcEZD3C454t1+AZTbvz5+BL8qRmhnwbCqiIVlxozpal5HWoM2Qv6+tKGqEVyt75qJv48
 Fk7J0gec7dqK8byBxwbga01yS31sbhQIngDx+9Rj1WhSyfz4HmQ7kyxXML33pNZnPrkBovmDiu0
 +th//D3Xi4XJgALKTJBAO6lubjHJrXdrT4zv2O+YvHB0sA2hrLwnyZ6f9amn3lfl2b1H7xanean
 DeYqVVcUxwJ1paw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add support for PCIe controllers found on X1E80100 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Documented the compatible
- Link to v1: https://lore.kernel.org/r/20240129-x1e80100-pci-v1-1-efdf758976e0@linaro.org

---
Abel Vesa (2):
      dt-bindings: PCI: qcom: Document the X1E80100 PCIe Controller
      PCI: qcom: Add X1E80100 PCIe support

 .../devicetree/bindings/pci/qcom,pcie.yaml         | 29 ++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  1 +
 2 files changed, 30 insertions(+)
---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20231201-x1e80100-pci-e3ad9158bb24

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


