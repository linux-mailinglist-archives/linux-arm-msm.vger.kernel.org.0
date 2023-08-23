Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94A7785E57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 19:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237758AbjHWRNh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 13:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbjHWRNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 13:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF82E67
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692810768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qp4RdEnnTC5xvkWmLF44PstbcAOtN7ar952PgUn8Uto=;
        b=aHBbqt11n1044LpFFxbvY7OEHOCV+0hl8RA+CgtbfoWcrWPTVod0hCS3Vm0mh8TfnlY5+M
        Xtk6zOAinlzd9SQRoaWih2tHpkpk1BweBNMlkA50cejj4zGc6AbNKmSYY2ZpmMLHiNB2YA
        tj4X7iY1Qdka+a4B6f1H8sVuUEWZ7G0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-H4XXwvJJM96aVgRoapAm1Q-1; Wed, 23 Aug 2023 13:12:46 -0400
X-MC-Unique: H4XXwvJJM96aVgRoapAm1Q-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-63cd1ea05d7so572656d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692810766; x=1693415566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp4RdEnnTC5xvkWmLF44PstbcAOtN7ar952PgUn8Uto=;
        b=i6KNb2iJ/uQy6Q5ORfHIhN3Aw2jNXPlTYvlRSpwMcizwc5jVMVoqSRShIhRU26S7L1
         fnT/E6cGbwGzoaeLJq5GcdMfeY9HW2cYWMNSA3dDsbGyQdWHjtnh/ZZWXFuytdJ5gjPn
         wGyy7wiYQHzRxkcc8JAUp42J8cK6WofaxMJaK3URDLV9LmNPNl7M7giKk7jzlx3ETVzb
         g3YayzcXKFDaQxjshQYplK4r1IYRY3rcZK7iNBKJmClwKlxwwFBWTRjlzmXB+vA34iYe
         avR04h9rQyKpfxAYTP3GP7S+TdPv9VZDdCzJZRpv0cdClELnuPC7lJKS2DS2bLx9nzi8
         643Q==
X-Gm-Message-State: AOJu0Yx12EnqOlppRqbKr/glBMrA8Q6Meh3g7sam51n1lX+2Gx26Q7kn
        D+2S3/xrOEyhn8lyNwSnufiW0IxhT0cAwo+0c2mRi1tubVywnRyy5QR1PBRhq7xRffzDbD83HWY
        87mm5ss8ceG57jV6MbyTqwicAIw==
X-Received: by 2002:a05:620a:4411:b0:76c:b7f0:2bc9 with SMTP id v17-20020a05620a441100b0076cb7f02bc9mr16526204qkp.16.1692810766076;
        Wed, 23 Aug 2023 10:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFijETF/QBal13dY4JCxSoiAz5Wdp9YfPUCZRSIbi8XM8ZuXXa9y7nQNuulElzOsLHKe1tZXA==
X-Received: by 2002:a05:620a:4411:b0:76c:b7f0:2bc9 with SMTP id v17-20020a05620a441100b0076cb7f02bc9mr16526189qkp.16.1692810765863;
        Wed, 23 Aug 2023 10:12:45 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id x26-20020ae9f81a000000b0076ca9f79e1fsm4056361qkh.46.2023.08.23.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 10:12:45 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 1/2] phy: qcom-qmp-usb: initialize PCS_USB registers
Date:   Wed, 23 Aug 2023 13:12:04 -0400
Message-ID: <20230823171208.18382-2-athierry@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823171208.18382-1-athierry@redhat.com>
References: <20230823171208.18382-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, PCS_USB registers that have their initialization data in a
pcs_usb_tbl table are never initialized. Fix that.

Fixes: fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate PCS_USB region")
Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 466f0a56c82e..ccbe64f7897e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2233,6 +2233,7 @@ static int qmp_usb_power_on(struct phy *phy)
 	void __iomem *tx = qmp->tx;
 	void __iomem *rx = qmp->rx;
 	void __iomem *pcs = qmp->pcs;
+	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
 	void __iomem *status;
 	unsigned int val;
 	int ret;
@@ -2255,6 +2256,7 @@ static int qmp_usb_power_on(struct phy *phy)
 	}
 
 	qmp_usb_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_usb_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
-- 
2.41.0

