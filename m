Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390EC34CF9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 14:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbhC2MBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 08:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhC2MBD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 08:01:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBE1C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 05:01:02 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q29so17954880lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TnkWF/fJb3+MN0k+LniOlBuYB58LfW58mHqJqX+URIE=;
        b=YWvnaqdDXdIvbYpFm/slhDkvN3LNK4FN0Q/Aj1+TPdF1Z+zz0FJSdlGM17Z1UoaQ0i
         e4825ouP+bSWh86Lc7qeL5qi1kd5J8p/H9sgDVqIizNxJYX/GVfpylSUTj05LhNbsdMy
         kfwbU9bzZmGvNrvrmp3VkgCQOVNBzBgS65PpLUgUqIXuBmd0oCjs+zJ0Xf6ntmf/xu9L
         0YPxkK23VFjUIi0+K5MldB/rLDyYdPckzEQT+bVAemiCTZBLBxAvtMY1HxO/kUiVEOqk
         vZgBNdADKEM2BAbzIJxi+UvJv2z2N+EhAXLiH5G4N0EpCxhmdmrXqZA2oTmCqZOXTTaD
         h1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TnkWF/fJb3+MN0k+LniOlBuYB58LfW58mHqJqX+URIE=;
        b=Bi/SCAbD7saFLwStf/zcmroOqzNjdH/WpfBVKfWWrdVnIE6ZHj4TOlNrgDVnz7ODxJ
         wMQH5T/4c8gR/ZYWDG8O4Vl8yTXE9CO9EbYVY+t/xpPNXOAdBaJXDLnn2YZjmcqu75LR
         kG93WDQIvsOmcJYFNa87tf0Ig18qKME5sVcyHm1BAo6TdIAIU4KEQD8yfzZ7OFhS1vB6
         LD6qTlih2+yZ5lmysvLPSssGH5ouxfnAgfFO0JXBm5b+AkRxYHyFY1F4Bv6QizgzPyUS
         PXqEIl1A5PfO7zbzzpLC/8jkdon08ywX5xl5OK8r2elCYpXFN6qIIAxfqk2zYyFZrboG
         UiGQ==
X-Gm-Message-State: AOAM532BssHoLTYuVI+yGZ2ujEM3oUcfLLqHMnrNv6Bw9W+5v4FmaMI9
        eNSuQvdxTvwSMlkgljolW6D8Fg==
X-Google-Smtp-Source: ABdhPJzvvEcuDdin+Rl6Z1zLKQZ88UPWFkNSXMU6UzLLhPOlRygjEWDdGE4qOxIihheaK6HYJSsBgQ==
X-Received: by 2002:ac2:4dbb:: with SMTP id h27mr16954400lfe.634.1617019261533;
        Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: qcom: sm8250: fix display nodes
Date:   Mon, 29 Mar 2021 15:00:51 +0300
Message-Id: <20210329120051.3401567-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

 - Use sm8250 compatibles instead of sdm845 compatibles

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 32f0d6a82457..693ac533f9b6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2323,7 +2323,7 @@ usb_2_dwc3: dwc3@a800000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sdm845-mdss";
+			compatible = "qcom,sm8250-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
@@ -2355,7 +2355,7 @@ mdss: mdss@ae00000 {
 			ranges;
 
 			mdss_mdp: mdp@ae01000 {
-				compatible = "qcom,sdm845-dpu";
+				compatible = "qcom,sm8250-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
 				reg-names = "mdp", "vbif";
-- 
2.30.2

