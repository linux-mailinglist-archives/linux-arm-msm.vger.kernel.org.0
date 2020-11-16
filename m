Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3967B2B3EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 09:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgKPIa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 03:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgKPIa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 03:30:26 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2EFC0613CF;
        Mon, 16 Nov 2020 00:30:25 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id q28so2051749pgk.1;
        Mon, 16 Nov 2020 00:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jbxb2khKyk+y1AIZPk4FBSYKN7b5uI6tHI8Glj/80TI=;
        b=j3C6TsHguxy5f0E3VtIWwOguLdPZIgBg8t4CjhQ5USXn5KqLieGRowZEm7QXOLJ59I
         znx1HI8DTuJNyNhmP2yMF39R9LdgSTvwRvemjHhG5sUX0hzUqgoAt+ug5VH+1kGEbjtB
         vGkp7FzJZTLeOfwsa3KJsaYvF8dwUvLK9b1yj67ma85xraIWscXzS+Bwl9YtVovWrfbj
         zkqzGpWdFqNs3mqsPHDWNaFsHJZta9g1FS2iydseCbpsj+cDOGIcRwC7MVSFGwdCMB0e
         41EXO2S5Q5bzu0FbbTiChgyRGPvhq6/ZL8LvMND4CYAsV+7lG5sF0GjXAfDCdltpIM5G
         EvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jbxb2khKyk+y1AIZPk4FBSYKN7b5uI6tHI8Glj/80TI=;
        b=PYyFvMt6YukC4+2JSS6Atjcl4G8dCq2+gMbfWYz425PakP7mFWV50/vTnSwirSn6Pe
         6hnlJBnztkljE2eAV/YHo7Y+TrJbwqLPKAlYCdzXg4D9P34GVH4YbMluxAUHF3RrFaRY
         AYoA3hVTIvnmzItDL00ymmKSJhskgvPe1VwZDVe0QiaKvceRa/x332zHpRoca87lKCHu
         k7GmuGKPR3DwKWjpTqfN+GSgnYg1TR5ib+Lc005BJEcI3o5eUa8Bp3kqyAOZfEzwkP6N
         LMdKAnMqZnvobt6XRGWTVlj6I9wS/HW7KeXs3JADTAGSe11fdnrcIPtLJiz033mUIhXu
         ymHQ==
X-Gm-Message-State: AOAM533X2rsjkaiSRpJDGj8Dbz8LPqyfG6YaBE/mzh1iFrZ3PD4DgB0/
        jTk9dWIcr0kJg2T80r4Ni93Bt4cYQyhYYA==
X-Google-Smtp-Source: ABdhPJxY/3Z8cTJir3PLkDclrLS7OiU3jKitrjkL9BdBne7cOV2nK+cNaz1FVUP18aqclkLPkANHww==
X-Received: by 2002:a17:90a:609:: with SMTP id j9mr14754476pjj.121.1605515425129;
        Mon, 16 Nov 2020 00:30:25 -0800 (PST)
Received: from localhost.localdomain (59-125-183-19.HINET-IP.hinet.net. [59.125.183.19])
        by smtp.gmail.com with ESMTPSA id ce19sm19670079pjb.53.2020.11.16.00.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 00:30:24 -0800 (PST)
From:   Terry Hsiao <a804335@gmail.com>
X-Google-Original-From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dianders@chromium.org, terry_hsiao@compal.corp-partner.google.com,
        danny_kuo@compal.corp-partner.google.com,
        jasper_lee@compal.corp-partner.google.com,
        van_chen@compal.corp-partner.google.com
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: add "pen-insert" label for trogdor
Date:   Mon, 16 Nov 2020 16:30:14 +0800
Message-Id: <20201116083014.547-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a label to the "pen-insert" node in sc7180-trogdor.dtsi

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 781e61ad75a61..9de95493ed902 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -201,7 +201,7 @@ gpio_keys: gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pen_pdct_l>;
 
-		pen-insert {
+		pen_insert: pen-insert {
 			label = "Pen Insert";
 
 			/* Insert = low, eject = high */
-- 
2.26.2

