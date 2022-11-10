Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB0B623FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 11:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiKJKeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 05:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiKJKd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 05:33:57 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1012E68AE1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:57 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id t10so875067ljj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGzWY9dQslOTaDVeaaodx13Gr+GUtkH/icX/AdfHUtw=;
        b=Ve/NPFkAE0bxmtVdm1r31VXlYS078dzAs39JLxBbiQwvV7jPMbBs29chxcR7ZpNyjK
         75WuHLCdZLdJix/nVfPSCMg6bG2HJRvi345t8et8S3BCyfI/CgMDo9zeQMxQVuuHNIRw
         9PC3/U3Eou0v9sWzSVMur865WIZJrW9nLQwxiQ53Df1AcHNTD+ATUU6EoqaO0AjVTtHC
         8JyJKv/z9Vqf/etXMbybdoC5qZMO3Tfkh4R7OyyrYM30bFafVzGtlkZ0d03/4ShcdKWn
         SKEFKlpKqFkXI/369AxMnESD8EIOgsl704X1n0+vvtLwsKuw+mTt1znbDMfVR6zJ2NU1
         fWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGzWY9dQslOTaDVeaaodx13Gr+GUtkH/icX/AdfHUtw=;
        b=wpQ/38NV754MFWeE3c93MRxWqScQ4qA3e7xibx2jfXL5N3LTKOm/h/mWyP1UbV9t+u
         O8vO8OZK5qbFdbOMFxj7EP2fPxvx0KbdM/3w50TpjM3BPkpQOWkykdNqPnlfjbDDUNSm
         wj/SVnpwEZJTEvh0cVV2tpNCzS1ZJ8z8qB+sUf0/GBRfJ/k1uETW4pVRuakvN6vpCf3u
         cD2v8Wg65CEkmd0z5u+8Qoc8u61gyLyfmeCNyJIBzivVeAFcjRPWTfsGNULGWfyJUfry
         Zjnmm1KE2RnRUABwZsYdzMmjT6Xm41U+b+TcX1NDozg/iL0c2v1SHi1g310ud+QvIjJj
         nEPw==
X-Gm-Message-State: ACrzQf0dmD4zs0DvAqgkStb25lDWmykqXn2/HEfbzfqkJK64LfABhe+t
        X4HqwUHv+70oNsUAq4cEqMHuzg==
X-Google-Smtp-Source: AMsMyM5VEx26zEE+KwEPWvpa35rlqAY/RhhTn/bdX9GOfGlWiG3oXxlF5FNTqocy0OWAQgRGVNViBw==
X-Received: by 2002:a2e:9a8a:0:b0:26f:bf09:2f57 with SMTP id p10-20020a2e9a8a000000b0026fbf092f57mr8119128lji.180.1668076435429;
        Thu, 10 Nov 2022 02:33:55 -0800 (PST)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p22-20020ac246d6000000b00498f32ae907sm2687837lfo.95.2022.11.10.02.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:33:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable PCIe devices
Date:   Thu, 10 Nov 2022 13:33:45 +0300
Message-Id: <20221110103345.729018-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
References: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 and PCIe1 hosts found on SM8350 HDK board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 0fcf5bd88fc7..58a9dc7705a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -222,6 +222,22 @@ &mpss {
 	firmware-name = "qcom/sm8350/modem.mbn";
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.35.1

