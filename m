Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1273C25CD06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgICWAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgICWAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:00:13 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BA4C061246
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 15:00:13 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id x7so2093030qvi.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 15:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPmrddlH7hegcLC7wfZovl1Ciuz3vrrjjRgvVbrEmKs=;
        b=C2MUXAU6eMzKJe3e0Iq4VREm3N3vBhKNRC4FysrWfxnkom4myeeubdh7G+d46xoGiM
         hHHhnQDUj8IJqoyc3++Zezg2QO9sqBQWD6kFJ3LWWxm42upicnBn3HfjYjdW2Zyh7zYn
         WYZqA4O9TooqQNBNzu/AP7mwagq+rGNw3jjhYAJJ46eKBYIVKQbh/FbW76wAjGdJ2htO
         vBVMnBwrzPnodIOLKz97rdMEZYmVVa9I/xj8cRRDS6CVgBs+hVPsvcRowBja7oLO23Iw
         HSXV3tumfnofcKE9mIsotEi8M0jh+vPN7tcP1p+hpDJaIXRpiNjyiMWsSorWBHjif7km
         jeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPmrddlH7hegcLC7wfZovl1Ciuz3vrrjjRgvVbrEmKs=;
        b=HP4iYoe8qsGgo47k9j626hD4FH8m60m6scVE+8YQIOIO/iCZumyviAPmPxbdPFS2A4
         dAPe/XKgtBqNJEUb5Yicsy8lotA2y62lxs4jrx1iGPS5akRNPq+tcLV8IvdaO6BvvnRE
         31Mk9aB9lXMRo39uI0bggSFoKTbJAVxKmqg4FCkafUu4feOhflLf2ueW+L8ELk4AlpBw
         OIn1Bkxc3FHNJRQN8lPHQ7tFQwOcCEaPZisV6CQ6+mVQkucHWXl5RgIi2gskQtPmYQjg
         xLcMKiY1eyPOfWvGsNkcJCLUxHFJHvpdDS+vZmA/3qo5WrmlDS7f08d3r/9sxMUV4xPI
         GGog==
X-Gm-Message-State: AOAM533ax+xMkouia/5jPxDDM9FCTeH/O/qMKRGIDiR5qEL5QUvTcQgN
        GP7XYB8CKUNX2y4O45u+a0hGgi+NFtwieGmZExY=
X-Google-Smtp-Source: ABdhPJwkEH9XtrK3cNQXeyfFSDGVHrAk+oV922w9fIRrc4E/q/w9BXZ8hFz61MBVZS2pgl5Q9FvkdQ==
X-Received: by 2002:a0c:9ade:: with SMTP id k30mr4890094qvf.194.1599170412459;
        Thu, 03 Sep 2020 15:00:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t11sm3052293qtp.32.2020.09.03.15.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:00:12 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sm8250: use the right clock-freqency for sleep-clk
Date:   Thu,  3 Sep 2020 17:59:23 -0400
Message-Id: <20200903215923.14314-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream has this clock as 32000 rate, but testing shows it is close to
32768.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 81aa1f497b13..2cd38053bcd1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -75,7 +75,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32768>;
 			#clock-cells = <0>;
 		};
 	};
-- 
2.26.1

