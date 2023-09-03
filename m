Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656C7790E6D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 23:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349116AbjICVmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 17:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349137AbjICVmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 17:42:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CA8126
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 14:42:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1429712e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 14:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693777318; x=1694382118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fl8gZia3d8uGRSMrCOuo+xZGwzdrHyhk9K+cL7FZyc=;
        b=WTpHh5M9kY04howTyEB8GN/GLm/GKC1zwGchyEUCNR7tihUUiXkVO83OSwPoA89lbE
         WlpYyvcDBWvWB6vsQlANHsA8Enpx+lSFlswXgAT9BAOY9oeMeDOn6z+NMZM23+S4XkPU
         YOOPgUg2ZMC8dl6oEVqE0lqbXCNtD8D6KPmpjYDJNyGOrXayYg9o8hJgD5xLkS64qCf8
         sEIkZNXYcS9Irzhb/k/Sv+AYigXMFbdLBbzIP5ZT4y3x8KUqxW6SFhgA9eDLK2vJBfw/
         C7taRXEotxCJt5eBv/IYqro7O6fODj1/nNKu161429SNm0BkFuViFeKxtKKbEdhEBCrY
         uAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693777318; x=1694382118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Fl8gZia3d8uGRSMrCOuo+xZGwzdrHyhk9K+cL7FZyc=;
        b=ECb/fYo+8g4ScoTNSNpiaxKu1wLqz4BKuLoHKsVXJKYa3PLJKn0YPES7cvSaNU/Tgj
         +EaXb7Y32FGdzy6zphWiSHE1331VnB4C/57MzZyZ2fW7yfREVpUfjrrTtSigvPD32DFH
         u3WucOE/KDv3ucdRqfPjCcMja5Sz1zEcnX5O9jHU5lLhqjZJyZeVx950yCrktfU2yA46
         HxEzsjLhkV6bzPq6+nV96mws+kju+NEw7bahl4KNLmOSNK8fkWi5Gi7Fy71tbRluJvlu
         UYuLFstWTyCUT/gqDvtsfX70Uw0Q2/vB+5uU5nChf4GqV4O/BxKESFOGU7Kvru1lEg63
         EUeg==
X-Gm-Message-State: AOJu0YzFSZEH93/W1W13zSpRdZ2/hg2+tFa9G9KPoKD3idQEhpNAxmCP
        3OuIv4Jrrkq2rUgKypWLIg8s8g==
X-Google-Smtp-Source: AGHT+IFB7g1NLcGbFTo55gFtReAERXtRLC3wSNcCmU3/Hx6wGeI5ha18iUymtWlOuu8WNDnb4g6j1g==
X-Received: by 2002:a05:6512:446:b0:500:9bbf:da17 with SMTP id y6-20020a056512044600b005009bbfda17mr4134008lfk.51.1693777318743;
        Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 10/12] usb: typec: qcom: implement proper error path in probe()
Date:   Mon,  4 Sep 2023 00:41:48 +0300
Message-Id: <20230903214150.2877023-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement proper error path in the qcom_pmic_typec_probe(). This makes
sure that we properly disable hardware blocks and do not leak memory.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 581199d37b49..ceda594a8d56 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -258,15 +258,22 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
 					 tcpm->tcpm_port);
 	if (ret)
-		goto fwnode_remove;
+		goto tcpm_unregister_port;
 
 	ret = qcom_pmic_typec_pdphy_start(tcpm->pmic_typec_pdphy,
 					  tcpm->tcpm_port);
 	if (ret)
-		goto fwnode_remove;
+		goto typec_stop;
 
 	return 0;
 
+
+typec_stop:
+	qcom_pmic_typec_port_stop(tcpm->pmic_typec_port);
+
+tcpm_unregister_port:
+	tcpm_unregister_port(tcpm->tcpm_port);
+
 fwnode_remove:
 	fwnode_remove_software_node(tcpm->tcpc.fwnode);
 
-- 
2.39.2

