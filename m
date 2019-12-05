Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9961114492
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfLEQPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:12 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:46878 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfLEQPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:12 -0500
Received: by mail-wr1-f54.google.com with SMTP id z7so4243637wrl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WuMwjVSBMzVnDnIlTNQOghVeoKUE2zewSCvpjpDtqVQ=;
        b=RQPUvP7/OIuO2EODLuAaqegFB1J4lvc/a5MJlnGN4c4mFrUwWvJtc4GSfagc23ITJT
         UKWcXVNO4A6+cV+IeiniddDsx/c3RllQABTAW63rRsJUItGm5SE4g4aKbEjkTCTjEHdj
         Ugcd0I+SkATRDARyqnTP3NOSAgFt2pmumQNIOGKniLUA5qzXVXCbumUmX0VWBsHJ6ac1
         EVwZssGAOZhnKaOZD1bGWh27Y+RfLKBcTSyY2fqbXSR9efKI4KuZHw8jUE0ODPFDgJb+
         39DHAFiXjErQxEv4C+AR5cmqGllY/mRdSglcbuZ5shNLkL4taqTTHK0Gl97nnpbUrhPA
         RP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WuMwjVSBMzVnDnIlTNQOghVeoKUE2zewSCvpjpDtqVQ=;
        b=kNbK6Flt9+CxgEDPRuV1S/WKqX2JCIusziqV30y/qRnVZzLYRNBDOVGNgybaoia+hJ
         UPwMY+mAkGti1thz2xvCPS9Fg+GmAZCNMA1PsoGxhe9GqrrKuGI/VfxgJG7wOql15wTs
         EdkBSZD2to5Yu1a7vv7LWtbntvnREBtK6MOY3QqYfSX4LgXODxfRM4mcJUbGMuRDTXa9
         pMmfzYLyLWE4HoIQ4UfZpeLnrQ+S0mXlS8jey05pVoU2MzGBSHFmmX9vwwnY3yjCnfOp
         tmyK4UcicHmEEZrRHdD7Uy5RIPwYrauHaFZSK9xVCoub4jo4Cfa7iSVYQelSyNUMgpjq
         TpmQ==
X-Gm-Message-State: APjAAAVpCPdY9fzzxzjhfYy922wN/AYx52YBW3jIRvG2QOVLLNTRCYBB
        BuAYFz455j5Dc7cz7zVz86c=
X-Google-Smtp-Source: APXvYqxd9QaTlEg3ZZPq2x53uF7h828EWqrI87AATWhjP8TMK8ZC8j0u5QZzUlaXUv/XtWSz3mVrDA==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr11613752wru.6.1575562510422;
        Thu, 05 Dec 2019 08:15:10 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id c80sm289648wme.20.2019.12.05.08.15.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:09 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/6] arm64: defconfig: PHY_QCOM_QMP=y
Date:   Thu,  5 Dec 2019 17:15:02 +0100
Message-Id: <20191205161505.15295-4-p.pisati@gmail.com>
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
index c9a867a..8f713091 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -787,7 +787,7 @@ CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
-CONFIG_PHY_QCOM_QMP=m
+CONFIG_PHY_QCOM_QMP=y
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
-- 
2.7.4

