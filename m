Return-Path: <linux-arm-msm+bounces-34900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99D9A3895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77BA21F22D32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EA218E744;
	Fri, 18 Oct 2024 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O06+/lEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13040183CA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240413; cv=none; b=H9aiC5CRcKZSW4TToOorEEhQI1UJY4S7mse3gu3A/4HjEzKckLpxrqNXuhAEg6QO8WQSZQ8KSq0QGnxHdBBTQ/8fn7BUKimyMWdlV4fnydIO9c6FyJuKBVbdziUENq8KVc2yxau5ja+w1NVEVV47G3szWtidLV1Q2y0nHHqwtmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240413; c=relaxed/simple;
	bh=cxeqt4MDJ45QuVxFvg3oaFqW4sJmmJ07okgJCrZ5ePQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FEYk3RDYf8dP9gcGkUElDAhoRILthtduQOediMUnEVdOZ8t6IFHwjO+g83sIvMJu9/VV5TaIwupucrnEeZ737KnV/Qoif8lHKrUSX/jfyE1czcrt9+6ImDH7dwxZwYhqaPLtut+7QO4D4pKytkriEYEAofdOtuF32PDNAE62jGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O06+/lEy; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso21868731fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729240410; x=1729845210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aliD7iaG0tNbgm2N4ydw0tz1kBIs+777G56/ABl1sKM=;
        b=O06+/lEyagj7jZj1nJqLGneQVVmKugRMDCgQ+rdIGQBqtz6KCU7xYqpeuV69Jhojr6
         /KW4HmHe1jW0Drqvp6zzh4JLHGsIXigZjxc0h+NpHbb0NwOVrju7etKfhm2OuSutl6jX
         rE1GssX/JEmqrJz1IJ7hNJodklXvgANJuGt1vC2f6aTvwgLdNvitRFZ7j92+bUtrE/FX
         nftIgBTV6smrpW21KfOAu+CN94DTrTTEn2sb70jL9qUN/ebSKlBlQ7F75FZIWV0fSlef
         REXgFiL4wGC92eZjcOE0Yok7mbnXMrjPe2X+LCiMLV+wKe4q1WI4bq7Q+nlNDt0C571q
         obxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240410; x=1729845210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aliD7iaG0tNbgm2N4ydw0tz1kBIs+777G56/ABl1sKM=;
        b=Yjo9K2glNpd8C2UYll2FSF08gPaSEIHCLCfPiww5QDBYiXhymH8wMpbtUELJalDahl
         uAaFcyB9ZFOZr/GKzRuEaU/Uj5RutCHiRO9/xvia48YTzh5dxBULgp3ySXXexXSAvHPX
         nJTx148ee3KDE/TdPBnqHBQQQAxkzVjGiDv2/qSJlfbUrN+YVkd2CZbPjjjcZun7LX23
         7CoyHZJOouYUWvJzwZnerHz50yhEL5VmljKQOCsxZFubRlVUQt6lQRSeDxwUpfW4g9Gf
         Gy6XZod2Iub9lafAyLMlNiTuarp945DmvNZFUu70uFZ8GdSozApsWzeKXwxL3tWErnDZ
         24lQ==
X-Gm-Message-State: AOJu0Yyg4oB0AUwPO4gLHvDSs3vIAW/4oFe1eB9ZkTnzmpViujQkFQLF
	uCbuzCFTkWcB/Eg3tJk9XizPm1U1gHonQle7FvXZUMhyfmIqTC5S0Q3HlLZxFMs=
X-Google-Smtp-Source: AGHT+IGT+RSysnbWqnvieDrR+OErr+Dloo+3x4IRYvKlblcTDt2ISpbj0gjggySvOtTRIlidHg6mtg==
X-Received: by 2002:a2e:5149:0:b0:2fb:5014:c939 with SMTP id 38308e7fff4ca-2fb83230da0mr5514201fa.41.1729240410077;
        Fri, 18 Oct 2024 01:33:30 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809f9b62sm1628761fa.96.2024.10.18.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:33:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] interconnect: qcom: add support for SAR2130P
Date: Fri, 18 Oct 2024 11:33:23 +0300
Message-Id: <20241018-sar2130p-icc-v2-0-c58c73dcd19d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMdEmcC/3XMywrCMBCF4VcpszaSm2hd9T2ki2k6bQekKRMJS
 sm7G7t3+R843w6JhCnBvdlBKHPiuNawpwbCgutMisfaYLX1RpurSijWOL0pDkGRNr4lSw7bC9T
 LJjTx++Aefe2F0yvK59Cz+a1/oGyUVsPo8DbQhB6xe/KKEs9RZuhLKV8kABLPqQAAAA==
X-Change-ID: 20241017-sar2130p-icc-e0149e2e3a95
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Odelu Kukatla <quic_okukatla@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cxeqt4MDJ45QuVxFvg3oaFqW4sJmmJ07okgJCrZ5ePQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEh1WfpZ4IimRlNtOIwUcpq58Gl8eMDVz0BNw1
 kyU79MzSK2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxIdVgAKCRAU23LtvoBl
 uLhND/4teM0lfYLZXT8GchgWA3nQgEIZiw7xkUKZa9/ZDYu1KsauPGpyLKcgyvieT6j2m5yY1Cb
 Nt3MW7nmNjplEWm/mLl2IHK1xzmmDlkMa0fL6BCr/yHSdO5BETuaiee0oT/sB5fuSzX72tufWG5
 yoay7naUyzDRabl6bqgxgln3oy3VqeANnmH8QRpIoyalAIVQjhzo7nN80ZZ95W3Z8LXQ9ocWFOP
 wblwTx9U4iNQ0LQBc9/Xr7gUKB2IAfxWwiqL1XnEGHhL4+5vQ+aWfondB7mYBUJqwEQDeWDFtZr
 fWHj24pF7HUm8J/wJ0S7u06L2QOiLh4V9Mit3s14cq1k6+n7AqtNnXwpiNWDywrtkRH+YGovdVs
 SzpbeqCp8ieJAFl/A3ocKWvTaN8X3XqHCgir5b6A75Wwz9qAZ7NlnlKl9gQbtfHHXLKFb8dmMIL
 +lb4xeqN9i2vrSK5/5Zx/i6VqMm22RdqjeW560/xxRumQG5NAsIlCTdXZGRaSEULQJtakZJlSGg
 d/WZ5yjRahn/yryrBqhNlWJIqNNL93iR+yrF4OETkdfKSidVoFxopjNqefzcr5EDW4poQaNYhnJ
 g1jSdSphnhlqAHbarOo1aTWOcdr3CuHzNpKNEwb3Y+D1IJnUu1ozztvfQ2TiU25nB30YO+jZQtu
 1RRTR8Y18ZFpcVg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add driver for the network of connects present on the SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Used BIT(n) for enable_mask (Neil)
- Link to v1: https://lore.kernel.org/r/20241017-sar2130p-icc-v1-0-bd3a8befa4aa@linaro.org

---
Dmitry Baryshkov (2):
      dt-bindings: interconnect: qcom: document SAR2130P NoC
      interconnect: qcom: add support for SAR2130P

 .../bindings/interconnect/qcom,sar2130p-rpmh.yaml  |  117 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/sar2130p.c               | 1930 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,sar2130p-rpmh.h  |  137 ++
 5 files changed, 2195 insertions(+)
---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-icc-e0149e2e3a95

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


