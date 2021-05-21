Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B92A38CE9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbhEUUHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbhEUUHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:07:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27741C06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:06:11 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id e15so4933924plh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+EzPeqojY+93vhWBpwnSXdlNpKsgPbELWuAjK3Y1rE=;
        b=ZKsR/+AaHphumaUwqUjftBqQdZqI0fzRobWZ89qGnV4MsIOLuKgdPwcj4rFcxggq4g
         jXLviS+mwisd5u8tm5ff1KmYPgd7yeqwP5quL6XcMjPQGuoBiIU2QAnOD70t1FBmAiTz
         1k1BTysLubdKWE54yPxyxqIru7BueK4OI/B7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+EzPeqojY+93vhWBpwnSXdlNpKsgPbELWuAjK3Y1rE=;
        b=g0ytKs1aRfqAnpVQI9t2Dnu/ArDNjC79EsvzZ3mFX2Cyh4z/qP9kGvHXEDOgBzQBAD
         S7ILL320cz9YI7NPeRT71n8GKCJTg8B3SvO3DgM3RJv+El7qQxBSMrbzPBycTKjmZ3zq
         XWcR6YXyTeqI72QT9kNySx3afsE6k12B8r/F8AUSdi0FHJUD6LlZoDHtGTrSPlgZM/mH
         6rBU40vNeCmygujkzaD/TMJcywCdGfOqGeLtiGTPtRYpouKLv/DYvyk3Frc4mIGjXxaU
         ls0VUHJ9kix4GR+pO+YGumcjqwUWl6nWiultvyYWvWaa/7+HvZ+ZJ9KsXXVCBn5v3Wy/
         hyMQ==
X-Gm-Message-State: AOAM530E/vnxFvUbrUIdy2rRfJI6I4QrOKRX18C9dnJnn3Z/OtKyruzQ
        G5GJteGO+nfPaAcYPqRvVnK1qQ==
X-Google-Smtp-Source: ABdhPJysX2rMH4lavP2VsfLuOs5VOzf6pzH8FUyZzMjCMiAkn90xzeiXrvFoo1P5k6r8OnEA7EDUVg==
X-Received: by 2002:a17:902:f704:b029:f4:228d:4dca with SMTP id h4-20020a170902f704b02900f4228d4dcamr14024654plo.26.1621627570751;
        Fri, 21 May 2021 13:06:10 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:22bd:8c3f:584d:d265])
        by smtp.gmail.com with ESMTPSA id z19sm4550614pjn.0.2021.05.21.13.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 13:06:10 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: sc7180: trogdor: SD-card GPIO pin set bias-pull up
Date:   Fri, 21 May 2021 13:05:29 -0700
Message-Id: <20210521130511.v1.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210521200529.1991729-1-sujitka@chromium.org>
References: <20210521200529.1991729-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Trogdor board does not have external pull-up for cd-gpio. Set this pin
to internal pull-up for sleep config to avoid frequent regulator toggle
events.

This change is aligned with Qualcomm's DT change posted at:
https://patchwork.kernel.org/patch/11675347/

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d128a0ed6ad3a..330deb4967ca2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1638,7 +1638,7 @@ pinconf-data {
 
 		pinconf-sd-cd {
 			pins = "gpio69";
-			bias-disable;
+			bias-pull-up;
 			drive-strength = <2>;
 		};
 	};
-- 
2.31.1.818.g46aad6cb9e-goog

