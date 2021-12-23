Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2F347E070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347209AbhLWIcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 03:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhLWIcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 03:32:04 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B34C061401;
        Thu, 23 Dec 2021 00:32:03 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id bg2-20020a05600c3c8200b0034565c2be15so5248520wmb.0;
        Thu, 23 Dec 2021 00:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCIN5UEkhZHfGa17tseQv9FnjRthtppZcJKFcClKQv8=;
        b=lDlyK9/aN5B7LV/uo5bqDLESmVRwh4eJlHl34hVoTAns1peuvgodKp3s7yZIKw/wuf
         QVMt/5NIMoqcJL/M8drPVYEv0aOnY3+d2EppmBk5v6e4sPlH7lUw/HqLkTkZ9TbcI7IB
         MvgOlWPluR3MQNVsyTfbmFpk1e+umBxTDanEBBP0esxtKQy/erCMoAFDq2enhpIXuh8/
         vXsVumldxNzYnwUfh21zQLIqnf4HN/RuEb4lKIx24BW3ysdZGZxHXKTTi6qTlmkTSxkf
         Ff8T1ZxpKlwL6yXUhRCZzmWz4Fb6Tx8Iv+hasLIdE5+Zyt0aiH0jLUE+imKVtzcGhxum
         CokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCIN5UEkhZHfGa17tseQv9FnjRthtppZcJKFcClKQv8=;
        b=lhXZ1uD1PkUbfCDnozq5ORC8UsjIB4W0YUfTw5I0IvN8xgpl6RNex7GgovwXu+HXhi
         CY4NARGdVkNAdFpGzSLQTx5nkNCliW4ZqSpMS0GMvSiVzUprK5+T5ZMYwdedtN3bfeHg
         chb4PEsnmmQ0ALVZSB3LXylZ2zrHZBlm9ukJI91YoB8OyOFDj+Rt1IJ6RqEHeaHXp3JF
         XuILUJsoWndId0873bwcGDgukfeyugWyxlw3CpH9N/UiHOLqYU3EYJ/sms5fdpPk5f4M
         khbadk2XJRonySqoS0ok5zatLNZEbcspnYn/x2lst2z0LO0Y2D63Gz0TgH1BTQHk09RV
         R4cg==
X-Gm-Message-State: AOAM532/MMhJPyFLNzuzW8kQJcC0AoU99O49tfTw5wEGy0h1O4eKoDLt
        Q0faj+gvev8JP6n2QrdH6PuZMhAaJTQUbg==
X-Google-Smtp-Source: ABdhPJxE1BSyW50MmY1o26qz0DfvyUqNaXC6qBKQOhwW75vXiRYlN97LVqr8ILDPqN2prLe/dkeuNw==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr841291wmz.19.1640248322419;
        Thu, 23 Dec 2021 00:32:02 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id p21sm4038277wmq.20.2021.12.23.00.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 00:32:02 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: msm8996: SoC specific compatible strings for qcom-sdhci
Date:   Thu, 23 Dec 2021 09:31:53 +0100
Message-Id: <20211223083153.22435-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223083153.22435-1-petr.vorel@gmail.com>
References: <20211223083153.22435-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 91bc974aeb0a..01d914221a95 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2693,7 +2693,7 @@ hsusb_phy2: phy@7412000 {
 		};
 
 		sdhc1: sdhci@7464900 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x07464900 0x11c>, <0x07464000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
@@ -2716,7 +2716,7 @@ sdhc1: sdhci@7464900 {
 		};
 
 		sdhc2: sdhci@74a4900 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x074a4900 0x314>, <0x074a4000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-- 
2.34.1

