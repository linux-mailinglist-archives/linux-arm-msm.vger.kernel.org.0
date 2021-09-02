Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7380A3FF6CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 00:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243139AbhIBWEb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 18:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348023AbhIBWEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 18:04:30 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C87C061575;
        Thu,  2 Sep 2021 15:03:31 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id e21so7740055ejz.12;
        Thu, 02 Sep 2021 15:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJlG7PHIoE2eh8lZ1u4L9PT+xGe+6ZiJku6kuCG9LQk=;
        b=LSe/vYSeYwaGeVz7Q13Ue6IExQPpblv8FS1IQqPrQh043Ups3UxmWwIrqLEl2plrNx
         3rHKCRf6FsMMo1+qAs8oLlVxOppsm0DzItO+Sor6Ibtu1oi3WroyS2JSwXdScGvzi6oC
         a9vUexSwX1/3fyRyS8KQ1eduL2k20L0S/RJHssnWnkisEfz1iXwv2uLNKL7YsMVyYU+Y
         bKflmUgYi8EsGyQt7giRHA+mRpXf/rq2XvEdlvMQwlk1dOuWXEFYpgeIOBxiKoFjF3wG
         3fuvZHaA80usalskyH61QyJhcCZvvaYcTv82vUltqWNFpq99TOd8vJRtj3DJZboIMlIo
         FJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJlG7PHIoE2eh8lZ1u4L9PT+xGe+6ZiJku6kuCG9LQk=;
        b=uHOiKFENicX1wDtCOS6lO4Gv6La18ombxYV/ftQsxbe5rbAFQ1iIJcjNLEeEGJvfRw
         lJMusMYnXa6mMQ7piIIT4vgx0wKLD2ZZX1qPH6XHtPew/jpb2DCzpHfIV60S1BLuucV+
         HDGXoWFBLT0aXLRcuflkOO+/HXOFB+dXZx9A3QnZgrZqF3D18j4KBQsQUOL7MpGj/zJ2
         tOkaKu8+gF9MnN7GvAwiQIuw0m24/a4FKjcwhxd5fJ+gzw+JPgiEQr3ofic4RYMap/uA
         eXmd5W1huTi1XxQ0cmq4OQQFDsSW05LhyLujR9Df8hPpPUcGYwW5fosEGo5ySR04pH+R
         OCjQ==
X-Gm-Message-State: AOAM531kEK0vkYo/G7C09Dpb8YISOQf4e0YZzFP7+maxBbpRL0vEn2mA
        VDcVg4PcLoiFmurwRoa7eZV8+V5luhJu4xQc
X-Google-Smtp-Source: ABdhPJyCFzlEUJKZnnck0bK9eLuZ2n/ILAsBd8oXFuAyN1DTdXXr39RKwPBAdYOorNQ6JtK3/GLi4Q==
X-Received: by 2002:a17:906:27d5:: with SMTP id k21mr385494ejc.235.1630620209661;
        Thu, 02 Sep 2021 15:03:29 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.158])
        by smtp.googlemail.com with ESMTPSA id ca4sm1774307ejb.1.2021.09.02.15.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 15:03:29 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        wcheng@codeaurora.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] arm64: dts: qcom: ipq8074: remove USB tx-fifo-resize property
Date:   Fri,  3 Sep 2021 00:03:25 +0200
Message-Id: <20210902220325.1783567-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tx-fifo-resize is now added by default by the dwc3-qcom driver
to the SNPS DWC3 child node.

So, lets drop the tx-fifo-resize property from dwc3-qcom nodes
as having it there will cause the dwc3-qcom driver to error and
abort probe with:
[    1.362938] dwc3-qcom 8af8800.usb: unable to add property
[    1.368405] dwc3-qcom 8af8800.usb: failed to register DWC3 Core, err=-17

Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 83e9243046aa..ab124dc7538c 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -515,7 +515,6 @@ dwc_0: dwc3@8a00000 {
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&qusb_phy_0>, <&usb0_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
-				tx-fifo-resize;
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
@@ -556,7 +555,6 @@ dwc_1: dwc3@8c00000 {
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&qusb_phy_1>, <&usb1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
-				tx-fifo-resize;
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
-- 
2.31.1

