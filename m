Return-Path: <linux-arm-msm+bounces-16001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B141E894992
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60EE71F2365D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AD112E7C;
	Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpJaNuuj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF941118D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026308; cv=none; b=Y2qLNGssuHggQUgtgwysEAGi9I6rheNNW7stGpnzmDGorXKbZ2KcazyQUMQkz46NLsZ+lSdADgq4cztJcyz7vPSDMKkjgjfsN/5thtS/DnAW1slbZ6iWQXVGTVLCiE5Ptl5ekgoUVzZ8LOEl+RqVGeRlCzMgvBBKTyP49R9p4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026308; c=relaxed/simple;
	bh=y5XQgkEoklAcMcBMPDOFMsdTPOYsPlqbCmGO9xsOB6M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gUgZ+VwEqk3hHCBKkirv1q4lz9YXZu5vdHWN411iyVJpG8oDRzHsaFrNqDrDvAl4hvXIirFcTkaCdgXYsvJzto0DZgUb7+6UjjUvjVF9rrmrQhcJlx8gErfOUmXXA1+uryv7stvE3uAXYbNVuhk51LHSzGDZbYIlGw3CqbtdOfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpJaNuuj; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so37040e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026305; x=1712631105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u51beO54X0b9gZ2OYRcuCm7ajK6+8XO/iEIFNJnKcqQ=;
        b=VpJaNuujKDWZIcWdxxoPROA1xS+Hk3yi2tP99vdQBRbdYPnNmkh1rC1eYpo26HyAnM
         WEa/34hXZQeu1hzznIaz0hWmSVKDTGW1eZNgqvvarQps3FjNNps04qTWoDATmgHpamFe
         mVLpPXdYc4ywjiJMI6MPcSTDXzHEGLnOwa3OvlpxFFucd0nJJmqiILaK8wXfu7cVeCPT
         oYuBK2tpEJxps7Ctf0PQJk/YPKZK3uZAUQa2nv5LZYdUX5zoY/LMldkhj35ZBw9WoZnT
         2a2yz3tSrEfbc7TQl4pKNLh7qVNEuseve/H2cWJiGK/76TlcHrsXdJ8O/oS55Q6zztWE
         qFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026305; x=1712631105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u51beO54X0b9gZ2OYRcuCm7ajK6+8XO/iEIFNJnKcqQ=;
        b=RqCSQyK9qsqhwLfV45Q+gzkTW1KEiptm1Fa9OIoaJK/2broqdAo9w/m5xu+JQLzNXs
         R8GxcDo8Ewqd0LtmQSagAUKz20wuQcphH73pZOl4YmleohD7OFaUTWDtM4NT2Y/MSePW
         56g4s6jZK+nJ58ZC3lRpP6CrMEWjCO7ypt9J/O6aojQfnYGltsClixi4D24bXxmz8WrO
         IYRcNu/3NwTCm3vDix9B8covDReVV8Lh6QK+a1WN95MwZV001XifdbJHLpyrG0vFc28v
         1vPa7lFuU/bSKFIwzRgnlOIQ8Jg0jSo8h0zlkMnn56WCJd/j1Vigf13wisuKLGShA/Th
         MvIw==
X-Gm-Message-State: AOJu0YwEHeB3WefOgMl63D1Kht98SUeOILFAtvMYMl6JEcwxJUXGLnNU
	KbnzVOtJ1yFugf0XlaqlmccLLdBiE+IPPeLyeIcUgIUTAU3CYJ3wUVYUvroXOPk=
X-Google-Smtp-Source: AGHT+IFlJxD1nqWGkA3INBWqc4UKgZGBwfU7efLJ9fDsv0OO5y9LIXZl7K0eYhbMWxAwA3+bti7n9Q==
X-Received: by 2002:a05:6512:3d0a:b0:516:a978:7b06 with SMTP id d10-20020a0565123d0a00b00516a9787b06mr4216248lfv.5.1712026305116;
        Mon, 01 Apr 2024 19:51:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:51:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: fix several display-related schema
 warnings
Date: Tue, 02 Apr 2024 05:51:42 +0300
Message-Id: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL5yC2YC/3WMyw7CIBREf6W5a68prxpc+R+mCyzQ3kShAUM0D
 f8u7d7M6sxkzgbZJXIZrt0GyRXKFEMDfupgWkyYHZJtDLznshd8QG/R0wfztLiXwYdmXkujFRM
 K2mdNrq2H7z42Xii/Y/oe+sL29p+pMOxRyouywx4hbk8KJsVzTDOMtdYfk7X/VqsAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y5XQgkEoklAcMcBMPDOFMsdTPOYsPlqbCmGO9xsOB6M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/TA5piUtvLCcIOV/X+jNAFTzxG6/hS3/cQ
 rdlHxmDYE6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1XgoB/9W5jpGsTHB+uKoc2v4f+cudCOlCoyXPZZK+DzId83JSBnqmrKueem1SagMmXXqW3+gS6C
 GfxQYyBtyk9kAX16xj+FVBiCwzNpx38OoQWYLVwRsPLRLb6qdS+5chK1Tqtl5RusRrx5WO2C/fk
 cuqTiC+iCuxMfhBQPJERRL+0XeLr+RsFm7Hx55T3DnUiofWhfN7U4aSNx/97ezgehv+ZDd576W8
 hORcdkAsajwaV0oHSSQsGlgWlyIfDFWs22qOZRPe9GRvJmPbYqa3Dp3PBz3M6DpFV5lowLaJ1uP
 HvsgOI3Alkgx73KPu2jxthfAhktxxHnLr2BDm/y3Lg8xSVbj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix several warnings produced by the display nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added Fixes tag to the DP change (Abhinav)
- Switched the schema patch to use contains (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: sm8150-mdss: add DP node
      arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes

 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   |  9 +++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                       | 13 +++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240326-fd-fix-schema-b91f94a95135

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


