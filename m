Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FDF27E10B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 08:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgI3G0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 02:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgI3G0n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 02:26:43 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BB7C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 23:26:43 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id s19so385345plp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 23:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mgYJJXMxx+kcf4ZUk0gqNRlrVT2JY/xh1hHfRqfpR6c=;
        b=iV9wRNOyNqLQTpCmly2y0p5KAla4essxwJFuzVjXokwsylwuKarknbAh34ukHphfOY
         D61kyLdAmE06aqn4Bj1dLlXxOSw/HOHe8UdSuypzadrznPtgrW1kDGNlc2YZzfsTWO8c
         3D5nmsrqtLGxG4budOtuiqwZW9y5WEQm0sF+x0wuxpn4mQki1ZRXA1du5N74JmchQfRB
         7A+pN6cBEI5luSOYB0mEA+VZCF/BOdSUAekw26fh6v6GC09UDPWOU9HOtSr7TQCFtCBx
         BVwm15FyByvbG/14gS611hbbG9Rpdz0FuK/1+aS4KX51j/c7buFIYGu7Gvz5BBZwwth5
         YsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mgYJJXMxx+kcf4ZUk0gqNRlrVT2JY/xh1hHfRqfpR6c=;
        b=N04WLtbp8QIxYobqrmbGnJB7WDbrZRSTmsbKrinq67mMjTaE7d1urIhusTdIyhdzT3
         nSsniCJBW8T+XpKCY3WeuvO26fdta6VcwBKq/E5a/zn+QYs8P1yk1VoLtcLydR54Cdmv
         Jcpue/IAi0/KkvPhQZTKZzsUbTs6I1OJXVI3hl29/n7a7s1eT+eq10cEvfwicZ0NtEXb
         p+KF6Vx4uGoP3jhZtbLAkCsl2akaxp/KVMCvq45LUq2cUZo/nbfRH3jioJFc/+t5KsnF
         GK5nHrKKkkDtFnoERIVj9/s+EKO8O8w23h0j6lohustMnU4vfq33xBIwa+2NR8Dw6NLQ
         jCqA==
X-Gm-Message-State: AOAM531aFRmuMzdIPOpsSkzgTpAFQpwkggKic5LR/1bsD/XR2E1hc1Av
        sv1j4IEojl7XgxMPkjE+aAxgAHasexDThgTe
X-Google-Smtp-Source: ABdhPJwnOj3kFy4/iMi9jsDq8fZlirpwCYqqynpn+DSeeIvV6IdzYX9kphWeqn9Y4MtaumgKFHgrDA==
X-Received: by 2002:a17:902:be0f:b029:d2:83e9:5d6b with SMTP id r15-20020a170902be0fb02900d283e95d6bmr1161775pls.75.1601447202685;
        Tue, 29 Sep 2020 23:26:42 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id t5sm772462pgs.74.2020.09.29.23.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 23:26:42 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     nks@flawful.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     shawn.guo@linaro.org, Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 1/3] cpufreq: qcom: Add support for msm8939
Date:   Wed, 30 Sep 2020 14:26:01 +0800
Message-Id: <20200930062603.29009-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930062603.29009-1-jun.nie@linaro.org>
References: <20200930062603.29009-1-jun.nie@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qcom-cpufreq-nvmem support for msm8939.
Also add msm8939 to cpufreq-dt-platdev blacklist to avoid
conflict.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 7d01df7bfa6c..b6eeb8ef9c11 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -130,6 +130,7 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "nvidia,tegra210", },
 
 	{ .compatible = "qcom,apq8096", },
+	{ .compatible = "qcom,msm8939", },
 	{ .compatible = "qcom,msm8996", },
 	{ .compatible = "qcom,qcs404", },
 	{ .compatible = "qcom,sc7180", },
diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index d06b37822c3d..d88060330497 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -458,6 +458,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,apq8096", .data = &match_data_kryo },
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
 	{ .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
+	{ .compatible = "qcom,msm8939", .data = &match_data_qcs404 },
 	{ .compatible = "qcom,ipq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,apq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
-- 
2.17.1

