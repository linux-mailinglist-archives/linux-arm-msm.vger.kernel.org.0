Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F79E7428C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 16:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjF2OrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 10:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjF2OrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 10:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA42E2D62
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688049986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=frkGVo4Jix0SxJdEp5WkIhYt82JsoR95HUu7QuiPKvU=;
        b=gmLs4Hs/HRmpaaoxtOdaL/WTTw0UmNCsnPMmqRRhrrgAB3ER5rGyfFxaKyYHu2vnezXSTi
        Cfuw0bjSe6EZGmIZ/ZY589O+HlooT4Vdv9hJSkOtAaYTFJ/JeiqdK4+dkU4NEkB+9Mgic1
        hvqCLp38BezxwHXK0TZ6iXyN9MjHDxc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-sWi3eL3yNs6dU9zNSf-zNQ-1; Thu, 29 Jun 2023 10:46:25 -0400
X-MC-Unique: sWi3eL3yNs6dU9zNSf-zNQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-635df2bb4b4so8855486d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 07:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688049985; x=1690641985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frkGVo4Jix0SxJdEp5WkIhYt82JsoR95HUu7QuiPKvU=;
        b=gmOPTW3eRCRdB6oDa9hXx0O4AOTv4rIDmKpZTDxMCX6dHRfgMq+oJVKEyc01UR8EY7
         XJR1dS52UPQG9tTk6kI2RfNSE696RXIrUar1no+7C4A6n7Ep4C/ebYT9441xUnqucXln
         88jkC4PFzpzEnm/4s/VjdixFTQ6AswK84yGcXYds+3Vhr5uMJzxkIqEODDIlqXGapZvI
         AtRWt5rVhN51T1s3HwyIiAI7mMAPaed50wYWWF4bXIiIOXlQF9Li6hJ9/9P2J1FhOqBF
         O2ri6OZ+erR0I1uC8IB0KCSHOsw/LGoFwO77XARLA/GdlRloXLPIBGbqVjPTGGykn2Bu
         rkoQ==
X-Gm-Message-State: AC+VfDxEsRbcFEqXmMoh9OKdpQaXKpYZppjRBR81omDRi+4VV6QuK5oI
        rWKAZcUHLG449Xhfia99PnjXzLouSsMbzv3UKWmj+n9nO6IRUPiqpxIq671TomRPv9jvhZ7k6Oe
        MxndgijUYsVEkuztzEpEvBePtXw==
X-Received: by 2002:a05:6214:e4b:b0:631:ed13:b286 with SMTP id o11-20020a0562140e4b00b00631ed13b286mr33755937qvc.26.1688049985345;
        Thu, 29 Jun 2023 07:46:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74djRCokcr0OekNQKJ/UsWDEjH1oj9tvMOrgNFcOaxaU9DKrR6QyWHwiiSm2lavDbeQFZTFg==
X-Received: by 2002:a05:6214:e4b:b0:631:ed13:b286 with SMTP id o11-20020a0562140e4b00b00631ed13b286mr33755923qvc.26.1688049985118;
        Thu, 29 Jun 2023 07:46:25 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ccdd1000000b005dd8b9345b4sm7055590qvn.76.2023.06.29.07.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:46:24 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v4 3/3] phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code
Date:   Thu, 29 Jun 2023 10:45:40 -0400
Message-Id: <20230629144542.14906-4-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629144542.14906-1-athierry@redhat.com>
References: <20230629144542.14906-1-athierry@redhat.com>
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

The return value from qcom_snps_hsphy_suspend/resume is not used. Make
sure qcom_snps_hsphy_runtime_suspend/resume return this value as well.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 6170f8fd118e..d0319bee01c0 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -214,8 +214,7 @@ static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
 	if (!hsphy->phy_initialized)
 		return 0;
 
-	qcom_snps_hsphy_suspend(hsphy);
-	return 0;
+	return qcom_snps_hsphy_suspend(hsphy);
 }
 
 static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
@@ -225,8 +224,7 @@ static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
 	if (!hsphy->phy_initialized)
 		return 0;
 
-	qcom_snps_hsphy_resume(hsphy);
-	return 0;
+	return qcom_snps_hsphy_resume(hsphy);
 }
 
 static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
-- 
2.40.1

