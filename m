Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51C523096C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgG1MBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbgG1MBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:01:16 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD82BC0619D2;
        Tue, 28 Jul 2020 05:01:15 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dk23so8490045ejb.11;
        Tue, 28 Jul 2020 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xVG670XkylcieeabI4BfFgFxbC/3cUWewC6wtfaP/Y=;
        b=lsigjsbcLg4U0fz2DXXJx6Dx+9kRltx8Q3OJh91jCAowBbFWJ66z7d6Ix651wJndte
         phN2g7QbZsy7xyqCeea088Lo5Q3ER78cU0gPdo/FWYfRKKcWSoG8eRjcl3jJZc63OkAv
         ByonmGBlh1OkelbbArUgZM9YYcCIjlRb0swiaDUG++flRzoUKqVdMSsFBY3Z4S7D+O9R
         oYde/E3lxnG9o6I2nCli3NP4vAgVbKpvEJKgZ8QnmibB9141v0Gw3UtWV4wI0X1QIPgb
         3n0NVGj0jlXVLvtyrnWA6p0DlFwmxCOsYfcpy+6yXrlAgedKefXV072QIJjeAk6xu/nP
         cjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xVG670XkylcieeabI4BfFgFxbC/3cUWewC6wtfaP/Y=;
        b=T6Z/fPPfziYhlNp4MVIY9UWlzUqpwYCm+z03+H3xQKVMkCzXffHR6RZjpl1nEk/frf
         4IhrVNAXzAo+u4p8fb7LxpmpY8H4A3qFdI2XC8gVtnoWBIx5UR5VP5FeUZkz9W5ST/XB
         52cAvsDUg8ynvTlz6hibdjWt/6l4GbvvSrcN6GD2fMqaRTtLtHLPWM7pVmjZy5eo+Lqh
         /P8AM8dKQYh2Dt4HXW2ZQH1ZdkFkRyf7Y7y1Nkv8uQb7xQRW4xfae9dZrHZCCZrINjFM
         kMIZd3doK27uEaf7IUSYuVGGYuPzkjRC/L7JjqfnX+rRiYS//3tenJEH3MqXfVB7TkQo
         WjUg==
X-Gm-Message-State: AOAM5302dZ9Ab+Lk0QcuA2WNyZzZKH0gJegzu4bZYZILIFvH1zg8AQPX
        FVoLr3d4IiBF+xOk3FLVYERS7ZxOROA=
X-Google-Smtp-Source: ABdhPJzjg/8EY4mfnf/6DLLQKoIP4Iig8B48JFS1ys9qasBiMgYlTjXxbuVtY01YIiaWgRl/1jOSCA==
X-Received: by 2002:a17:906:12cd:: with SMTP id l13mr18816915ejb.385.1595937674557;
        Tue, 28 Jul 2020 05:01:14 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:01:14 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: qcom: kitakami: Enable SDHCI2
Date:   Tue, 28 Jul 2020 14:00:48 +0200
Message-Id: <20200728120049.90632-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728120049.90632-1-konradybcio@gmail.com>
References: <20200728120049.90632-1-konradybcio@gmail.com>
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

