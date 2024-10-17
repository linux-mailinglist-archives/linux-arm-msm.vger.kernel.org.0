Return-Path: <linux-arm-msm+bounces-34802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6A9A2BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8CD21F2257B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478071DFE06;
	Thu, 17 Oct 2024 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYSypRu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4741DF246
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188794; cv=none; b=lD9hHqmqM29eN8TlC1Imta2XGSJ3Yt7/wj+J4A17IvIdqVxASVRg2k2cMR525tHRvPEqu+yUluTr2n2odmq+/6cYRXA9koeofqYfAdD0NvEBau7P7okDtbtZ0JyGF7cTeZkf9B2e8QYTD/qEJSYOZqbMk+Ixh66+dzn2xauIHIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188794; c=relaxed/simple;
	bh=JTn3ixRm8ljcOQbWhG9GTJvBDZ/tOmpxr46jMslXuP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hBVDjr4uW0CNwrxhyyKBE1uzIgIERwoAkIvlycJ8qyTTMbuEQ6hRtFc82SCQ8rKrCS9i7Tg5k0CLFJdxFf14q1Uh/7U9RUJE4EwY9tRQNUGIerOjsSmTy2gC+18HT5jsUMMtnRcoO3mTGwpPvrMMiXc0DuiPrkfG8Nt5p9ZnwXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYSypRu2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so11764461fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729188786; x=1729793586; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l39JnsJ3fC+SijFlQC+GvShh4wnfmDB5t6AXOQs1NSg=;
        b=FYSypRu2hE7sZaocAL8VpaUeSM8jlzmCZoFeuxGZ66SXR0aJreLbQo/H6nqCx8olvz
         /qwwXOetDSPjrKleRkvFijqQ4DmTvXcW/QK7Yvz9d3oY1xJgQtQWVg4cOkSMeUSgCLOY
         0kn51Ji5JKAFr6lYPUGOBcmHL3LdQQtGTpHM16XqvsDPAmBsu/VQQmFsv8//YMbsI9x3
         GZwrdATzeBO0sUpmcKuLrXCznjYi6PgMZ0TkyZ973MQvfhT/5RbjwlCwgzwccBT0sgxY
         TXM7DiI6kUksNpVXBsZicmd/9rRmfUXRVUtKdmK+YcZE8wbf2f4z1I9qhVyyWJLOdBKi
         8xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729188786; x=1729793586;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l39JnsJ3fC+SijFlQC+GvShh4wnfmDB5t6AXOQs1NSg=;
        b=TL5pW0YG+0haC9SH6ZVHS+Xf+YhINcxt4Cde7Y5YkQ++BVBebpysBjWPR9rNZYXq9/
         Z1RCu23yvNB88lsyEyBH6vY4u1gmfpAIft1elm9QS2kuhYpCtkeiHa/slYZyQbvlNWbW
         bLtEEe5qetkl2+hJ4ck6Ta5RJlHKRiBYA6sbAmmegJXqcv0K4LTtIoLnLANQN1/u/wSj
         WA/b8xtL7aBHEGe1LYBK7cb7YbGQuRk92ekkfLF6tNLaa74CotL/ed1GJPrfff1ItyyG
         Xi5K0ytFOGLt6kFx3AwBXZWyFYw79h3iyUAM3+f/nOcsOPefuJ+lh0hv4DVkBLrUcDXK
         eFHw==
X-Gm-Message-State: AOJu0YzsgkALqqNkXMJI3zkZz+Emdmmj9VV5F1e0Ewc3u6PwhHfpRRU+
	89aKFcthzu6/1p3m+E1E7ILL1Re0jlx5+M2Q7Vt5VYYwAPFOXT/hTJqoTQAzqHgipax0dpGmVz7
	CMDc=
X-Google-Smtp-Source: AGHT+IGw0tSb9CE3mnWZTN3qDKPwaTJlAAJR+GEEhhCYXi2czQwNLvBrAaBiT0kjDJ1ntYXjSsrUJQ==
X-Received: by 2002:a2e:a984:0:b0:2fa:e658:27b4 with SMTP id 38308e7fff4ca-2fb61b37ab8mr62558611fa.4.1729188785950;
        Thu, 17 Oct 2024 11:13:05 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d0fe159sm8109781fa.10.2024.10.17.11.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:13:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:13:01 +0300
Subject: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKxTEWcC/x3MTQqAIBBA4avIrBMcDZKuEi38GWs2JgoRhHdPW
 n6L915oVJkarOKFSjc3vvIATgLC6fJBkuMwaKVnVLjI5qpGo4osMUi00SRlnY+eYCSlUuLn321
 77x+3srQVXgAAAA==
X-Change-ID: 20241017-sar2130p-pdc-18d3f08abdbe
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JTn3ixRm8ljcOQbWhG9GTJvBDZ/tOmpxr46jMslXuP4=;
 b=owEBbAKT/ZANAwAKARTbcu2+gGW4AcsmYgBnEVOwctZnaQ4zKYvIlKNdhY9jNZUcSNE2teitQ
 duFNaSj0J+JAjIEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFTsAAKCRAU23LtvoBl
 uF8gD/UZMhZ5nFP0p+HiisG+GGRVRlACgGRgwBqsYnm+XCW47yHWnaZySNlM8uDySI0GF249siu
 RDF5Hb4evdNP4n3ZIRIsNADHOy5rwm2H4pVRElIb/qANxXMXlevKeWoce/owRz1UffIQ6jWbVEn
 GhkTPKTMsVVbRw9j/VcS2SIi+A4+3LVLwDXoM3wk+eTbG/Yh3O34s0YpdNHzbLxB9o1lC5DOpt4
 tgS98sNt/1vzN5/d0Ss+SpQMefc/t/42BL0MK/gQuh2VUqjFl6MaiS44MMcgzIn08XyBX/b33gX
 waC+OdcFCF8frbjaan3OMNbo9HW8rxEhiV/mSiND4YP5rqBzX1OtXYdHAt1gDKijZTgIbq9zcuy
 UDgCCx3KpgsJeNyq5cdCLEfzTFrcDHYGRyS0LZgaT6y+qX1YgXhqMNO9A8FGQpw4KiQR1ocyrPS
 lIUedZqM3eovJWQHDbLmAyzYa8EJo+vAFRuMNubN7l+QWv/x17+Y2ZtAw9pu8pBZtUxGQl13l7A
 SH/lfFBovAoOQWC6rZmzAV9PAeG5NkdJzclHvB9DQpY1L/hEqG8LQ0caRLDboouCfesbNFl/8VV
 FjxKD1xq4t5+OshV29kEDjzC/R1xlsL1ym06gW8uvrckOuuR7iRiwgvRjo92ZZgQ2HQLQSvR+8t
 8cNWSFrm1a8K/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for PDC interrupt controller on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0c369985c5f2d5b4c4644367a88dd..a54da66a89e73212f7b965997dc487d9f0d421b0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,qdu1000-pdc
           - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc
+          - qcom,sar2130p-pdc
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
           - qcom,sc8180x-pdc

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-pdc-18d3f08abdbe

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


