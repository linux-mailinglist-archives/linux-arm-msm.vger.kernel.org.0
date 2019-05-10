Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4EB19CA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 13:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfEJLaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 07:30:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38557 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfEJLaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 07:30:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id 10so3086974pfo.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=XEEIgwOV9z+zGwCO+bIPdlvdaxukbTtCAZSyRHFIYp8=;
        b=PgkRML8BUjp4OaooFW5wqoDKpWiVOpDtLOaT9rXtfDX8p1w9hjpPGCkM+9pXTvVIgp
         o7f7YVDLeyz64hfKY/psaexOP59hI0BiFvFMOIw2+FXP+oYknF8Q8Q/rvZW/TiXeUp5e
         I8HnJmMf5tOdX7q/eOgpuvSv8SZLC/0B0Y5D9zdw02m4a/5oDIXEdNgwx43oVrNGLvBN
         KLGd7V9L3HpJhooCyV/2SFrPe8x99d4O7EYiZQ9kgatEFMUMy5KdkdZ3tGv5TrU6YmWd
         J0OYDSp7nTw8JLKG7URMq7FSOiAKpsrXRR4LWET0rqQ9d041XFAydmqetRD+/HA/etH2
         aD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=XEEIgwOV9z+zGwCO+bIPdlvdaxukbTtCAZSyRHFIYp8=;
        b=my5Li10smk4GcjrxYlpqRBW6tvB8HcqJDLH293OPwIV27gVxNlqQA6dxJ31IQapBPo
         acJFJSUE9F+z2o0d3r8QXoSOPDgZ0HSwnq4rKP+Qy9RCtB3E+dLcP1t4ySTnHTRxt8hP
         QQM3z/3BnRqdSo0qevSaMqAX5bgYwMm6Yqmd+gyWL38JTF51xAh3zpxYmuxwCI0v7qMU
         9FfnyHNRNjW16r84q3iQzNrMpEtaXh5bInSr8J69ifA7Ood0VRnEdqCxCfo1eO8p9j6M
         c+ONR92gbp8JwL9FLEFA9pDcnx012r+TudUhCg8eoT44PUXpaMrc3ULRAhJYGKz0cDLr
         AQCg==
X-Gm-Message-State: APjAAAVM+2jabNr33nQcysTO/0a9r2IQMJ0BdtR6qV/piOW2v1nzCGnc
        b5jdOmfeJ2yujhBRsCqKxrROgA==
X-Google-Smtp-Source: APXvYqzVNweeOUex4wtCyguEfq/kjTXsfJW1UD0IsFIC5Dc0O82bHCQsrFPy7HWYhM1fFJWBxDlRvQ==
X-Received: by 2002:aa7:8212:: with SMTP id k18mr13005473pfi.50.1557487804833;
        Fri, 10 May 2019 04:30:04 -0700 (PDT)
Received: from localhost ([103.8.150.7])
        by smtp.gmail.com with ESMTPSA id p67sm10677543pfi.123.2019.05.10.04.30.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:30:04 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCHv1 3/8] arm64: dts: qcom: msm8916: Add entry-method property for the idle-states node
Date:   Fri, 10 May 2019 16:59:41 +0530
Message-Id: <030b5d9c6dc2e872466b7132e4fd65c473f9883f.1557486950.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The idle-states binding documentation[1] mentions that the
'entry-method' property is required on 64-bit platforms and must be set
to "psci".

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0803ca8c02da..ded1052e5693 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -158,6 +158,8 @@
 		};
 
 		idle-states {
+			entry-method="psci";
+
 			CPU_SPC: spc {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x40000002>;
-- 
2.17.1

