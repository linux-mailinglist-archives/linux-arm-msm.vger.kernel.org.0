Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E118220246F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgFTOsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgFTOsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1948C06174E;
        Sat, 20 Jun 2020 07:48:39 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r9so10917611wmh.2;
        Sat, 20 Jun 2020 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wW++sDpeHDTflJ6Os2FkMg1pvptnu0Wqw0CM6692GDw=;
        b=TFqlGt7gIuJWhVEeGO0rF4Vy01QGpx5pao6xea3Fgfr6Ej4mfttKT+CcCwluN69Bs7
         njkE+qRCOamQ4N2KXQv4zTp3BW4CzjMveXMQ/aH0Wa2wLE+lVs4CcivOHiuC+DeBMaVq
         SQshm4dRu29nANZr6uZC3YBlH5odcv3ZauV+J/FSbjOym+7q0GcdUkM40xJyqvXGiZUN
         3/AwbHmumci14ETcIinEbN5WVcPCit0OOsIV6WJD9BN4DB4t1nwlv05cVMf/WFlT2yTD
         ylpaDjqVXX426pk9WgHhwSe1RNSveBWRNQv6nfiOnlZq85QKLGIUHgnQofUoXMeHq1+4
         dvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wW++sDpeHDTflJ6Os2FkMg1pvptnu0Wqw0CM6692GDw=;
        b=WLcgxLltfvqFGIn0ofV5KQuCKe+tYvISjh+zE8i6wqxUKCnp+RtOivogzWcR2Sblfx
         drJvWhbdW6HGIeIhGfn7vkejVRKqVVGc4ZRlQjAb+Tp0jXgwpnt1mtvADr/fqo5KSomk
         /JVTYRKDCvFTa3kk0akndVMFx9fzjUmcwisvpo0+gTANcvpsxvuIzN9QQI0tz2rtvPgl
         +s5/dnvQwIv/FqFHvqDKorsbpXk7o+fxjVufAacMXOrj8ah6ePcTpqLh+AjXqJrihJSN
         Bq0HNPYhC+pS6KMDQIKdd/zyaI+0GiJOeWnrbESutS4vAAfj0/D1vuxy2MpgrTqYAx51
         ikBw==
X-Gm-Message-State: AOAM531IwD4iKN5HKopTcSWaylvq6TN+9kDvvtVu324+avNWekyREdu5
        c5OmOz5pLLxuLTZZUdC1VZU=
X-Google-Smtp-Source: ABdhPJyHijlKf4XRf2GRReiuVkDcHieN0Bw5U+8y3OT5wOyOBtC2V7MwSL8c9lB8vErDv/XzYs9N9Q==
X-Received: by 2002:a1c:a385:: with SMTP id m127mr8504361wme.112.1592664518789;
        Sat, 20 Jun 2020 07:48:38 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:38 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/21] arm64: dts: qcom: msm8994: Add SCM node
Date:   Sat, 20 Jun 2020 16:46:30 +0200
Message-Id: <20200620144639.335093-15-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 19c9ac30453e..df35c975c94c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -138,6 +138,12 @@ timer {
 			     <1 1 0xff08>;
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8992";
+		};
+	};
+
 	soc: soc {
 
 		#address-cells = <1>;
-- 
2.27.0

