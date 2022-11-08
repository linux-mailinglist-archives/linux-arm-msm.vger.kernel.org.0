Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B35620FBD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbiKHMDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbiKHMDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:03:04 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D792CDFB
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:03:01 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k8so20662041wrh.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34uELl7iSr0KkNMrPbDK0p3kOxj5Rp7IXkKhGBvUSAg=;
        b=FCj0qS9DEU91XF9GU6/3CVjhV71oQF+Et5zuA/pS/cIe9ojQbZnfwNRx7EFmp7hBvG
         TyRCjQNgGqJwe6+L75yUR/xe7XOrPKWiqXjoObsPy8JLGK40qYvnjc1orcH+YMw1nra5
         VnFujy8cqUXcguo7JfGiJzjvSYCiAYs5auWGzE3DyUmvHeKC/v0PphLW64buuGR7QLjb
         RZGPBBf3tWMHfKjhHPf+nkYMs7zGB/unm5MGmFBAOv6pYwO8w4b/FEAqntdZD3Lbly0J
         sOgh7XxzZZtc+dVpWv6jzKoim1uiRNG8BzTvX2WAEZdnO2SeYqIyZI/WjITUZj0i4nC/
         71Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34uELl7iSr0KkNMrPbDK0p3kOxj5Rp7IXkKhGBvUSAg=;
        b=oJtphCskTIUhLW9Hm8CG9jFAfYp3vhq/2nnGXrNNPtg9+6pk68zEj4+fBzuztNJjHO
         3e1KS1SK2zbZqFFPkUqa6mMaBgIfF8SyjWgtxQ2maFG0ZKLQHHVAZlGV5NkSRPXSa5he
         /B71J/+Zdd5qg1S+a/kAJ6bvRM6P6eijcAeLjFKOwa6218xlJpk+FzAHcndLVEgVFAzW
         0aZehuCvqc+6M+IWOxpaxnJpCv1kvrpa/PRfLfqpsp7bzGMyE4SUUAM4UXu42XVLWAlI
         h86yH8114nFDvBpZbCqjsw8NUMiLCfN4gKuub3PesxCFj7n8IUSwOWmX4JeVKnXtnNk5
         /iew==
X-Gm-Message-State: ACrzQf3198sBBB8NqI9d+Tnk2p4hTa39OEh+EE6vtTKCgXq6cP2EDNMR
        y9CYrmM4uG0Y/ZHJna8RGNz6mA==
X-Google-Smtp-Source: AMsMyM7K13gbsFzH2YQDtPN8bvUJhHqreRaknylxG4yXs1QpWmAIghwCjAVDLvh7FGZApvlAxGuW0g==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id r16-20020a5d52d0000000b0021e4923fa09mr35961603wrv.244.1667908980061;
        Tue, 08 Nov 2022 04:03:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b0023662245d3csm10056034wru.95.2022.11.08.04.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 04:02:59 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 08 Nov 2022 13:02:54 +0100
Subject: [PATCH v5 2/2] rtc: pm8xxx: drop unused pm8018 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v5-2-bbb120c6766a@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v5-0-bbb120c6766a@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v5-0-bbb120c6766a@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8018 compatible is always used with PM8921 fallback, so PM8018
compatible can be safely removed from device ID table

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/rtc/rtc-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index dc6d1476baa5..716e5d9ad74d 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -461,7 +461,6 @@ static const struct pm8xxx_rtc_regs pmk8350_regs = {
  */
 static const struct of_device_id pm8xxx_id_table[] = {
 	{ .compatible = "qcom,pm8921-rtc", .data = &pm8921_regs },
-	{ .compatible = "qcom,pm8018-rtc", .data = &pm8921_regs },
 	{ .compatible = "qcom,pm8058-rtc", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8941-rtc", .data = &pm8941_regs },
 	{ .compatible = "qcom,pmk8350-rtc", .data = &pmk8350_regs },

-- 
b4 0.10.1
