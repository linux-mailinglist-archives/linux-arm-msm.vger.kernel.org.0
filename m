Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC2131E28D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 23:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhBQWhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 17:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbhBQWex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 17:34:53 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC077C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 14:34:11 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id b16so184031otq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 14:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1qY5r9Z3a/mo/EMdt37YP9TIpp8gvqH0wcp8KFskVA=;
        b=ypCbFUrXzJ9e7MwrAEKWLRFspEeuU/M2Rj2Dh+IJKNXw+HfWcyHOsJwCX7JdRTKFwI
         xuebPqyQzADc92+qBvp9YCL9SWCOFm8CCJiB7nugTvc3SV2LSq9sWYcHyoKC4lTqqo/V
         E5eGFzNJ1SxSgvQmyX3kqaoCcwY1YUGGANkWGc8uBdHc9XlW9fpV7QRihBXCTxMpSDiF
         imnUO5WJc4z0gyA03kZn0IFMjzwRMbR4d6IeZu0QwpZznJDEOLdTiRa5wpPEQg5GIfIs
         usOSdF4oi8NckD+sptnEGs1LpOC+3AzkfROhO2p5g7gAn9sKF5JNjYFr4oefsDaw2PpO
         G6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1qY5r9Z3a/mo/EMdt37YP9TIpp8gvqH0wcp8KFskVA=;
        b=QJMdyP03u9shaMlxd8Hqknrx15ZWNI0UC/3d+16KBcavr0CKwJ0yVwqXUkPT2Ip6xt
         /dqm4fmBEqmPakM2sb+754coVDgP8uLHsLXrWg6eKBzaemage6aKY8bQRCht6od9jShD
         9hQGzlISrrLU3uWHIeBAbwh0znuGj2sFqfA53r9Wx4PKIjWmrHXqaM3TicRiR7sxcAXk
         KUoVcgJ/P7wQPlAlZJUkP3jU6aXpVP7D6JxsW40nfGAFjm1J8J5TRvIpugviy+Pk64sI
         zt2/TGlJKfuXzFk+kmYXLkFIYNcGILDbYvRkZaP3fRiUS2ai4xtEXIqcQjUkl8emWjxS
         ugtg==
X-Gm-Message-State: AOAM530m4CCoGFTNNxQcyOtOJmYwsnwWFGJlyjam7jzd2Vt+g978xYcq
        LjhjZ+/+5EVHuQ/UA7W67yYnEg==
X-Google-Smtp-Source: ABdhPJw5Drm2g1d7LBICt7NWdPD4P2Qi6i3UPteyalyiWVgvxGKB4FWlsp2JvgNWSGVPMFgfeZrU6Q==
X-Received: by 2002:a9d:6016:: with SMTP id h22mr942346otj.63.1613601251160;
        Wed, 17 Feb 2021 14:34:11 -0800 (PST)
Received: from blackbox.Home ([2806:10b7:2:8299::3])
        by smtp.gmail.com with ESMTPSA id q2sm686232otc.28.2021.02.17.14.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:34:10 -0800 (PST)
From:   =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] arm64: dts: qcom: db410c: Update firmware-name for wcnss and mpss
Date:   Wed, 17 Feb 2021 16:34:06 -0600
Message-Id: <20210217223406.1422005-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20200108055735.660475-1-bjorn.andersson@linaro.org>
References: <20200108055735.660475-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Enable the mpss remoteproc node and specify the firmware-name for this
and the wcnss remoteproc on the Dragonboard 410c.

Link: https://lore.kernel.org/r/20200108055735.660475-1-bjorn.andersson@linaro.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[rebased and moved to use pronto label]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Aníbal Limón <anibal.limon@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3c7f97539390..8f1ada75d3ed 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -301,6 +301,11 @@ &lpass {
 	status = "okay";
 };
 
+&mpss {
+	status = "okay";
+	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mdt";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -308,6 +313,7 @@ &pm8916_resin {
 
 &pronto {
 	status = "okay";
+	firmware-name = "qcom/msm8916/wcnss.mdt";
 };
 
 &sdhc_1 {
-- 
2.30.0

