Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271433969A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 00:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhEaWTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 18:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhEaWTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 18:19:52 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736EDC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 15:18:08 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so12351308otk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MF6dhyMCYylsS7HK8UfiiNsP4nzCYur3oF76D7ZNMTE=;
        b=ICkK0DtlmKNq6O84NF+eZeMiVbPqDEgCyxh19kEgWOFr4AtZtaSRGMbMOgJiDbeG1l
         iastI+GpDbWp3YLH1tK6Wxww7adNvQKXdDkusBiT4cMopTBXKU0JcQngZ5xEmxayJuK0
         l6CP/wB0OJbRh+H84gVPiLiOcPpIXmMz8okPFYBbe17oVnkbMJTM/6LX2dU/96m4tncL
         JnNAWR41K+0xxhPzQuJLrs/bLzjV0dIRpKNKBV2v8r0f9ionNm0frFVfBmDEJrg5qKSh
         rrc2bQ4Iy6uYyYTf7fr4wuzqx0fNcn+sn6scqKSJ/etiwBfesb1VpxwITKPE2iHzOyLi
         xwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MF6dhyMCYylsS7HK8UfiiNsP4nzCYur3oF76D7ZNMTE=;
        b=f6MT+yHieK/Or56rsUfcEQJF9M9vheYwE7qGDFOJoke5UHrVLO/MbEnIMxMF2TTyGY
         kPaiQ+A4OB2OeVIQ96kcex5tOoQFW2fmcnm0CFVG6fMiumWFItxKqAIAyCgZ1jLV+y8H
         syB182hy2ybibQOtBOoUf3MfVuT3/Os+gncEroukKc24uOLrkgUYCKtC+aBv3a/uupK4
         Sz6eTztmwycmmq8F+Qj6P2kXEj2PoPTeyPe0L7gCr3fMOHhcGEAdOOdVY0VcJsfbv4im
         JCfMX2xtmDraik/ABveMyDO3WVSkcNHIWXt8eZ9yDuVjcbPaUtuM5bsZlVHreGolLV6b
         AQFA==
X-Gm-Message-State: AOAM533Xoie/9r3assImJR/LWPWrn39Q6cX5l0EacVcFCqVxwot9SzAE
        HmBym/maS4YO1pySkiNiGHndOA==
X-Google-Smtp-Source: ABdhPJxYlIGU0H3YXBIQ7GhAXs8y3l/HGd74DIm13Lylqpq3Z95oGQ2gdtjHzH8pTOwcPc2dKN6OJg==
X-Received: by 2002:a9d:6ace:: with SMTP id m14mr18316615otq.207.1622499487874;
        Mon, 31 May 2021 15:18:07 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p5sm3043829oip.35.2021.05.31.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 15:18:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add dt-bindings to mailbox entry
Date:   Mon, 31 May 2021 15:17:30 -0700
Message-Id: <20210531221730.627149-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MAINTAINER entry for the MAILBOX framework does not cover the
dt-bindings and as such Jassi is not among the recipients for such
patches.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8648ee43199..c45c316eb02c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10904,6 +10904,7 @@ S:	Maintained
 F:	drivers/mailbox/
 F:	include/linux/mailbox_client.h
 F:	include/linux/mailbox_controller.h
+F:	include/dt-bindings/mailbox/
 F:	Documentation/devicetree/bindings/mailbox/
 
 MAILBOX ARM MHUv2
-- 
2.29.2

