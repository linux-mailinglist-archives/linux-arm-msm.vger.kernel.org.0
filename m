Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3D42A299D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 12:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgKBLfo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 06:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgKBLfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 06:35:40 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569FCC061A47
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 03:35:40 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id v4so14056110edi.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5ZRnhbjvF5vhabbPJRjSHqRgQjYY8yji4DiDRURWAfY=;
        b=G1QX6xet8AfPZqPVhIGOAc5PPJ/F6vo77jLJYQfxWENLGmrR5SkUBtwj5hwE9saITE
         Rse6H0V0c1RJ1AjWMQwaIX3C8ZFXp3YUd5bz/OcrtxtlS3AhECfIhQNlsO2iTfn+HlBm
         s77h81JFh3EQRKHT7hLQJOfqb9TQQBBwPUTb3p9L7AXhxzHJFmL+DRNmF5OaWG3+XDrv
         LmrwUSUfSZtsGroWpYTHadzjUv4Z+J0RYOueB+aW+UheJFWlJoH0rA4KvYdLFVyfsCnB
         Afmb6WZKH0FzY1fiNt31KbbQGr/aKdbuhRw7h38iWRR9buchM3uFVjpFNks/QNUY9fwy
         HzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5ZRnhbjvF5vhabbPJRjSHqRgQjYY8yji4DiDRURWAfY=;
        b=rjw+m+qlhs5xjSXPrgP04d+jS7Rb6jp8bkkDlK/JTYpVdB1owID7EHSgDwTXRl74rh
         Y7zPhrNIcE0AWfh1OPlHIsUvWuAu7iu9ZKe2/yo2fUyvN0QV8Yvkwe4tgTM8VquAv6JM
         EdkwveW1aLLApnE5QYo0Nx0AGNeHfGl7nOHcY9kax0ehefmcCkNwiqWCkNbwrEsd9LLE
         LijZXzHuzRd435V3ar40jAg1v0i4Bcoqqaw8YON0augvRRkJwzmwrSxtez65QWBfB4gL
         P2DuAMqNKdOpc+XDWIr3fy/yTUiEJ1z1/cEFG7z6MXb+0rcXqSa7IseL6Pf7lGI1Nyly
         Kh0w==
X-Gm-Message-State: AOAM5303s08PHsu7JMueBasufywJDi6XlkHhSUtW9TJdCxZ0T0qnOwyl
        YngiqeO2eAxUpgoNGmFeYqpJzA==
X-Google-Smtp-Source: ABdhPJzeFdJG4XY7UQ6yHGasew1646U4JPaHzki24LIL7RrLhjFgFTPPb0ZBvGZ5Qz8Y8pVNkYavrg==
X-Received: by 2002:a05:6402:142c:: with SMTP id c12mr16629660edx.41.1604316939104;
        Mon, 02 Nov 2020 03:35:39 -0800 (PST)
Received: from localhost.localdomain (hst-221-54.medicom.bg. [84.238.221.54])
        by smtp.gmail.com with ESMTPSA id g20sm9424234ejz.88.2020.11.02.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:35:38 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 15/17] arm64: dts: sdm845: Add interconnect properties for Venus
Date:   Mon,  2 Nov 2020 13:35:29 +0200
Message-Id: <20201102113529.16152-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate Venus DT node with interconnect properties.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 40e8c11f23ab..aca7e9c954e0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3661,6 +3661,9 @@
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
+			interconnects = <&mmss_noc MASTER_VIDEO_P0 0 &mem_noc SLAVE_EBI1 0>,
+					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem", "cpu-cfg";
 
 			video-core0 {
 				compatible = "venus-decoder";
-- 
2.17.1

