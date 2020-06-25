Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BB420A4B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390733AbgFYSVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403814AbgFYSVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87332C08C5DB;
        Thu, 25 Jun 2020 11:21:39 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y10so6907246eje.1;
        Thu, 25 Jun 2020 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x3wtRHMZ/MZ4FcDZUnjrib+cjt+ls4zlIHiLzlwHN88=;
        b=XByxbr/8chpCA7iOHS21vnd1JzDFLUDDP6oyQKI/12dB4WSP3KTj5brktv/58PPzX/
         78Hd8X+AsR77JlrWSyEl7GLD+RuXtgQYojQZM0ZK+d7JnFbMMDmz7sCen86eazrXASIZ
         0OD5E/PA7rIlnGw3LI5lB6XL79qQwIbGKCe9gcF7LbG8UQYkh99oB8Pj0xpYeVzS9Bvq
         kD88M52ZNl1kbMzldqubJWloFFGIMKsQ1z6YvIEUqtEwjKl1nzhlck0HrroKJ19bcNUA
         Mx+AAmQ9D0+2FChhcGGpoAjKGYR4K5zuHuzEUJC8DAZcQWAlc32oTbiJAO8Ly89X4iEu
         661Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3wtRHMZ/MZ4FcDZUnjrib+cjt+ls4zlIHiLzlwHN88=;
        b=VBq3jfKo1qnQoT4BbDIPsNi7n4Yt/l71NE6yBgGD9o+TW7h6zx4AGdBZpdzahzTOtG
         UEofcvhhxe+dCJJbvGlupwm5YXxS/fuFheSF2MJCF0zGvn01ZZvjY5WI4ZpCBdaIdjhR
         CDyVr8PRzoQ4X/SkFpyWlDbs+SAX2nSHkX+UA52BQW7YpMGyvX8Nln45yXAl2h47ims7
         iQKAj6juuxwaFct8MMkTMA8m/5ih5a2OZh1JNQ9VMsP6fbcYWnEwnaoqmDxY75MiegCP
         wURzIpDgQPBl6f7OY9rf4xjHUeBD+xzVyOWXKQbrNj56qXRPElv6kZnT1OB4cbx84iMC
         UIgw==
X-Gm-Message-State: AOAM532soW4gDgimeg4kW4+eV+UEr3EJ1Dd2USNFqhrKZoI4F5NKP+7d
        c6+aeafOOvmKVahndPgdoTA=
X-Google-Smtp-Source: ABdhPJyiqouyfvh9F0EHdyStVHCFJzAYzvJl96YFnjIHnBN9+8qKIcpL95n6ql95WdowvBydLtV6VA==
X-Received: by 2002:a17:906:7751:: with SMTP id o17mr32132825ejn.111.1593109298262;
        Thu, 25 Jun 2020 11:21:38 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:37 -0700 (PDT)
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
Subject: [PATCH v3 06/13] arm64: dts: qcom: msm8992: Add a SCM node
Date:   Thu, 25 Jun 2020 20:21:10 +0200
Message-Id: <20200625182118.131476-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
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

