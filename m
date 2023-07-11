Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBFC74F980
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 22:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbjGKU7c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 16:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjGKU7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 16:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758A01710
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 13:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689109112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CvuwAv+s14TExJvbO2C4lPkzFf4n3yORaiUFHM896h4=;
        b=BbHA4gkiSFp38W3GTh5Q6s3A/SlPSWz0A1nBZOQpymyDCFijtWTCrhHJydWyHk1xumvxIe
        vs49D6/jMg1P8RPsF8PPMzQHZNr/QGt2ANxXlHnBALHjDPWuif/JMSBSBlfee0ZkjBp0Uj
        RX5c1YaeivprvBYYGcEqA9AKa6vG4jo=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-U_6mDg9lOueZGsm-80HwPw-1; Tue, 11 Jul 2023 16:58:31 -0400
X-MC-Unique: U_6mDg9lOueZGsm-80HwPw-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-565893ef956so4289385eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 13:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689109110; x=1691701110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvuwAv+s14TExJvbO2C4lPkzFf4n3yORaiUFHM896h4=;
        b=A56km1fG9N+a7NRhCpXJiLd7LDlCuaQFnFZtG1bo0N8teXgdxThNr1yO7GPkOkFgOv
         PX5mVJLiHi9NsJDqrDKMVL4Ty02Eyu207CP7sjRPzNGz3n9HI4Yj3AjXtrtrhOA0SC7J
         Ods9rY5LYA9PIa4dff01LnQy5vnc3cCktWim+d5tg4nSvb9sZ1d9rjZ/pWt4K2fuROfA
         k7xQ0sOtFbtKdpqHtVrOlUynVQZzpraGlgFReXPkdMx5+GeJpB5YLJMcli0ExQPBdN+U
         odaGKfgqPzj+TilWKwLO1E9GPtat1z0kGHQl0zf2/p1SAjgy/kOCjDNWhb0lo6/u45k0
         DM3A==
X-Gm-Message-State: ABy/qLYTrznqcin6HwzEWeT7zrLYgsD740fq8TK8svOrM+ibjkCDuc16
        XtkNybis6g4hH1DvfMM/ykxMMhvd/54YpWaSU1UHrwxaSBcCkvVqFATYQ6upcIklBW6cf0LPC5u
        wnc4xof7qRTwrbL3xsl5oxd/RqA==
X-Received: by 2002:a05:6358:340b:b0:134:c4dc:2c4e with SMTP id h11-20020a056358340b00b00134c4dc2c4emr5573612rwd.23.1689109110682;
        Tue, 11 Jul 2023 13:58:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEDwoVz3zRB6ah8VU/FCjuuuOvOlH20gHcWLu5haldDqXSdHnX1ggzW6h5gC9xUcPFDK+Zpxw==
X-Received: by 2002:a05:6358:340b:b0:134:c4dc:2c4e with SMTP id h11-20020a056358340b00b00134c4dc2c4emr5573607rwd.23.1689109110337;
        Tue, 11 Jul 2023 13:58:30 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id j136-20020a81928e000000b00545a08184cesm785353ywg.94.2023.07.11.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:58:30 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        mcoquelin.stm32@gmail.com, pabeni@redhat.com, kuba@kernel.org,
        edumazet@google.com, davem@davemloft.net, joabreu@synopsys.com,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        bhupesh.sharma@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH RFC/RFT net-next 3/3] net: stmmac: Use the max frequency possible for clk_ptp_ref
Date:   Tue, 11 Jul 2023 15:35:32 -0500
Message-ID: <20230711205732.364954-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711205732.364954-1-ahalaney@redhat.com>
References: <20230711205732.364954-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using the max frequency allows for the best PTP timestamping resolution,
so let's default to that.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 231152ee5a32..c9a27a71a3f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -602,6 +602,11 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->clk_ptp_ref = NULL;
 		dev_info(&pdev->dev, "PTP uses main clock\n");
 	} else {
+		/* Get the best resolution possible */
+		rc = clk_set_rate(plat->clk_ptp_ref, ULONG_MAX);
+		if (rc)
+			dev_err(&pdev->dev,
+				"Failed to set clk_ptp_ref rate: %d\n", rc);
 		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
 		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
 	}
-- 
2.41.0

