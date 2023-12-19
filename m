Return-Path: <linux-arm-msm+bounces-5454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDDC8191C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 21:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E7E286041
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 20:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CC53A1B9;
	Tue, 19 Dec 2023 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uddosf+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F00539AEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d13e4f7abso31526175e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 12:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703019336; x=1703624136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzAkdCe8GmigS9meJGB6RLFDC8CgmK6hEzQqiVyayPM=;
        b=uddosf+jbXLcKzhbX/ivgEUQN4ZlabMSEJt5XmFJBg9dtHyZdcDItKCI+snQaab+Nt
         b1cqa10J5dsC6QpfjteuCLT7ozH10aP6b5UTKlHdFdmZ3Fs6vFbD7V1HUFxf5hpdzeCk
         jja5nJJL3Qnp48nl0B1HluKA7KkbVde+8axMNxbzTVLOBw5+N6BKuymGI0EeVmWD9Gui
         d92F3VOkIkGMtYygfZsc+JYS4y7TBAhpZyec9MwBZTOv0atnuK9i6A7mwySXttQpTMGo
         9ptxof6O6m/tIEqdxF2oDQQzziJA64F+VHAqqEo7R5lwP2ec24EoyOHyk3ZSEzM4CSug
         I/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703019336; x=1703624136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzAkdCe8GmigS9meJGB6RLFDC8CgmK6hEzQqiVyayPM=;
        b=t3pRgbXOVj+k4bdv3d5XqngHQOBghDTzR11SHe9CPh2tOeg5kGVhEcia+V2ZP/NZhP
         FMONLgiOdlNSLZwf2tTbKZ/iA+4AsZQ2BUVqfmONTYiC5UdOIWNjzhrpJ6B828ayPbTR
         QB0tcxDdet1pZflrKWPGHIpU/298qdczq6WCJ+VVi74Hp05/flGNkpT0yEV1ipb8bAEz
         t1nFGfh+ib9nvfah2K32mB2+4Hs+x0lqVufxayqSZ0w053B5nidy3SivYbS4bQAqiyGj
         IHEAjd2giXs8tQVj6IzicVW4zQwDaN4yVzeER2ysD8F+GRO/GXHRzXu3mSe9kLyUIe3/
         8fEw==
X-Gm-Message-State: AOJu0YxKYgIMTtpE3+HMg0Obp4JZcvPy1PFA1wpffa9HjI3aAteSh4Oh
	+rrYzvCQchreTz8j7ii8AEbH1A==
X-Google-Smtp-Source: AGHT+IGAJyStX1mtUQYYCTDSpkc//MycAPf4K9KBlbCHttgWpVCxlYFIAZezQfFFL8nPZ/38jCJ+tg==
X-Received: by 2002:a05:600c:4fc5:b0:40c:3f1e:169d with SMTP id o5-20020a05600c4fc500b0040c3f1e169dmr10096872wmq.66.1703019335958;
        Tue, 19 Dec 2023 12:55:35 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b0040c4886f254sm4460701wmo.13.2023.12.19.12.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 12:55:35 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 19 Dec 2023 22:55:22 +0200
Subject: [PATCH 1/3] dt-bindings: phy: Add PHY_TYPE_EDP definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-x1e80100-phy-edp-compatible-refactor-v1-1-f9e77752953d@linaro.org>
References: <20231219-x1e80100-phy-edp-compatible-refactor-v1-0-f9e77752953d@linaro.org>
In-Reply-To: <20231219-x1e80100-phy-edp-compatible-refactor-v1-0-f9e77752953d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=559; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Hwpu6tM6RD/JKvU7jn8nmPGWlA4+6aqHXvdwplMfgcU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlggNBNofmUvB1GlykPY4ZZ9ztP/pkhjzjIy3Nl
 Z7srTQrFC6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZYIDQQAKCRAbX0TJAJUV
 VrC0D/9/zHvjOnobv+UQaalKS5+3SEoZw+gq6TlvFolwexpYugxNO9wiiksvlFfKDkrAY+pYWwr
 QID6451I3+aswqA45oML4NK4NCm49L45Fa9L/u3mYrW71hc0WhTSmF3W9hd+Z9SN6yP36AS+SKn
 cW082AZxr+L5l3LD4RMz6nFc5u4/Ch/Dj5ez67yoKtbeFWiFIkVKgGnwBz3rnZoYayXz1sHYf5R
 Ac2NRYU8NSGQWebJcwwLf3kGDxhucoUkjpn5IiwrpXPl1d384F/eB05QMHoLP/jVChE15eGrbvB
 jd0AxSTImUiVh93vI5268j3Sql9GP3CNEIDtIu3BQtQM63u9qJK4OB5FrEAz9VOpqY+pdhAmP9X
 wdcDE3kzYo/HYhQA3At+OlvOzF8uhO0hkG4oG2p77PlA4fJ5kIrfb32ag6yUXDHng8PLf0uzFwY
 nRT33fmT29Q4l1Vlzzmv8BdK36igDs8DPAKuLJH1CO/PsJe9L7o/6x3wf+0URcfNoXiJOKH/Ef6
 vtSXzeXZsJQ3fcibxVVbOjit9SUjV6FFe4JkRDDj8xZtrMCMuJl6RchB+FSw75d+JoQNwnhw+U8
 EdtrfK5ksdjg8Y676fDntQOdIOGzxwOXiaTLn2E0cRhD2DUF97IcFeuwXkEexKYViS3srXKydSe
 uzGKeMdgVH1wPxg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add definition for Embedded DisplayPort (eDP) phy type.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..b1a64508d937 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,6 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_EDP		13
 
 #endif /* _DT_BINDINGS_PHY */

-- 
2.34.1


