Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DD233C106
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhCOQDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbhCOQDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:03:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E13C061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:03:00 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id mm21so67072114ejb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kp5VYTsDNiB0gGXlB6HcqJmGVkbYyLUkcxdf+TCO1As=;
        b=Lr214abl7ddeutY5fxou0YYCI5lxlhT/40u6BAPjjD91wy0wAapA+ON5eFepOmFSm3
         xT9EoCsmlyS0lG2ivodFxwAWfVVhMkhQ1/06EYs8jN/Rf1Ztc0LHC6V3BQ1u57EJcAZz
         UKTBuME1jPE5NNZZUQlkbMcZsd7PMWII3SoGvfXPakEFuM5E0CLeHZHUYxrXfR1XF9mk
         pTiws9aKIsTsi5xEGqhX5fy9TMCaOmf5du6Nw92hPYkgfOFWK8rsM6vciiyFbTDIIqkm
         aUSMxG9B3MYH9f5rgKoeG1PdgozGhZ+L68kiQvdqhu2Fnesy8vliCwj+8QjHK7d3qVdh
         XLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kp5VYTsDNiB0gGXlB6HcqJmGVkbYyLUkcxdf+TCO1As=;
        b=WxA5W6lEE2gUXy3ziKGmZddufOTg5ARYk0b2jAOdGYiNEdew+vutyng6cR2xG/qa6V
         aLvMVoyiLVodrtlsIrsAr7kolzb7AXmZg+UPWmIKc2kowCJWL09xktH7TblS5+oR3D9k
         QoPQQtxu+hPcyHzv5LL6dcSoT8bO6hy++4S3kCIikrzKSRFG/1TxYe1wx8K+fSUFldGZ
         bDPEbbXlgtrL6cEtedoQt/JbFFVbi2CAuMFiknAmQhGT+aXwF0KSmJkrfUyvdUb2n0IN
         dQgu1c2uWS+pitFBiIm/uEkUN5h4TRNFyiJNU+VhCkb+JmT+hrtEmgdP45ENhHDAqMps
         slUQ==
X-Gm-Message-State: AOAM533z6mzVxsEJAajl6gRJ+QU/7t6cBVZLbiQjmh3i4tBWRlJbsp+U
        q5XT00UXkgBhX1bxp5VFMX7LiQ==
X-Google-Smtp-Source: ABdhPJwertWu+l7Zeo7FOjsdIsO/DukgNukXQTqr1PwqR9mJokCr23IenGBVbVAZL+dMW0MgXH8DCQ==
X-Received: by 2002:a17:906:2786:: with SMTP id j6mr8716846ejc.157.1615824178926;
        Mon, 15 Mar 2021 09:02:58 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:02:58 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 21/22] arm64: dts: sdm845-db845c: Configure regulators for camss node
Date:   Mon, 15 Mar 2021 16:59:48 +0100
Message-Id: <20210315155942.640889-22-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator to camss device tree node.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
 - Andrey: Add r-b


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4ac6f5dc008..7e3c9fe4955d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1108,6 +1108,10 @@ &cci {
 	status = "okay";
 };
 
+&camss {
+	vdda-supply = <&vreg_l1a_0p875>;
+};
+
 &cci_i2c0 {
 	camera@10 {
 		compatible = "ovti,ov8856";
-- 
2.27.0

