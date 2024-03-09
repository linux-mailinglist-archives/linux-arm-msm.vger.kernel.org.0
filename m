Return-Path: <linux-arm-msm+bounces-13753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B95877163
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 14:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB1CFB20BD6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 13:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7771A3BBF1;
	Sat,  9 Mar 2024 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AX6Edpw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63EE3BBE3
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709991102; cv=none; b=QJtUirXM2FYxWKjrWh3TnRRe8r+ssKw73K/2AzdJ+wSag9+OcHfXZukIWtm/4F2YJBGt3VLC6fgwe25geqTruMLWsPZojhji/8nKz92unjDOWn0fZVUHgSk9Iu98yBdwa1Ha6RyNuiNX4LgNl3TeCx17C/cPDp5ZQc+0s3gYwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709991102; c=relaxed/simple;
	bh=3PPGy1YGHaSdumT4F8l8zt/zKWZM90Ind2PI+taBgZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dQEp9lzAcW0jbVviDO0L/zwQtkRBZYNxYm1CiTlnFARGajdjIQtRevcxHVc75iXGIWu8CyUhoT+Yg5DQiduwAiIqSlt+Ajzmi4ASrIquTRlVadQRBv/ArfcY+H2pOHHGItE5Tc0ZpmbeCJ7RrmIoaZKQISzWusGe09A9UeWQ0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AX6Edpw5; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d2fad80eacso19766151fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709991099; x=1710595899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKCIWQzokuJrHNFcpWWWhUjMkEYBjpikwqy95obUdnA=;
        b=AX6Edpw50p8hCL+FGZfk1HS0xFK9qvOxiC0hZSk2q+3MDkHf2zjpmSJYDwiG1NyKI6
         x1207OcYkq7Ho8vshL2FuMlTxZIjFbiG0J8s6x6FpqYSyXdIbPCqF0kIP89tBgcDeKpr
         BS1kiVs1rnGia2zT2G8t+yGCI6dhcGgiVtbnBDKHSMdyZsBr9rwqq463X27VCr/QCTHG
         FgFQHOl20FRk8A5e762mOdIcY7juDf7h10ihhCA7Sh+MHs4a4yKCEYf93nlfjcycS+c9
         ya+wsV4P9WEn5LtQ01sL/6ofemQ198u+Z5yIh3NDHw1SPMiOnx8kFZW9EQT+jaV4rX2M
         mB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709991099; x=1710595899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKCIWQzokuJrHNFcpWWWhUjMkEYBjpikwqy95obUdnA=;
        b=sUlBybW5gpcPzGVVEu6Pio4Sk8hsrLxDfoY8erXl0u+gLMG2ei5mZC01rmqqL0NyIQ
         Kv6lAAcZ9CnR2rRXt+XwlaXIFKD56QgwFVQLWNY9xCJDdcsuqW0ZACsZNG7iomhdBRGD
         FsKfImS5IqKmZFba5KC4MylwnYyYbaD+QUH4gyGm5ZZRO/Li1SVNLPUmQEYo2LSE+g2E
         7erL9oQdw+wxDCFocjnL4Zgv8I9jX+57XaPxrA6irWWhGOMwl4qJr3KoRgg5qkBB+egH
         QPcutl6d8xRDDY0M2iL69fD2HzF+i7rwc5R9m8CFFP0rwojfYkBN/jPq+yzcGf4qyL8K
         QFhg==
X-Forwarded-Encrypted: i=1; AJvYcCW4BC6exLGyRPnzEn+/WKum0c3yeHcdYGn6Ux2O8uqK5Jw1akch27tswvvqgziyyZYDAzjcUxjssaU5jsil1gt+/f5YNopnsJtW7Q10RA==
X-Gm-Message-State: AOJu0Yz3MhqDD2eqGO3M5LMM8V05J1ePvLG5/gZq8T4C3EMiK4dRLWFP
	HQE3/4eLr8livOjMQOzExeeemqAEM5Joqdd1Tozsqz6StGGWVhaOzy3jUbYerO4=
X-Google-Smtp-Source: AGHT+IEzC7Rp20E6bhvNP3S3wyi1hQB7gbrbf/iWVD1sKJ4sYtswRuJi1mSZprYsBF0BW6EFy4eQUw==
X-Received: by 2002:a2e:928c:0:b0:2d2:7813:6ca3 with SMTP id d12-20020a2e928c000000b002d278136ca3mr1139418ljh.9.1709991098793;
        Sat, 09 Mar 2024 05:31:38 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b002d08f3640b5sm298524ljk.11.2024.03.09.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 05:31:38 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] Describe SC8280XP PCIe SMMU
Date: Sat, 09 Mar 2024 14:31:08 +0100
Message-Id: <20231219-topic-8280_smmuv3-v2-0-c67bd3226687@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxk7GUC/32NQQqDMBAAvyJ7bopJSNWe+o8iJYmrLmgiiYYW8
 e9NfUCPMzDMDhEDYYR7sUPARJG8yyAuBdhRuwEZdZlBlEJywRu2+oUsq0VdvuI8b0kyxbu6apT
 uK7SQO6MjMhO0s2Mu3TZNWS4Be3qfo2ebeaS4+vA5v4n/7L9F4owz7NFIYcRNKfOYyOngrz4M0
 B7H8QVcNBu5yAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709991097; l=804;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3PPGy1YGHaSdumT4F8l8zt/zKWZM90Ind2PI+taBgZw=;
 b=GGkbYbxDkQuoMPokNfWOq17o4bOTMTzIETydZjsZu78FIhnI/OCk7sXZeWxNZGzsEzWoMMsY7
 UeGZUINREJLB/csm2Vbx8FNPeWzwgBaaNKZYrU9UdxYYENvkFK0Mw4y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Explicitly call the thing the PCIe SMMU, rewrite the commit msg
- Add 8280-specific bindings
- Link to v1: https://lore.kernel.org/r/20231219-topic-8280_smmuv3-v1-1-efeb32b2655b@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: iommu: arm,smmu-v3: Add SC8280XP compatible
      arm64: dts: qcom: sc8280xp: Describe the PCIe SMMUv3

 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml |  6 +++++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20231219-topic-8280_smmuv3-51d8795af7ec

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


