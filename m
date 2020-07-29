Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12829231DDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgG2MBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgG2MBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00B0C061794;
        Wed, 29 Jul 2020 05:01:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l2so10827560wrc.7;
        Wed, 29 Jul 2020 05:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xVG670XkylcieeabI4BfFgFxbC/3cUWewC6wtfaP/Y=;
        b=GAhF4rqWA/rCnxC0tmw0CqGWsHsMefRlXnwrFNwJkZRxk2S7Xlc2vthRRjMT2+bEJd
         Z2s/mNCF7YAPqEAEOcVmE7Ta0OKwBn4dVXY1VzTGe8lsCr5QPn2Xgc0tSLUplXn34chH
         cKO5cJD1kPAnz2n3AQz2mmpgzcydYv0gF2CRiIH75/BYhfbl07IS2W8LbzyVEJe0Hqqn
         l0I3vcQUQ7TkLtMjODUf9AeSGeB1dNveifBRpNKNirgxLxUCsSPRB6V6byfFgJP+jDZM
         ungqp3BHQupzl1ipOFqRz8krpQRXsLgLC1w4CvPGJ69QL6UGJmR7JilN7IZOuuGEoUK7
         6M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xVG670XkylcieeabI4BfFgFxbC/3cUWewC6wtfaP/Y=;
        b=IpuJG/EK3KgILuWShP+FI3E1XLja8K9EV8kX/6lhcwa8WlBTmwMHvnlYaF3l7Ud8Bv
         fXUkIVnqnna+DKaLtXWqZs5v/2y2NjW8TryWSybHoEoILpYSRsvtfTa0kZB/Q9PjEfWK
         ViQr7osp13CLZDoQKHORRgso/DwhB5vOe2J63PNcAQnzE9+n/Xo7uXBAoIzpsjK14b3c
         U+Ab1eiCohFLRAm1t32yKi9PksmeptXfIJOx/M0OEM7hbRTkeRxDjyojpOBxz0YDMNsM
         TpiUNt3UdY9oaS+HWBSvNOigXQ+ru5QDc3pQ/gz4oClXHYkDEiEd5LmhyxKNE3FiS8LL
         QaGg==
X-Gm-Message-State: AOAM530iFPyKf6MGC1CzwchDzJQAteXzyQd0COmrUxm/LrW8m8dp2Ra9
        O4Yrp9mhX8dc7b/M1jqOQtY=
X-Google-Smtp-Source: ABdhPJwaYKdSpCLeQeI5eyGMB+KUi6nGVIlTL4OC0YJQjCvxsI7L/NwUEDmuDNd1TKL0Dgyhw1Z0ag==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr28809614wrq.404.1596024081422;
        Wed, 29 Jul 2020 05:01:21 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:21 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 08/10] arm64: dts: qcom: kitakami: Enable SDHCI2
Date:   Wed, 29 Jul 2020 14:00:54 +0200
Message-Id: <20200729120057.35079-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the use of uSD cards.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 696cd39852f4..806e8ee00833 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -261,6 +261,10 @@ &sdhc1 {
 	 */
 };
 
+&sdhc2 {
+	status = "okay";
+};
+
 &tlmm {
 	ts_int_active: ts-int-active {
 		pins = "gpio42";
-- 
2.27.0

