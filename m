Return-Path: <linux-arm-msm+bounces-35118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404C9A4F5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1AB3B25A42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6E0190045;
	Sat, 19 Oct 2024 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWOA8Ub1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB018DF84
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352705; cv=none; b=iaPCVc3pg+ho3+8KdZwP2F8Bs/I1gyut7o2LDShZ7DVseRU4twcRYI/Ylq97cA1Xd8g3MhcOiFmxeQ/ZVnDA053HiDxW2JK7Y0ImNByG4YSzon2BvQQ/Nh3qAhAsnhVe7kvsw5QIdcKf0h0d1KlsYAxYGM2lhQLXRAcTrtPIzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352705; c=relaxed/simple;
	bh=5Y/fABq9b4vk+PutXYP52URTjzKP/DzFXovrE11VWQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vqm5MZjfDZ9PFP+YDgjwFlex3tbqx91iDFA+XJbTp2EMWXh+xZ47kXwJLLSwE85FHMUEimKL5qVTdjvgRByPABsSbwK8S5/s6Mq1VcmjWI7Q7tWkVoaJBEG0rRlvy4FVahwLOU0/7N8tpGSQgpfkpyKet3lnwsgbEx4TgxDMHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWOA8Ub1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539fb49c64aso4477001e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729352701; x=1729957501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYfkdNF3O8TZS4V0T1JegIJYADXSJj7bD5ghT8EX1Qg=;
        b=EWOA8Ub1XQChankSp9rkAGqUxRsWu7kRSrdWaLbnMtulLezgkJUHD5r55B9SKNqQEC
         PtqY1+o7ZlNQMKjkVqrdrlGGqk4Qkd2mGV3L1j3kPOX2h0P9GCWwmEd8ZySyPp/T7HNQ
         H8EcJ5y179BJhApZbLqXelds/M1LQaf+s7ktWWLh8cvIHwXuBgvoQcVUMCJkiBqXVeK/
         +vlwWqi+iNmwNXE4WHCdlvttkXft2QnGcsW0Z0XtIAWJ7G8ySGmbAss1xIP9PHIg5Ofy
         9fouvBDGjOhaULAnKgeIgePeqi2KhDuvzVo3LE+BRhQr1BzRt9TlswoKUtsGUVhJiHQB
         Ap0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729352701; x=1729957501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYfkdNF3O8TZS4V0T1JegIJYADXSJj7bD5ghT8EX1Qg=;
        b=uYwd9OWgFAQZ9sdaDovD+Rk51E0zeJTZotz0sMAIW3eSmZ+I3Sq4yHffDxqQRqshfg
         STfLJlJLHdcCG7rhEqtCU1EFfIyxw0RK+ioRTZGWTnr/Mz1XcOCMiYowouzIk6OoGSn2
         ynUJ0igtB4ZYJcc/hy2Y8yeevgN9cxXfMlQ63VlVR1/RjGvUGplHicwxiLUZ+0q/7VS5
         Dk5xvjWkZAXAxoBOdsg2gRlb47cYvn8NMFlLQbM3rj1/2IEy1k2mFRotbMIQWb+PL/3B
         iV6q+OFqxsJeHExbCBkTRXY/pE8iIQ6mPg25s+mUXFrqhec0hhUAmRZazlGYuJE6mr1e
         EnDA==
X-Gm-Message-State: AOJu0YxVPf3qqrlkAzyXyn6WAnFx5xGbQ/0q+HCwhxjSgfNyX7WyQVVO
	77Z46Bm4JoUE/AH4r5bLe8CAkZpqHopSfQV8e8POCzNsXoGz0O8cV7YF2ed2xty8/yvDWjQyqsG
	BYtk=
X-Google-Smtp-Source: AGHT+IGH6Y5P6FyFHKtLYJ0fUjT05rH9kh6VARZhWP0R9zDdHuzkdQyoqFz2sXtSlq05GusZGgw/YA==
X-Received: by 2002:a05:6512:1188:b0:539:8f3c:4586 with SMTP id 2adb3069b0e04-53a154da832mr5560399e87.55.1729352701053;
        Sat, 19 Oct 2024 08:45:01 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211401sm562854e87.249.2024.10.19.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 08:44:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 18:44:51 +0300
Subject: [PATCH 2/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-phys-v1-2-bf06fcea2421@linaro.org>
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
In-Reply-To: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5Y/fABq9b4vk+PutXYP52URTjzKP/DzFXovrE11VWQU=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE9P0W3I/EDrNDCVj5yB0/w7HCAzPrYSmmTAYW
 KQgQDeBCxmJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPT9AAKCRAU23LtvoBl
 uIKXD/0T87NUhAJmFDsDGEks/ElPd0y0NKgCp/ExgE17orDaDiLFy2A4uL2VsI1ok63vOi8DT/8
 1dC2T3tv1Wznedh+WvW2wUi7d1BEGmtUswsmzovHCEL0CuXrQIFGPIckYWu8fKeLJe3X+3SgHbM
 WgJiuba5KMJpnGjlo7S2IN7bJ97QRmoL1eCGhU3ZXJ/82w7CH8Ades8G9+lkTv5SGuKIDpA2uX2
 3dFEyDdTkdcweBI86WW2rh/trWaxAbnVWqA9RNsjF6QryqBb6hS91qOCCe9n7TxeHr3DeQ1RG6+
 eOqIGyWv164RunqLJ4kJGWaaoLrJ7vfyaDvo/ATYDXPed9C9TX2xJPuViEzTUcXLsaFiit57dPi
 0wrXxLRGJdQggJTAm1czG9xLhWLUhHQ5EjqqlVBeGo0TQtcTcT93NWewoyrnsFs2ha70/chNh27
 sXIBYCg+cf5S6hLCdjtk5bb4DVUYUpo5h9J9HVxptVfU8/q0S3CB0KWm05H1MXzYQWHeuyaRXqc
 88b/0WcJzup88PE+ukO5i7KVtkZx3VIxHEsDc6Eywz3BWMF178wFR5Nm7YgfMTGXGrlzNf6Gfpf
 sBro9Hidm0BOKxf/lk5lNdxeF/r7potcps0lK9ZTqbvEcJpT0jw7vfSuyMtvK6Ezq/ZU3p67dB3
 Cm6WafXl4uirKYQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the QMP PCIe PHY on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3c16330a58ec68da32486637e02ae89af9a06a3a..9b3b6fedd70ee924e7757ce531bdab0fb6a3cd8d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x4-pcie-phy
+      - qcom,sar2130p-qmp-gen3x2-pcie-phy
       - qcom,sc8180x-qmp-pcie-phy
       - qcom,sc8280xp-qmp-gen3x1-pcie-phy
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
@@ -139,6 +140,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sar2130p-qmp-gen3x2-pcie-phy
               - qcom,sc8180x-qmp-pcie-phy
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy

-- 
2.39.5


