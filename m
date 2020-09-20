Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A76271511
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgITOtb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:49:30 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D83C061755;
        Sun, 20 Sep 2020 07:49:30 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so10157298wrs.5;
        Sun, 20 Sep 2020 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyigOv+0We+x79PCbFPnfiw4bdpY9tY3JDxDVTtrA7M=;
        b=Vdjfsc/7P80TGCgg/RLuJ1h8OC850QmJJE059kmeoGiEDX/L7SyuNa/GiPZrH48UA+
         vqLEQfW5UvQ7b8hM2LcguAEMeu1gVleuBARvPZBBpVAzUgECPiiv2+TOjzMy/3Lf6PzN
         UMIXlIJK0HRA1JCrmArGqI+xRIsg6Jzs40yH6Y4KShfKfIBhQt5jv1syji3u+FMrQjTr
         4YhNOSIZTqi2RRjK2lI2tOqZnuZkQ0XUaow8/K/pEKnQsZ9+gCut3OsBl9QZ0wRgyzmB
         iMqocQ/r5ULo7E90bUittsIvfxNGyWx/iti0IqPG+6SxCGBzTtJTcqIfV0k2/5B7eN5t
         oEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyigOv+0We+x79PCbFPnfiw4bdpY9tY3JDxDVTtrA7M=;
        b=Mv+QLacCF7639SlLUevvMkFBrKCnv2RSPN5UBz+An1EeC+wtoc+1TmqBkUeCl9i+B2
         5aqXtEiph13upXoj/yHlvN8laHRmIOEgorlO1vgj67TqcIbnu7+79LdHVjApqL9+F20s
         qTiKGgYpWLN+KpEXozgQBWWnX6ICwunMT47qVRQxwiVZsiXQbIQVEf56Dti7WhX40eCu
         i9Fc03inEpB92dXSS89T1O1yCC11cmqvivJsOONK7opJGz/cbLzCchOnBNRVo1EUupkW
         eCmRzLkbtsFNFa+RGBUix78Wj75CH2sfsuPF1jzcU/h+6cVIW7l0h7WbkObGcaN04BRk
         9mIw==
X-Gm-Message-State: AOAM5331+sPXDTxJ7VduSsRTZimkqdm+dlxhsDpCeVYwb83vN/YQzm28
        GZfWUM3e/lb5mQ5ACZAnbZ8=
X-Google-Smtp-Source: ABdhPJwMkFXwfxbpY0hLaNoL95BI4MVfOnZmgvAPwtGcLnbypJut5bwjRfFRadALSYWoku1pHvi+wA==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr43850667wrs.388.1600613369348;
        Sun, 20 Sep 2020 07:49:29 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id v17sm17420215wrc.23.2020.09.20.07.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:49:28 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 1/7] ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
Date:   Sun, 20 Sep 2020 17:48:53 +0300
Message-Id: <20200920144859.813032-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

commit cd13c72c1853f219e1f ("ARM: dts: qcom: msm8974-klte: Add max77826
pmic node") and commit 8bf7a360a92cc6b2aebc8 ("ARM: dts: qcom:
msm8974-klte: Add sdhci1 node") both added pinctrl node. This patch merges
the two nodes.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index d4dc98214225a..9520c6e7910ce 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -258,6 +258,16 @@ cmd-data {
 				bias-pull-up;
 			};
 		};
+
+		i2c6_pins: i2c6 {
+			mux {
+				pins = "gpio29", "gpio30";
+				function = "blsp_i2c6";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
@@ -298,18 +308,6 @@ phy@a {
 		};
 	};
 
-	pinctrl@fd510000 {
-		i2c6_pins: i2c6 {
-			mux {
-				pins = "gpio29", "gpio30";
-				function = "blsp_i2c6";
-
-				drive-strength = <2>;
-				bias-disable;
-			};
-		};
-	};
-
 	i2c@f9928000 {
 		status = "okay";
 
-- 
2.28.0

