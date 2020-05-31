Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668F21E9950
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgEaR2c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgEaR2b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905A2C05BD43;
        Sun, 31 May 2020 10:28:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j198so10497404wmj.0;
        Sun, 31 May 2020 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNjqJIcwvJ40HHGrWb5z7DmuyYRT8Gwg/AB7gmiMdwo=;
        b=SoscmX/8ekqhTQfQXyEcMfGjBz3OdtU9lVs3DnuoWzahRzIiyfeKWWaxucFkCdIB1G
         EhNZorDa05vEtvC+4tLBWMYYPwW9r7Gm2Xs83ps6nFSgnmai47I62++XKl+42BSMnw85
         cwtVDCkVq3tkdH8pevf7qmJbW/zIr3qX5m3hNT35b9tJOabZIiIdFQhv1FoITBh+8fXL
         uHhNt80BULPqsHywGdQ3fSLOC8u046Ax3BNK1LmqnhYUrGqrXCtqks/if+YJH1cUieKX
         cLkxZo8htMqObr/xbP6JkEDPrDz67C2AQbWKvrmixCJw7VFPhHWhtD/8hEekPiqnB88U
         CP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LNjqJIcwvJ40HHGrWb5z7DmuyYRT8Gwg/AB7gmiMdwo=;
        b=d89yv1IZNTbITIPeQF8jIgIk0eTpSwVgiSBmqjkDWrbTibt9uhCnwFgis6yujcuWnK
         PWWWlrrEA7rHgwPZIYf8U1gaWCaFi5nI9G4D1QhyCbnaP0/e3surKIvuBZCmVzhU5keF
         yyADlYmkiUCSPhcdmfSZhrTm06JLJ5hOlkKmV1QDcy5cUA9SPAI15XdgAjyVzrFWLDVL
         dP3+LwgAtlCvb19c2CFCo4st0VdDR3QhpvYPWvdqxXp33DXIDyP+w+uG4WHqJJs82aJ4
         ATQc13z8fU+C+By6Vzs5d7aMuWapql0TmCVnczIuuCxIWRwCUuv0EtKvfDzz0rYSk0gO
         pe5g==
X-Gm-Message-State: AOAM533eNYfo0jRMtQp0T+rPHQFBUuSB1lzq8Bp2pUpEci1XdFTQN96a
        6vAgOG5wtWxz+d54bRsHTAk=
X-Google-Smtp-Source: ABdhPJzLhTzzBOdoc383NMgKDy7M9Wiz4WFgvveFblJfIVzVeBl2Wpza7Q2CsHnCW5kFWVW11smGMw==
X-Received: by 2002:a05:600c:34e:: with SMTP id u14mr18188832wmd.16.1590946108381;
        Sun, 31 May 2020 10:28:28 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:28 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] arm64: dts: msm8992: Add PSCI support.
Date:   Sun, 31 May 2020 19:28:01 +0200
Message-Id: <20200531172804.256335-12-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This SoC's firmware does not fully support the PSCI
spec, but it's good enough to bring the cores up.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index b86fcfb6f463..e7354826d701 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -386,6 +386,11 @@ pmu {
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "hvc";
+	};
+
 	smd_rpm: smd {
 		compatible = "qcom,smd";
 		rpm {
-- 
2.26.2

