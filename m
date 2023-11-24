Return-Path: <linux-arm-msm+bounces-1813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEED7F7081
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2584F1C20E25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D47179AC;
	Fri, 24 Nov 2023 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZFv5lf7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E30E1719
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:50:54 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so240808066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819452; x=1701424252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brAeBm5ErhrEQ0BAzXeJClA247TqOfDPvAa9z588DN8=;
        b=ZFv5lf7zhVYs6odMTW+OesbEnZAn6lKq7MS02Ct11t7Yc/VEx93SLvf92UuyKildRg
         8SNa38EW03tlbgDCWVQHr7HvvQngtuOSsRUiWiW+lYbfkHCqwnNY3YrNkLmVn4aHJjuz
         J9+jvsp++DRt5LIrZnCrzCJpKPuwpqD84S2v9qoFHoKISZIaSc/Y/NoDTNOkriRmiTZ3
         eHybQgW/h1BtnRmHmMNguyC7WrQ/29YyNRKTiKqj2UL6BwUQ90Y+6fVpZpWEmN1pZN3X
         zRu+XQ2BsG97PqRTdUjCCgajlweGqyYu+gq/WA+hpOAU6pl6rVbrgJ0X/XojLiCI9Mn8
         0oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819452; x=1701424252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brAeBm5ErhrEQ0BAzXeJClA247TqOfDPvAa9z588DN8=;
        b=kNh2dQ8rf2gHWycexfw1/bnzT9hRGKJmm/Z/I4rhoGVMMdfhipO9ri7kQGwwXY3nmn
         gQpI/gn0WDeWz0MpCfDK+0/oY6r/cwoh2qME7HglKBiPHnDW3cDCzA8BapkW0hiR8t12
         8gckjP2RPCZX+hjLYpuwjGa8Cx2xOpM/pUAQzJzW8dgg9gItwTwBCwXUI0mdUD3sjPKk
         Kq+3OCFPR9YfNQ8tkfW7sNP9x/TtX7kAcHcanXsXHWKtW9vitErKaB6qfftC+1b9QQ/7
         tvf6KSfQAwNvDpNZ5qf6BgjG6nqFHgeab/5zVfDGLGpYZlPgyXVlmUFYTpZlIePckSbP
         OSAg==
X-Gm-Message-State: AOJu0YxG8UoaVX3J0WOlrG9ydWAyk+89iaWuWLcHF27gGW7O86DS31af
	denUIs2amGHz+sHFuX7QKbg6zw==
X-Google-Smtp-Source: AGHT+IGbWaLklKY+f79fsd0hJGKV6y5A/za30hPMRAGKzUNsTJvL8xCsIhZsZv1sRL0tWj9A1aBoSw==
X-Received: by 2002:a17:906:73c4:b0:a03:d8ea:a264 with SMTP id n4-20020a17090673c400b00a03d8eaa264mr1641203ejl.2.1700819452766;
        Fri, 24 Nov 2023 01:50:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id w21-20020a170906481500b00977cad140a8sm1854824ejq.218.2023.11.24.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:50:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: qcom: minor whitespace cleanup around '='
Date: Fri, 24 Nov 2023 10:50:48 +0100
Message-Id: <20231124095049.58618-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 5cd03ea7b084..b9686e75fe1d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -875,8 +875,8 @@ reboot-mode {
 				offset = <0x65c>;
 
 				mode-bootloader = <0x77665500>;
-				mode-normal     = <0x77665501>;
-				mode-recovery   = <0x77665502>;
+				mode-normal = <0x77665501>;
+				mode-recovery = <0x77665502>;
 			};
 		};
 
-- 
2.34.1


