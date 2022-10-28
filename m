Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C61D611985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 19:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiJ1RnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 13:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiJ1RnK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 13:43:10 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECF622BAFF
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 10:43:09 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q71so5425156pgq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lCS/ZUURVz1YCG4pNVk+KiLqyYD23fxRdWfocVL5sE=;
        b=GeM1PpMU78y0RQ5AoOn8RBhPwx+Q8QjxLZ0EgvXK+5nLlO972d2aJ4BtwkJ7IVgIGs
         L3/lvL502/tIjGrLNX9joh+i5e5tTNImqQtMb1q1JcUmLj4U52eb/+nwvY1iE8Shtv9Z
         cgn56hSBg4dCyUhjfJ2wV2Tg71kWA76as5+7Cy1ieDSh5vBJKuDl5cZX010s6Ql4n5FG
         inHqsPaq/7PcI9z84ASt5vYB/nwPdIanrWbM/zQ3ipc7ziH0bcqy5xCJP393yxTK1Ei+
         YlmXXQXxrqYahb4hO9HCnC2dG6YewofBSSZ6eioIYtX3DF4JXPhBnxdkyTFlnlGFkuGq
         6qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lCS/ZUURVz1YCG4pNVk+KiLqyYD23fxRdWfocVL5sE=;
        b=zuY5Xgi1Q9bqWconl1mrrDcav8pZV9Ngu0YVGybMwzji1vlb2jMa+UJNNARusbVa4e
         m6kI+K6gc+OLm6JhVgxtpvW49vb83ypN16apl3LEsyHdAQZxBeDyNPNft8NLyTLL/dpZ
         ESF1MUKcmGED68ywFTkpjbDb+pk4/4vSstzFNaGp8n9sLc0z1hLBhDmVYUK0pxsvXCnc
         UwrYNUswBHujW0kfOUujG+WeEj4G+MGu+YB2Bt3DDJLp3+HTJgD1f4x1RT6l1M27GEnu
         2LiUsMr8ydWZ3Apu4MH8dvQ7zHRIV8S0gcc9l9TpjdffuA+2LGXrUMBhwyxXOnOIFF0N
         +zIg==
X-Gm-Message-State: ACrzQf2PeiUQlKvL2/ozMbRdgvA8eh32AR6k/+6njIRNl0Dj3naN3mXl
        HqJoJzIkwOr/5Fg8pXLzcyLJ
X-Google-Smtp-Source: AMsMyM4I97Tuks9zFgFeNlC+dT0Lj+6zfOD3GS/7jyrVxydlSI5w7qyDW9LZM9xOAR5uuuf43M2h4Q==
X-Received: by 2002:a63:2b10:0:b0:451:5df1:4b17 with SMTP id r16-20020a632b10000000b004515df14b17mr549658pgr.61.1666978989030;
        Fri, 28 Oct 2022 10:43:09 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id y14-20020a17090a154e00b00210039560c0sm4462499pja.49.2022.10.28.10.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:43:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Remove Hemant from MHI bus
Date:   Fri, 28 Oct 2022 23:12:57 +0530
Message-Id: <20221028174257.52525-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hemant moved out of Qualcomm and expressed his wish to not continue doing
any reviews for MHI patches. So let's remove him from MAINTAINERS file.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..ad9279218885 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13395,7 +13395,6 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-R:	Hemant Kumar <quic_hemantk@quicinc.com>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1

