Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D5548E0FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238218AbiAMXeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238231AbiAMXeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:14 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B70C061574;
        Thu, 13 Jan 2022 15:34:14 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h10so12894635wrb.1;
        Thu, 13 Jan 2022 15:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EQP/lIddQVg4DekanQ8K46jty3YAPGzLXeR/UA7EjUk=;
        b=oi86Ch8gk6Td/kTPAH/z1yPGnITfiT4sIuSmN7nsglZ5hu74BZO0JKEtX3pvItw3QM
         kfCvYLPBXbYI3RJdCVYQSF6FzEbZsbUGnpMXevg8YuTE0ffUr4xkN8ouhLVoXpuVShQy
         cm3YfS1DIX2CET5p66AXKApETUFgAwta9LUtDxXCwaXRaBcTt/fizOqQWwKGtYs5mhiZ
         urwM9v34OaMeSax9h50sBwI8+twm7KbelEFVCH1KoItgpempreBdQl5TPlSLl8LygXUB
         65FOQapZ4oM3YdGBA0hoDTf3jnWGKwLzWLM6KGvG4dTohJg03sGj4Pmoxs3lP6lY3Wg7
         xIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EQP/lIddQVg4DekanQ8K46jty3YAPGzLXeR/UA7EjUk=;
        b=SqTNyy8Tob2pPnoyz9PZsDvyqcZQKdEqjvEYgwV2sket6GV9v5FrRxT8eQOHVusy+v
         Sa3rtCtTh+aI6zF3XhkaWgFNfInmpmLncOu5wwF6HcWB+/aNJn3K1rub8BzM3Da+33dk
         lZz9C9SLO9L7aJnmsYwxYBebSM8MCA80wmMHZLiNY03o9zTFVQk+JoILOLM/k7oUKjkc
         lIDhJxNK5SdvhlG5MSF4wRgqfHOY04J1e73vGly8EqXAdyal8vKxSVO8GLkPMX4jvpQr
         O6CF/kwaWXVgXtCan49fWm/OP1zbVxJRJAcp3bRZdTdV3BwZlLyYl7mzINJ0OvxMGrQa
         nCDg==
X-Gm-Message-State: AOAM5329lFEFtgRo1DI5KFyMbcOId5BIqK4+jBymxW01Xv8uhiUOuXS3
        sz+G+m2S0qunCqu+lc2oYxVwJuqtdcLdDg==
X-Google-Smtp-Source: ABdhPJxyr8kpgIk3yD5on5Cmd6vcW5GNaiuGNj0/2hWCE1eC8Ykhx3rWCLiFr5V1r0YujWDoPOUJiQ==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr5967853wro.587.1642116852903;
        Thu, 13 Jan 2022 15:34:12 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:12 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: msm8994-huawei-angler: Add vendor name huawei
Date:   Fri, 14 Jan 2022 00:33:56 +0100
Message-Id: <20220113233358.17972-5-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

to follow the naming convention used by other DTS files.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                               | 2 +-
 ...994-angler-rev-101.dts => msm8994-huawei-angler-rev-101.dts} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/boot/dts/qcom/{msm8994-angler-rev-101.dts => msm8994-huawei-angler-rev-101.dts} (100%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0f983400d60c..523fe9f63368 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,7 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-huawei-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-octagon-cityman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-ivy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-karin.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
similarity index 100%
rename from arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
rename to arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
-- 
2.34.1

