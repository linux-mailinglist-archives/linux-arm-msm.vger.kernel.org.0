Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF848876D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jan 2022 03:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbiAICrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jan 2022 21:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbiAICrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jan 2022 21:47:06 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B029C06173F
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jan 2022 18:47:06 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 2-20020a05600c02c200b003470f96e778so4981009wmn.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jan 2022 18:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5MT7rEoiiCVz2gFm3EQaB2V5VAMjaCUk3cu8vjhwBg=;
        b=s4QDAkrsbWWo6Op4Bso41dYSVGBQ6LLu61q/iu0h/7q4ZEr5wvuSBdqC7UlxMYWe9F
         LsuuEAgyokh8rIVuXJyLR0/cG8+EAOkfGzxMyBgPyUFjuT04JiL7JqAKLmaGbvMBzCEs
         87sYK+95NA5L5+pEhcui2NeiAGQc5iRfkDyMzFDU7wOgZQeg4t3XZgmjED2RdzevL8+j
         efZ8f/hmlEggdblxpC3VNOB22/Ui6DHapKJb6wk51sthiYCDRILqs3YaeT3KT29pNQWt
         lTJO+ZBddOy4FLA4F1M2BrZeqQ1jqx7Qu/KkH8v+snagVxEov3NqdB9I7GAqcaGskT1r
         iJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5MT7rEoiiCVz2gFm3EQaB2V5VAMjaCUk3cu8vjhwBg=;
        b=ChF+K//FQ3EgFutWXplEE5qxcOh6gDrT0yn137an6bN4tnZm6VK9kTH7ayynkVyImz
         9LSW9QRZPO1yw4QvwdQUn9lAwCXLy+SxydDXSBrzlp6q2nLLaO4RBbwrZX8CWr0znGTd
         VQJibMzLHaE5boNky92R1lLQ8AeHlGAxCSWjPbhXpfIEAAiyVHRUY1KvCfNFtOqRfdDh
         6t1bNWP8cQtBuX/b1n91yJZJBxrN8hGvZV3f+xY9eKni2r2C2tBcKRfmbSfLfl3fdN8i
         xoDFr4N4X9fuG/C6YMcXCoWxbstPF1iK83PMJLG7BDCDolMg5kpiGReFq8yvKH/yfa/g
         5sEw==
X-Gm-Message-State: AOAM533iuMJnl/yQ8j1L+R86+7Sicjs6AIMLBqen1y1lS6FlqVJZiZPu
        SglWvyimnmw3YHPPHggpXIUlm2/XMieXnA==
X-Google-Smtp-Source: ABdhPJySua1hDFonprSsYul58orghyPVu/tAE9uq2rOtsCJ4iSxANWWAFHGV03Benjfn+g3o310Big==
X-Received: by 2002:a05:600c:5027:: with SMTP id n39mr16622051wmr.148.1641696424723;
        Sat, 08 Jan 2022 18:47:04 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 3/8] arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
Date:   Sun,  9 Jan 2022 02:49:05 +0000
Message-Id: <20220109024910.2041763-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dts entry vdda-supply connects to a common vdda-phy-supply rail. Rename
to reflect what the functionality is.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faaa..c4db88dbf8766 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1115,7 +1115,7 @@ &cci {
 };
 
 &camss {
-	vdda-supply = <&vreg_l1a_0p875>;
+	vdda-phy-supply = <&vreg_l1a_0p875>;
 
 	status = "ok";
 
-- 
2.33.0

