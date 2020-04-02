Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9B519CCF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 00:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389171AbgDBWha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 18:37:30 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37798 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgDBWha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 18:37:30 -0400
Received: by mail-pg1-f193.google.com with SMTP id r4so1061779pgg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 15:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bu6IDjQbNb2NPz1Fm5EK/pgWdtaCjhT3hwfgjnIqyNY=;
        b=kq9U00PG054owKDvVaCBkGyEcbZK4fArjyVqX6i9Dka3lTJjzydu4zBGMAugaMRl3b
         FvkvqBTKIWQPnkMAVjxRLCZ8nbCPeCF4c//wyuBQZZ7NRDiVD4xd2MMKX9c6mS/3aJbX
         G3NkfpuyzepUDi0Hv3zN/bQBMAWBNRf9WAVWSP3qXeK2nX17ee6XpVJKu5kSj8iEPKuI
         5pRxFCLDsPwbbnrEJaFJpH0EJipBJbxupqUBaNX/yZljp0HhojAckxHmNdZxE7fjfR+D
         cgsizG4kPi+AXRbJGdA8B4y5E6Kc50Ge0BiSS8BBC5ZyGSr3QLFgjqkb/EL2PhWl7Bd2
         UEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bu6IDjQbNb2NPz1Fm5EK/pgWdtaCjhT3hwfgjnIqyNY=;
        b=kKftXMrhfvV6oeugonuNo9T8ylR+0lAVawxo26zc/iHHhZ14OgIWVmUaWcNmlZbvoe
         Mcl/N94adCC5hYAh3VCA3LIPWwY5MWHIKg6i99ZWP4bUm4x6Zdm8EJOoKDMBi1neeobh
         gKSAM9Ciyl21vt3waEXAmrttfx72vsrjnwgJauBVWAu76LIhatYcZboA2ILlg1xtEGXg
         q/mk5rwBavKfthmPJwVq4n3tTrVRCBNQpSfAD6VE0OzYFUDjz8KPqQxBTZjbstPCLljF
         RrtGFKj8xCyKRCa0nCOuF4Vhsyzfy+t9tlXxHyKI1quMVPg4vd7HZOKfcg+Vr8YD2Pl9
         QMyA==
X-Gm-Message-State: AGi0PuY8PnON3I49/EMPQ8F4COwdjlAxevpHuhHHdWLlvwO377m0IwfB
        rFaEW/YRa6euKyUjoO4Fw6Tthw==
X-Google-Smtp-Source: APiQypI2A0RyjcwbJvCMnhbdGWU1MNRnX/WFlq+gU61bs4LuIC6IOuf54jlv9QFrAhjxZuBS1mpayw==
X-Received: by 2002:aa7:8ec9:: with SMTP id b9mr5185648pfr.118.1585867048645;
        Thu, 02 Apr 2020 15:37:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 71sm4508709pfv.8.2020.04.02.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 15:37:28 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
Date:   Thu,  2 Apr 2020 22:37:23 +0000
Message-Id: <20200402223723.7150-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
PHY support"), the change was made to add "qcom,qusb2-v2-phy"
as a generic compat string. However the change also removed
the "qcom,sdm845-qusb2-phy" compat string, which is documented
in the binding and already in use.

This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
which allows the driver to continue to work with existing dts
entries such as found on the db845c.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
Reported-by: YongQin Liu <yongqin.liu@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3708d43b7508..ab7941ce5d3a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -815,6 +815,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		.compatible	= "qcom,sdm845-qusb2-phy",
+		.data		= &qusb2_v2_phy_cfg,
 	}, {
 		.compatible	= "qcom,qusb2-v2-phy",
 		.data		= &qusb2_v2_phy_cfg,
-- 
2.17.1

