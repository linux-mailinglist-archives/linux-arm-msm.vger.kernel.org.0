Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352883FB8C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 17:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbhH3PIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 11:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237218AbhH3PIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 11:08:01 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D35C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 08:07:08 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id oa17so9708277pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f7E36/4NEmmdeFXZk05Zb6lbS92pEe7/zhYEBPZmpVY=;
        b=hfW9wMcdYKy98q+B6cb14b+j+zZn9ud9xmGIDnQMrGOeGxAjqGjnp8ef0QZcvZqKoI
         PddPnU7VunrapWeSpplCxz9Gp6Bfd5jpbaQnvehjuQmIXsYuSlOVAp9uJHZ7QSw/5Er+
         ZmbiHX0akipuIjeEsvjQ8GbuggKhZUKzkpmeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f7E36/4NEmmdeFXZk05Zb6lbS92pEe7/zhYEBPZmpVY=;
        b=iIMkMhBjBC6K17m/cGGhd5KMkPtfeXECm1Th69TbFsyeuFbj6bCP1p1voU3XV0oghs
         aHmXjVDEFdpbMnSRA0N1NDe7Se1Vzwyu4BqHdep/fENMh8uPk28A1rEf3TXDEpNlye70
         pCRK5uzuVS9E2Jt+WLCCaHmKXWtEIVlicQsbLbt0GeRv4beQFwJ7L5h5bDXApCVmBwYP
         oWwZHtZIGVJn+ZqDlURFpC8YnEoenuCKHa/G9gGxs4HifxdHD45t5HseHCbLOxCdP0EG
         i5PEMT9dLpX6N2z4SJPIK+y38vq3Tkgbuq9XLPki4rvOSTDRZygTOCRJsaTtaKA9Rofc
         uNzQ==
X-Gm-Message-State: AOAM530jpOmv6qiCHZEK/XH6o/S41o6CK9RT40irVeffFrWk+swvLGua
        bQOx1mPM9C+j5OI26trFd7kreA==
X-Google-Smtp-Source: ABdhPJwY2E1nxu0XIhzRBDbGZh3rxjkEkKjQFVgVhAaC8KfQJH+XJZSuOZFLHRtdD+Fi14LOe0mcaw==
X-Received: by 2002:a17:902:e891:b029:12d:6824:9d28 with SMTP id w17-20020a170902e891b029012d68249d28mr123373plg.23.1630336027860;
        Mon, 30 Aug 2021 08:07:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b658:7113:70a2:ea])
        by smtp.gmail.com with ESMTPSA id t10sm20285025pji.30.2021.08.30.08.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 08:07:07 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     bjorn.andersson@linaro.org
Cc:     sbhanu@codeaurora.org, swboyd@chromium.org, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280: Move the SD CD GPIO pin out of the dtsi file
Date:   Mon, 30 Aug 2021 08:06:37 -0700
Message-Id: <20210830080621.1.Ia15d97bc4a81f2916290e23a8fde9cbc66186159@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's nothing magical about GPIO91 and boards could use different
GPIOs for card detect. Move the pin out of the dtsi file and to the
only existing board file.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 371a2a9dcf7a..ed9f9283b71d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -336,6 +336,7 @@ data {
 	};
 
 	sd-cd {
+		pins = "gpio91";
 		bias-pull-up;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d086178..99e946a33fbb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1573,10 +1573,6 @@ cmd {
 				data {
 					pins = "sdc2_data";
 				};
-
-				sd-cd {
-					pins = "gpio91";
-				};
 			};
 
 			sdc2_off: sdc2-off {
-- 
2.33.0.259.gc128427fd7-goog

