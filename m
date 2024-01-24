Return-Path: <linux-arm-msm+bounces-8083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1E83A315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EFE2B25DD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AA917BA0;
	Wed, 24 Jan 2024 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ef25jQVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641A17BA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081842; cv=none; b=pHuPd9tSLQi3fPVvyeqpkSDfb5nQ/F4W+9Zm8RNMc/hzvHyGI7gC/Z+jqRvtK4mI4KL+kXTga+EKEiwGT0nzLt+SmGhpccbyPdDPqh/PlPCuNfHkq+s/lBUqt+K3c5KUpUzi8nSaukoaaN92jHHOPzfRS64iQN7URlke6eaoipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081842; c=relaxed/simple;
	bh=SMDJRGbt8Jv9ABIlOfDcm2JYxpzZQjqrX46K5L5t/xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jiBlBEp9N/4xqws27mqDPXX4cbWGKGska9MdQZSQDPnFXdnMG33a9kCTRlvja5s+cb5FW+U2yeHPafz2vpFMKlc5RAp6wmDR4BGwkkkqY35SjjmDLYqpVUbO+cSs/6sCgVrbRvjyUcfyxMpcUtVpLc4UkmhqO9Mlx+zIcLsLCjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ef25jQVK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d71cb97937so31244685ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706081840; x=1706686640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJnupBgFvOzDewfsN2fbqfoXAijS1cIjpRbgOobXJnE=;
        b=Ef25jQVKTs1NV/SOt3b1Ov7l22+0+Ki1oZFBXxKof/9+dEMvwJQJXm6XU5eOJf0vLE
         RTB61OVOwkfN4eG/ktcOAnLrNy73mnDK7trot6OCUdXdt4TD9nz6pQlldiyiDpll1JGb
         BBT0LW9i64GfwjazODgWYloNVr6ASjXasgdhwFPImvLPSm1kYnFy7OjlllPuvOP8VVuW
         Jv/ZLlwpw5YmDbv9ZJ4xbToen4mjpz7I5IGbhrmHmZxHNSyXAlxTJ5ah3tGmxPrXGQ1L
         QQJ75dIIuTQzW+6NZSOSFBa+HZiem2cLjKaN4sLMQ5PWyJ06u3y6NzGek3inqr4E29Ta
         JVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081840; x=1706686640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJnupBgFvOzDewfsN2fbqfoXAijS1cIjpRbgOobXJnE=;
        b=sPnkqEnJq5ayX7xyzF6psdbsGl+6SyUZ5pB2mUwcWOPDaiNIsnlMvCz3+5DETMnZfk
         5D4LIrBi8RMZDpqgn86yN0rhDIdFSpEQMS8/qGcciDMBBoQoHlsZOZ0i+u5xa4wkpgjK
         ESeKpxWFygRsEzfc8GNMXcZfooTVLMOtZHZHqBv5AjzGYDUFdqq/x4lttrFPKrj448j1
         hRLLnCgqJeo+StJV7h+OVKui5+lEEhnYvAZwtyzorhWtYRGNzu+MHC0ceI+BlCIWK/6E
         pcwacxc1Bn7xr8uwsFLa/5thdI8avQY5zjym9dyLVEilzBOnayzsv3SsuIq5R05c+dky
         f4gQ==
X-Gm-Message-State: AOJu0Yy4tYwJYoWJinkagO/qhoFIOl9RMLuoUS6QYPu6TWltiDOiFJLM
	D6bs4MKNvAzNT8OtraaeDLwu+n1ybrRD8e0hVKCANSLXmi1ICh4JFOWK2se2gA==
X-Google-Smtp-Source: AGHT+IFgsPWxZquxFDzz8I+/ShqqZin/JEW0/exyiv5vB1JusQRtCefw4n6e95w8cWZvyOJd08aWdQ==
X-Received: by 2002:a17:903:8d0:b0:1d5:f255:d386 with SMTP id lk16-20020a17090308d000b001d5f255d386mr363745plb.11.1706081840194;
        Tue, 23 Jan 2024 23:37:20 -0800 (PST)
Received: from [127.0.1.1] ([117.217.189.109])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902b20300b001d726d9f591sm7386982plr.196.2024.01.23.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:37:19 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 24 Jan 2024 13:06:35 +0530
Subject: [PATCH 07/14] phy: qcom: qmp-pcie: Add a comment to clarify the
 use of "aux and "phy_aux" clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-pcie-aux-clk-fix-v1-7-d8a4852b6ba6@linaro.org>
References: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
In-Reply-To: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=SMDJRGbt8Jv9ABIlOfDcm2JYxpzZQjqrX46K5L5t/xk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlsL4Ey0uoNqHHYLtSpRKMWtRALxolVDEIjsBe1
 zYzwB5mGOmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbC+BAAKCRBVnxHm/pHO
 9WzXCACg8RokdsMoSt1cI+uOd7qIPPW8HvoqXvRdXwF/FVdYRM+4YTHK6EJJElspwuRhLnphsdy
 I/+Z8lnLaKfuPLCXoircyEnF9PPdsGKbcCCII0YGpCWaSmLIkvRddCBfZvXKsN9gaegvATDg9Pe
 xA7iGWN9VVDOmdVyOJdadAtul4vlv3KrUW8QdLJL0vCouWa/OJx9m6CwnZ5A+iUMXO7gmWvgCrj
 WQsUUQfmlRWqZAmEkT1p8XoYs7Fwo5a7T8LDXcKSdbbkQTHNI0FbpTPq9IDoWqkqv/hGznNtaVb
 BKEJ7RfVUA3wOjPqCq86Shm4jUiYP6nbnLRDjXzXLdFxdPKZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

PCIe PHY hw on some SoCs require PCIE_PHY_AUX_CLK when the link enters L1SS
state. Historically, DTs of those SoCs passed this clock as "aux" clock.
But, SA8775P passed PCIE_PHY_AUX_CLK as "phy_aux" and PCIE_AUX_CLK as "aux"
mistakenly as the latter is not needed at all. Even though the SA8775P DT
got fixed, both of these clocks are kept here for backwards compatibility.

So add a comment to make it clear.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 9a220cbd9615..044e3c5ba341 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2328,7 +2328,15 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/* list of clocks required by phy */
+/* list of clocks required by phy
+ *
+ * PCIe PHY hw on some SoCs require PCIE_PHY_AUX_CLK when the link enters L1SS
+ * state. Historically, DTs of those SoCs passed this clock as "aux" clock. But,
+ * SA8775P passed PCIE_PHY_AUX_CLK as "phy_aux" and PCIE_AUX_CLK as "aux"
+ * mistakenly as the latter is not needed at all. Even though the SA8775P DT got
+ * fixed, both of these clocks are kept here for backwards compatibility.
+ */
+
 static const char * const qmp_pciephy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
 };

-- 
2.25.1


