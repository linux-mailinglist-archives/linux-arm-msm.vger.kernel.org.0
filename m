Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F93449A23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 17:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241360AbhKHQrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 11:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241352AbhKHQrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 11:47:46 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC001C061746;
        Mon,  8 Nov 2021 08:45:01 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id s136so15648184pgs.4;
        Mon, 08 Nov 2021 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xjWtduiNsj6Bi3f4t7JE2k4ZxRzVTBo3OlUblSXbUOA=;
        b=HoPCsEWPsJzxSomLl9MtjTikV0eDo0q8QPURtJQYOXlWgsAvIEy+13YFZNXkW4M8hm
         J1SqsoQzKg/E2u6E/3se8E0tqACqvD2LTKcRmKAb3YWC3nVMxKU1YRhFpVkCQfXQ472W
         Nxo62AZQrFL2T/2jIW2TjlFd7fjLhrWsTUt9gjGzgGpnVwDhBYVOCiDLjZ/KuQO6lyM2
         hiZ100h6zghGp0sMoat55L6Nk+WkN3egSpMvqYCaOH+lBbW4nuwILp1JxpARTlfg8J1U
         NNNuZLLqhtplE3soC3nP8fYO0YjaDFOz4LDv6hmBka+3GGfrswnmrOX/R92rSI2Aglu1
         WdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjWtduiNsj6Bi3f4t7JE2k4ZxRzVTBo3OlUblSXbUOA=;
        b=EzfEUjlScWDARgWER2I2Ql0khcjMVC6uhytnqOesWCAMWkZ9KImsR+M1oKm4paPW41
         YxCwnmSBlFbjYKA+Qnv7yJTqIfgZCqJKprofbwMtbR0GV4etAzxbrC/9zMu4JBYebXuh
         6MHYQ9rPrfpM/rhdgincyVAPgY3gRBR4DOP3xye2Ogf/VeLgHaSO9IStPTsYtUvGOXws
         8Tcc72RDkfO0a1LwlDrIvAZtuJnP42BCsbbFPItVEapjbyLpvsZof/WuyEa3VtogJnth
         k2atSpAmVSHPSsjrl+C/nb5PioErL7QTu70vH6wbNtbNFC7OSuoM3+bJdeZvfUxHsdyd
         CowA==
X-Gm-Message-State: AOAM530eHL/A4LNg7YZGf6PsZmI5Bmkz9Gs2r6+o5cXvevJ0zjOVsNLL
        54hTTLJvTmSpIUnRR/i5ajc=
X-Google-Smtp-Source: ABdhPJyUyh5neBvgx+NnI2a3lyvv0Lv4NVNDbeK6bOgb+eZ3Im9fbnJJ43E/RmvueSbvn+Q55HKu+A==
X-Received: by 2002:a05:6a00:148c:b0:49f:e048:25dc with SMTP id v12-20020a056a00148c00b0049fe04825dcmr5470184pfu.12.1636389901393;
        Mon, 08 Nov 2021 08:45:01 -0800 (PST)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:36:87e1:381d:5b89:8aef])
        by smtp.gmail.com with ESMTPSA id 145sm15980974pfx.87.2021.11.08.08.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:45:01 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultz@microsoft.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: surface-duo: Add surface xbl
Date:   Mon,  8 Nov 2021 08:44:49 -0800
Message-Id: <20211108164449.3036210-6-jaschultz@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108164449.3036210-1-jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce device tree source for the surface xbl driver.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

---

Changes in v2:
 - Updated to reference an offset inside of imem

---

 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 736da9af44e0..25a4ee05ee2b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -429,6 +429,16 @@ &i2c19 {
 	/* MAX34417 @ 0x1e */
 };
 
+&imem {
+	status = "okay";
+
+	xbl@a94 {
+		compatible = "microsoft,sm8150-surface-duo-xbl";
+		reg = <0xa94 0x100>;
+		status = "okay";
+	};
+};
+
 &pon {
 	pwrkey {
 		status = "okay";
-- 
2.25.1

