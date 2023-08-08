Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C1A7748AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbjHHThN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbjHHTgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:36:55 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A682127A
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 12:01:55 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3177f520802so87419f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691521313; x=1692126113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVWCwLOI0RDSefmknyaUf7dplb4DpGR8Zf3HZcRuHo4=;
        b=1wHx9o3c4Yz2BeeZHkHGOHcZ7QmYbWaBwzImwoUkKtTdUE7gcUEqg65Ywp8TyX7ZOz
         i5YW7K5tIajPgn2Y2nLPv26Zt5GkrsAhc1YgQOe4h0Hm7GwYqDuuFsxCtAGKT4oLxv9G
         qRtwgCh0j0yOIIhnKMENx16+kM6RfrRWfH7mkiPmdKdsN006Kvl3rv4qY8OhTrZ0dXq0
         2BxlIghJlo4SaL+SKXv3kDjcVjru4ZKO+AKAsN9dZMBLcDYTGLL1RcFeUyINhPNXVQj8
         ElJVfErnmvaj+OfkjXiLtN3rb+sztKz8UvOT04xDNprnyQ9ToBZZ/klOO3UunsHY+bp7
         Sb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691521313; x=1692126113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVWCwLOI0RDSefmknyaUf7dplb4DpGR8Zf3HZcRuHo4=;
        b=i7b+eUHVcFa0VdYXtyBAcnSyqUE7CqenjSkqZrUsYL1WlJnO7fzTICs4SoJ8wMTcQ8
         08klAleKCub+ezy75Z14M5ZGYUBRndnry2gSTTrzxNAoHjzeGWKXtq9KrSyP2NxD0z1m
         uuYY9RUYtMaBw2uDD9ZmlIeuKG7S8znNh2ixu3pkR1N2tQmPY3qhyjk5kSqQadsHs5WU
         WLr2nQ2gICppEGNpm5h5LhAhL3bADjKDlRVhvGVUGzwR74i65BEX2KPsuiPjLp+9Rv7f
         F1AM8AGl4LSxYx23tJirU1gCssRG1xGrYqVkEPTr4qJ9cmKMf3wbZK7J7uFiKzMO6gyb
         Nbzw==
X-Gm-Message-State: AOJu0YxJjf+ANOlsvdcPIlUoYl+dHZ0Q4dOForbDe5LxW7gxMCFholXB
        2rZbFgWKKBQMlE8+lH3eKbQIjg==
X-Google-Smtp-Source: AGHT+IHtndLWibUQVcwtqnOkWRdaTuE84A1QwcAl7MRWdOnbv6AROq7OdLzJRoheCl6qZfsNQHrHtg==
X-Received: by 2002:a5d:49c8:0:b0:315:acbc:cab6 with SMTP id t8-20020a5d49c8000000b00315acbccab6mr515129wrs.16.1691521313474;
        Tue, 08 Aug 2023 12:01:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00317e9f8f194sm7301055wrm.34.2023.08.08.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 12:01:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/8] arm64: dts: qcom: sa8775p: add a node for the second serdes PHY
Date:   Tue,  8 Aug 2023 21:01:37 +0200
Message-Id: <20230808190144.19999-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808190144.19999-1-brgl@bgdev.pl>
References: <20230808190144.19999-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a node for the SerDes PHY used by EMAC1 on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 7b55cb701472..38d10af37ab0 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1846,6 +1846,15 @@ serdes0: phy@8901000 {
 			status = "disabled";
 		};
 
+		serdes1: phy@8902000 {
+			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x08902000 0x0 0xe10>;
+			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+			clock-names = "sgmi_ref";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
-- 
2.39.2

