Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E7B6543FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 16:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235276AbiLVPN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 10:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbiLVPN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 10:13:27 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB78DA0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 07:13:26 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id v11so2168096ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H4m/wf/HMSRBe+V8hTigy4zAd13cLvfwfrASaDiTjU=;
        b=d43RMO3xDPnI5+1xSTx6QhDYpCyGIVMvdnrR20AM6yCbyVJm9TcCPJ4c/gR6dKcZz8
         EYq2/FaQfOM8snzdO9BOErim5FFSavzjuiDu1zQOay2cyggmrpxjsotrpuPUFV4AQTna
         H0RqbdN93sU1purKS2MIJw3t276LbUPincXQltDr+03PUxaEy3EG+cRVlaal1Il59e0x
         qQxdvHuSrBHWBzfml2gzZDJCc56MkUxFEjWzwc4y+6YuhjI8OD0A83z7U2iBnRXGN7iy
         jOmkXPKYCdlnrmh+E026yWnlxEki7/mqxdvscoQ1A4B2XPotgFifuGbWZm2lp4xI982s
         o+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+H4m/wf/HMSRBe+V8hTigy4zAd13cLvfwfrASaDiTjU=;
        b=26Wr2533cS4sTLNVKsGmj7aJj+6K/6GM0O22mFuFtitlIqfQTcP2cErbgDeu5YeSVL
         QnY+eT52x/1r3cc5BznwaZjKQf5pxYYiZKgVDPuBcR8Jits/DdHwfQOXPNPO1epfxzCW
         UwYGjpKxG9wqEt0KbNghhklNVmeRIYsT+UCO30tmrb5eW5maKdVckDA2KEKs2x8tmYN2
         Jnw3/WXiQyUinQCDGVufhSuRycIWjSV5HWaZWYCcEHodzbQgRmiEdJXpFFsqYhCPRwqr
         DdEuTlQyJh3601OhcCgoEBJSYIDR7Fm8ZFnvHceFrt5s9+OIvXLBKLjqpF5RU1GWYtVo
         Zg4A==
X-Gm-Message-State: AFqh2kpkDIycdPIBE5zHRn1licUt39VKFYhRo3PpbQMB9ggYZ5fWiiC1
        cBKruKQe/ad0e9sef+l+Ouxnhw==
X-Google-Smtp-Source: AMrXdXukbgWHJ8eXS4Y+iIbxXiXx7WDckPMMWlAzb/kDkAsKcE2fYrb3QX5hB0X7v+oiW3YaV8Wffg==
X-Received: by 2002:a2e:3c18:0:b0:27b:5080:d03d with SMTP id j24-20020a2e3c18000000b0027b5080d03dmr2061095lja.10.1671722004931;
        Thu, 22 Dec 2022 07:13:24 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b004947a12232bsm91269lfo.275.2022.12.22.07.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:13:24 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH v4 2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: fix audio codec interrupt pin name
Date:   Thu, 22 Dec 2022 16:13:17 +0100
Message-Id: <20221222151319.122398-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org>
References: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pin config entry should have a string, not number, for the GPIO used
as WCD9340 audio codec interrupt.

Fixes: dd6459a0890a ("arm64: dts: qcom: split beryllium dts into common dtsi and tianma dts")
Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Doug Anderson <dianders@chromium.org>

Changes since v3:
1. New patch.
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index eb6b2b676eca..85b8a1b5f0d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -472,7 +472,7 @@ sdc2_card_det_n: sd-card-det-n {
 	};
 
 	wcd_intr_default: wcd_intr_default {
-		pins = <54>;
+		pins = "gpio54";
 		function = "gpio";
 
 		input-enable;
-- 
2.34.1

