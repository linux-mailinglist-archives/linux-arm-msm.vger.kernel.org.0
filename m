Return-Path: <linux-arm-msm+bounces-9346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B363845C4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 16:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D5C11C2AF1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 15:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C22160876;
	Thu,  1 Feb 2024 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p58qGk7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC7E15DBBF
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706802952; cv=none; b=GR99OA0RM2f26Uc3wrwn+QTPyI/jImxm1nVUnlGnYcPOKNIYahGW4Zw9Auqf7dVEZTJQwYiTM7fYRN/GZKDfSybv+/OoEM4wdJWAFpLefWx3zfxI884TkUFKQoPePGNrhOuSeeMGjU53byXhD4w/uNoy8yp+oZ/qPBlabs8b3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706802952; c=relaxed/simple;
	bh=N8nSlGpY+h0yDVzKyyy2ahDrdLPIziiOuPJg6GZ4M/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WUKyxYcw3KSDWJlRqUTrFuta48DKQsNia3gpwhlUf1sKsy+30TfGjBFPk8+E3No93PofZTpYrn+WdsJfjNhVlgFKP8CMnyR4hqHtZ5BbORx5/PeV+J1eSH1Cw3zJc0W1EmqWKgU9P6O7KYY2kSlzFG11j1UWL3UdpnUs0+lOB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p58qGk7G; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e800461baso9723225e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706802948; x=1707407748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko9AldsNAGIySQ6r8IsXSCtLQ9r/1ys0AWCrWCqKA/w=;
        b=p58qGk7GpsIaI00rBDL8NubrJoBHh4q8c7qGLMluqvCYFLcjbigkypbrWHzULlja9z
         kwbwlskssLJ0pxEzD92PbPeBpWX2xlKkJCFHZXePvLRSp9oCScYir71yr3eaMXEz6NBO
         dO6slGOQiOaEnXA17hNJ1PBWA2uW7MmqmaEREz6zI9UIToX8xpseTzi2Rn6PiQ/Ar9Es
         Sc0UiN3W90Qlcf4zBj14r+CUFGud4W4rWj7YBrs/SRSRGD7dWijABCNaRAIYHKMs+qW2
         EYHiNJG3Lo8RCrpQsoVJGgR+aN0QB9yL91r82P21xoZn9+rpH/Gq70q7G1Dolj+KSGLx
         0grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706802948; x=1707407748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko9AldsNAGIySQ6r8IsXSCtLQ9r/1ys0AWCrWCqKA/w=;
        b=XDGQXvJNJAyz7QbnDd6ROcG6JpDajR0/8ByfFqw54KLhTf6PYfZVFAhYzxAsSpkjXy
         do1yVYCV1xNgUK4MwSPtv/QCOoQGgV1Ao0xmK+jQXBmJ4cY2PTc34Z1Y3LKeKEAn0nWO
         jn2vVGei35SgRjiwAe3OJui4krKXI9GWe2esyApBk9sPC2CMbATXlW5KOV0Ce6/Ae/cS
         paEWNVAI41trG1IKX1XGncebK9wmY/KeqPGoSJAkia6GR13Ch9Jc+WAi/fHbUXBscQI9
         y0aDFbxHUIJmqFIY3N/gqrKm18Ws/fxbZt/5yvqEubYtYHpIak7WqqN9u6q5V+hfLdty
         8GeA==
X-Gm-Message-State: AOJu0YxpkgSZtqJS+nLzTuAL8GAX5YpghfQJBIIumu3IUFZUcF/EhouO
	gdvNSwtvwIiF76bOkdev459XhyyjB4Jm+Ou86BAdDoi1g1o7qBBq+D8tgYDhRdM=
X-Google-Smtp-Source: AGHT+IECy3sWdJFy3OZpf+H1uoDhxOmtRildWIioaz3T+kxQVPSM7srz5odlLPfDowURVFQ+IX4DuQ==
X-Received: by 2002:adf:fa0b:0:b0:33b:1823:284a with SMTP id m11-20020adffa0b000000b0033b1823284amr1007860wrr.14.1706802948596;
        Thu, 01 Feb 2024 07:55:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXlYTWL8hpL9LxHRL3AaXBmnDvFdHk7gghjqrm9VPT2vAMqnxwu1brL92C/rrGLj6Q+nQGdtnoBGYncZ7MS5HnZEyzekn8X6U80Jw+acvE05tAxDZSUY3SUBqV9QAKNQizaPN7c7coYJPP6dj1lMEXKA+w28eUp5CEECfKrN0Yc6AU/XstQxBOTcMkkgHpr8dx1Y+kyQLYyFwArboJaHOIoM3phfdOT6iDvzN66m7gfGvRcLRoFErs40y26IVK2NJ7VZLxBoTmzu++rdtyFOMh7eGER9tIaarMrcqY7MOg/hwULS4CR0hV46ErZ+LiLDUvx4NGruAPBCXSJDnENrxceqfnJffheG+7EO9KtKDceCAXIf7cfZlcloSiVrGJWE/jgOM39K1I+t8dbGWs8qiRFUagUPU03jBFoM4y729ewrbOTy87QZGaG3a4Ikf1QNkR9x6B0Mj0+q+x+3cFuiqip2oSZCpuG4Zw6/aatb9pJ8aIFQqLNPFGpjD40s443zJjKz2j6Dp5VXeNyhFjGbTz6vZzEqLfoG6J7ky2gG2lNgjcmA4l3jnTTjLFx1EykZNUufaXC7WVeWFFAxzoYB51bhN965SYXiYPcGfryZWkquTFQlBVOr0Ju0Zg1z6LBDLz3oyrFCHOWYbnXYpY6RFnctHSYPI+3LZuvQYvqdRtfo3V/kKp8/ULsphAb8+SPmcWilJrJa5ql
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:dd01:5dec:43e3:b607])
        by smtp.gmail.com with ESMTPSA id ce2-20020a5d5e02000000b0033af4848124sm9650318wrb.109.2024.02.01.07.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:55:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC 7/9] PCI: hold the rescan mutex when scanning for the first time
Date: Thu,  1 Feb 2024 16:55:30 +0100
Message-Id: <20240201155532.49707-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240201155532.49707-1-brgl@bgdev.pl>
References: <20240201155532.49707-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the introduction of the power sequencing drivers that will be able
to trigger the port rescan, we need to hold the rescan mutex during the
initial pci_host_probe() too or the two could get in each other's way.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b7335be56008..957f7afee7ba 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3122,7 +3122,9 @@ int pci_host_probe(struct pci_host_bridge *bridge)
 	struct pci_bus *bus, *child;
 	int ret;
 
+	pci_lock_rescan_remove();
 	ret = pci_scan_root_bus_bridge(bridge);
+	pci_unlock_rescan_remove();
 	if (ret < 0) {
 		dev_err(bridge->dev.parent, "Scanning root bridge failed");
 		return ret;
-- 
2.40.1


