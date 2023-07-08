Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BBF74BF4E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 23:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjGHVgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 17:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjGHVgW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 17:36:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767E9E48
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 14:36:20 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso4488440e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688852179; x=1691444179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HOgsyFnmRLb7BWgjXvFqhyfaAqjUxbRkljfWv1FMJA=;
        b=RfYfDYsGQ0khx69JPIk83zN4PIYqncMaqBWW9xvvva2JFSCVF64Wt7+BCvH8HtuPfp
         Oxv3xQYLlfCQcoQ4mm7uYegK3zJeGRwRj7JfYM/n9UwlHArgqOMwghc82yMH1eMXkcSI
         E4Ld3sCTuE8fKaQokZ3VYlFMnns4ij/qkX8mqKJ/mfOWHYrbB1G5F1TrPCm/yeoLvH0U
         EIFMtbA0CBmCClHmJeHfc9g3+PJxzi6Jpn9KHx9LWs/n0ts2G7CetwKWMn/X5ADTVdPp
         +C7Vt4LEf2vFcjJYmFeXN+0LLk11DH+RrfJIfwpsE//4ys1dnGHfwzS5opr4++mmbuFU
         jCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688852179; x=1691444179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HOgsyFnmRLb7BWgjXvFqhyfaAqjUxbRkljfWv1FMJA=;
        b=l85Fw6HVq/EOo7edKJfjWhEfe5GM56KncfrcKeHHkovE46yTx0JpiqGGOvwuRt8GhS
         kUkRvFAQEA6kQVgd8asBGQB32c98b3HyNqXsBzPi/uwMZ/CZZhYQAnhkQLHo68UJyPPN
         Y/m88NtJGvWA7+s1lNViWtPTqy3QMizKW8nYAnA7znfTtLWZvzvFvCiCT1NWisqcSRQn
         Ln4jTPYZRc23P7Q8I/WyG2AYgNtjTyL1751q3IVBmhocCafBJ+5iFfyfof+zlLiqmUyH
         o4S2xAUVvo0swzhgCHHqOJZEQSj+CWxJvcZ6FA/KnLP98km+mSNwf5UlwtdFZVG17oJl
         zaLg==
X-Gm-Message-State: ABy/qLb0gkSoz5Oi9/qt0QsgRzX+W4Mg3XlR325aVTI2EpowqeB1zvMj
        90cvhzPJegrFipIfWCD/NC0IEesx9fmF3dLiW1w=
X-Google-Smtp-Source: APBJJlEORJJUVbpbOK3EURKdHdjF6CLPwNtiinaNrr6Ye30x5Mu1hYVfuyw6Jbd6qZgladJ+1LhG5g==
X-Received: by 2002:a05:6512:1187:b0:4fa:b380:4c03 with SMTP id g7-20020a056512118700b004fab3804c03mr6715844lfr.56.1688852178622;
        Sat, 08 Jul 2023 14:36:18 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id q18-20020ac24a72000000b004fbd0725d1bsm708032lfp.105.2023.07.08.14.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 14:36:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typc: qcom: properly report Audio Accessory mode
Date:   Sun,  9 Jul 2023 00:36:17 +0300
Message-Id: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Detect and report the if the Audio Accessory device has been attached to
the corresponding USB-C port.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

