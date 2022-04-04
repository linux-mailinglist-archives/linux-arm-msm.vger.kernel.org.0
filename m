Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1915D4F0F8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Apr 2022 08:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377541AbiDDGob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 02:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352121AbiDDGo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 02:44:28 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5472F2B25D
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 23:42:33 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id l129so7567567pga.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 23:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PegN0LY73qhaXEJ51OmllBB8FerysE5PYKx9aPbALwY=;
        b=nez2g3GyxqQU5kecDLhnZpTR9ZGLVFMT63horZ9s4lHNE+NaIQedEh1X9iN3+K54kC
         o8jQuSoqN3jcn+f61rJS2PthoEhIj3rkQdWSUfPzlBNqMldPOGH6ee9Q/veMqeHGN/Zo
         FvMcJP0NDOR/uL53JSTQ3akA09/SAY06DI3o3LqAPyp0WsW1OnRYa+X19vZd0WLIwvT6
         GplsXkIZ9EoOvoXFX9g2hwB9/UzNJCXh0erZtQwCZfoNX8l6/HdoAdgcx5HZTONV5ngv
         RlTnx1Y551M2SvfV0eB5OfMMgGbfaY8oObwqxkIc0imdZhXbSi4Bs/fz9RRTZ/S4yROu
         HAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PegN0LY73qhaXEJ51OmllBB8FerysE5PYKx9aPbALwY=;
        b=aY9hcHYPJABk0V7tKnhipN43ZB4sWfmJKTjXs1pyltnbHYktTW4pXkExMmgSNhaxgr
         XvVrLxBwvrVxlTdjTGvQeNC4wg0IJXq6medix8LHHL+3DLGqVK0c9CIPk0dlpaKEigZP
         73uLmCCUEExd2+j010Yxtb1USktFqICRKXy6k58OTbzBRTvH9w/L6MnSLoIimv3zczk8
         woDso0aLJH3HTKYmj8rQY4UjXXGbO0EZJRSiPPmbjUzvsWx4LTBavoVDJ9A4pOtiM2iM
         IX5XzQLFH6k3Fx1/3gKn/gRoOjWs4cqjqK2W7gTZRj8mTCFuaaHtDHB63yljQrg7Yjp4
         5xIw==
X-Gm-Message-State: AOAM532pLN91O8pNKWBKGYjIBCrR3xHhJCUCakvi2+5RuXGDpv6UkuoB
        d6MEa+x8rIFK2MLZf8O1f4LH
X-Google-Smtp-Source: ABdhPJwFU9KB4YkxChyoBR6qa6Aaf6OQbEbszzcy5A4KksDZTTDkHkZp8AKiclccEJ9hyM6tn06cLQ==
X-Received: by 2002:a63:9502:0:b0:386:3916:ca8e with SMTP id p2-20020a639502000000b003863916ca8emr24408663pgd.357.1649054552805;
        Sun, 03 Apr 2022 23:42:32 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.184])
        by smtp.gmail.com with ESMTPSA id s3-20020a056a00194300b004f6664d26eesm11071070pfk.88.2022.04.03.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 23:42:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Update Hemant's email id
Date:   Mon,  4 Apr 2022 12:12:26 +0530
Message-Id: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The codeaurora email domain is no longer available for Qualcomm employees.
Qualcomm employees should now use the new email ids from quicinc domain for
opensource contributions.

So let's use the new email id for Hemant.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..d714313d5cb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12793,7 +12793,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-R:	Hemant Kumar <hemantk@codeaurora.org>
+R:	Hemant Kumar <quic_hemantk@quicinc.com>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1

