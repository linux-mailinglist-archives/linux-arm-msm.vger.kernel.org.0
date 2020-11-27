Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B03D2C64FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 13:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbgK0MLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 07:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgK0MLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 07:11:49 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EF8C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 04:11:49 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id k5so2616360plt.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 04:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jLxCd/F4fxI6lLKUfeAQgTwipZuT/u/XIJSTRbWtMDg=;
        b=CPNWCzWsSd3oUokNVooWVpeNA95diJkjWwHWX/VnN33CosnZTzfFcSk3ty9TMIKIcZ
         NmUbPWW7Aqmjwbrh1I+eIhuZFBshCLUYcEw4kbOP5Zt+4hZIv2RAvP2fMj/4/IcqTOpr
         bq0z3QSfnBLwCW2qC4VHcWv1kensicmij+BxV9egwWndypnbFwVuDBiX1st3JveGFSdD
         8qWLyKfjGWISKLZIBz8pXNbWkj8c/l/QNA53P2Ipw/Ei7E1ACEutWHrPmOla9jH+QAYQ
         P3ZM/qYbs3HlwJY1LaNA9BCJ2hKdZCF3vydrgFgn8+zLOKBXxxVTstNmOxDjGYJISXiU
         S/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jLxCd/F4fxI6lLKUfeAQgTwipZuT/u/XIJSTRbWtMDg=;
        b=E30+4FnTAkooveZSaYOZeJr35QjxJ/o9WMjV6FQ0kbu4xcvKgMkWi0Aolzg6ucDD1x
         EM+EySASZ/HltEampZ5prV2hwidKWlNcCycNWibJcPAPxqbKT4cCyHPQD7lXj65rGQNc
         SqnLB26Fl+BffkBrTfym7Ap8vZkRtQZCYNvOmo/5G8ND3AgyLEY/K6gB40Cd7UbDl1Pq
         ZqP0/QRvTW5o28ifIOtPsXAFM9L6DBdwN994QkVZq58TRsxMM/YV1MxGz2xUCeMdTmHa
         Env6PYIf1iTLX05UXLx7c0L1H44MZcV3JHvZtu0UL5Q73TJ7zCqwe9LkoiHuyBsjuoj5
         Ywkg==
X-Gm-Message-State: AOAM530WLB/+4+mUnKH/+R1snbuWPu4fLAqFBFISY596kXoacEmZaJuL
        V56aO57J60sC2lHOdwyJaIgv
X-Google-Smtp-Source: ABdhPJx/ROcKQmH0joCVhqAZ4cSDQWRVLRB7n7LeFtd0AT8NZB9vmmIWXJtuUb+l5cdmNMF8nSzPtg==
X-Received: by 2002:a17:902:8486:b029:d9:66b3:958d with SMTP id c6-20020a1709028486b02900d966b3958dmr6885707plo.48.1606479109115;
        Fri, 27 Nov 2020 04:11:49 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:480:e2cd:2509:49c2:a270:1438])
        by smtp.gmail.com with ESMTPSA id g8sm7318790pgn.47.2020.11.27.04.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 04:11:48 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8250: Add support for LLCC block
Date:   Fri, 27 Nov 2020 17:41:26 +0530
Message-Id: <20201127121127.158082-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127121127.158082-1-manivannan.sadhasivam@linaro.org>
References: <20201127121127.158082-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Last Level Cache Controller (LLCC) in SM8250 SoC.
This LLCC is used to provide common cache memory pool for the cores in
the SM8250 SoC thereby minimizing the percore caches.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 65acd1f381eb..118b6bb29ebc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1758,6 +1758,12 @@ usb_1_dwc3: dwc3@a600000 {
 			};
 		};
 
+		system-cache-controller@9200000 {
+			compatible = "qcom,sm8250-llcc";
+			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+		};
+
 		usb_2: usb@a8f8800 {
 			compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
 			reg = <0 0x0a8f8800 0 0x400>;
-- 
2.25.1

