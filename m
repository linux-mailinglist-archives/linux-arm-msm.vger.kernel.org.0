Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E99C1E9957
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgEaR2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728402AbgEaR2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:35 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D247CC061A0E;
        Sun, 31 May 2020 10:28:34 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k26so9115224wmi.4;
        Sun, 31 May 2020 10:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebqlPcl+XNjJOe5h+TEWkSB/DDD6wLCqevkiNxwyrgo=;
        b=hbDjGJBq6N4FgliI+Xs5w6z3P9mHi4Q8Qmzwdc54xC1ECzD7wKXMvL6Hv0DMayWXcj
         Y/9gYahtEcvXSaehRVE9jP7eKCk9Qh7hdzlPfE8xlGveGdJOW2sleml/HxjG8fnouMDC
         zMZ4e18dX29WrL4CHRj4DqifEfhtT7YfArP3EHnAZPxdaOXdrFBNbZcvEpJ5RmGGSsk5
         RVJUXAtvw6Hnyq8KF4YuHMlLHuhexwHvpmrjpCjLfA5m7WsqD4dMyj504AhGThEL0j4S
         ZdbCqbDqG7DjR482pQ7bXFaxj5aTuPysw0aCpUxf0/GUsRBeZcqtYkvncVRLwNm5w47m
         J7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebqlPcl+XNjJOe5h+TEWkSB/DDD6wLCqevkiNxwyrgo=;
        b=Ha+CLfnvqJVLjLVP4V0NAYZpevoSJVU7bqqo/VOwBZInQPtelZz4VY3llrMapC0ZUO
         cV3Oo8gEqfBrRWIbIj1/BePEnABNZH2gbVk6/6wWsNoT0J3EfzzirTbnW3Baf8w4IpHk
         cwC+I3RYw8u57GVcNPnZ8ngJdH2MGhF4+qFC2eIUg6+tOeBExxXxN0eW9+WqIC9aKDY8
         ITlGt+p9Em4zLpIfJ/ZHyMi6Mk+C2ln5Sjr9Th1lDq7sLsUHk4Ac4umMqcRlywP3NW0N
         rsukAKWJYGzSAcsbIuUeW2CmwdH4Ps0P5HkUacamfJ/hYJKyYKZh4r9UkZVQB8U8v6QI
         cEkQ==
X-Gm-Message-State: AOAM532o4tbTx+ra4pWcgvUAVGdgkWbP5JcHmI6OQpZWYrbGMJk3o9Se
        1pV7UhnjNfCy0Wv0P/nnJd8X79d6
X-Google-Smtp-Source: ABdhPJzlcaH71IAUa4X8DVuSN8cyFvPl02gWD90+HYXiXd4Lk2T6WOIF2NfaAR/BtboMH6bAN6LYZQ==
X-Received: by 2002:a1c:de46:: with SMTP id v67mr17863171wmg.146.1590946113571;
        Sun, 31 May 2020 10:28:33 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:33 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] arm64: dts: qcom: Add a label to the msm8992 rpm-requests node
Date:   Sun, 31 May 2020 19:28:04 +0200
Message-Id: <20200531172804.256335-15-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the node to be referenced in other device trees.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index b5bd73205a55..81fed16fcee6 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -401,7 +401,7 @@ rpm {
 			qcom,local-pid = <0>;
 			qcom,remote-pid = <6>;
 
-			rpm-requests {
+			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8994";
 				qcom,smd-channels = "rpm_requests";
 
-- 
2.26.2

