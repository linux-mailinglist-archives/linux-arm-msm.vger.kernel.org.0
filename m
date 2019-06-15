Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1BB47141
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 18:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfFOQ3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jun 2019 12:29:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42331 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfFOQ3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jun 2019 12:29:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so5551333wrl.9;
        Sat, 15 Jun 2019 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xbzPPti/d7x+WaN+ndNWClJ+kz638DCPbc0fo6KZsxY=;
        b=ieIDwSTE7HAtFhzhbgj5P/HFRPZEIOuO8UWSkVQTqz8dqtGwrSTeM3Cg9+iEftZa3d
         2p6TE36oS951Zcr5TMHXCxTlcpVKKP2i2vxphtNzUExZ3vPQNOzQ9URg0n9Bh/mOyOE0
         eFHvyzQcM5aA/lzRMYs1D8xXFPGsKtLXwGUHTg/BQ8Zf8AYN8gQCy5DQaoV0kysM/F0W
         Pj1BqSQxd3WMA3K0gRtqYhk3hMlJxIS9sxBWG3F70AkC6jweErdA/5KbBB3xJMbC5aXt
         F3mTXmmIeZj/X9g8FdvIlxnRS9oXBDAZ24UKlabYwAPZtgbjpNt7DP+d1iYkkGTdupyP
         GRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xbzPPti/d7x+WaN+ndNWClJ+kz638DCPbc0fo6KZsxY=;
        b=cwOt7QTpqzPnDF60TClWny+0DA6F3HtvuLrzbmb4jNl3R2oltM0Rsxb1l3puqUQwQB
         gINI4X/8vgDOHMOYX6pEIn5yRb09LbQB931E1bDHBNtRn7dplNtYsPoTvFmcWiho1aw4
         RY4oPqM4BHcXsFOq77mjueiGhpMDO8eNkU+kiIdqq0bdaquDn2Q1JnD22TeSlAcuqlVH
         klanI6gXAoaeJAHNWxpy3/dindUFXxqgac2HTfv/CiqL0rUHNRrZ//zOREWdX+fL2O03
         IiDHT+2gkjzMz2IVK+JHfHJxxpEcUyt5QS3xTwb76ktAgdoS219vLXlCivcqV7feWsxr
         lnXA==
X-Gm-Message-State: APjAAAWdEBXk3VbYVce85QGP3md+Rms5jbV+6tJ7HBaWLrrj0aTAkzaJ
        CpUOIuXe0kkwHW9899kex35CJBrEjb4=
X-Google-Smtp-Source: APXvYqy6frYI/6mx+Dk4Co35nGqa5ZlXs/X4iQfnMoOiujw6z3Bucud4rw6PC+VvLVuv0WlBY8iJXA==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr12181927wrp.287.1560616159963;
        Sat, 15 Jun 2019 09:29:19 -0700 (PDT)
Received: from debian64.daheim (pD9E2960F.dip0.t-ipconnect.de. [217.226.150.15])
        by smtp.gmail.com with ESMTPSA id l18sm5643055wrv.38.2019.06.15.09.29.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 09:29:19 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hcBYM-0007aO-6H; Sat, 15 Jun 2019 18:29:18 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-kernel@vger.kernel.org, Pavel Kubelun <be.dissent@gmail.com>
Subject: [PATCH v2] ARM: dts: qcom: ipq4019: fix high resolution timer
Date:   Sat, 15 Jun 2019 18:29:18 +0200
Message-Id: <20190615162918.29120-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhishek Sahu <absahu@codeaurora.org>


Cherry-picked from CAF QSDK repo with Change-Id
I7c00b3c74d97c2a30ac9f05e18b511a0550fd459.

Original commit message:
The kernel is failing in switching the timer for high resolution
mode and clock source operates in 10ms resolution. The always-on
property needs to be given for timer device tree node to make
clock source working in 1ns resolution.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

v2: fixed subject [Abhishek Sahu is bouncing]
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index bbcb7db810f7..0e3e79442c50 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -169,6 +169,7 @@
 			     <1 4 0xf08>,
 			     <1 1 0xf08>;
 		clock-frequency = <48000000>;
+		always-on;
 	};
 
 	soc {
-- 
2.20.1

