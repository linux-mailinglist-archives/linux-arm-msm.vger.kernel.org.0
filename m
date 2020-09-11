Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5684F26614A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 16:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgIKOfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 10:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgIKNLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 09:11:54 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A0CC0617A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:10:05 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b19so12338976lji.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JSPHG+gWrol4xtMWqlVawkUp7PUHXa4piQC1yx4WIUQ=;
        b=sEuCMNpNZYYuAs0LAOewYrhOb/4Ro2IUzL3kV17d/lgV7TVvfrubtNKkZAdRvWopCR
         Eji5hFzeP6LDqZAVhwLcGoVZOrdveHmVbI+MPe4vI+tGD3TgHQHJ3Utvz/UymyXWuMWU
         HN3mJ4oMGNRoQWQNOBAnSsTkm2V+lqdJSknF0yt1SqCvhZruKP0Mcem0bPnN3j64tIkV
         VuPa1w9xzlajgmQNMLKwPq0z8oCVgJgEL+jsnOK05rwpp/s8eFou1NsSQpvSilYsiJm1
         u15+8CJjnNj1jfCsweCkHWaZqdYgAgyEBuzz+bv3IErK3ObQn0zbpwTHk6LB8DNKNZKP
         nKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JSPHG+gWrol4xtMWqlVawkUp7PUHXa4piQC1yx4WIUQ=;
        b=dcoip7gME7kzq+RRrMAqjSC+XAjHjys4XKfdTtCreSRJE0zv8GGvjm93S5G6R9rh+n
         pIMkGHfKObM3ziRsdQAU2lHxBGtNkbPqIoTJwwpF1BBqIAudcoqIfwOEjgYt+21deDno
         89Ofut9d8EnId9+zS+7Z1tUw7GkQzqAfyPc0U2EhTukbGzD/NuuJURklawsLrrs8x5AU
         puA32hDhOw5BjD295bu2+tSiVLJyGm0dlf5nwWGIXXmiDVmBfQjG3VONyb/U1jHlDmQQ
         cZ3gMcvYPkRwmvgetTYpI8IvzeQcwDZBe+r4Edz8ub4qG+WT0REjS1co9+D1ROJgz7zb
         IDPA==
X-Gm-Message-State: AOAM533vfjYCbVdsRRD87WMt5GMDzxbXXkqTcASdeKP5YT7KeFWVbSoq
        07bYSB05aP9sEoMWH4sYBhifzQ==
X-Google-Smtp-Source: ABdhPJweLFzvwR0GykH9HcZst3Q+Y2PFxn41CgZ06JQB1cBkINnhG0UexuZHCND63cR+N8Y6v2gFTQ==
X-Received: by 2002:a2e:8153:: with SMTP id t19mr851775ljg.334.1599829803419;
        Fri, 11 Sep 2020 06:10:03 -0700 (PDT)
Received: from eriador.lan ([188.162.64.141])
        by smtp.gmail.com with ESMTPSA id 10sm429500lfq.64.2020.09.11.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 06:10:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org
Subject: [RFC 4/4] arm64: dts: qcom: sm8250: pin MMCX to stop the board from crashing
Date:   Fri, 11 Sep 2020 16:09:50 +0300
Message-Id: <20200911130950.578483-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use MMCX domain to power up MDSS_GDSC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 5045fe89a494..c42640228ceb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1732,6 +1732,9 @@ dp_out: endpoint {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
+			power-domain-names = "mmcx";
+			required-opps = <&rpmhpd_opp_low_svs>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
 				 <&dsi0_phy 1>,
-- 
2.28.0

