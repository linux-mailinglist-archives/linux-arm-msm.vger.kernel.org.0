Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E126AFDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 23:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgIOVqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 17:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgIOVpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 17:45:21 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7048DC06178B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 14:45:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z9so925773wmk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 14:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9KMVC1YG0Zgl+FYlCNkjyM0mDusyj+CBKlA/V00wdpg=;
        b=Xb7UczPakAqjh0s7AzauUIfKdNEFZ0A8228lXc8AQsdh0Kmwgk5lkpS+1EIwII0dXu
         CIt/VcnjGSZnKr7dAV5DkDLY1s7Gq0NV6PFLJXD1PpTVUFIAYwiC2/97S5XAEWMrXErs
         hKJd0JZ1yFJRuLER8PxCsexh05g/HlAvFn3HozjVa503kS1sZ59CL+E+51w47YvCDi+F
         /1Pcg3HMmAbbxJ4GyeZ8LShbSB7ia87HAp48UYUOeiCzSoSG5v2WR1pamdXFRFjQj3RN
         3++WXdntatcFiy56ghIk6GgXYYYXH/vYAsDUISCeFwz62KMhrKEtOIdyFLejxoUxWCP0
         Dtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9KMVC1YG0Zgl+FYlCNkjyM0mDusyj+CBKlA/V00wdpg=;
        b=ifNXvLK7N7fF3RFnwUfseFQI7t68xOmJ2rdZlyiroWqzqdN6N1FjPzT4tIsrLgVsxo
         KFRY4B/C2GytkYNkyHHk1S4hUS9IVvlCp3F2m9X4e24WQzTOM4vmZHGOewwIDKoRlrlo
         Ac1XambJ5q6m1MZO/q9Qj8sUd6ViI8Yj9M/WakxBO2MnZIDhMhWhiEZtUuv9Mas1ZQtW
         18PvywjvP4ez65zYeCTscArdebzi7L141XNOUy/L6vjI6oJ+7k36nKG3TXrLrGr070MZ
         wBlHC0kb21RnifZEQRfNjkh5pfNQurxH/CVJYeWUCpuTlZe90XcXohQ10zj4dgUhOlU3
         m5iw==
X-Gm-Message-State: AOAM531/lsHaThmFhCdh8mhpfqY0JQl1uQtUpsqSxMMQN0/f62l1UVPF
        nC5OlKS2TkRHNSjJs1H7gN8zdw==
X-Google-Smtp-Source: ABdhPJymR6Ry5JFvKnoD5Xxv9aObqndWEzvNlMxWJ9h6FbBqRTfoX1UHM+GtvIxRLfqeaRTG9SEQMg==
X-Received: by 2002:a05:600c:2246:: with SMTP id a6mr1412838wmm.38.1600206313133;
        Tue, 15 Sep 2020 14:45:13 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id i6sm31643363wra.1.2020.09.15.14.45.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 14:45:12 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, robdclark@gmail.com, amit.pundir@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Add interconnects property for display
Date:   Wed, 16 Sep 2020 00:45:11 +0300
Message-Id: <20200915214511.786-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the interconnect paths that are used by the display (MDSS). This
will allow the driver to request the needed bandwidth and prevent
display flickering.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
This patch depends on:
https://lore.kernel.org/r/20200903133134.17201-6-georgi.djakov@linaro.org/

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 86457d9bc229..f8f09ab3442f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3813,6 +3813,10 @@ mdss: mdss@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mem_noc SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_MDP1 0 &mem_noc SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem", "mdp1-mem";
+
 			iommus = <&apps_smmu 0x880 0x8>,
 			         <&apps_smmu 0xc80 0x8>;
 
