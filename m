Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E3C22D60F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jul 2020 10:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGYIZS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jul 2020 04:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGYIZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jul 2020 04:25:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A79C0619D3;
        Sat, 25 Jul 2020 01:25:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d2so782373lfj.1;
        Sat, 25 Jul 2020 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/AujhH32yT1zynZA3gTaDD/1XbzOVKjmIAaSFERNLZY=;
        b=qt5OMN8SiQIyahobJGEoaJiejlHsehvmlOEVGiAp6KNf2koAfjaRm9Fqr+DDOVA/oI
         RGjZn744A0PRpg0ocy+Rwn1Y0kjYUeJnch9jb1ygbF2MGo4mLgTXtM/jF9TUnGn4aHoO
         094Jv2TlFFGsMCNwRbXfahWXNK9HlRlsacAQ/t9A99M5aAw0C36WoNhTkIfriSTjc3BM
         8bEFEBybQNxCebo9R1nKQTRFP/jfST3zhTEvXjHMWEL2iMluo4webGdrzldFsKdGaWoa
         U4NsQsgcHcz25Q4xBczqdKA7MFWpmT0vhn8wvV7vrJE2miDd/a3HcURnpLxuSsKX0Ghg
         pvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/AujhH32yT1zynZA3gTaDD/1XbzOVKjmIAaSFERNLZY=;
        b=fuSfKD+8b6aGTxVbyPi87zTxVT6U4a7ZF14y5qE9naaH1MjDbGsg/WE08RrlZd8gke
         +B8kmg9knGVfJ6WQrDrdKA288yg3iBIhlu8Md0Qs/ABFGR0j6yeERdvw4CyhFAsSOePj
         gmJungLflTdIriKCFr44bWajcf7CQ88vnyiJcQD1on2gQ8rN28pWll5wULVPlO8u0MC1
         JzOBMVCIeXAOHj8oN6GHLfkLgZwf2UvBGusQko1grvi+Q4fUE1z94+tOW48n+SVLlJaD
         DiIjhr8poO5fTlC88JFIGOYTOUudMM9Q9ecYcGTte8tnQXz37uY4GOI7bzBVh27523fm
         Ux/Q==
X-Gm-Message-State: AOAM533UaEu6fq1Ho2U1myDYjBeODcDTNGwK9tb+SzHsJ8a87LN0vtU6
        5t/OnYB9Ht+jVRuzcWjY05t65irFC08=
X-Google-Smtp-Source: ABdhPJzrpGEUvwZs8JXDolGzEMHZoQIprdqK9e6lIkIfYyki8sxCiOK55nT4jCWPTOjAe7muww0MBA==
X-Received: by 2002:ac2:5933:: with SMTP id v19mr6898303lfi.94.1595665514461;
        Sat, 25 Jul 2020 01:25:14 -0700 (PDT)
Received: from luk-pc.lan (host-46-186-7-151.dynamic.mm.pl. [46.186.7.151])
        by smtp.googlemail.com with ESMTPSA id x4sm632835ljd.34.2020.07.25.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 01:25:13 -0700 (PDT)
From:   LuK1337 <priv.luk@gmail.com>
Cc:     =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pm660: Fix missing pound sign in interrupt-cells
Date:   Sat, 25 Jul 2020 10:24:17 +0200
Message-Id: <20200725082417.8507-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Łukasz Patron <priv.luk@gmail.com>

Also add a space after '=' while at it.

Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index ea0e9558d0f2..2e6a6f6c3b66 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -44,7 +44,7 @@ pm660_gpios: gpios@c000 {
 			gpio-ranges = <&pm660_gpios 0 0 13>;
 			#gpio-cells = <2>;
 			interrupt-controller;
-			interrupt-cells =<2>;
+			#interrupt-cells = <2>;
 		};
 	};
 };
-- 
2.26.2

