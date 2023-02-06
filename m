Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82AE668BF17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 15:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjBFOAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 09:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjBFOAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 09:00:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6BD274B4
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675691918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=clH41W/lVoNcFLsG24Ai/QiAFITnKECHLPzrN7ce1sU=;
        b=ew8qZxIEt4rviXU1KT6KDEvY52IBVPJaSdOYSjmb0thzNnAuRexu0GnBUVACBupIeu+9qC
        pmvUK43FjpwE9tjfYmJr9dKpL08NjFTn18H2yT46T8PWuwWqcQAd4/24KOa4eH+I3CKzmI
        Mreci+n1gYOCuzFM8n1OsoW/1utl1Os=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-DHTYXYJuMmCX1gzpUvnZcA-1; Mon, 06 Feb 2023 08:58:37 -0500
X-MC-Unique: DHTYXYJuMmCX1gzpUvnZcA-1
Received: by mail-qt1-f199.google.com with SMTP id g2-20020ac870c2000000b003b9c8ab53e9so6431170qtp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 05:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clH41W/lVoNcFLsG24Ai/QiAFITnKECHLPzrN7ce1sU=;
        b=nN3S/JOOQJGHn1ry2I5iykjl/peVFWcqi82sWsjBLTB5ID0627gZNSodV4rXzzZ5Q6
         DYC2u7g8EJqqAGf49h62LlMk6A7atkoZuyhKUKbjT1v0h0E81e8f6dib0Z8OMF5ZPpVI
         DMDn+jW/P0a5x2oP0S2KtsilgzAWOQqn+OuEgI30AjgSmsQ9WrXzZ2wpIi8eh07J+X7Z
         1KJHm1OPNghCIr72eZdbJOtaa/W+8p4KBAgYDP2OjMaMKeCWgHplg3PzPEOGYcROr/fW
         gLgMm1Bae4AwmxGUbuGRibM6vD4HJOp+t4XTd6jbTLnPLX+64Fbl9fvhkMdxGcIhaaad
         e70A==
X-Gm-Message-State: AO0yUKWDzPJycLHa1qycn2WEg1anlLc/Fy59eDNYWAmuMqQhQENlF3Ua
        t5TajFzPZM94GuP9AwIyp/gD36G2z3W9UCyf6IOMlXCYwabTV9YsfsabMgiotXvt816Vg9vkwZS
        Dk8AiZK9J8ladim7HUmskGN2scw==
X-Received: by 2002:a05:622a:1206:b0:3b8:2844:b7e1 with SMTP id y6-20020a05622a120600b003b82844b7e1mr37449746qtx.46.1675691916417;
        Mon, 06 Feb 2023 05:58:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+bmn86RLnryVfY1MFIzgFbcCymjIAPX9Fd5RuvLyYIiTy98IQst+YMd976FBo820Tfz/pXeA==
X-Received: by 2002:a05:622a:1206:b0:3b8:2844:b7e1 with SMTP id y6-20020a05622a120600b003b82844b7e1mr37449726qtx.46.1675691916237;
        Mon, 06 Feb 2023 05:58:36 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o6-20020ac85546000000b003b2ea9b76d0sm7238344qtr.34.2023.02.06.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:58:35 -0800 (PST)
From:   Tom Rix <trix@redhat.com>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] soc: qcom: pmic_glink: remove redundant calculation of svid
Date:   Mon,  6 Feb 2023 05:58:31 -0800
Message-Id: <20230206135831.1794583-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gcc with W=1 reports
drivers/soc/qcom/pmic_glink_altmode.c:223:13: error: variable ‘svid’ set but not used [-Werror=unused-but-set-variable]
  223 |         u16 svid;

From reviewing the code, the setting of alt_port->svid does the same calculation.
Both are not needed.  For debuggablity, keep the setting of local svid.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 71f861b8cb51..4d7895bdeaf2 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -248,7 +248,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
 
 	alt_port = &altmode->ports[port];
 	alt_port->orientation = pmic_glink_altmode_orientation(orientation);
-	alt_port->svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
+	alt_port->svid = svid;
 	alt_port->mode = mode;
 	alt_port->hpd_state = hpd_state;
 	alt_port->hpd_irq = hpd_irq;
-- 
2.26.3

