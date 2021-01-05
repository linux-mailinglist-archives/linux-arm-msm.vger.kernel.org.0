Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E532EAADB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbhAEM3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730315AbhAEM3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:29:08 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310DFC061386
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:36 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id c22so21143303pgg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQ4Xyw+lomP5U3AJy8SgFcN3M+pTYg7eIxIz6Xs0pzE=;
        b=WFHYQQItdpm7MoI00KU+wczGRD8zZMrET2a085XOPoebkPBarWQjwa9b8h39b7wGAx
         ds2UXCzlfij2QnB8aSLP6iWEcq6Z0l2xl50UeKjRTKzNi+5R+IoVR2AVmCUnbDeaGJQp
         anB2xo790mHU5uDPAMPjDDEo/eGNZkAOsNs/nZVkS9MFC0Q46ZpOx1+0YK0VKkRcyjED
         yYaeDJYdglEpWvAh+h3V2zC0UT3BG14V3jucJIF5P0Ab2mfzWhkD67abmXn/liGKaePa
         ylk2O1Mud9l92PIqZTqbdJzRrbQ1o7a/k1w9kvjZQo71l2w3pWoRnl2+AAKfBYzXuQ37
         pGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQ4Xyw+lomP5U3AJy8SgFcN3M+pTYg7eIxIz6Xs0pzE=;
        b=G4jsFWXIQpYH6/+mMEyHH3ozLRTcqJcV5MuWPFYbRxVhMmIE/KyY84sOW4Uhh8SRTY
         4+JQJ0ycHXBAZ4cVwSvPSps58zeCRVc/figOh/adV/vRKRV6iGI8P78wBTqLB4VBx8C/
         LpQ+/zu9lmQqzWG9C3oj4pqxeFApW+x1t5jVj+0cvEYw+k7VHyHm4zfA9A5soMxWnsOV
         1AuLfguld7REWAEPGqgYPWHtMrwFvTgWCeqQN24hdkeo6vCQfsAJQSePMXVh4H3uI923
         G35eG6296CIRHbfQEBljMGHN34ZCzvhDCtJxy7Yka1TLjuU2PWCFLhjylQgpMJYa6Wbd
         wCBA==
X-Gm-Message-State: AOAM532X4tDqcvR1Sl00iDpb2zoWoGcneWf9sSRt/7SOrVtGV9FrQTj2
        2qVUDGFoGSth2M3tfzstUtRK
X-Google-Smtp-Source: ABdhPJy8VUmLbmwmFPq5SJqORw6Qrp2btQhmyblwiBeTf0+vMyMjaenPVfYCVhTg3yMqIqmGwZXtOQ==
X-Received: by 2002:a63:1602:: with SMTP id w2mr36955617pgl.128.1609849655746;
        Tue, 05 Jan 2021 04:27:35 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:35 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 12/18] ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
Date:   Tue,  5 Jan 2021 17:56:43 +0530
Message-Id: <20210105122649.13581-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable QPIC NAND on SDX55-MTP board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 74ea6f425c77..b8d432a4324c 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -29,3 +29,15 @@ &blsp1_uart3 {
 &qpic_bam {
 	status = "ok";
 };
+
+&qpic_nand {
+	status = "ok";
+
+	nand@0 {
+		reg = <0>;
+
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+	};
+};
-- 
2.25.1

