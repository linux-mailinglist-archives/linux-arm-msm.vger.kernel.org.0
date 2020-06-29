Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A9720D87F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbgF2Tje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733018AbgF2Thm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:37:42 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8D2C02F00E
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 07:49:56 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u9so3580727pls.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+rSgnWvzCZALaQyW++jIaIPoFwAu7y5f4Pe2z39zw30=;
        b=VMm9xmy4fEZxXG+o2k/Ep6O5phF2tOBoKpXoQZKWJsm6D2ODsZbKMcOfvPBiyd7vGu
         Gia+WEeC0/IfACg0ngh/2oEf6QXgk8OkPFSg6CGBA6C+IfGqjgFlC0MA1V/qh2/rC9Sj
         VhtpRWV+R3AZ99gKUS3odKT3uY9UwZkfBiNL8UxkMv1IuZyKmvvphelcHlOljg7L1Uzl
         13YZ0hTnpGyoNiDXmj3C0iOy0urruBvo/lxER1wFgVarChQx4Np6Xixcp5jzZgdCel7B
         ugmNn+XQg30Gwg6xt4XVcnKunmervTnThiYhHfq7ZXg/HeVd7bFUevxb17BvpPT9UKds
         e+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+rSgnWvzCZALaQyW++jIaIPoFwAu7y5f4Pe2z39zw30=;
        b=Ksdn+1Dj+3o7EfPgSIeNnv3MNgtiqpMk+paqtXsq394nD3lRcj8JUwFl2t3xSw0eGK
         ecD8HG6bSHOeOUzQg0qR3oOb2XMaLiv0FA2Kjw7+H/ilKHv0DLdlZQgNzspLqdr474A/
         3dl3eicGPckxUcMQ/Q4jOd+HqRQ6uBrfnLEcjmxzaPcRNs8+8qeFqZ25XD59UTLojmwz
         zZ4+p7U7PEFBt+bASjh5xlu0M3a4m5JCROyA64q0AgekdEyk9HjLng/Xh0rS1V0Ta0qA
         nY76fNmczYKQ3Cjc60rb7zPVcsJ4pImDq3cn9hoq05JMmWtkQhxjSrjPiUHRMgNl7JAO
         PNAg==
X-Gm-Message-State: AOAM531hfhyEaarcsLK21NfkA/9JCzpGvH4EXMNzneFPer77ArrMNHGN
        p8kpkbgOyHvd67wTllEmOm0m8w==
X-Google-Smtp-Source: ABdhPJyybtDmcilXfo+dhV6hyHaIxV+dSXXecI+jPSloyEVxVEQfpJbPH0b3Z7o/8Go3hKAI9uAjtg==
X-Received: by 2002:a17:90a:eaca:: with SMTP id ev10mr5700130pjb.151.1593442196236;
        Mon, 29 Jun 2020 07:49:56 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id bg6sm191614pjb.51.2020.06.29.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 07:49:55 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: tsens: qcom: Document MSM8939 compatible
Date:   Mon, 29 Jun 2020 22:49:25 +0800
Message-Id: <20200629144926.665-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629144926.665-1-shawn.guo@linaro.org>
References: <20200629144926.665-1-shawn.guo@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

It adds compatible for MSM8939 TSENS device.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index d7be931b42d2..8100fce2c892 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -23,6 +23,7 @@ properties:
         items:
           - enum:
               - qcom,msm8916-tsens
+              - qcom,msm8939-tsens
               - qcom,msm8974-tsens
           - const: qcom,tsens-v0_1
 
-- 
2.17.1

