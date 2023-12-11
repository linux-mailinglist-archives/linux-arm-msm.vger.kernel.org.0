Return-Path: <linux-arm-msm+bounces-4240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB93580D022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C9312820B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D754BAB9;
	Mon, 11 Dec 2023 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFl9GU4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0345B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:56:22 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so618731866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702310181; x=1702914981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RybQrZs+eLSsMdObNv4v0HXZw2o3tDH/SAM3kDy3DRI=;
        b=MFl9GU4gvkIyipf5vnUO2TXGyOFCU5csi5ZOr8UiBcs+oM9u6kyeGXozcEz8nghU06
         VBqttOGHrgSFr9mCFKg7aEBkkpBvFdo0ga9Avkp5xACchYtbKMYepoMqenS282k/8A3b
         l7+zn2iO4bk9v6KfRdcZBIVh2tNZvdB5N7BAFGjja+dDJxOmkF3ueBNm5cX0UCkpOeV5
         O1lCursH1zOa82vYffK9xF0Y9/hvZJUtv0vpaHAcSN4S6HVaOD3MXs7ePhjb5dwF7rsw
         +INzjOIWG4SHHHopcBZKrIGVffZDDt1n0vJK90xkMNrJJCP4NuHZudp5Hzu4T9IvuFZe
         JoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310181; x=1702914981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RybQrZs+eLSsMdObNv4v0HXZw2o3tDH/SAM3kDy3DRI=;
        b=KZ3kJCZjIOQgBbkkFJ4dYtp85VmOzkVBaiYRn9hn9UDHNRXWM97VE/IzKWQoPitgja
         Quiqime7F5TWD6S/gXcUvcgo2L7NgtIqHSkwaHU9GjzUz9X3YL4J2EFgOd2PzXah6PYq
         y6kklQxaChGapwgrC0ToTAKSZ8SkPjhiWIZVvfnMKsBL80tOqqqa4WTiq5ZE2nt9BMWl
         WVuGH7/Z424VgWtIMYymgwUsum+tQptcoqnGlMsC0IT5jyl2heWLKdFN2NmZ0FRwtUGi
         cb6UYbi/MAkXxwNoneqA2mbcJ2+u9YRwJ3Q8ERensF6hcZDS02eDf29dD47RbEE9T2tU
         dfXQ==
X-Gm-Message-State: AOJu0YwKurr/J7HGMF5NSpX2lX9Q0ZEBaNuaK5HdicvV7pabSFxmQrUC
	vsM6OnpZqsOyK3hccZvKP5FHSg9XHyQCPQYstpY=
X-Google-Smtp-Source: AGHT+IEQ5hYta5LdO6d4vzHPw3b9RjbZ+VcrlqMEDmZGTKb+VdwmNjF/2DI6kyj5TmutkUe3+P4XLw==
X-Received: by 2002:a17:907:94c9:b0:a11:2ad2:6563 with SMTP id dn9-20020a17090794c900b00a112ad26563mr2910577ejc.26.1702310181330;
        Mon, 11 Dec 2023 07:56:21 -0800 (PST)
Received: from krzk-bin.. ([2a04:ee41:3:e085:3572:d83d:98f3:19dd])
        by smtp.gmail.com with ESMTPSA id lm11-20020a17090718cb00b00a1cf3fce937sm4983602ejc.162.2023.12.11.07.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:56:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] qcom: MAINTAINERS: move Andy Gross to credits
Date: Mon, 11 Dec 2023 16:55:33 +0100
Message-Id: <20231211155533.106003-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy's last emails related to Qualcomm SoC ARM subarchitecture are from
November 2019, so move him to credits.  Stale maintainer entries hide
information whether subsystem needs help, has a bus-factor or is even
orphaned.

Link: https://lore.kernel.org/all/?q=f%3A%22Andy+Gross%22
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 59cdc6a9c8fd..6cb661c46985 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1421,6 +1421,10 @@ S: University of Stellenbosch
 S: Stellenbosch, Western Cape
 S: South Africa
 
+N: Andy Gross
+E: agross@kernel.org
+D: Qualcomm SoC subsystem and drivers
+
 N: Grant Grundler
 E: grantgrundler@gmail.com
 W: http://obmouse.sourceforge.net/
diff --git a/MAINTAINERS b/MAINTAINERS
index 82ef00014f41..37d1bb7b1fc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2550,7 +2550,6 @@ F:	arch/arm64/boot/dts/qcom/sc7280*
 F:	arch/arm64/boot/dts/qcom/sdm845-cheza*
 
 ARM/QUALCOMM SUPPORT
-M:	Andy Gross <agross@kernel.org>
 M:	Bjorn Andersson <andersson@kernel.org>
 M:	Konrad Dybcio <konrad.dybcio@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.34.1


