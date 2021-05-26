Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E631391B0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 17:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbhEZPDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 11:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbhEZPDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 11:03:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5583C061574;
        Wed, 26 May 2021 08:01:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id k14so2980016eji.2;
        Wed, 26 May 2021 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3TsWKPNdt5LoO7ABzE313qIQTyyt2VgAPGd6lpsge2o=;
        b=QasaBuqgJAviAxWemLUq3tt9sSPaR4L8Fl7du+XRFI5CWqkBkwlWLUjZxyNNFm2tAf
         qj87iQPZKwwNf0iJ5MGm3f1nN08vK788ktlFByVA4HciNJn11C6+2NZvxWlWmjrFUEDl
         IlRIM7Qk9NYwjeJEZg6nOgIP0qUe6+91Mi8+1C6QdhlQOR/lrupLedBIDYRj4YFuBCAm
         HhN1GO6lJ4buAyzgdqbOtUkdYpCgQK/Oj5dEhL+qo3KACReDVytiTRwJS1pahqOJ+hGa
         5QfYp5wx0Xxhr738LOml6BVh/2yHgdwCT/vqqlb/351ynDprJa576zgJ3wSu9V0z7ebJ
         izwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3TsWKPNdt5LoO7ABzE313qIQTyyt2VgAPGd6lpsge2o=;
        b=mmC1Fd0Zc38RvNxvZtKegAblpEC7VxFOep6rlcxSHmeHy5ntdyPF5tcD8xmZBKjMla
         oC7IhYAMe+Rcjzu4cDfIX6tGfVJnOgfEOZlsvTsPinew9qdRElUbiTEp3fvtMneXCV2V
         ZyhLGkkMFo13clH5C8V3Sytk7jqI8zPjCLYlzlyemBAt4LBcxo0kFAHiv0za9EGRFDzP
         DEQaTWA+J/ju+mxrCggfhC+ZhNRpDV8nG66dVkiwWRi5Yaef/tbkHWNCdbcFYxdZ6ONu
         oKozfuaU604HkgkNoP6SI8w4M6Z7FOVJbtV7qlMVTfvdzgUcswE9njvCZrp0ZmDa6rAR
         O5ig==
X-Gm-Message-State: AOAM531ObBDNmuFqjyyRH21y3cpHpzGephQ4XUPKVyDqIRtpgUUfQW+A
        e5EXOmU8qTCuUKTosyzrHqc=
X-Google-Smtp-Source: ABdhPJw1YXbIQG2PzZoC8F6kWo0NyDwmh3pZ/qDARSKKTklpPFuxXkmoob+CnsW8MeXkG4G7wpAWBQ==
X-Received: by 2002:a17:906:c30b:: with SMTP id s11mr33876742ejz.486.1622041293205;
        Wed, 26 May 2021 08:01:33 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.224])
        by smtp.googlemail.com with ESMTPSA id p10sm2045381ejc.14.2021.05.26.08.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:01:32 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] arm64: dts: ipq8074: disable USB phy by default
Date:   Wed, 26 May 2021 17:01:25 +0200
Message-Id: <20210526150125.1816335-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One of the QUSB USB PHY-s has been left enabled by
default, this is probably just a mistake as other
USB PHY-s are disabled by default.

It makes no sense to have it enabled by default as
not all board implement USB ports, so disable it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 555a107959831..20059d0f7d714 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -286,6 +286,7 @@ qusb_phy_0: phy@79000 {
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+			status = "disabled";
 		};
 
 		qmp_pcie_phy0: phy@84000 {
-- 
2.31.1

