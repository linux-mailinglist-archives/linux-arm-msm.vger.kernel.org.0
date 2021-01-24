Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67AC301C75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 15:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbhAXN6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbhAXN5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:37 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE08C061788;
        Sun, 24 Jan 2021 05:56:46 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id hs11so14237451ejc.1;
        Sun, 24 Jan 2021 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcVySy0XdLlShiYBkJyH9r+svRLETjB/758IrdVCUQ0=;
        b=sRvCQMEzzE/rcPEwO9JxEjc4blKuTSKWw62oRdYu7PebCMyviACPhLNtz8OpgaXPoW
         asTKq8uqS9AzeM+oMgr3dLKiOvSLqq8lECZglvcxOpieCehifS7iScXB94QYMYdPlGFg
         K3sjb13jztf/kFIMuAB3BLw1ZS8CBdffWXI5LNdC321XOo+Ngij6jdd4d7sQ6Gf8ANZH
         dF45R4aLfSvghawX2cyNoSnSHqN7Y/NyQ6YxiHykQhbj5bfakpdtErK/Xte6k0qzMyzV
         IvfT7JehgK5hDL8f6VqgkbE9KBvnQvNmdafhw6zicMFnZnNOk6kSButmUNft0J1FwWDt
         uRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcVySy0XdLlShiYBkJyH9r+svRLETjB/758IrdVCUQ0=;
        b=nnBLw90BezEufRl3FTgEPmBk0tjtZoWjXYR2+kzo4H41MMcO6VxaYAVKWPrzYSGZDF
         qgPi0iIe4A34ut3W9SQ7fR20xE3/pGykS3lFOkjYQfPoj+SGgIL5oyQd3bR6tp10NeSW
         eeET5eXt3rTXcMo72oKcJAl2zNwWEsqnbTP7Rfi51yEHE8XLF0G57GMe8/AJQ78I4Q2s
         EJRu+egdco5qEqd9/Iogicfka7BcMICTuyGTkHGACv0+rhGNagHDQQQgRkl3KLk1SexZ
         iJTPml/xXD4bD62R3sY2MolWNmMtuWWS/48UbEz+9HchO5HLEExuEpG+JapGaao0lm6R
         4m1Q==
X-Gm-Message-State: AOAM533CReovtol2C7/PBqIV6pyBf4XB+bor2jz7aIy2Oli+R7ukljQK
        crwC9p2JAXg2jRePIt6BkOE=
X-Google-Smtp-Source: ABdhPJzb3Ro1ID4ggk5LvOAS1cwIQ+TLrtPFSB9pPSml9g5pVyZb85FdzyzChKrnD2J76KSr1qn1dw==
X-Received: by 2002:a17:906:dfd3:: with SMTP id jt19mr335281ejc.64.1611496605019;
        Sun, 24 Jan 2021 05:56:45 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id j27sm2060338ejb.102.2021.01.24.05.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jan 2021 05:56:44 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 2/4] ARM: dts: qcom: msm8974-klte: add support for GPU
Date:   Sun, 24 Jan 2021 15:56:08 +0200
Message-Id: <20210124135610.1779295-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124135610.1779295-1-iskren.chernev@gmail.com>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Enable adreno and opp_table dt nodes.

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index f23d1002b8f8b..5a7ac4a31031f 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -697,6 +697,14 @@ fuelgauge@36 {
 			pinctrl-0 = <&fuelgauge_pin>;
 		};
 	};
+
+	opp_table {
+		status = "ok";
+	};
+
+	adreno@fdb00000 {
+		status = "ok";
+	};
 };
 
 &spmi_bus {
-- 
2.30.0

