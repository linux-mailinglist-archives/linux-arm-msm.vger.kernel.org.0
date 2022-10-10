Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5974F5F9DDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 13:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbiJJLqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 07:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiJJLqc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 07:46:32 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAA15A2FC
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:46:29 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id hh9so6272166qtb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSfv8ucux5cyFw8d1btlWFWxGgS3qmoczNmcwaSNdfg=;
        b=TeGgAZplfwDnGyiTWMCStRQtwXIgGDPtpQpikX065xrYSn7BEvzVxYyrSlGNP1Z44r
         qmQ4I+9nsUi6VbCNV5WhglP9FTqyl7d2FG26JOqZLqD90bV1spcgnbNT9ZeZlmM/HomQ
         f6sX1Tw6ARHNbh8SBrohvdjTy1cRiebS/RkYATvDwcwdPER6w5Tr+Tcs9Qm4O/4bz9X4
         GrPhhw3BptH6ZE4ZdlhVc4j2MJFQEWyk5ezd1PghdGuXxr6SyqtX7lKteEbq137ckN++
         O75W7u5dqle4aQc43vf6g9tXLKIe26reVhLuGr9A6gHubBvFyCYu5DZa60KFy++f2vBx
         PwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSfv8ucux5cyFw8d1btlWFWxGgS3qmoczNmcwaSNdfg=;
        b=LKdHOvAFWCAvhqCQvVOFyf8oLYK5ccBgEJxa3z8N/cRXC9KyMsIK8LxC7/NoA2JADI
         IRYegT0VGWf4/ASmzCST4fcbbhlKFx2eYx3oyVYujFAa0g8iYLoybVmlkqfNugI8zV9Y
         Hcvi0DGbLnxelK3N6eUzE0SKjXSENZrlYq6vUYRuNuN7uei3aLkEP10MJr8EIPxHp8ti
         /HVaMF4oRqFAlccEE8ioxAte843Ic/2L7/zxxTOvz/gO1cYt6jYqffgz4AmlPmO9+K24
         flxrR2ZYRp1cnRllnHDwzJB5OiuxRlWvhPzo51dJt+gcL8CIke60i/hqQs5CfFjF623n
         p/JQ==
X-Gm-Message-State: ACrzQf0a8uD0AO3cdqXcRZamT1E59j19sHQhYeeF9e7qoUacVCIGsZZa
        2Ibry27ipyVYN53l0AWSs2jRjw==
X-Google-Smtp-Source: AMsMyM6IIJcHXbQtCcMCqFfbBcORQVnr679cB2McsDhQzs1g0GiKTPkA+PuokVpHKFqIl0NXZmqlVw==
X-Received: by 2002:a05:622a:1a20:b0:35b:b6ec:7524 with SMTP id f32-20020a05622a1a2000b0035bb6ec7524mr14694506qtb.341.1665402388278;
        Mon, 10 Oct 2022 04:46:28 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a178c00b003972790deb9sm6698707qtk.84.2022.10.10.04.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 04:46:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct I2C12 pins drive strength
Date:   Mon, 10 Oct 2022 07:44:15 -0400
Message-Id: <20221010114417.29859-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010114417.29859-1-krzysztof.kozlowski@linaro.org>
References: <20221010114417.29859-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pin configuration (done with generic pin controller helpers and
as expressed by bindings) requires children nodes with either:
1. "pins" property and the actual configuration,
2. another set of nodes with above point.

The qup_i2c12_default pin configuration used second method - with a
"pinmux" child.

Fixes: 44acee207844 ("arm64: dts: qcom: Add Lenovo Yoga C630")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: Steev Klimaszewski <steev@kali.org>

---

Changes since v1:
1. Add tags.
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index be59a8ba9c1f..74f43da51fa5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -487,8 +487,10 @@ pinconf {
 };
 
 &qup_i2c12_default {
-	drive-strength = <2>;
-	bias-disable;
+	pinmux {
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &qup_uart6_default {
-- 
2.34.1

