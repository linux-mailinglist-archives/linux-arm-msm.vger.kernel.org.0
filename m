Return-Path: <linux-arm-msm+bounces-22713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C28908991
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E66028B7AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E586C194A56;
	Fri, 14 Jun 2024 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeGAn1nU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC461922DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360309; cv=none; b=QCGFhLMpxTTS5V+R4vTUQ2I7s2jesDgPMFQ8LTtl52rm7O4yk5RfVnDjDu4E8YgXvYqiM3DDTwXHa6DGmxlYtV9G6KrCnco127cgxcBIYIePxoZKnNyvPtVd1Pm982Y8esJVUt7W3VMSa/cRlMuilOVQs44WZtkEsaizuU/cYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360309; c=relaxed/simple;
	bh=e/vS57MZRDtlro2SWvpS0gu0uEi42A6fSDn9ZPw9edg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XCsatUPdH3ejPtZ08lpi/t/3fwCBKyXEODmwZzkEPUvBcwCemjWwZKOxSHi+ysqtI4DXsluAAPvw3tqtyJxE+ERDDr4dRg49MMEVaQh6kNt/ly2agZOhHhuu5BLJBZ5LYUZuRl5GgNE75whNiyn/dgV3ilPFpMbT5ZcqEeATyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeGAn1nU; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so3300681fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718360306; x=1718965106; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYj+vYlav0P5TSwPVqUtIz1j4klkYA9AbEcUeqORsg0=;
        b=KeGAn1nUQF6+CVbZjIK4zqzqB5zouZA3VWCcH0K7MdjX93hAE1t0fYh2vpIxeqlGi8
         rv/Gr1ZLhEnd4onknKztBsJoGvrqI3uUn4HjtMmWnV40MMLJKw3ip9H/M1OJBY6rrp04
         0jB2H17cvRxm0Hynq0SvHguxlRXnzeHcGqHygzDeWzwlF1tHny5j7JR3bOqOfAjDTGT0
         5E3RsK6mdbpKgyhvjcMEunLE4KZtqzdgLjswcx0u149zhwBnFDE5eoDXe3Nz09Ln/6tU
         BxH1R8Hy3dPz2WughcJIOqy21DbD04FOH89NMq3qK98me/hEIB4GthDJ3vCi3ts3X+0G
         k9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360306; x=1718965106;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYj+vYlav0P5TSwPVqUtIz1j4klkYA9AbEcUeqORsg0=;
        b=mhus+pToxOm4IgR7touTSa0HNI3l/0Z7nYqZZ8MG2a9g1Q4k7xPt95Z8ZuD2RnGzKq
         bP5S7BbQJufeN7B2sh/6Lzsuss9rmFwYpgKu6A4QupjJsPTGD+mY918IsbFNyMMJvh8R
         2/MQdZUj8KuGDh5wG5FFGSXtJs9UqKTnHk65Y33mjf3JH1X+ZM8Zm1SjS6OiRHyPL0YO
         XSpQjpGS/RqJUIOG3Xslywcda2hIjTjTB9r9tcPgdapL27C9VgsPNKLsIiYGtz247VFN
         jY5xDyeDHYqDGoKrvunuc091Z2skgRynUz5/Y9kMTnA1KqgCvjVYD/UzZ708/AoBLDZX
         kFzQ==
X-Gm-Message-State: AOJu0Yw7GzLw/EcnNYyf4GHL49VDATGCB3jD5ztx2p5YkuGzjHXzQYVb
	qY1cI5Zx6O9dL7AnKpCJFaOVCnYnT+r/VAglidggqw8QcfOaKKY1Ip0/xWh075w=
X-Google-Smtp-Source: AGHT+IH4H3K8j6QfiGJlv35cF2UfdUw7daGofG712v461wn4hJojqEJ1PEJFBhgsfwpiXRogE71/Vw==
X-Received: by 2002:a2e:878a:0:b0:2ec:48c:8ae2 with SMTP id 38308e7fff4ca-2ec0e5d0b88mr14261061fa.23.1718360306362;
        Fri, 14 Jun 2024 03:18:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf44c4sm5000241fa.9.2024.06.14.03.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:18:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/5] phy: qcom: qmp-pcie: drop second clock-output-names
 entry
Date: Fri, 14 Jun 2024 13:18:23 +0300
Message-Id: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8YbGYC/33NzQqDMAzA8VeRnpfRL0V32nuMHVqNGthsaaVMx
 Hdf9TIGY8d/SH5ZWcRAGNmlWFnARJHclEOdCtaOZhoQqMvNJJeal1JATy/wLSH4cYHWPb2ZwfK
 +02h1ZTvD8qUPmNcO9XbPPVKcXViOJ0ns0/9eEsChNkaL0jZS8fr6oMkEd3ZhYDuY5AephP6Ny
 Iw0Da8rhaZUtv9Ctm17A/nORbv8AAAA
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e/vS57MZRDtlro2SWvpS0gu0uEi42A6fSDn9ZPw9edg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmbBjwQrd5js8BXipsqsF5cpu5SbQHYqeKPfwwD
 JdYmlmoThyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmwY8AAKCRCLPIo+Aiko
 1agVB/9WS3uiu3HZIel16w7kPNn4LdNLQX7XqhyLY9sHu6oe1PD1PpxqXReCWlgn3W3g9Kcxtpz
 H9+ur40bZ2unxnckJ1e3Go1juItrgf9O4RrIgGblqqeaxdBfTcwSItG8XQaYothSKlb9IcYNiKA
 e5wCnDgFfa+pqqsLs8GCiJkjM87kb6KQPh0JHRaTUiS4ZcAvPvMO8sITHlRqU+hNkQynETq/uiP
 SGot13W3gfp9bU95srZco4aCiYPufBAGNKktkk928d1nNVLbdv5HRdboy+oIM2sAxhfk/uwufAI
 sOClMbo24MaYPpyVH8ifUcs7lBJ5lHN/uHrGz0zic1Ps1r52
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While testing the linux-next on SM8450-HDK I noticed that one of the
PCIe hosts stays in the deferred state, because the corresponding PHY
isn't probed. A quick debug pointed out that while the patches that
added support for the PIPE AUX clock to the PHY driver have landed,
corresponding DT changes were not picked up for 6.10. Restore the
compatibility with the existing DT files by dropping the second entry in
the clock-output-names array and always generating the corresponding
name on the fly.

To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Changes in v3:
- Also added DT bits to remove DT warning
- Link to v2: https://lore.kernel.org/r/20240614-fix-pcie-phy-compat-v2-0-990863ea53bf@linaro.org

Changes in v2:
- Fixed generated AUX clock name (Neil)
- Link to v1: https://lore.kernel.org/r/20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org

---
Dmitry Baryshkov (5):
      phy: qcom: qmp-pcie: restore compatibility with existing DTs
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: drop second output clock name
      arm64: dts: qcom: sm8450: drop second clock name from clock-output-names
      arm64: dts: qcom: sm8550: drop second clock name from clock-output-names
      arm64: dts: qcom: sm8650: drop second clock name from clock-output-names

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml      | 7 +------
 arch/arm64/boot/dts/qcom/sm8450.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                             | 2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                         | 9 +++------
 5 files changed, 7 insertions(+), 15 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240521-fix-pcie-phy-compat-b0fd4eb46bda

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


