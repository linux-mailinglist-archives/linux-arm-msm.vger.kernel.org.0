Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAFE702BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 13:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbjEOLyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 07:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241252AbjEOLyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 07:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F384C3F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684150849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/HfDmifvLEGL+myxWzfdruEc+v2HKRtI9dyoUcoziAo=;
        b=DBCgP3sJ46QefSf0y8Pe+25oRYu/7QjjnpAZNrzp6pp43IpEmWQSKMHfXcLeBftwjHj9yp
        hehcyV08IugMLA1cxz1N/7Grv+iNxIQE5dlYRB7P53Z23Oy3ll3F5Z71WsYltVEEJcI+gx
        9UYv9aT1r/8INyPz2K6dmKRQdlz+6pg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-x-_VsbcOMUmjmVbCYFSgTg-1; Mon, 15 May 2023 07:40:46 -0400
X-MC-Unique: x-_VsbcOMUmjmVbCYFSgTg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-61b5f526a79so171007676d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 04:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150846; x=1686742846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HfDmifvLEGL+myxWzfdruEc+v2HKRtI9dyoUcoziAo=;
        b=YvGl7CVzTQA9HjS7VzSOtpT0ElFK4EJvmX+MRkPUbDsgm/9sqei/vqVVR2Nmb3uZMg
         V1nT3mI0/bO+zHXi+Ag7r9LMYhBxFpUb0EBTZHgj+/huSBSJ9wSnAk0uvA/d8XAa353J
         OnORTZOJfjcVQMutFqjb5BlLGn+aqi3ejZK64Q7AFceaE1H9DAuRsgaQCj3KkysvAOGC
         ODEF8tZ16EV1TP+ftNDQLvCqa+i4gKx0bFP2eibJ9g1dVNtg4rnZNwMIBuY1MeOctylr
         Z1CR1qdEqz0oTrtYmK8ct+0rwdjOVMDo+Ibt9le1LYQghH0+mUcCP2TzqymUtJDhFJvt
         RKYQ==
X-Gm-Message-State: AC+VfDwZDdfZQiNgYVT9vMZ++MGod6LiGYHFtQC0L0DbkI3v/tt32Exg
        kYcUtFN+Plaszckq0IE9MWdDI5SpHxMN5T/iF+SsUFahuvqad43e34B6jPRiLBIOlUfJ/7MUsIu
        WJ2pTW9QLsxW08qVYxfqkvJ29Ug==
X-Received: by 2002:a05:6214:1304:b0:616:5a74:4577 with SMTP id pn4-20020a056214130400b006165a744577mr54341299qvb.11.1684150846151;
        Mon, 15 May 2023 04:40:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64/L+1AICd+CF8YmLfYaYQhL090U6OJPKtYRrix5mOzOc05j2LN9MIevk3HkocPx5eb3HtIA==
X-Received: by 2002:a05:6214:1304:b0:616:5a74:4577 with SMTP id pn4-20020a056214130400b006165a744577mr54341271qvb.11.1684150845813;
        Mon, 15 May 2023 04:40:45 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s29-20020a05621412dd00b0061693e61dbfsm4794108qvv.63.2023.05.15.04.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 04:40:45 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     bryan.odonoghue@linaro.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: qcom: set pm8150b_typec_res storage-class-specifier to static
Date:   Mon, 15 May 2023 07:40:43 -0400
Message-Id: <20230515114043.3452010-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

smatch reports
drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:323:29: warning: symbol
  'pm8150b_typec_res' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 191458ce4a06..937e855a6c4c 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -320,7 +320,7 @@ static struct pmic_typec_port_resources pm8150b_port_res = {
 	.nr_irqs = 7,
 };
 
-struct pmic_typec_resources pm8150b_typec_res = {
+static struct pmic_typec_resources pm8150b_typec_res = {
 	.pdphy_res = &pm8150b_pdphy_res,
 	.port_res = &pm8150b_port_res,
 };
-- 
2.27.0

