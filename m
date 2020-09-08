Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD12260D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 10:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgIHIFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 04:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729841AbgIHH5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 03:57:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B14C0613ED
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 00:57:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s2so7607245pjr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jp1JbuEONyh0D3c15mdIEQg1E4rtcuX67btWSgzEVZ0=;
        b=q0syyZEHC6UJrwegi0WqqL8cvZWfYs02KO3ti/PWcyksi9BW0jaJbDN6ApeYHBSjDv
         mOeziD6tiK1Xbu3Hnybyo3dlcmP+1cVCyZKh/pj5kWXZMEeV3CwfkhuYVFAA7cE1utQ5
         /vCcD4Sk3/BmKlFk8tyf6Kga/Wb42ORnQXm0zNctna93YZKwGX7vb+b9HSWbJatO+XUY
         sMor/KOYzLcUfeVq3q03J1iFdKxOE665GPxtFlBmHJuGQuCn42XgO8m6J2cruiI1HLhs
         KAwCBh+a9fqyntz4TOp8iPC82h+tL9jE1s8WsJOECElZs5qL9aNsMs6Anxo0CrByE4f/
         u5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jp1JbuEONyh0D3c15mdIEQg1E4rtcuX67btWSgzEVZ0=;
        b=VwZmmVoJtK89NLxFedJflHCHgGGmQJ4ttsgY3C1NiYI+A7HRjYfuPdVeLw3AheGN6E
         iONAIH/X76pdSmuxV6B51yo8JSxwzvL3MpKJ6hDmE2VVyZGh3S55/9KYb0ddcv9u1FAf
         4tUNWBZ0i49OPJ4Y7ABZyTrBht+PWKSy8fYSyEbbTxFNnQMOuwJP756joxpTN57jfK5J
         IRbBzF4O49vLo7xMRS876vDaBqban6jUyNIs+azuagiSSZlaGct2hFfczjtLe7V+lraJ
         kjpkmaCYrzXKc21EuCasgZ5rzOerYd/Rnjrc27IN+AkWAZXAQBwvsXxEwgjj2a7KeRlk
         Au9g==
X-Gm-Message-State: AOAM530PIetSR45wYywtwMLH91GWi0ctorEGAKrJXx8Oz4V9Jx35rrNe
        YKZ5JojoQyVlyfvPHzN1ATkM
X-Google-Smtp-Source: ABdhPJxKmEuz+uZ0bUmp4YnY8M63J+6oLAHi4IgbNQqubssEsG00n14g7ib0k0+hUHZoOE0Ou6oSpA==
X-Received: by 2002:a17:90a:f992:: with SMTP id cq18mr2899411pjb.136.1599551854565;
        Tue, 08 Sep 2020 00:57:34 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m21sm7560154pfo.13.2020.09.08.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 00:57:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/7] dt-bindings: cpufreq: cpufreq-qcom-hw: Document SM8250 compatible
Date:   Tue,  8 Sep 2020 13:27:10 +0530
Message-Id: <20200908075716.30357-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8250 SoC specific compatible for Qualcomm Cpufreq HW. The
hardware block which carries out CPUFreq operations on SM8250 SoC is
called EPSS.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
index 33856947c561..aea4ddb2b9e8 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
@@ -8,7 +8,7 @@ Properties:
 - compatible
 	Usage:		required
 	Value type:	<string>
-	Definition:	must be "qcom,cpufreq-hw".
+	Definition:	must be "qcom,cpufreq-hw" or "qcom,sm8250-epss".
 
 - clocks
 	Usage:		required
-- 
2.17.1

