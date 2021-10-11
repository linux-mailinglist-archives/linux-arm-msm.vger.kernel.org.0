Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B90428A39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 11:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbhJKJ5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 05:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235599AbhJKJ5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 05:57:39 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEA9C061570
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 02:55:39 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y15so71343854lfk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBarjcZyLGiMmFvfK+amIgyffwqYFHfGdnIAQ0ZFp2o=;
        b=rYeD11KIuoPJThVYkeB5rzUzibSLWoGNxT+6aTE0groDYRXL/JHFEJTXZHsFinPxuy
         JtFSeAXGAxJiH3Wm7yokhzb3VISE8ZkIWckcS1ufXs/Yu/5ncUZH9MzDT44hTKLGkg4c
         jiRyTxToJ1KftcIOdA/PcRftLDtnqlbEQu6g5KqpFyX9FamMBo+WJC2GlJIRZ9NCFY6d
         vV8JhEAV9Vvxtd7J1PkmnVl0eqkY6RyBKL1967TORxSTG1PdmSe3Dejx7jtHSvNCZrar
         srph6nOHMugapsLaeym+1BFPkmv9Gxe6Ult/8v2s2noLZ+RYbvCEzXlgWR6wUA5Hi9/K
         zZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBarjcZyLGiMmFvfK+amIgyffwqYFHfGdnIAQ0ZFp2o=;
        b=epF2eGuQ2OalMLwN4OnU6cHP26TJGG9njghUnnB9xxQm73CE/XyS95/XXqCHXqosFd
         rf42EClU198z1bu14/e3Smvr1/Ulh9d9NRPVCSVyaNcM/K+rC5dK5htluGGyKYhySPmp
         ehrdXxp8QXQLeShFeBEntCcQdUZymRpw8BSUX89NkuM+f3BhsvoxVehBKpUaIWH0yjNS
         SnNGlrVDrUL5HVUYIBZUbiE7CI14Cr+8B1ZCcajbhBDlr+cVapX/t0pQ2Nu4SI2RFR16
         y/1zmiUHeDz4rXQeMmc1RB8eZuQMRUMirG/n8QjxbgZuFeBOhMlOmGI8Qia2Qo0KAI3o
         N/jQ==
X-Gm-Message-State: AOAM5314Ly5SUyDlGgf7GKa9XxGYGOyQ7sve2RpTpMPL22fRpKgfpx0u
        PLVxVdI4yrgE+3dVY90cCof+yg==
X-Google-Smtp-Source: ABdhPJziEqkbBzWOz4Rl56dfiWZg5Pw8RIf2s/vb0RdTbZVPffhDLHLq3/+7CcK+kz0XxuhNGkihGA==
X-Received: by 2002:a2e:b053:: with SMTP id d19mr12536957ljl.290.1633946137602;
        Mon, 11 Oct 2021 02:55:37 -0700 (PDT)
Received: from localhost.localdomain (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id h4sm689183lft.184.2021.10.11.02.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:55:37 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: sdm845: Fix Qualcomm crypto engine bus clock
Date:   Mon, 11 Oct 2021 12:55:34 +0300
Message-Id: <20211011095534.1580406-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change corrects the described bus clock of the QCE.

Fixes: 3e482859f1ef ("dts: qcom: sdm845: Add dt entries to support crypto engine.")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b051adfed4a9..79a87eeee090 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2376,7 +2376,7 @@ crypto: crypto@1dfa000 {
 			compatible = "qcom,crypto-v5.4";
 			reg = <0 0x01dfa000 0 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
-				 <&gcc GCC_CE1_AHB_CLK>,
+				 <&gcc GCC_CE1_AXI_CLK>,
 				 <&rpmhcc 15>;
 			clock-names = "iface", "bus", "core";
 			dmas = <&cryptobam 6>, <&cryptobam 7>;
-- 
2.33.0

