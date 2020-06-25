Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D93020A495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407098AbgFYSOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407040AbgFYSNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:24 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86074C08C5C1;
        Thu, 25 Jun 2020 11:13:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o18so2413727eje.7;
        Thu, 25 Jun 2020 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x3wtRHMZ/MZ4FcDZUnjrib+cjt+ls4zlIHiLzlwHN88=;
        b=V/mLaYMTezEBhloz/36vaqNT4BtHW0iURhA8ZD4UhZgW3lCGpujjBDWvZuPYZM0lZ0
         7Mp2Z9Db09kNgTKJkJzY1Kw/Ybo9yds9aIVO+dDTOyh4hx7tg+p2HJB3T/0Ytl8b6MMc
         X/zarUY/zREbG2ZHEvhXRvEFOSQWJgpIHXZJaTejzoxHyRaImysaF9tVNTt67wvZ+mvF
         t40J3ugMWpX01f00sA2xH+SvQen5VwCl+rAGb5E7OC+ZEvo640tIg7Ms8jkLC8DrSvv/
         Q2KUPqu9wKY/8z8wRUZ8GodAn0TfYsq65LRcEGIViOldQtnSHZWVSxEb4Mgzdexx3fF5
         CMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3wtRHMZ/MZ4FcDZUnjrib+cjt+ls4zlIHiLzlwHN88=;
        b=lVNY85lDMm0zehXzXbSLCAoabuqI/p/guOjayiWYSm+/sni8wd29gps1EY9MRSza9y
         OXZf1P5/HTdmnQ3i5nLwTqwkxNdCpX9xrey7EoPAVz5W5xjagwgab2CNVQl/xPlg+Frw
         6N3JeOSQNslWSSWQ0Twvc4LGqURnR9FNbViVsPXlpXqPJRXNH4PpTuyYnBE5RUE/jczD
         DshjSYQ3QtKJqNHMBMiT5y6F9FMJ/mNO+gmBOVlWK6Zj4844uW06VLJcGjG/vcXY5xh1
         oH2ANCt3/OwQ8fZ84kIv5gabtHbKbNdlGt4QS3sJfUWPsQ0fu08ECR5LDTl33PGLxzDQ
         5wOw==
X-Gm-Message-State: AOAM532fcR5CHpdzAdgHzTYrfX04WZAhyunmeYAvhIHpzMZoO703tj5H
        F0xX9Id2YP92m5r3eHGhTeQ=
X-Google-Smtp-Source: ABdhPJyYQ8ZdnlTDp3QUbmx/VqWy+7+hkkQ7ybwWRlml8WI9phNKm1zLYlw/HzjVSdj1P0NFbs4QcA==
X-Received: by 2002:a17:906:2bd1:: with SMTP id n17mr29786253ejg.147.1593108802275;
        Thu, 25 Jun 2020 11:13:22 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:21 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] arm64: dts: msm8992: Add a SCM node
Date:   Thu, 25 Jun 2020 20:12:54 +0200
Message-Id: <20200625181303.129874-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index f780cd39ded6..aee33ed61858 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -118,6 +118,12 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8994", "qcom,scm";
+		};
+	};
+
 	memory {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-- 
2.27.0

