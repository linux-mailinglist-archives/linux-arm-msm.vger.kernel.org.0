Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F20420A67C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 22:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407077AbgFYUOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 16:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405370AbgFYUOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 16:14:51 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE68C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 13:14:51 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id m2so3841432pjv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwiovEhB7CAH1O8yfDM92FVkjjdutFaUMailucDFpaY=;
        b=mULvLsLXB9T++eTvRcP6eutLh1Lp2WQuaMPhWZFBbv5WjoxH3CxTo2/ZGxYV9+HAQg
         Ei2SJwymRinQcnTD5S5zmtAnZ/57nNOpEIADbRVhvdewYAvhlPG64ATi/EonqpqeZ4bK
         CI9cGy2nhHJh1J9NYcU0K3rGgp9lwce90CnIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwiovEhB7CAH1O8yfDM92FVkjjdutFaUMailucDFpaY=;
        b=b3wAvlm1oLBnIikYYGvr5OPI/H9R0XzGsyPYXyFJDXTB3GI06yp0yW1O8ZtdigJR2Q
         6Pg+AY/cMt6lP5AxA01vyVEIkn3pC4eqhsAwtAiRgi72oDMSlqhldtpgWKBA5TOwHe3E
         hxz2qCgvTK5ngv33rUUNCpcF18olkiiOcBafwv+dcH9zfsNknGwNWkTk3scJmHQHTO9K
         Wc8j42pFpWPOfmPKGcdesjoJr220SBUgA1dWcbON4z0ZHfdWhTY/ZjqjJ+lIebZzvWge
         3WUvKpqCSDbzv9NBzkHCm8+w5m5R1moldCtEpl94FoDXvYrDZBYz1NFbBelbJQ9reuvd
         /iIg==
X-Gm-Message-State: AOAM533Jc8rF7K0/LdP8sqAtFVk8krl+NrRVD1kERX6iUNKlXpGmdw+e
        y3Co+MgYRhUk3FOzBoOe+dt1uA==
X-Google-Smtp-Source: ABdhPJzoxfKLASLthYbW6n/lROcyoV7GspKguRh2ivt+5Ys1KCi9I/vVwGulO0AJzCEQ7twOEEmR2A==
X-Received: by 2002:a17:90b:1497:: with SMTP id js23mr5328080pjb.30.1593116090737;
        Thu, 25 Jun 2020 13:14:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id t6sm2824521pfd.140.2020.06.25.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 13:14:50 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Evan Green <evgreen@chromium.org>,
        Rakesh Pillai <pillair@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Fix WiFi supplies on sc7180-idp
Date:   Thu, 25 Jun 2020 13:11:44 -0700
Message-Id: <20200625131130.1.I32960cd32bb84d6db4127c906d7e371fa29caebf@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WiFi supplies that were added recently can't have done anything
useful because they were missing the "-supply" suffix.  Booting
without the "-supply" suffix would give these messages:

ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-0.8-cx-mx not found, using dummy regulator
ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-1.8-xo not found, using dummy regulator
ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-1.3-rfa not found, using dummy regulator
ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-3.3-ch0 not found, using dummy regulator

Let's add the "-supply" suffix.

I don't have an IDP setup but I have a similar board.  Testing on IDP
would, of course, be appreciated.
END

Fixes: 1e7594a38f37 ("arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 39dbfc89689e..472f7f41cc93 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -391,10 +391,10 @@ video-firmware {
 
 &wifi {
 	status = "okay";
-	vdd-0.8-cx-mx = <&vreg_l9a_0p6>;
-	vdd-1.8-xo = <&vreg_l1c_1p8>;
-	vdd-1.3-rfa = <&vreg_l2c_1p3>;
-	vdd-3.3-ch0 = <&vreg_l10c_3p3>;
+	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
+	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
 	wifi-firmware {
 		iommus = <&apps_smmu 0xc2 0x1>;
 	};
-- 
2.27.0.212.ge8ba1cc988-goog

