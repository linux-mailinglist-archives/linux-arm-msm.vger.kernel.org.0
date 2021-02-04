Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FDE30FECC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhBDUtu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhBDUtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:49:50 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BEFC061786
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 12:49:09 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f1so6642136lfu.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 12:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+BkYTpir1J+WMle84+eAWl7vJ45bkuj6clu7v/nPaA=;
        b=uqJ0mSGDZUXwXd/9NrPr7sCbnyL3BOoFa/jliHcKhTcBOIjW/7TX4ZcDnvpvX9DQR8
         3Abj1d+OsRrctJSyxcyuevNlVNCI4y1MAeOFGR+wJlRLxzCqMCY34+Z4XRqYJs0nICpw
         bC2nZaxtlH8Ebb5dAp35JjNHq3KPoP+whbSrm3Y9VJIXjA5DHBK31RyCRr+TUs2qi0VQ
         WZKjDr+pLi9+eNFtUVGmmR8d7CZkqNYUMVEBGlsdIuRNzawxJk5cn5oo3Sm34cr3IBIz
         AesnKAO7BV/zezKSX5h0JZSJ6oNrgJvDYwJC547n7mD1II4CQrQovdu9HmHraIWpyY9z
         vAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+BkYTpir1J+WMle84+eAWl7vJ45bkuj6clu7v/nPaA=;
        b=FTKzPp/kKfen8Jzw+S4P7FDtRVRyba8JNoWBtQAwMsCoM5h3DrmXGbMwTUjCEpa/7k
         8IQHPM5eiRgZGOlN/sAgOuzchtJTBYLfSAKFmnfFcFgT7vKFtWDJcmTYu/65nl2wPUcX
         XgE7VpxGLRaqPDWfPRR4+3Z3h+hZzy5hv+2S7U+JZsU0mMV5no3vtOw4xdSO41CyfGGs
         VUBpBt8PTasIeNTeQmy+dBDZK5uzryMpsNZaWTlDCOi9rgynx0lDBqNgKU9w95qxNO8m
         Y7vfjTehQ/ZDOPYMvXPB+U4bzUBIoSvZoQC035DOArbmTk5kVZYBzSNVBI7IgPnTiW4F
         8/kA==
X-Gm-Message-State: AOAM533i49EJq98tM9STfI/xhOfkOXBT+lO6STkcwjTvu9FIc5WJ0Dnv
        n8trO+3LnCR2pT/Pec3I7ThFFw==
X-Google-Smtp-Source: ABdhPJyUq4wIyCj4DcB7vKkXURzeTglMpTZrK5nB3To0oEedkqCCPtddykWV1NPiCAQBvvdtePpEoQ==
X-Received: by 2002:a05:6512:308d:: with SMTP id z13mr605908lfd.71.1612471748137;
        Thu, 04 Feb 2021 12:49:08 -0800 (PST)
Received: from eriador.lan ([188.162.64.67])
        by smtp.gmail.com with ESMTPSA id g25sm759958ljj.64.2021.02.04.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:49:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
Date:   Thu,  4 Feb 2021 23:49:04 +0300
Message-Id: <20210204204904.294555-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS")) for the details. Configure SPI0 CS pin as a GPIO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 50f94460c970..6098ccba85de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1129,6 +1129,8 @@ &slpi {
 /* CAN */
 &spi0 {
 	status = "okay";
+	pinctrl-0 = <&qup_spi0_cs_gpio>;
+	cs-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2518fd";
-- 
2.30.0

