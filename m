Return-Path: <linux-arm-msm+bounces-77409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FBBDECCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3657A351568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F6F23BD1D;
	Wed, 15 Oct 2025 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3cVTczD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9F22B8A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535805; cv=none; b=lPNfw2raAx6IIrpPs+4NUCGEEmbyvN7+oH2eQxY9FGEujcL7l74xZ+My3LumxMOtGoB6nz/xeQI1wDeyQ8K4hNNhrjclh9YeqcykPE6Lj6WNHBBZ7q1lvGMfW7xNNQZFMgs7juGdOoTXUsTBBFcoh9YGBEhVs/WYgga995+aF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535805; c=relaxed/simple;
	bh=FEcVeNXEob3Or/fjZ7160WHo5UFeG3NUjybRm3Y7qg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ssm50MnKKH400XngoOCU6O+NVDqzOgwaGjzdFkoDBD555osqDs5GpCTz+suuG/VJHedZJTN1HFulIXwami2kfp9ORpbQyk65Np1Z/eixZjSA2SFhq2weK/zeH168EtmdmPkglNkmtre2UWLOlrmqv3CoA2n6FPCGofUUZ4REkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3cVTczD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so5143475e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760535800; x=1761140600; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1wPyexKG43q2S/sOO7LTnlneSVFmXTxcSi+s2kdJX8=;
        b=H3cVTczDh0cY3yEa66d+e0xgeTIJ4KbExTGp07cpIq1afU2Sdc5JR+Dm3oOtdoury6
         UA0G5eT5XO0vSMZOSIfM/h/aukJcMY+LCND1zZa4WnRD+0erxpZNKpHJImu38WFs8QPZ
         itRkyiyN9wlkzDa1zf/lbtcmCpceqwBeN15C02XuVLhwKDu85J2kh2XXy+wSbMN+gHdx
         h3TbRTZGtz+WKy5Eaoh5tLi30MPKaHEVU9YWWvMA+8WI/yniGir1A4j8rs3SUngfuY5c
         vZI2MrizyuW2xwzg/eXCzZMSeXLUHhjlXXGk3ocrGbUo1Oa90hkBGP68s7cM1Q20HygE
         pp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535800; x=1761140600;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1wPyexKG43q2S/sOO7LTnlneSVFmXTxcSi+s2kdJX8=;
        b=Q7Tu22+/zeugy44xWjfcuUng/WWd7ojT34P0O+V6yRcoUHeCqsMj6C6biked2tpRTi
         eIZgNWK3PJiqEUnZ/6Aq7+nKAst0HpA5bK6fIgRS7RNUPnLkyimyk3OgXiV3q8ohe1oY
         wQ8LLUL+bOlzHVAGmO0HQUh+YsEFVy0WMvS+2ijke/yNB4P0sVZkr6jxQyU/Utq/NZ9h
         3OyhB4xqMmCQbaBGF83NyTqvAfrAK+KRfhhQ4jcyC0KG6sIAT135xr2V3OGEx9U0UgRd
         +4D40l48RY1D8vbY97ZuvSfnFZcyIHUVQnK1YDNSDwTlCj7z2h5RTRV+WLKcV0RlNdLw
         OvVg==
X-Forwarded-Encrypted: i=1; AJvYcCX7IZtHcnMYujNXq+xvmlrjEVpqHX0p6db5vZfRh/jWgaln9mUDVm1OL0Sq/X+oUTG1RLhSXZnXSQMs8+nD@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjLytW+0/15Na6IIv6edqWjaEvXpFMs5o/iiHAvSx37XZyJwy
	dJe5SgcYmeqvoO0CS3mO36mwYRZI9qDAcg0clA36XDqPv/hBSc/6NxqZuOMDbdPbmSPFX4wEq+E
	SACdo
X-Gm-Gg: ASbGnct6OLcZBuW0Joj2LWFz/As9L7IEovI/YRGRAoW9YASVRB6vdirCHjE2IBXwyeU
	v53n6xsNrNEW/FygtMswtvB7xF2U9+D+PqyrV/K8f+8G3rQkMvC/CiFwWx1ibgWdC4jF0i+KbZz
	fHIf2g2Hkbhml0VeafTZE2V2z8xY2TF173HJEukJvY1HqFd7mhUZOOPOlGwl0kJN7mTNMmuloKo
	65RWDgXqEoOgol/UuKp/hWBdTyI1FpeBu0C0cpRrVM/Wyv0A57/9oI7EYHkHiO52WAYeZt5YSJ2
	SWbKhMhV8udzNtJto5fZk3SjN0aiKUi15i8qS7fRymaTePd10cosx6Ov+agVIioSNQVbkBEmYTn
	9nV3i09Bfs9StK1q6TqZVzgZdHK3pl3QtdokvweurmwG2YdRifWFK+A==
X-Google-Smtp-Source: AGHT+IEDNRHiLd8V84PrJutxE1YijuILSF7iz1WAhlDVrmP7yEDEZruWiWJN5TrIcrfXwM7BNuLZug==
X-Received: by 2002:a05:600c:8718:b0:46e:731b:db0f with SMTP id 5b1f17b1804b1-46fa9b08f09mr227911015e9.28.1760535800346;
        Wed, 15 Oct 2025 06:43:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3d2d65sm174180795e9.2.2025.10.15.06.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:43:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Date: Wed, 15 Oct 2025 16:42:53 +0300
Message-Id: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2k72gC/x3MTQqAIBBA4avErBvQQKGuEi1MJxvox5Qiie6et
 PwW7z2QKDIl6KoHIl2ceN8KZF2Bnc3mCdkVQyMaJYVUGOaMh91XDJYJjXPol7yeEUWrR+1aJSd
 joeQh0sT3v+6H9/0Ah5x2PmoAAAA=
X-Change-ID: 20251015-phy-qcom-pcie-add-glymur-096b6d951fac
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=FEcVeNXEob3Or/fjZ7160WHo5UFeG3NUjybRm3Y7qg4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo76TtfQlQuLUSfyKLYFG/uNYaVXKOdeybOqKUw
 CANF2gkaCqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO+k7QAKCRAbX0TJAJUV
 VuYTD/9z76fsMU7KcN1pWMXDlk/BbOnYznrTMostkjqtlquDHKwCmR3JlZrNGmuKS4loi6jfwvT
 JuSmX5mhIFJcnjpJVX0fSETN5kEmZ3bv4VknpJlawrbX2c4eHcyB07TzyR59rb6AZrkSMPNM5ZF
 hKsTiliyShykTtUaFogjA1m9Ggo8YcYiqDImGHlCv9gxPNDBYxVYWvnq1/c5WjioZV7KJR71D8Y
 c5DU31kG3/noxD9WfODeHssg/bZiiiA6RT3Up7xi46FA8GbXm3qGzVm6ADJhoxh3+jlp8oG06bv
 931BXbqLTIKxnyxOmzAjt4PXdy2vQPJR3pp2gwF3eXbymMWJCZ9Q0Mawa7iSEhoSRsFAOL2M8Vg
 PqKOqx1JBXxq/O39eAN4U7p2MxAJNF9eCkyzW4QZ6pUdcdHEO+ewQ3SbcaRwKV+fuJOlVrcuyBn
 VZV16NE5rVoomGpG7WOc4ZSZxC5Fb/eLeSTVfzX4f11SpdDPUvgN1wMJTqVXyUGAibw9wWIG2sN
 22eANZxkDIx3gtliquHadOS7Rope404CgnTJxFlF3KzXTLnYnm9ux7uJ3zpcJr9SgwjQPKcdSWj
 7/fs1MQbiJGrcoMVwnyEwko7Nw68nBuz6M2O12X95DGAseINCwBeiBEwSScfIucRlA7bbMjNxGN
 VPFUwG9KjHNNTUQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur platform comes with two PCIe Gen4 2-lanes controllers.

Add support for their PHYs and document the compatible.

This patchset depends on the following:
https://lore.kernel.org/all/20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur PCIe Gen4 2-lanes PHY
      phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen4x2 PHY

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 34 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: f6d12bdc035bee8f83ee6735a0c00b5e0c7407d4
change-id: 20251015-phy-qcom-pcie-add-glymur-096b6d951fac

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


