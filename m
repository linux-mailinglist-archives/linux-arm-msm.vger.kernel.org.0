Return-Path: <linux-arm-msm+bounces-29474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B124295EE0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A13F1B21135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0709E146A6B;
	Mon, 26 Aug 2024 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/yuAsWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EB804
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666856; cv=none; b=HsduNwXRLdqfkPLa1erxHCGtlywCFuFCWTlt9EY0Ao6RKDaBxOftpCmFzlaxPwuUVTK0QlpxKhmZRyQOssWxjT8aGjte6POUmZatUqqWMkXaRR7y6BIL/Huvsxafo/kqSYSV314Zq+3mMYxQKxSBaUx+hcZ99oUjR9s2qcvMh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666856; c=relaxed/simple;
	bh=flmAEj5Nd9G8wrUjTaGvwvFK+32RV5njH6u856Suhok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l8/Xyb/NZtLvNFcMRY4nWJGSGBWX3F6fYTEuTTRturSC21DdytxmtOExx22Ny8+MbdHSOqYnaF74d8IsjliZpF+tQ/oedUBOKs2mgZN5f7UtDoacGtcGC1eqzLfdhbaqoli6W+OaQroiZIwZ81dcoEetWYbgyKzNhHC12Ubszaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/yuAsWy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-371c5cbc7c8so478917f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666853; x=1725271653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HjftXAU3xKMpzR2JP/aMX2y07jgOYNP9sRw85N0o18=;
        b=N/yuAsWyMQ7FlHy/8VYruVPVmrcrn5SM9NDh5vLsoLzoWraf4VNsYs4lfl9zZwoQXz
         f4yMzo4wA/bXHtdKVCdDVQYhs96C7yCT0jlTCXj71OZuRzNnH/SLUrOro3p/EVGyGLU6
         et23Z2BOvnev5Tc9YM/g51WrTySFBRmxgkqUfAJAFZTrkOlcuDBANiiTHIAb6XVRDDGo
         ++rkhRySgzOZYq99orL96jDvgJhfib9CqN4R9X+w/c2eNDG7PlyNvP1p/gQq7FmB8gBn
         bjoBV3GD2pZmyEA3jp8dYqbsMK+iz6xcCEd2QJvNKs7G+tW9e9nVfyVBG4aCc/0Zztdp
         BW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666853; x=1725271653;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HjftXAU3xKMpzR2JP/aMX2y07jgOYNP9sRw85N0o18=;
        b=bmjZRBgveVyQjoWh4MwcnHOo16jf+B+HTtsbbmQaC3vzsphPeaoRqqHwMY4sEhaZ1G
         mWd4yN3mgvZe5VgJTkvJf/MKzoUdCj4nr6/ECP0/0q8wcLpnyw371Yv2h6laBomS8iEP
         Uw3MHiwjTM6fZq8v4nwSgNt1+z7eZH0P72pWj+GU4u2cqgFF7OBYYOvqwrKuLDpYj0hr
         OAllLaqhadvwc55DngjFuOh1AqkNQKAPRpaSScZ/6jye2J0qammWj/2/1gMUok4vIxUn
         oldzGQxwjBv8axEY78j6dpUGs/+F6/6PfAQLGPcs+0OIPB1DKH3Dp1mw/MOO9zclTdUX
         qOhA==
X-Forwarded-Encrypted: i=1; AJvYcCVUrlk2sz1+rhtigoYWyM2M5E/aL3dxqNvN+6YR6lN44vBY5lwQWzh4oQXbt8wWxINiVUWiCNPLM0Jsqw/J@vger.kernel.org
X-Gm-Message-State: AOJu0YzLO2mkc+GUSj6elF585e+bjWrKcAb4Mvx+e0BfrlQ6mR0TNOE8
	hLC6BsjDyTsRRt3HeDSUfhWPFKecAf3sMR33enqaa9Ql7RbW95Isy72P7DIAG2c=
X-Google-Smtp-Source: AGHT+IFCD5GPA1+BkzRXcgnVVTn8nZixGGKVQtfkU6p7k64Y3GOsR+HExdueg7UHKjrmdDfxphRs4w==
X-Received: by 2002:a5d:59a9:0:b0:371:8d07:f84b with SMTP id ffacd0b85a97d-3731191519cmr4431159f8f.7.1724666852669;
        Mon, 26 Aug 2024 03:07:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] phy: simplify with cleanup.h and few other ideas
Date: Mon, 26 Aug 2024 12:07:16 +0200
Message-Id: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRTzGYC/x3MQQqAIBBA0avIrBsYTSm6SrSInGo2KgpRSHdPW
 r7F/xUKZ+ECk6qQ+ZIiMTToTsF2ruFgFN8Mhoyl0ThM54NxxxA9Y9liYiTn2JPt9WB7aF3KvMv
 9P+flfT/ZtsNTYwAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=flmAEj5Nd9G8wrUjTaGvwvFK+32RV5njH6u856Suhok=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPVkZ2FsKym2PSIv1cjVB9boTWCPLW6iOlIN
 /9pOIHBeGeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT1QAKCRDBN2bmhouD
 1xLqD/9/qGmAF8uPKhx2wWo3kIzy3zrrimGskzxVQsS1cNXBQRhKKrAI6JAENVXRunpYd01lng/
 v0Hvcze6XwNg2IOTK4bjA0n0AF1KvOzFzaPNE3cS+W+t1QUPEz0nzSRzXryV6tYTBb2Z4UCzBDS
 pUC/9jLhQJf1X8giqkNktJNUJ24cOzG4DyUoe4Qvki6ISGMXI2zEMoOOXTOunDcMz9fLB9PBcow
 q94N2lgYb4EcM/KtB5EVs8pFdB7TRIfd14GRRAPqSFBJ0Po6Ym+nT92uxrsWIEj0Nt2Ag8ZwOk6
 WpYyQDmrDFhwdQt4TVhVrcm6kHThBEMrS7+1VdulIBcUvpw/o40qvqFIWlxvyntlcqaGtAMQu/D
 HAO5edJzkHxYXGOcvnDdUFM54tcxqe1EbgWAx61OLgwIrYm/wYoTNHC42CMvduAvA1bNNvHLzSd
 PWb0C6qh18GesykeVDY1LSwjkYBNHFRLBvgaTUEq4PPdVIqtUU58E4vR3qAc8cgQEtAGJje04nA
 llG/H/5qkeIe3hLgrmO7ipSS4pfWIRpPjj93sFe7Sdelh1e8oYwZMm1FwRDmAb8d/T6qa5Iklyo
 QrX76hLjS4tmqrzTHn3WDz+1sUThCLwxfL0K8MoTqIPYsjEMkvYuGKo9rhgnK9AVc4sWYae1LIY
 EIYW82BvNvhusHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make code simpler with scoped/cleanup.h/dev_err_probe.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      phy: broadcom: bcm-cygnus-pcie: Simplify with scoped for each OF child loop
      phy: broadcom: brcm-sata: Simplify with scoped for each OF child loop
      phy: cadence: sierra: Simplify with scoped for each OF child loop
      phy: hisilicon: usb2: Simplify with scoped for each OF child loop
      phy: mediatek: tphy: Simplify with scoped for each OF child loop
      phy: mediatek: xsphy: Simplify with scoped for each OF child loop
      phy: qcom: qmp-pcie-msm8996: Simplify with scoped for each OF child loop
      phy: ti: am654-serdes: Use scoped device node handling to simplify error paths
      phy: ti: gmii-sel: Simplify with dev_err_probe()
      phy: ti: j721e-wiz: Drop OF node reference earlier for simpler code
      phy: ti: j721e-wiz: Simplify with scoped for each OF child loop

 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c       | 20 +++-------
 drivers/phy/broadcom/phy-brcm-sata.c             | 21 ++++------
 drivers/phy/cadence/phy-cadence-sierra.c         |  7 +---
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c       | 12 ++----
 drivers/phy/mediatek/phy-mtk-tphy.c              | 30 ++++++--------
 drivers/phy/mediatek/phy-mtk-xsphy.c             | 27 +++++--------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 11 ++----
 drivers/phy/ti/phy-am654-serdes.c                | 50 ++++++++----------------
 drivers/phy/ti/phy-gmii-sel.c                    | 16 +++-----
 drivers/phy/ti/phy-j721e-wiz.c                   | 12 ++----
 10 files changed, 68 insertions(+), 138 deletions(-)
---
base-commit: 834e84894a9d34ecc195d5db5386912bde3eefd7
change-id: 20240825-phy-of-node-scope-055ed0431743

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


