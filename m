Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02760486E1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343619AbiAFXxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:53:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343584AbiAFXxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:53:38 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12655C034001
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:53:38 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r10so167651wrc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cmFENN6DpfU2w2rL3CjvPLwaJNNz4VsyBwG74nM5M44=;
        b=zUfhr6sav/maZtnP9i/JC5E/7dr0f9dGHSMAyCcPznMDdQRq3pdIuRG31d3vDW/DO/
         Eh7rNOKQ8SsycNZFLrkm4/EsUr42xMCBKBrpaES7Y4RLufFoxTqrzOIKdcv5nwY25pqt
         mQivjVZPoPmKMWB1vXPMAgig08hegddrmxViDAJThX9iOb679J2pRc6raOU1y71Mhi61
         2CvllXtZ4SmYRuSP+bYhIn0jddXCxKkSkhVwXyI6PIs4kAD39ZkVKVeetWgGdv2BE8w5
         fh483m7gOf/DkAY57jfAYF+8v1/2iHqC7U3nkORoJoskuWq0Ctvqv1RPdig7t6felokq
         rYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cmFENN6DpfU2w2rL3CjvPLwaJNNz4VsyBwG74nM5M44=;
        b=rCLqYiYfd4bcfr7QEa2M1wyMQmiEyJ7DY7+yR2z+B/ZFg6H5etdoRLYLHBlBBjsbyC
         66H3JkVtTIBZ73gpVHCYjHT7dL7uDyyRWWkocoTusnciVz7YsNZpKxNFqV2C6PNaw3GG
         rSUFjGjRfbqEClSgSc30SNQ+fWwXMVlT19Snp8L6yiAZo3n1jyjy3J7nkolLRV4ytleQ
         SAqnl+1GSTMYr1GCiJhBFOtxhYSFFRfhGWAZDUjagV/CqC75uvaVWF0gjn9OEXyPPeoO
         RXcG50OX17dq/2c+o++2SJNPaRiqYadSUAny55Ov8c/iD5l+uJ4rMvdSqeBcy/qFMVGL
         a5lw==
X-Gm-Message-State: AOAM533d6AlJeAkj9fxoEFHrtTUKcdCBEWQngxxwiaOsobbUJvgHlzvY
        oci+dFhF3XYXOu2/Q6VYxy0Jy4ijjROtYg==
X-Google-Smtp-Source: ABdhPJzKFnQV7XhqXPsX/KMievHHwXmjdo/Bagi2gCQ4gxBVDyNaAYfRnuNTyuqtc56tJ/PU5X4qYQ==
X-Received: by 2002:adf:fa4d:: with SMTP id y13mr8348924wrr.278.1641513216402;
        Thu, 06 Jan 2022 15:53:36 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:35 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 4/7] arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
Date:   Thu,  6 Jan 2022 23:55:37 +0000
Message-Id: <20220106235540.1567839-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in the missing vdda-pll-supply rail description.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4db88dbf8766..f7bfd69b13620 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1116,6 +1116,7 @@ &cci {
 
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
 
 	status = "ok";
 
-- 
2.33.0

