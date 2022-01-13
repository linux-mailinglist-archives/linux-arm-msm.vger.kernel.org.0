Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72D448E0F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238228AbiAMXeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbiAMXeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:13 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3666DC061574;
        Thu, 13 Jan 2022 15:34:13 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso5742867wmj.0;
        Thu, 13 Jan 2022 15:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6JT0FxS3j+AciZuFGJT8ttFeOimeOq4hkK9P3+VcTOM=;
        b=XWPxdTz1gxFG9TOul61/6gxPYHqs+v6UzPMHd84IDp5BQvVVD27uhuDQ5EAeyodG3x
         zCOc0hXgpDyyNuro5t6ei+yXbWxKy/c+qQl2fkNIlssQiQiMuSueyeCrBf84pTrQ9Jzz
         8DING1ow8FMV6xkdE3qWRVW5G/4AGFX0wUAt4Hd0s9iB2Q/kuYrOpT5MYs1vMHlAXPBG
         KWRVJWtLDIgTYiH5+8agLnxKndFruMUr/sif1cUWAfV7Eh2kNUKfb8d7niUU1KE1bIA9
         0BF1wE46HmGglxAhlZQc/CS0bWPJf/r70Gs5Hm8+8v4QvfN2XxT2DBUjo3DD5NIKHVly
         CluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6JT0FxS3j+AciZuFGJT8ttFeOimeOq4hkK9P3+VcTOM=;
        b=CnL9OQHpqPF+7kBQ89QbZBGoMd1AmtRrjF51ApQpiG+gGWqUvx8rqPdf1m0HHb9UfL
         CkfNbP2lHkK2shaXcElTeWLBqiFQdXeiZCqHsenp2Dzmf+lgptU1xki3CpVcX1kViSbK
         7WNjgs/3tVk9ebLJuRK7Qohp15J4n3nTo/iDgWEn48l1CHlvIkaXQKecVc0vTM9tbsdn
         qBKqFyqKBaH+CDNoYteN1DmxDTCpZJr9KVIEdQsUfS4FFk2Ypb33F88CGkGeHmc/Feck
         ez2N4vf0R9LQngJd0lJtNP2FY9GW8o3X954MWG/uUqRG/Sc+1M3tCkapYiMUQuvXtBlQ
         LuiA==
X-Gm-Message-State: AOAM531AdYWyT8tF+vGNZBZw6Tc1ejWVkneMTdSbaTIgxeYveAM000A9
        lGp1J3rhMVeUoeLC0EodndOqQg/+MUVq0g==
X-Google-Smtp-Source: ABdhPJxehK/5hveQFvwlmo+q122NppKSe28BeOexxVp0JaLc/CEd92CZ66d2RT/+Wqg/FRqBQ3Gi0w==
X-Received: by 2002:a05:600c:b50:: with SMTP id k16mr5858495wmr.85.1642116851837;
        Thu, 13 Jan 2022 15:34:11 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:11 -0800 (PST)
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
Subject: [PATCH 3/6] arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk" to GCC
Date:   Fri, 14 Jan 2022 00:33:55 +0100
Message-Id: <20220113233358.17972-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is needed due changes in commit 0519d1d0bf33 ("clk: qcom:
gcc-msm8994: Modernize the driver"), which removed struct
clk_fixed_factor. Preparation for next commit for enabling SD/eMMC.
Inspired by 2c2f64ae36d9.

This is required for both msm8994-huawei-angler (sdhc1 will be enabled
in next commit) and msm8992-lg-bullhead (where actually fixes sdhc1
- tested on bullhead rev 1.01).

Fixes: 0519d1d0bf33 ("clk: qcom: gcc-msm8994: Modernize the driver")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 5a9a5ed0565f..215f56daa26c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -713,6 +713,9 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x2000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>, <&sleep_clk>;
 		};
 
 		rpm_msg_ram: sram@fc428000 {
-- 
2.34.1

