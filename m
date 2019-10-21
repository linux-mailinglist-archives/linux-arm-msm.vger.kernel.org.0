Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9E5DE9BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfJUKgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46870 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbfJUKgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so8155929pfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=vAk0yGeiCW4SKIjJnq+f9xqPKX6m5wwJtivbwF55fLs=;
        b=S8Bihem9RpDcOyr4KCVSnTKgeUfPM47uXgFRw0WH/pp1ZI/CGMgOaRarY4+jS8r4gS
         PZpQcWGZJydjFrJx+3/rQeLATVNn+cjQP78gMtCe7O3pARui+qlMs6eRZJgxCjP2i+S9
         zexPLrcg0i73kjZjwihN4Bei1fNq1WVTYQ5v0l6Q7AhZjLbA7OTGd6eZNsBQFLIl0P6z
         MuP6Jc07fhAxSwYpluUMayVoKIkd89LX0INf8iTC0i3POAmGNGI0l9R2lIvdBYXAixEL
         U7Bfklp9rj0e4JB2/ZjWLoYflbAl246lin6/JZsAc6eGDBUKkoJem52JZkMxarUnsSqw
         HkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=vAk0yGeiCW4SKIjJnq+f9xqPKX6m5wwJtivbwF55fLs=;
        b=tAFHtru6kjSb7qc3an33vvcmoAz7T5c6VsE5fktmSUSI0GQzDqO5FQsvxjWpIFMIKi
         b4PN2U7D4gaQChxKUe0kuWgIverCgFdD2kLVrF8W4I5pDksazGZcKZdJtgL2eN7kEbSB
         sQB/0vXiHNsDKO8xt8H7xWDxtB8AAalPZDzsoHrg0eRQkTgFgnV/OirJ01XHz84tN/SX
         se/0WWbtUAO7kuM6+3EFxGvVIZ/MsFKbKi6dy4mMSvIIhOib/d+Nc6DlQav5gKXq+www
         lpheiePaznw/PRbikh495t8+IvHgtdJkMDZiiIp1EAizR8asveAkJdihmeIU2Bw+2VM4
         uWHw==
X-Gm-Message-State: APjAAAXOR+JfQOCRermHGp4Q+ksfKL268gxysM0L0jTXhKiWQu1rS3kr
        C7tvDMFm7BRoxOjy+rclnwTb5g==
X-Google-Smtp-Source: APXvYqw5wwC5YcvuabWh6R87MJJua4G4qRlb7eFz5yGtKtbysUKwbLA8bUKJcPJmbaNuXHSaejJowg==
X-Received: by 2002:a63:7d53:: with SMTP id m19mr25458922pgn.450.1571654182214;
        Mon, 21 Oct 2019 03:36:22 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id 19sm14665031pjd.23.2019.10.21.03.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:21 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v6 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:30 +0530
Message-Id: <63d6b0b8bba0d217c2f7bb4240c587ead933b6be.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a97eeb4569c00..b6a4e60739362 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -290,6 +290,8 @@
 			nvmem-cells = <&tsens_caldata>;
 			nvmem-cell-names = "calib";
 			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

