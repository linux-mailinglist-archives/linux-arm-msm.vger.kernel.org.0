Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C129600B61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 11:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbiJQJp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 05:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiJQJpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 05:45:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F3731FBA
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:38 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so11865650wms.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2dHjCbjXW/wRyX5RnrOPDvSbncypen+BqayjwLtgH0=;
        b=ruwwVvPzxmGuNEgur7/luWWutqifu2dBdgUNHOuqDcDl99kgGfQmGC8au4U0h4NRai
         LBPtrhA6d0vWQLO2ERsL3tUsAcgGurO5g83PdqvVFdzrZD/jBmG5ivefs1rKJSl0xOYm
         zht8gUV9T2f+RL6J+5z6LddkHDvEdra5MF21R+keOgoF9eJSkDSe+Bm4qzFCEWosy8SV
         zr5hnsS6XTOyxBIpupKIGVVAD+ID9CGzWDvPJiTgHGlWS5Xu5qVJvrWAM8fJlgh0pZJ0
         usDP6lhM5pMi8rjql7tOVIIInfeQbUbHmHnBBSV4+PYwb1Ugh6hBXqvj1/MXUwNSWfaJ
         qGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2dHjCbjXW/wRyX5RnrOPDvSbncypen+BqayjwLtgH0=;
        b=frpTevceiNoZRgykKH6AXVmw9mrJbUDsNJKBM8/F4K5K3DcMJuz8bQe7tmyXoJZXEo
         /YhznSQ0kl7Qhm3j/qlTXDbjBXJQRpqPfJnPv+5C4y+GhArkjV34EmpWirekX/udqIp2
         bzSver2dWIogqQovVtClBKhltKn5ROne/QG81NtJaQa55Pyvi3OGe8KMXYuazrfo3NBo
         KzAramQvSZTT5azbu4053aNJKadq9dRCpsegLOHclNo7+N6mArJ1wNA6w+Lr6MNiVlUL
         lXsYe0BaqRXuZNyLYrkot0q5W6IjamnqI/rmEwZIkew+5OZ/Ke+oBgBNHY/+cSl1XAkS
         XQnA==
X-Gm-Message-State: ACrzQf18lUkYZgtxiaXSGEo5HKhlYwwcMgTzM26E31gbzvT9OIeZJ9Tc
        gXp74c5KGERdMdLUHKe8tWBOZA==
X-Google-Smtp-Source: AMsMyM6aC9lp8jJdQ41ouimX0k2dUuBrxNBvlk/zMrTn10I0Y+5dd5sA9RPPQ+w6Xx6/+IuLzC906g==
X-Received: by 2002:a05:600c:3d8c:b0:3c6:f233:d91c with SMTP id bi12-20020a05600c3d8c00b003c6f233d91cmr6173437wmb.88.1665999936605;
        Mon, 17 Oct 2022 02:45:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d12-20020adfa40c000000b0022ca921dc67sm7824305wra.88.2022.10.17.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:45:36 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 17 Oct 2022 11:45:33 +0200
Subject: [PATCH v3 08/11] mfd: qcom-pm8xxx: drop unused PM8018 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v3-8-531da552c354@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-rtc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8018 compatible is always used with PM8921 fallback, so PM8018
compatible can be safely removed from device ID table

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/mfd/qcom-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 2f2734ba5273..601106580e2e 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -497,7 +497,6 @@ static const struct pm_irq_data pm8821_data = {
 };
 
 static const struct of_device_id pm8xxx_id_table[] = {
-	{ .compatible = "qcom,pm8018", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
 	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},

-- 
b4 0.10.1
