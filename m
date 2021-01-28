Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872D1307D19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 18:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhA1Rx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 12:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhA1Rxt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 12:53:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BD3C061355
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:52:40 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m22so8755350lfg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YhHWk0hpFtEKwreT9I82hjXdPuDIowSRXuqfI7wusBw=;
        b=R9YeBg0DyiIE6kJi5OD9vsC7mHNBKj6kk1eTAc5k+ISlrHTzWAW7L+3rGlBeSJ0wX+
         aLIU2JTcNa7f/gU1Z94ZetMvrp1C5f+WiaP7yjejfeMwdg86tjMc8go0VwR7UnIl7mvl
         hCK860uG9MqhEI/MOj1Hy58cWxTE2DelBPtkH0QEHV2qfuLrAIQi/Q+B7cHXc0ctqYuK
         yzruaO5j7WuAIqxJo8kfGNupvaV6G7N4sebSgIbH5Tdb1E8xWsCVcDvdimdzqx84hNwv
         +F/6oW36Y6CJ+rjkZkCICnJwRvn+ATN+WgjQN3cZ6DD/dGNhsTT/zelpkldhbNGw2zUP
         PU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YhHWk0hpFtEKwreT9I82hjXdPuDIowSRXuqfI7wusBw=;
        b=VFTb0feSflp0uFtSG9bC5xrPIOP5lpOqQWNtMjqfRVmcIpdxobQsl/ZqvUuG8RFnj1
         pMNHZDmak6cg/TRvXR1OwK2cTkmpx8qzMyEo9iFQbPfti6ELKCvCpRSrXXeNVoqmvl4H
         oZ3iA0QKNU8U3lurscbjTtrELu4mNR6ZI2CjIU1MdMAmIwYhyxon9qxM23fR2mgLkS7g
         ySWQENz078O9DVDCWzJ/zv0MtHwhrOYP4vEcFa35Mlm+kpv+fJNPK1I4kb3QUvht2TQO
         H8HRiBYvEfC3ElXpRDX/Wx2p2wOhks0mXhiz0LJg1HkEGZoHkuCnvM0LKzI7ubtvueFs
         TQvA==
X-Gm-Message-State: AOAM532FYP5/En34E//lVaGqCxKPHNPIw7vswtxoaYykdRfa72x/3/8Y
        3sUQnh9uRmVEfEEPh5oz5gzm2Q==
X-Google-Smtp-Source: ABdhPJxXq6Enj6CntWrJrW6xnC0/gzPkKOVwIt8Y/oZlEjb+wXCD0OMGAazEx9jh8prgW3NhgdSEuA==
X-Received: by 2002:ac2:44db:: with SMTP id d27mr118897lfm.248.1611856358975;
        Thu, 28 Jan 2021 09:52:38 -0800 (PST)
Received: from eriador.lan ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id w10sm2216119ljj.37.2021.01.28.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:52:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dtb: qcom: qrb5165-rb5: add bridge@0,0 to power up qca6391 chip
Date:   Thu, 28 Jan 2021 20:52:24 +0300
Message-Id: <20210128175225.3102958-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
References: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If QCA6391 chip (connected to PCIe0) is not powered at the PCIe probe
time, PCIe0 bus probe will timeout and the device will not be detected.
So use qca6391 as pcie0's bridge power-domain.  This allows us to make
sure that QCA6391 chip is powered on before PCIe0 probe happens.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 2b0c1cc9333b..b39a9729395f 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -581,6 +581,18 @@ &pcie0 {
 	wake-gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
+
+	bridge@0,0 {
+		compatible = "pci17cb,010b";
+                reg = <0 0 0 0 0>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+
+		/* Power on QCA639x chip sitting behind this bridge. */
+		power-domains = <&qca6391>;
+	};
 };
 
 &pcie0_phy {
-- 
2.29.2

