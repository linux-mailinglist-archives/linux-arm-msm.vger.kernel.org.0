Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265382C3023
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 19:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbgKXSoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 13:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390909AbgKXSoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 13:44:19 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0E1C061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 10:44:18 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id z24so6318934oto.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 10:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z50zrczk/HXT3wMf0LhtTgKjujoLdfzrjXHxy6jadvU=;
        b=BUsry8dXUyq6qvH12+S8uwdIvLqe47yNySt4CQBM/hhHB87Oyc9x7pntTUnLGORUqr
         NNSsIGUhtiOxgn4o6pQqsfQpM05xC7XvoCOhW4QbJb6IVm8ZPHeh2mepfyScK8CS3Baw
         dv/+IPESAIh2X71+UL5+oSEdZFxaBMrDtH6hs6W+HOCygkxEdoThZJ7LFg7+ucKkC6Dh
         7bry1X8B275f9C/S1Y/7qrRnGJrU2JL/K6eopL6Qu9PXt+lPuiyoSoeeZq6cpTdlF081
         P4T4aFBfXxbb4IXGoCzk6/lUSsYHs79NtnJ3N41yDXmW0k4lFCMedgofKqhd9ToLT0h+
         JSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z50zrczk/HXT3wMf0LhtTgKjujoLdfzrjXHxy6jadvU=;
        b=MrzpEzysNKOGQ3Nsp3ynRqsybeGY6JcxJFkOKs8zakncmXleScijRwLWkWCoPwLhhE
         VF8h5EexrNIEpuchIQAmVxd5pjwazYn/1arwmAIjYSHZztyM4TUtwKaHdE2jRfQw2TSP
         lHvYGp0RvbzGXs2pw82xUrdrbNg2fze+t3DUWptGqY8UvSfv9XwIyhbPIagjS9iVlI9n
         STwjUFn/0JbyMFwo4/mTwWdkrLDMLjNYpAlM0Ota8iWP+HR9KPfXnscn1L4bdRyTqpF3
         eLxW9iT0u2Pgiumx8PJ10qbd7U8Zwg0Tk2QDYxZiqhQpspwkHKfNsvlvJyxcruvYMRhx
         wNsA==
X-Gm-Message-State: AOAM530iMc++FUSFkyvojVSQzMnsH98jNFIFJ5fH6DiJwrm9cBpAi5c0
        6IlEx+RKNQK9Dfg1EjpEivvepAy3HbAvsg==
X-Google-Smtp-Source: ABdhPJzuUNL2hALito6AJog35PnicqoPfOTu0soQCA+H2qKVW4zlwU8MRsrtI1pCWL1vVO8keKN8nQ==
X-Received: by 2002:a9d:6641:: with SMTP id q1mr4553514otm.190.1606243456575;
        Tue, 24 Nov 2020 10:44:16 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t25sm9024376otj.13.2020.11.24.10.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 10:44:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Re-enable apps_smmu
Date:   Tue, 24 Nov 2020 12:44:14 -0600
Message-Id: <20201124184414.380796-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Re-enable the apps_smmu now that the arm-smmu driver supports stream
mapping handoff from firmware.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index d03ca3190746..f5b98845fa90 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -232,11 +232,6 @@ vreg_lvs2a_1p8: lvs2 {
 	};
 };
 
-&apps_smmu {
-	/* TODO: Figure out how to survive booting with this enabled */
-	status = "disabled";
-};
-
 &cdsp_pas {
 	firmware-name = "qcom/LENOVO/81JL/qccdsp850.mbn";
 	status = "okay";
-- 
2.29.2

