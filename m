Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E7F73A911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 21:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjFVTlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 15:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjFVTlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 15:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38711A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687462845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MWrDFCHsqN4+5MSAzLCn1UT7GF/+NLROeJoU0j89xKo=;
        b=bA8OFLJH8+0lMEJj9Vxwwe6fxeNXye3bCU9fg4Cp0HV+Vp7cUmvPArutbBaVslHXgD0+4l
        a8EcJy+DieB5IfuajukvrzhTuPfHtC6RQRDL+UGIKV3WBVdQ5cQQQPs43qFFyVpup9rX7l
        x2zQjKqyOsQm0DhEvKZhuicFk6rG7H0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-zElQo2liMQWwGpttbHNYKA-1; Thu, 22 Jun 2023 15:40:42 -0400
X-MC-Unique: zElQo2liMQWwGpttbHNYKA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-62ffe2b9faaso74790326d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687462841; x=1690054841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWrDFCHsqN4+5MSAzLCn1UT7GF/+NLROeJoU0j89xKo=;
        b=JROLXjGkJFfAXawbrh7Zy2uIWddscGlYtmruOMEIfbc9gUb5YHwGprKVdAPMc4+GM0
         q0CufzpvJT52VWE6a1Kdkj2pdgMQm4Q/82lxehd1a476Gqv8l14LAvyQaAS9sgolfFPI
         97Xkz48AdsosEklgKWMgcOAZG95T/ciDnCU32b4GqsirlfQSWvNixkW5JHJTmvy/oyVF
         Xe0ZFXWYbpBpT6L2KLhRF2xBqDf8s/L+XdA18Zm6bX2W6Ze0bcRj9ak1ETl9qntOJE2d
         k4LxWGCsXW9/X1h0xmr6xStdqc72u5MMf16TyOYGYEh2G5aZUZ0kQ2rJzpr9wtzgXVF7
         dqmg==
X-Gm-Message-State: AC+VfDyCYbgPGVy2Kdm8H43yOtzP2l3eGrtvJ4SooKbU5MzfdOkuBtsp
        4uN8AF7qiJg7vf14zABy32Lyg5zOqHpoLzhgMVpZrSyUQPxWSWKpYnC/kH5mi+SirAZN58tp1LI
        xHid72FI4mT0j77l1G3Kpe4B3HA==
X-Received: by 2002:ad4:5945:0:b0:625:bb19:278c with SMTP id eo5-20020ad45945000000b00625bb19278cmr21175179qvb.2.1687462841470;
        Thu, 22 Jun 2023 12:40:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73yfvqsiPyuOtABnb0j8eIwVwowAAFand2k5OPq2wcWipHS01G81L+H9yJSu96nSUjf8KfOw==
X-Received: by 2002:ad4:5945:0:b0:625:bb19:278c with SMTP id eo5-20020ad45945000000b00625bb19278cmr21175163qvb.2.1687462841144;
        Thu, 22 Jun 2023 12:40:41 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id jo30-20020a056214501e00b006301819be40sm4174183qvb.49.2023.06.22.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 12:40:40 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 3/3] phy: qcom-snps-femto-v2: use qcom_snps_hsphy_do_suspend/resume error code
Date:   Thu, 22 Jun 2023 15:40:20 -0400
Message-Id: <20230622194021.80892-4-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622194021.80892-1-athierry@redhat.com>
References: <20230622194021.80892-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The return value from qcom_snps_hsphy_do_suspend/resume is not used.
Make sure qcom_snps_hsphy_suspend/resume return this value as well.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 378a5029f61e..6be8b5218aaa 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -221,8 +221,7 @@ static int __maybe_unused qcom_snps_hsphy_suspend(struct device *dev)
 	if (!hsphy->phy_initialized)
 		return 0;
 
-	qcom_snps_hsphy_do_suspend(hsphy);
-	return 0;
+	return qcom_snps_hsphy_do_suspend(hsphy);
 }
 
 static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
@@ -232,8 +231,7 @@ static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
 	if (!hsphy->phy_initialized)
 		return 0;
 
-	qcom_snps_hsphy_do_resume(hsphy);
-	return 0;
+	return qcom_snps_hsphy_do_resume(hsphy);
 }
 
 static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
-- 
2.40.1

