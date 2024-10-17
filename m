Return-Path: <linux-arm-msm+bounces-34809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D99A2C0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF4D21F274C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFBC1DEFF3;
	Thu, 17 Oct 2024 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkiMt37Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52C1DE8B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189228; cv=none; b=Jpgsn4mjy5etaAT+w7cW12KXkS5VKUQFwf1SYCiJhGE3D5gmUcMiAQM42SAdG8JplD7WfFUKE51IqAh/2lbdb6p0JFU8b12BsppehPiYTiXth6IjKvz1exQx1seFu0lVsWhbSydW6HD0+6Ryjf7ItRMu5g3nQWbaqzzxBzk/BQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189228; c=relaxed/simple;
	bh=IWnOkoOZ8OZLzfgS5I6gk1xbLXcubJ+CYIPQ/82YUM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U690RV4X0QWdnQA3Zjfl+lDSSKpdPwXthW1fqvoCx9WSuqkhTnlAv/gckax5prn8jyks1TLpZyBDOTphzFkf6xkfUnwA5YdcDkD8Xyo2KWnB7jaDfpgJ/uYFwoxQuLBH/qg+aDWj2ffaLJuXrnp4Ue7zbpqM4X7kXplIoONx0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkiMt37Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a097aa3daso1289157e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729189222; x=1729794022; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BR0ipYNmY1bs4eqL2TOJ5C3MKZ7O1g2EJ0YZ5m2AwY=;
        b=HkiMt37YPLs0Es72s8FQSOhQnrb3EMHu1c/TzDRM/FlLDK6y81K6Rk1K/FhGvZcqEa
         8kMKnSu5pBWu0nGSMlbKx2jWDLeUp+7IOQtBnokxhBGhXehUG5VFEzi8D5Fu8JENkJNq
         ki3lm+Dl11Nd6ybuEs7EQqB5l4OMO6t2RObWfP/xeo0NRKczUapn6i+AibrlWCdtyMaE
         YqkkDuEyTEhfDByRXzT27xEXufBfsAf7YOFHY7qbXK5D+9aSH/SzM8CFeQmr6I76ZVny
         Qlu7ARn2dl+Xi89oevncxDGXuYsldqjKMiKGFgAvYMG6ZMAfY8uVxl20gBzFo+/VGeXP
         etjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729189222; x=1729794022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BR0ipYNmY1bs4eqL2TOJ5C3MKZ7O1g2EJ0YZ5m2AwY=;
        b=pUncTTDucGjbIKFuIl4huoIfmLuMzQU5vjMX5JTilZsTGMV0RdmTCFoGDkT7Mp7LpC
         g8ZLv57KO3hltNtd39a4ge6h2uygl50e3vYLoFtRC25i4NtpvNY5FsxUONepRDZyHV7n
         hrVBlusk23K+BiqJdW985Xr3rgDuHODgWiYxTFqsJMqEgwKua0/AHyeC6hJx92R/HFQV
         OTMafPlfZwKqXvHKnJuJPIzyQGV2djABVp58IWaZeg4jbMjBIu6zoCPsaVD+jUokpaP8
         XnH+xpTFbk8HxIrGOyhErVaXtbLsh5A8mE8G+J2M3DTCb6ikv5z9O8kl4n30nh0JY90K
         0E/Q==
X-Gm-Message-State: AOJu0YwkfcxINIurBA7YLFAE1o5rnMJQct/6d70bLgAMqLdVG3wrgF/e
	r0I/TvWqwkSfwp/fNxk246mksyeIsRA9pjHdXBTViCBuCGz5OhWTRNAlI9kWDcfQngSaY01+ng6
	MF98=
X-Google-Smtp-Source: AGHT+IEX/sa9ePyAvT1vqXU76ax+ypBs4N95EgrGbuUEJsC6Ql9F6Vmmw5adxqH4GzLAoZmsgDHrFw==
X-Received: by 2002:a05:6512:3a8f:b0:539:9f3c:3bfd with SMTP id 2adb3069b0e04-539e5762469mr10974911e87.58.1729189221878;
        Thu, 17 Oct 2024 11:20:21 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00006862sm839637e87.200.2024.10.17.11.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:20:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:20:16 +0300
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Add SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-scm-v1-1-cc74a6b75c94@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF9VEWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Nz3eLEIiNDY4MC3eLkXF1TYyNDy7RkU0sLA0sloJaCotS0zAqwcdG
 xtbUAqHvUQF4AAAA=
X-Change-ID: 20241017-sar2130p-scm-53219fc59809
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IWnOkoOZ8OZLzfgS5I6gk1xbLXcubJ+CYIPQ/82YUM8=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEVVj/HcRKVQ3t/xI93CDQcSGP5pRxKMEld1T8
 GVhyYxiLUqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFVYwAKCRAU23LtvoBl
 uE47EACW57f17b3nx3gJRXknzNZ7xh7EJY8cOUatdH4m43JXEianwc3bYDB/e7vUDmervtnz1rt
 D68pLFW//48n6jYv3OMJNtDwTllctedP0AV4zKolNReXcrklfGP/VFRawJgl/cRvp7xqHpSVnVD
 L/MGqUhBpwAAHA5jgQC+b/xMLPueJ5dV9H/dbYB9bQQJRPFAaAvDlRpHWHl9xIvefZ+REMdYWf5
 MCvQgDHreG0hiY+oS5H2Ijcu/ICxOiZra8hZwgWbdp3nbVgXQzV8Azmtc6o8GngROxC16pF796w
 yyZWVMjGBdk90YmFjx2ZSwLv+XCEtMOubo1daGlaTyiAUEF4YRcc/0zGeBNRZbWuPyxrMNB0ntP
 IkmUDqWiIRJ4mCI6T0kAWAMR3NhFoNoG+v1UQuZoAAMPLed/qqf0VY9IbK7ZdRWpGENtPI0+ktl
 iKkhrimm4tzQXU4KsXZsJIqy/076i5fGdAroOapvGH8JR0FLDB5Ye4lxZhD5i0W4J0PmgR+iFbb
 ngdnk/B+Cj5Px4ScSMuaCZWa1y7yphNPEgWzlpBv3WCwG+6X6OYrXECB1VcWfiPamX7aYj5g597
 0wZ1hmireAfQZxJRIefAiXt9WsOkhwwbBiW/SQ1y1LcG9Wc5XtAKs1klRuIxKeyQFuuTQ9lCQGL
 lpiyrUGMy6K8UnQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the SCM firmware interface on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e708c8e45bf977ab4a94b1cc846eb4..1a6278e5571b35eac42ce5dba8963d3514c32a85 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,scm-qcm2290
           - qcom,scm-qdu1000
           - qcom,scm-sa8775p
+          - qcom,scm-sar2130p
           - qcom,scm-sc7180
           - qcom,scm-sc7280
           - qcom,scm-sc8180x

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-scm-53219fc59809

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


