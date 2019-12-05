Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D861114493
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbfLEQPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:13 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34630 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbfLEQPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:13 -0500
Received: by mail-wr1-f48.google.com with SMTP id t2so4353151wrr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vb9iUzm5L50itQZMrHU7e+RHACgQh9iXw/KRJBG40FU=;
        b=BEkLiPijcG6/D2TFray9us6+y/JdP72xgxijZy5ieS54DbjXBW2QOAH6avRySSSAu9
         Sskuu1euff+Lv7zwyE7/WqHjlL9TXjpSwiNEVDCX2qNB5H3KcMTo9SPIoGA49zd32pkF
         D85koJXChERUi4UqOGVxkKj6Gp++1O9lAlZbh/5QKuAlpzpJnPqFqR8MYyVNredqah3I
         d3n1URkOGZcuhCHcATXjqTnCSsJvPHzqhe+YbgzfNs+cr8Hk8tWr7b8L3cqTNrCDWUnN
         Nyaf0t996uoORT5K4MDDyHoL1hJYKMIvd4ZMstNkSTQT5Sl1xDiF44j6Q6Ti+pcpzaAH
         BFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vb9iUzm5L50itQZMrHU7e+RHACgQh9iXw/KRJBG40FU=;
        b=RjKbbQtNTaerH+ZrAge7WqV0C9L+1Mx1aKQPaiDyUT6Ep4IWQSqevnUKIfp6S8kXn1
         wCQK0qiEZnCVVFY+6XGg8cx/0Y4QnSmy1jEv/BNlelKqJtGwoPXjeeNb52MXd3aX+17q
         pGGM7vQZs8YqJOhR25Wo9YzosjTWuQx28EcELeArPP5R/uYXGmIljOi/pVV7YXri7Wnq
         tmogEVx70YEpBWUeNWeSKDVia4o6Xziy0yIhKWpxXJrYyZRugfHAejYsHgQSg2HRLHVU
         6/YXpZlvVS13bftcJU12WkKTorlgnkUAecOAMih/Z0jGeG1XpOP6F9ansy/GEpSO2dX0
         5gHA==
X-Gm-Message-State: APjAAAV8qpp5MrXJt0VvitP8mSSMzyw5QQT8xEM+w0+l/taZFhMstOc3
        fQJef3vGIxm+J13595tBPfA=
X-Google-Smtp-Source: APXvYqy9tp0xrpamh5Bix4JOTobX/pSa6E7BHZKyvc3e3jZK0ncourFNrdkjyGalFtCMTz1CF5cN8g==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr11736688wrr.74.1575562511481;
        Thu, 05 Dec 2019 08:15:11 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id t12sm12958245wrs.96.2019.12.05.08.15.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:10 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/6] arm64: defconfig: PHY_QCOM_QUSB2=y
Date:   Thu,  5 Dec 2019 17:15:03 +0100
Message-Id: <20191205161505.15295-5-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-1-p.pisati@gmail.com>
References: <20191205161505.15295-1-p.pisati@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8f713091..560cb54 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -788,7 +788,7 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_QCOM_QMP=y
-CONFIG_PHY_QCOM_QUSB2=m
+CONFIG_PHY_QCOM_QUSB2=y
 CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
-- 
2.7.4

