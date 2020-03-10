Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50789180C2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 00:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCJXQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 19:16:54 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36730 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbgCJXQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 19:16:53 -0400
Received: by mail-pj1-f66.google.com with SMTP id l41so503pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zXg9Gj7QTUwpYvOhGlvMrbNF6i7eg/pUYIjVoM9j78w=;
        b=m1sTUdtz0IBH4T58S0Qp8F887lOMFeQ6E3LwhmSyto0/XicAZGMKH/OdcvxBS/gioj
         hpdgTy+8k2waNEDrL7V93U+BcQrXkOtW7w1AYTphgWutJGFtTIY3zpT15dtk3Y+co1p9
         dCqpvzXMboOTnI8q3DAmcjPcZiP2ChNuhzxOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zXg9Gj7QTUwpYvOhGlvMrbNF6i7eg/pUYIjVoM9j78w=;
        b=DjJuXmwKZsnwnWfwwTdqmvK2hL2GJ2jLaa6/BbylQJpbfnissijJZzwXjeRhf4hOae
         iAz29ghqTj434cyCi1CRBpL0EP8KPBnYBEw29qT/8+GJtKww0okeozlhFMjuYnYxvDV+
         g1fQtGTSyNHCiD9E0MLiCiBcHkJ0lDXMy/+MawyJsJdqthWTWa5FuBV8xt79aZtooC6c
         G4ei1M+PMKRlF6lm4tx2t5e6hkmPyV67P+BwfP99gdNIgu6wo0z4Zkcy3TiOG+spQaDY
         /JZhiorJfCisdSvUSjEa524imar5mRbY5ZTbzQmo43B9XjBCID73nujXWIfraglXR4ZS
         PAww==
X-Gm-Message-State: ANhLgQ0IQvfsxlij/FiB1Ua2EJdl4wFDxWdHcfmEJh6N+hD5ol4EKLZ0
        hlVI1NOP5Azhqs+0e/4O15umIQ==
X-Google-Smtp-Source: ADFU+vua2DRqzHPDCg1h0WaWa5jUQRYxfdS9IEm3qlPlei+YNlP5TOn8cJF3gz2OQRyZ5zwlg/XAUQ==
X-Received: by 2002:a17:90b:438d:: with SMTP id in13mr333664pjb.114.1583882210644;
        Tue, 10 Mar 2020 16:16:50 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:ffda:7716:9afc:1301])
        by smtp.gmail.com with ESMTPSA id 15sm43071797pfp.125.2020.03.10.16.16.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 16:16:50 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Evan Green <evgreen@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sc7180: Include interconnect definitions
Date:   Tue, 10 Mar 2020 16:16:29 -0700
Message-Id: <20200310161502.1.Ia2884ed3c8826f52fbd5dcfa7a376a2fac4f31e6@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Re-introduce the include of the sc7180 interconnect node name
definitions. Though this was part of v5 of the interconnect provider
series [1], it was dropped because the DT changes went through a
different tree than the header. Re-add that now.

Interconnect clients being introduced can reference this patch as a
dependency, rather than racing each other to add the include.

[1] https://patchwork.kernel.org/patch/11417989/

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 89ba01246f95b..eb5a527da685a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/interconnect/qcom,sc7180.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
-- 
2.24.1

