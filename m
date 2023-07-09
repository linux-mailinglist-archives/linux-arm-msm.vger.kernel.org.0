Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92FC874C7F3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 22:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGIUCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 16:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGIUCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 16:02:40 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1F2FE
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 13:02:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso60215291fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 13:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688932957; x=1691524957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCcj07yvsLCgStmlHgG/uNQV/0r0pToqwEhw7f3W7gs=;
        b=C3GEHCjRKLUhz6+3uXo5hOlbMFAcI2l8LNwNnFLqm+3wcfHlPHpnLXz3qeS8JFwf/j
         IaY+LWCFQ/RIpOJM+XAR+cyoKclYDsy5dhXtj+l/TnuuRhK4cr09OiJiO1ji4PjMTPqJ
         qc1KgvrwF8sN/9DSnthx8Js13z6m45pbWJ7Nmx9qdIB/PiVatI+8uHbM62K7rUkQ5avs
         aOvWPvQppcepDy5L2POPpqQ1Tq6hSpv60LgYVBdfJ5ULuTUvkisWzXpzy+BY7LtKIgR9
         kfhlEwd4/ehNBX+2eXRbwD39vXfr7mqmySMC0Gdh7lvOxQ+zlYG0BDfzGPRVWxU+Bmw9
         8CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688932957; x=1691524957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCcj07yvsLCgStmlHgG/uNQV/0r0pToqwEhw7f3W7gs=;
        b=Xsip2ylBGdUgzl/HyzPH9pXPHjKCxDb/I0MJgbuPKqjNDQ77MS5c8ID2pubFaIMNja
         UGaWEx7/CB6FPnAvUcjcrW1uduDc6UtqQEMn/5NqREs6Lr8EFNIo1ywakC0ustAnA6zx
         a1zpNYuqirGwMRoM6w8LWB5plQvL8t1u/1AiS7yAy2nseKmaxG/09023CP3yqkkEuLOF
         ri1mPnHjcnTbqGnpznVP5vtkmX7EiR7gwzx9KDOpLx0CNQ+9BBkkVrCTVlI41wahj7td
         NIsT6fB8BKh6z6tprCSYJU3ypGP3FOMBFHHxW4ru7GtLSROR8llY0pUEfzYqFBDBKHJP
         BZ4g==
X-Gm-Message-State: ABy/qLYPRDMbNzvaD/5AVSEurUZkn78g0r8yIrqQs0NDEN0/XxbqKLjQ
        Ml01OWPRsdNzh0pWu6FiHUqKVw==
X-Google-Smtp-Source: APBJJlGJj4K51WW7zDaRKwaOtxeXigI0fGuJqg9z0pgryn7DFxU0GLT8MRXrvx+ZfUSp23l3Ay+Skw==
X-Received: by 2002:a2e:3606:0:b0:2b6:a057:8098 with SMTP id d6-20020a2e3606000000b002b6a0578098mr6798509lja.0.1688932956707;
        Sun, 09 Jul 2023 13:02:36 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id c6-20020a2e6806000000b002b6cba03427sm1689580lja.79.2023.07.09.13.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 13:02:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: typec: qcom: properly detect Audio Accessory mode  peripherals
Date:   Sun,  9 Jul 2023 23:02:35 +0300
Message-Id: <20230709200235.265674-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Detect and report if the Audio Accessory device has been attached to the
corresponding USB-C port.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Fixed typo in commit subject (Bjorn)
- Removed 'the' in the commit message (Sergei)

---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 94285f64b67d..56df04af2d2b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -214,6 +214,11 @@ int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
 		if (ret)
 			goto done;
 		switch (val & DETECTED_SRC_TYPE_MASK) {
+		case AUDIO_ACCESS_RA_RA:
+			val = TYPEC_CC_RA;
+			*cc1 = TYPEC_CC_RA;
+			*cc2 = TYPEC_CC_RA;
+			break;
 		case SRC_RD_OPEN:
 			val = TYPEC_CC_RD;
 			break;
-- 
2.39.2

