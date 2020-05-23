Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5031DF489
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2020 06:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387603AbgEWEMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 00:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgEWEMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 00:12:18 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA1BC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 21:12:18 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id w3so7300044qkb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M5sFOrNXglw9u9oFYHMskJ7NcnM7eaQiBeIqzNjN18A=;
        b=G8S2SApaGaeOZYDOZa/usofyB38IwdN5arOsw90EdNv9M91atUz8HoIeWxnaEavt4k
         lkFN9p2LOH3h5m3Xs2l+BFRL6h+bttLmhu4g6layqGy0qQH/vvmt0xuRgA9+tUBubB5n
         BgyY2K1bBuOVhVgpBcwNx+kAOt75PR3vFAjzILzquIyTRDdkpVzIQyVbEiaV7UaCinVx
         aK/QxWxCdiLGKJZIEKY6FvwbNPrceLumTCs8MeCtVXVfukWKsmCffr1IpGxE8KoSBrVE
         cPds8tntUfOy2kPKViDmFxLcMSFGB16JkJRJ8XVQflrJX2Sfm1vcyCAdUaN+77UQrKon
         4auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M5sFOrNXglw9u9oFYHMskJ7NcnM7eaQiBeIqzNjN18A=;
        b=qwCvxI45vdfppvdPnoGmvOM1Nhm4SpOI+CUq/2RYQ8rjedN2OcWQ06zgqvxEQf4ti2
         MrUOV9bFa7TsGLlz2nyLstBgrTYAdp27Z+aFipv2oBXVAVf0IDCRmI4HD/xXmi7Zf9uG
         E/Yrcfqk3ssWgsSbq1gWZ7ufqJ7HDs4W7rCPBestLLpHDRqNbUFwuphFa/k+dYzBiD6V
         COZlAg/3qTVh+t3vAj7KunTJLlHI3PuAcFU9izfqG8oNsVrM9+d+sUWbEDKduQQG4S+l
         wISZ5FrIC3cYG3SaPWckkUEh+qV8rIRU+FClUFW/9uLuKVmfc1rkrpy15pBZ2nmCMxR2
         ECew==
X-Gm-Message-State: AOAM533rLP4G9gyUQT2Kgao86AAvVsVBkarTu2E39+l2n8Ey/0AVwf9N
        jh6+4pMeVfGeCgFVuOziGw8b8h//sPY=
X-Google-Smtp-Source: ABdhPJxRnAIPgMXBVIgY29ESU3hRJT/Hualiru5J/jkGjg0GRLMcQ7/pPTunfbRWCCCveIzowiD7RA==
X-Received: by 2002:ae9:e50d:: with SMTP id w13mr12486140qkf.315.1590207137323;
        Fri, 22 May 2020 21:12:17 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id w21sm10077978qtj.78.2020.05.22.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 21:12:16 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: enable pm8150 rtc
Date:   Sat, 23 May 2020 00:12:01 -0400
Message-Id: <20200523041201.32065-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I don't see any reason for it to be disabled by default.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index c0b197458665..b738c263f9d1 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -64,8 +64,6 @@ rtc@6000 {
 			reg = <0x6000>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
-
-			status = "disabled";
 		};
 
 		pm8150_gpios: gpio@c000 {
-- 
2.26.1

