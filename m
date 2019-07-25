Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73EBF75A8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 00:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbfGYWTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 18:19:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43752 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfGYWTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 18:19:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id i189so23435320pfg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 15:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=WG9jq4WFZwEP3lX+wKYMJWPnRtojYdkiNvJJ73qOjsI=;
        b=rjqSM1l76RZ1jsgxJIxswc2R+VHTmGOHJOCRSKds3bO1rK3+jD5av0SQg7lQ/qY93L
         AWS9BEh5BGPlZpMJmA1VRC15/ta9xntous7ck3TQu5Itkb6PmcmXORv/9nyz7ocBhbMg
         Xq4KyuptPJGvtvp6USAhDTichdcKUZSIpygMRUTw7tWtUDRr2Sy+kpBsUzfSSPQuFbLM
         mk6hVIvbV1y+PNBJAdp3dOthn8iR+giucgIxPiXTarWNqW8F5IjfOrdrsfRwRGWzWO6Q
         bxye46/UvGQeW3DdKoiF7wGR67J46zL00CrrrQ1g31TRYb5kvMd1VfTZ5DGJBi1uztdL
         SeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=WG9jq4WFZwEP3lX+wKYMJWPnRtojYdkiNvJJ73qOjsI=;
        b=Ly3lUsLpbovmwpgeSvfhLK2dfnFq6Y986X8KsjutQheW0VIlbZHDB9eKlRl83Jsgka
         Nfeg3sv3Rzk9DihpbKa0qYueFpCpE5ATHghCvRMk0FSwCv0ymjevj9+kAkjxnVpsPZPn
         rw7GvkUprCJLiIFDFloGvt4yX0cSMt4+YH50Sq2SIwq6AvD9BsrdHKCYAB7JXamXaTVQ
         L94BK3zsURRbpLe6nqTO7AxbqJTzfe2dTGBgj7JpINBpBWHrzfvBomDwWQMu4llgBMLa
         5hGr10RWSgaXyG2U7XwI1uDqLMFroyA27QSfg8y6s0AibGtEY0PBtNkCMynxbB8MzeLj
         gJxQ==
X-Gm-Message-State: APjAAAX070+dDK1yqLdjbRiXkKHSJvjcPJgBpxt+aB0ksE96AR/ekycP
        dpVojHrNa69i2iNNR6Hl5cztZw==
X-Google-Smtp-Source: APXvYqxPqiX346K5fLm+YKUdWqqZ0RfvQQz85OU/QHZ3lIOrrzBJdoV2XqG7BvGkEmU0TD8l92sy1A==
X-Received: by 2002:a63:2148:: with SMTP id s8mr86318468pgm.336.1564093160295;
        Thu, 25 Jul 2019 15:19:20 -0700 (PDT)
Received: from localhost ([49.248.170.216])
        by smtp.gmail.com with ESMTPSA id z13sm45986147pfa.94.2019.07.25.15.19.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 15:19:19 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date:   Fri, 26 Jul 2019 03:48:41 +0530
Message-Id: <5d86bfcdfd118294122e2182f3328fe823bc985d.1564091601.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
device tree so that the correct sensor ID is used and as a result we can
actually check the temperature for the cpu2_3 sensor.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..8686e101905c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -179,7 +179,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 4>;
+			thermal-sensors = <&tsens 5>;
 
 			trips {
 				cpu0_1_alert0: trip-point@0 {
@@ -209,7 +209,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 3>;
+			thermal-sensors = <&tsens 4>;
 
 			trips {
 				cpu2_3_alert0: trip-point@0 {
-- 
2.17.1

