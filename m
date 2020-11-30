Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A3D2C8992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgK3Qav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3Qau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:30:50 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C76C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:30:10 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id f16so11818204otl.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2/Og2IOPDJsBgw01zFHUENyZf1mtmRivApUUrpN1Uw=;
        b=mIOhlHdD4JGHnPaM2Ui7/TsfhjGK0yN5VUdSdxW+YlWW8jATL70TP6LIbPjtVVEf8z
         G9r8p1aRZg4hu4fySJAYjhYTsJsAVFpyFsbpU2qQ8snt3k1hWhcE5hQpBjLb4PDP8y2W
         br+h9fCpHRw4lCe4Q1sLNED32HwkUcS14x/sSH673XVroduyjMj+nGy5qdGs/xIOhUqY
         IdfPJgvz8Sl+oJ/NrmDksbTOXr+3j9Nopvd37S4XshesXntNNr1wkkH6qkbYNX1UBCPc
         I5TyFK/ta498nYa4RenzkWZc2eW80W2ggdLmHFFEvkOKYKIF3YCGGlTjr4lQ0yD1rPxA
         slbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2/Og2IOPDJsBgw01zFHUENyZf1mtmRivApUUrpN1Uw=;
        b=o5YPXXzz2o5iwdMLS54Vv/v+TNg9m6bTdcaqWVIfipsGtKvOyTSGQaNuKSu33IMYMY
         MNvR25PQOHHelImRhqUyyOyOOIYbqb7ZLr0gW3KHS0U1GCT8wOqfDAeeBaNNW69cdYSL
         j2uTv1acg1S5VLMCgAfmBHMZtdXSOSSeoWsXozQJE5L+QODXWkw5dntGXoqoUV+0doQV
         JMhQvNwgy3tDZ4IjXxbCDEpWjQSi8Zu7xrSWVoglKmmAIsBct6C73cG+xL5Jm7WRYUGz
         0L0frX3TS/YYGtxX0nNb3MbVMeeXv1z37eW9sqsY7OF6vPv3rmLkq0fWozsvHwCQ0lLC
         30Fg==
X-Gm-Message-State: AOAM530AFT7NbeGi3BzuELdvdJLZspoDzu9VhsOM6NN6tGdZJj3KerTh
        l6ietp300lJraTSqGrIrK+QddQ==
X-Google-Smtp-Source: ABdhPJzMnycX7PZAZIl54pfYZHBOJAyj3DKwoPY/lSTop4KeZzDa3E0lHqXhGDL9nN+7a7uIps3WbQ==
X-Received: by 2002:a9d:4806:: with SMTP id c6mr17415207otf.66.1606753809434;
        Mon, 30 Nov 2020 08:30:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e5sm8957632otl.75.2020.11.30.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:30:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Steev Klimaszewski <steev@kali.org>
Cc:     Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable TMPFS Posix ACL
Date:   Mon, 30 Nov 2020 10:30:07 -0600
Message-Id: <20201130163007.310384-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The lack of TMPFS Posix ACL prevents the upstream defconfig from booting
e.g. Ubuntu, so enable this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f4d0b3a61e41..3d2a1de6e8d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1075,6 +1075,7 @@ CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_OVERLAY_FS=m
 CONFIG_VFAT_FS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_HUGETLBFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_EFIVAR_FS=y
-- 
2.29.2

