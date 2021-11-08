Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46071449A1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 17:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbhKHQrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 11:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241324AbhKHQrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 11:47:45 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66F0C061764;
        Mon,  8 Nov 2021 08:45:00 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id z6so839871pfe.7;
        Mon, 08 Nov 2021 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vetmgY/q4MmVB6NApmYxDp/2A50t7IQ3n8oeFYR+SKA=;
        b=Xjdgcx0pQDbMpGV+OFc0m9Eg4X7Sl6hJKRYGIPGu60Nsa3g4q3BiQ5UhPSs6opKH6l
         q/X79gNcDPu3AGDMubiHpflUvdmGhLctnP8oQXunLEEtJxROezRcFDsJMI1PbrPZXntf
         p6WpbWu6FcxfQQrG/M3MKRY65DW8l4K/Of8hZWF+DqXXY4HSO7XWyf3MaLENhBScQzkR
         rIeGqA/3z+iNdFur0+pFTe6MK/5r837yeaHfdJxeC+5Y/K8Krb953+mYnKr2+/BhbMM/
         eHBe0TA2CQrqYJlH0ZYzKXi2BP9nHqsPVnAVOt6cJDV5cfratxEt/xePTh4b/x9iob84
         tSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vetmgY/q4MmVB6NApmYxDp/2A50t7IQ3n8oeFYR+SKA=;
        b=3RGNSWU3I8geZaDsrtOlKW0mAqjznQpX3AXU8QHGsT5+VGhkQ44sZgVNtfivDIYt1C
         KCWAMyNwzOV5nslnUzcSw+ZQ4g6rI2ex1k47Hyc/96tH7KCx/tIcZEyvz0PsnlhkpM69
         8lFo/s/e78m7GwscfDbbkgyfgwPSunVDPDgO9VBlB0R6U0THL5Gbn+1fm/otkyoJhTqW
         3PkQ2JP96i0IVFwl0LuOMkxCxh6iLRYtNtTUKUOwPY8rXQrnrzMVvZbBg+8xNGgrR2Hm
         3aCABXbv3k+cf1QLll3JmNLxnA1707Lrdnr0v/IvHPttSXORvE+PxyiKEXOoc9YyM7dm
         c3LQ==
X-Gm-Message-State: AOAM5313BCvjkpSde6yyNzVsnuVTYgHu+u+KzF8W4zF24h4nEpAqNJ2x
        5bLECQxUhZYrDbBvlcvf7V4=
X-Google-Smtp-Source: ABdhPJwUmmqDJIlQuvXx8sDqZNGXpwBy2XXBuV/EnsoJuo5jsbxxGH1qOpyrD48y1sIfdLt1AIiouQ==
X-Received: by 2002:a63:1d23:: with SMTP id d35mr543158pgd.357.1636389900449;
        Mon, 08 Nov 2021 08:45:00 -0800 (PST)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:36:87e1:381d:5b89:8aef])
        by smtp.gmail.com with ESMTPSA id 145sm15980974pfx.87.2021.11.08.08.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:45:00 -0800 (PST)
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
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8150: Add imem section
Date:   Mon,  8 Nov 2021 08:44:48 -0800
Message-Id: <20211108164449.3036210-5-jaschultz@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108164449.3036210-1-jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the imem section in preparation for the surface xbl driver.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

---

Changes in v2:
 - Created to properly reference the xbl section inside of imem

---

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ef0232c2cf45..1da327cd49ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1176,6 +1176,14 @@ gpi_dma1: dma-controller@a00000 {
 			status = "disabled";
 		};
 
+		imem: imem@146bf000 {
+			compatible = "simple-mfd";
+			reg = <0x0 0x146bf000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x146bf000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x6000>;
-- 
2.25.1

