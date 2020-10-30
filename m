Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28D329FA4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgJ3BH3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgJ3BH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:07:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3943FC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 18:07:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a9so5761499lfc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 18:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QViQgAeoKYf7Iu82LVxWPMaTDwhUZNQ6uzFRhsBC9QQ=;
        b=orT0AVb6wpcbaB4cOcZktemGwXtEtIn/5F1pze6EHOAx0GlUohuWeJuHku2NIHldlC
         7eOvKhbw/DSo7MFXJRJIT0H6fQ4SZINbpNEL6EMLjcMHxsWxnxZ/bLiTkFpgLgvCDNUM
         DgyLdFNuvtPpy0kuG8U/wOEBgkzF4rULDSecF3vhFqtARelgCh7Wmhd7y/y+S5DWcvZS
         dWbHR9XoK2Gjv50dr10G0zsSfMWz69EgkzOAT74h14EL0t98Jx+dLN30rL6SOyMUiNUJ
         k2bFyzmG2A2LCm/SdzuTckV0MpKDJ/yvxUobX9UiShs8FgtHQTCuN1ic87bbVcoYxTfM
         8iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QViQgAeoKYf7Iu82LVxWPMaTDwhUZNQ6uzFRhsBC9QQ=;
        b=ZNMcu09zv29UDH1MsEXZ7fZZRGVrvEHKAeL4g2LDKL7WBw249akVr3iyNUo6m0miW/
         bIEOiJ32U21E5btQWjEuvbvS146R2A/K1MTJ6l64JahWbSVloWSgCpzLrgYgNgeI6rz+
         xCSa5GYFSu4dzMYuSfGbx1sRC8Le1YgO814ULQVOj/r1peyS6cGla+hGwlBA7UnJxPv3
         XqGSKQKU1PkNlaZvqSASqtX9vW+Mx25/fVja9Td8KTqtNaEY1aHuDHnJc6DcYBQVWdz1
         rf0ea3r7vXJHn+lrLH1LtKbIxmDklxx3ldo759N6W5nOWlXNjCBwP0/6UbIVXc64WJY6
         cgRA==
X-Gm-Message-State: AOAM533JY7zwLQ9TYOSKMX8w+XCOTzeqey7Imo+3ScfrRuJmjnbIYQsV
        zIQGEXy0ReXrNRUM/Xa0N8T+yg==
X-Google-Smtp-Source: ABdhPJwMQ8mJJAIEFq0SK4wnTzMtVGJRlDwOXQuWiFM0xv0axvzuANNoVT/IEg+GpH9yYT4AVxFN5w==
X-Received: by 2002:a05:6512:3490:: with SMTP id v16mr2432620lfr.61.1604020045762;
        Thu, 29 Oct 2020 18:07:25 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id c6sm447130lfm.226.2020.10.29.18.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:07:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: qrb5165-rb5: declare tri-led user leds
Date:   Fri, 30 Oct 2020 04:07:13 +0300
Message-Id: <20201030010713.247009-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
References: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm RB5 platform uses Light Pulse Generator tri-led block to drive
three green leds. Add device nodes defining those leds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index df2d01f915c9..bf3d3f44016e 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1017,6 +1017,29 @@ &pm8150_rtc {
 	status = "okay";
 };
 
+&pm8150l_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		label = "green:user0";
+
+		linux,default-trigger = "heartbeat";
+		default-state = "on";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "green:user1";
+		default-state = "on";
+	};
+
+	led@3 {
+		reg = <3>;
+		label = "green:user2";
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.28.0

