Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA3320248F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgFTOte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbgFTOsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:33 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297ACC06174E;
        Sat, 20 Jun 2020 07:48:33 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g18so3286549wrm.2;
        Sat, 20 Jun 2020 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6vJgKaplvVYu5CK3tSSKZqp8AdKD52jPGys9WAg2ik=;
        b=jHflshu8MRE0tbnm3v4T8SNN7diDQz/65jfJwoRnXg9SXiyswmRiTudYNu5y2EhTd8
         9LCUerKNPQnaudvq0y6cL0QTInaecz0xsTE9+MUTr5NkgN7G8FaSOdgkJkjcShOpsJap
         hmcxl4nYNv5M6pVmc/baYFnx4Fv3QbOukg39FtzP0RbYSgf6YLozeyZ6IKPgMYSxOfOF
         8DDJltnpYLnCfW+fmqDZlDlhzGKMyf52dLjpmx65XRL4bMthb1cCIdDikIpql7zs7CN7
         szoQpR05oCjZigJhMedZX51o28754Nnwy7nlp8erOwDRf5hslsAWwfNHtF338mezZatQ
         S4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6vJgKaplvVYu5CK3tSSKZqp8AdKD52jPGys9WAg2ik=;
        b=EQmQy9EJPyfSb57QGiP4Ndvo9Au82ynaI6kAfG/1V/nb8ClmtR6CfgoSiqT3LAfdQw
         Box3nQmKNP71mA/sSnJ5EyNjlijPAFrFcKdz5aXlNu6NdyMgnf+pASO/Bp8Y19cDvGBc
         rrL2VT2mksPiGnR4MwsEZmsJTqid5Mdmtkth4CitJ9qehf7rx8VfOQza+tK/a9DXutoC
         UMYyFNJ/excsF7WWScPHTYavTemEqx9n3GO1MJ3UzuxJ2LuZJxWj6AzZjUv9PcSToB+o
         n1314ATC+hE1ZQoIL1JxWh2kkQ4g1NfxgkJFp0N5jZlPI0q57LiXvZoCJlfsacm1R8TH
         8cnw==
X-Gm-Message-State: AOAM532rTAjYilaDTuBf2IY01Pa6NgR2qlgoHgdVQXZdab1J5LL8cdkI
        p5706piUWHLc6w7NfEUioCM=
X-Google-Smtp-Source: ABdhPJzu4Y9C4y0Qd65ugxbI0YADYBBvj5/MB+c7KXfREiadsPdCL4sXLQALh/+8JVVDHClvdKd65w==
X-Received: by 2002:adf:c404:: with SMTP id v4mr9061373wrf.85.1592664511955;
        Sat, 20 Jun 2020 07:48:31 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:31 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/21] arm64: dts: qcom: msm8994: Remove qcom,msm-id and qcom-pmic-id properties
Date:   Sat, 20 Jun 2020 16:46:28 +0200
Message-Id: <20200620144639.335093-13-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These should be set on a per-device basis, as they also include
hardware revision bits that can vary between boards using the same SoC.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f363b678c3b3..b1a3f1732d84 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -8,10 +8,7 @@
 / {
 	model = "Qualcomm Technologies, Inc. MSM 8994";
 	compatible = "qcom,msm8994";
-	// msm-id and pmic-id are required by bootloader for
-	// proper selection of dt blob
-	qcom,msm-id = <207 0x20000>;
-	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
+
 	interrupt-parent = <&intc>;
 
 	#address-cells = <2>;
-- 
2.27.0

