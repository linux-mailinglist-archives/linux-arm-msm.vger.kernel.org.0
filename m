Return-Path: <linux-arm-msm+bounces-35261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A449A6B16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 15:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143A91C229AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2173B1F8921;
	Mon, 21 Oct 2024 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pkcF4CDF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A41F4717
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518825; cv=none; b=SUqh1GXY20gVjTn+yaJeFrr0MjWPpqU2eZzrcw5ijViUQLNsMm1dtdOHEKS4gGBuWvIWvCijWpHtS6tmOU240k2ZhS6N2rLv+2mGcgH2gKSyEzxIbQdqhWmSCMnki5EyTrplxH9WB7OLtHvTsMHU+xEr2tLBd3liKprKzLvL24w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518825; c=relaxed/simple;
	bh=mLPprBCYS0CcvNkeqeLXHs6Sa2ppC6QadWhv1n9S39I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z/xMuHdvqJbQbzn9WX/8kZ6rlf2MmkLI1EmBC5axG0xx1MW0xHAEv37sO34dEZ7xQEBve2PnpTlsXHjOYlUHfsRchXEHX5LO/nf0ci+vaiQ5r7ql+JOG5KPjATD6r9VK/BInuqhEa7zS5h4H5RXrRWuwGf0umzgf1yMexwb2xKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pkcF4CDF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so24184095e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 06:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729518820; x=1730123620; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJfs+PgK1tr8VcHDI0/x5V7aXC/yCNYdGMqUywKj4to=;
        b=pkcF4CDFWqPVLtloUm+YGBENe9xw+7wj9qeGCp/N5SKTfFDMl5qtaADTUSOVllqz7R
         wUtgz+LWRTB653ya6TVOrUNpbWWCL+0ttJEuKH4sNEayGiZlZb/IPmXTTOXfmTvDXz2W
         Yn52+ekiVYLhwdmXJgOfw5kMNK5ZKcqOGQo/1X2MFd4U5KUXkA9Koz1F/GRwrESF2RHt
         71B16SLbC5mzltrZjdnkeUhlpoBY70puoMqs+yj0XsZ4OG2G0YuL9k8fRpdi+hQdrWbs
         IJk59AAQbdh4sYIa2DlcTwjj+dNl1oPlxCxMY+IuKW7s1AvVUgQ/TWBuAK2v4CmBQu5O
         KJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729518820; x=1730123620;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJfs+PgK1tr8VcHDI0/x5V7aXC/yCNYdGMqUywKj4to=;
        b=Bo0bDkdZxo1ly5hjPi/Nmejf0Uu7cYT3V4b2hxeR9d1eHRYiAoY2pYGE8OMlVgf4Eb
         bAEDQt+JLyhhg2oGknbFN+SNC2jPopOcfcqRZ0/goqGn/1OhIn/YAQk4MLcciWFxS9CP
         Iz+Y1+Fa9MVhGkVYxRRUp9IxAZwnakvg6Y841TmtLDrA5KUg+dDH0TwNWDEQ3wwYsx6h
         O6u2WW6/LtckIK23TzEa3NrbkgSxfaIxBdsipdrwIHCMM25TPZ6AWo3Y2zUakCHsPK1j
         06l/U6sD1PIjHLtiaKQNBR+tkMk++jz6nyUSxSDc5c/PC+UQhXPf7wuUADtspgw63eVa
         OVMA==
X-Forwarded-Encrypted: i=1; AJvYcCUQvs3R8IoN516vOXQAfW845/Ts/pL3XuwtRWSn7EwtrS7KMMDKvUxoDTdLnveiYdmTXgzqmT+QFstfNU2e@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqCxbMv3uYn2LXt4ZSP1Kwx6jnn2rBhwUbXwiUB6WGaidAVCP
	R/V1eU1CIAiBd3e3oMNJK6WfnCclv6LXvGxZFRbLutL0cIxv79c/ePxScAxTcBc=
X-Google-Smtp-Source: AGHT+IHlX/n83la7R4mDN/KOpDwKGHa+CWoCcHlgz31EiLR8noQeoZk7NzcnUOBBFsYCIC2mYv8DdQ==
X-Received: by 2002:a05:600c:1c9b:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-43161687bd4mr96391945e9.24.1729518820511;
        Mon, 21 Oct 2024 06:53:40 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94066sm4408625f8f.71.2024.10.21.06.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:53:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 21 Oct 2024 16:53:28 +0300
Subject: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v3-1-1918c46fc37c@linaro.org>
X-B4-Tracking: v=1; b=H4sIANdcFmcC/52NwQ6CMBAFf4X07JpuKYKe/A/joYUFmgiFljQQw
 r9bOOlRj/PyMrMyT86QZ7dkZY6C8cb2EdJTwspW9Q2BqSIzwYVEjgUM7QJjaTsYuwGG0hDUZoY
 ZqeDIOTTUy1mCI0+Thxq1RH1NszzjLCoHR/F95B7PyK3xk3XLUQ+4r3+GAgJCnclUXHIlqqq4v
 0yvnD1b17C9FMSHXeCPdhHtqBGV5FqpCr/s27a9AZSkddBHAQAA
X-Change-ID: 20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-f1b41b935750
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mLPprBCYS0CcvNkeqeLXHs6Sa2ppC6QadWhv1n9S39I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnFlzaQ/WbHcREWc1gcB8yq5ce/mMzJID5bmSAY
 x/QwnLoh+WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxZc2gAKCRAbX0TJAJUV
 VtqDD/4+L+nmkyjMjZhj2u3amD1O4+4KaUe6rWHdEVM6FmVywmgyb5aDk98SzwYPhy6nr3ms+F1
 sTn19vUBoE+x7NynWHbCN3OqpzpVYLeEMLVz0tUvQvA+I4SkPd1xJfqImPUz5xxjlsfSz05vBHV
 MM8tpB2I5zTkmt8w8jA/Qy2aAk4zx3fP6O3IcZX7Ch1yiLugEsk0cEar1WSelrxcaXspL0U2aNO
 cEUvTsxcunQu+Xk2+dsi7n5OxW3W5TREwXyswbEJZ8h0vAO8+tB9oqb3+UNQIvaZW9NbIJpzBep
 NdX6SlueY8yHmq32+q80kcDRFtnghrxVCNIhtip1aiucibEcglwTleW9pYH5FU702eW5htzswKG
 74JEV2qaTsiJyvUZSZFtFxM/4K5dCHb0QbyAjWs4XjpRx7PUogHQEoS1xTcqwY/KfIqxxs2PP3C
 P8zbuA4Wo670c7F2023yNwe6wihnolesGiTqf7Q3IrWFTZyTAw5qAFliaMEbPTDuPUG5ZO19TnX
 urEm4EFNJrtAQjszOKB8OI9iTy2k61mICexIBMJ9GOeMJ3nl1dMiKtDsU+P7bFFEKPqwo6KRBZm
 OzE1JxNm0bQhPj0rDL7ApnLPdrL1RDT2gWSojsSUk+P7nGawtqF9GU3eUZ9g++9HH5jGcQvNLD9
 BuqvpXyLyUL5eXQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The PCIe 6a PHY is actually Gen4 4-lanes capable. So the gen4x4 compatible
describes it. But according to the schema, currently the gen4x4 compatible
doesn't require both PHY and PHY-nocsr resets, while the HW does. So fix
that by adding the gen4x4 compatible alongside the gen4x2 one for the
resets description.

Fixes: 0c5f4d23f776 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410182029.n2zPkuGx-lkp@intel.com/
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Picked up Johan's R-b tag
- Dropped the extra "by adding" from commit message.
- Re-phrased the last sentence to sound more correct.
- Link to v2: https://lore.kernel.org/r/20241021-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v2-1-1b11a40baad1@linaro.org

Changes in v2:
- Picked up Krzysztof's R-b tag
- Re-worded commit message according to Johan's
  suggestion
- Link to v1: https://lore.kernel.org/r/20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index dcf4fa55fbba58e162e5c7bebd40170342039172..b5bb665503c86c79940031bcb58a36a833918a4e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -201,6 +201,7 @@ allOf:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
     then:
       properties:
         resets:

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-f1b41b935750

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


