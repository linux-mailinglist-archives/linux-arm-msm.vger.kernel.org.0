Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D5B466517
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358511AbhLBOVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 09:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240661AbhLBOV1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 09:21:27 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CE1C0617A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 06:17:43 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu18so71940362lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xL4c95uqByU7J08CZiX/XHP0HZvf8gLdVWZxGCtbXXU=;
        b=sNtnipCEgRSiLyzcUP8nFO9lRdlmoymw3vEn4BMyNF2Qlb3qCHcsbrNRTDtIotwsbk
         dgKrbHfLwx7xyqYusZx6jqNhnL4bSHgI39IUNpwZ7PO5C8I2gon15ouXdd26seWkKq+i
         qHSfftUIF7oqv2lldD/ceoB7lC4es7JZ+hr38SPSjHCbxpo6HbXswfzISrZf4MM4dLea
         GcjvXp4rsJB29zomsNlJk49ubLNW+IC+HXLOiQyNWp5UcCBf1O2AhwU2dkt073LEk0mN
         V4Jst+VJYdvQ3k6tLkRh9Y2EXFWTRWV4a6AzFGAbYeOLwT3zikEdBnS8G5ZY3/IiEyu2
         S/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xL4c95uqByU7J08CZiX/XHP0HZvf8gLdVWZxGCtbXXU=;
        b=QTsS+NXjgR94zIfdka1DtyJB81LY5xzXTCYKvytIh8UxXhwAgK/Ha+5hs+IwX3FMZD
         4O0uDLXJH/EDm7qVJNw/j5xO0vO1X4NBntRe/w2YIr4XCUy2DpW3dcu0koD6CQkyegl5
         0E4Sej9mQpgRShkh/iUtD8/6Y5HeAqIiBrqBF9Xr/XrJUlDp0u15VhITpyU9aUrI3gJx
         fbBDhvBB6VPyPNtpnDQ6iPSsyUGnndUM+QgcXtGED1XuyUDRqsiJOibUzWFbdLsicp1l
         vyJ7R2634BUGIiwrqDYBErn8HlVvWkyDUxDYAKv8AHXW71WzZukKqn74HkRJwzQx+fO6
         G77A==
X-Gm-Message-State: AOAM532LWWepZZoxWgJaEM36ADJaEWJsQ+xAWQ07mYnKvlCaYBkVZTMu
        3gABu+0cLrnnC8KPLdeE4aW2zQ==
X-Google-Smtp-Source: ABdhPJxwS1ZJE+rFkAabfyXdoekK/hRmTaui1SVyA6I2RXczyk8lcIdqlWOM+2va9OgJViM5c4GlPQ==
X-Received: by 2002:a05:6512:3213:: with SMTP id d19mr12392700lfe.519.1638454661909;
        Thu, 02 Dec 2021 06:17:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m15sm362487lfg.165.2021.12.02.06.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 06:17:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 10/10] arm64: dts: qcom: sm8450-qrd: enable PCIe0 host
Date:   Thu,  2 Dec 2021 17:17:26 +0300
Message-Id: <20211202141726.1796793-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
References: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 host on SM8450 QRD device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 30ebafe9c6d2..017b0120c5d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -346,6 +346,10 @@ vreg_l3h_0p91: ldo3 {
 	};
 };
 
+&pcie0 {
+	status = "okay";
+};
+
 &pcie0_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
-- 
2.33.0

