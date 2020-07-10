Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1C021AEB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 07:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgGJF3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 01:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgGJF3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 01:29:42 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCCFC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 22:29:42 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gc9so2123524pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gVIUeXQMCzWAcTP6WaAZI7/yPZyluiCjZUpguitY3Jw=;
        b=P/u5REteL/HeTai6cE+dPZwjiV9k45Y4NLnHY/lfDl47b/TH7IYwoItVnpyoWNzEwM
         6JGv23tEcx6U4hePPsyw74Hfjs2Yz9Neipt4eposDrzASCdglgWRr34EkrHURio4/qBj
         Z3xvQf4yms3QgpM6rQLSnnbaDQKSrZhPBW33tEZtZutBTBjXkxuhYhB9m/jgYjc+losm
         lNkfdM8XoGwpuf53dV5pDb7JLFt2TgVPvvUJlz7iPpTEbrohj4aPWL9vSVMagftZLgvA
         n4PQN7OYSdeEdD2wNWJE48CX4FacFMVW5rUOPU4xi9fEh7zodbFDNJabUL9mNXtQabka
         wRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVIUeXQMCzWAcTP6WaAZI7/yPZyluiCjZUpguitY3Jw=;
        b=FFn2gctxfQ2yHNKx7QueWrd/TG3/TrPkX1akcRF0yNSYUa1QnX1gcgA+/8uDyUJkNb
         wKwEA1fruEvSldd2Oea8Z3STca1Yd2X0Bcqpv0upbKzjfYFO47E520Kh0GDIasyTWybe
         F1d+nqRXKbyJ2+o6l8JZMoYIpiRoXutyAc2V8ovluoxYa0pxNvzrKVYqVTg/zi1ex/T2
         aKxQApxOCLlfu9GJ2ir6CDUbujMooxiVYmL8NIrGu54TLSjFSWjfWioo1fa6PXfMoJYG
         gr1fSAp1Tmvz5KXR6F+wTVijyc9ZhqdPsMRLEiKQyt+eJ7wXkFb2j3TdCcqb90ru7swn
         xToQ==
X-Gm-Message-State: AOAM531jPUQ1n2whpqpwS2PU8jJ4jn6sOU98XuQSfBwXGjVyuyDBf2wH
        XUmCOcWY16UtN3xBpwiT1PP1/Q==
X-Google-Smtp-Source: ABdhPJzIuQ0yZotGXpNCWaIQ1/eS9a2x8OHmZ8rZCozWUj5XQgvP6wsYMa3AmkDZBQsnw+5EmhUdww==
X-Received: by 2002:a17:902:44:: with SMTP id 62mr57666397pla.104.1594358982126;
        Thu, 09 Jul 2020 22:29:42 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id j17sm4168320pgn.87.2020.07.09.22.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 22:29:41 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [RESEND PATCH v5 3/4] arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
Date:   Fri, 10 Jul 2020 10:59:18 +0530
Message-Id: <20200710052919.2611-4-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710052919.2611-1-sumit.semwal@linaro.org>
References: <20200710052919.2611-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

This patch adds devicetree nodes for LAB and IBB regulators.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
  [sumits: Updated for better compatible strings and names]

---
v5: sumits: removed interrupt-names, since there is only one
            interrupt per node
v4: sumits: removed labibb label which is not needed
v3: sumits: updated interrupt-names as per review comments
v2: sumits: updated for better compatible string and names
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 23f9146a161e..d016b12967eb 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -25,5 +25,17 @@ pmi8998_lsid1: pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		labibb {
+			compatible = "qcom,pmi8998-lab-ibb";
+
+			ibb: ibb {
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			lab: lab {
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+			};
+		};
 	};
 };
-- 
2.27.0

