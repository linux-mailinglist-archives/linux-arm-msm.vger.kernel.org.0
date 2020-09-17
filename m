Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B54F26E6D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 22:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIQUjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 16:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIQUjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 16:39:19 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176CDC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so3667026lfr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5YmpGPaFncH3493RUUZcCD0yCIoenGXPPXF+I4dlKFc=;
        b=dxnDENcE99+hwYwuUiEDwLZutz1mu/iFT2ZOrV2Mhu/busmV4MJJ5rqTOu0+5H0vhH
         K7x9T3aXbZBXP1zozNel9wzDkFSEVXPcefv4b5hyCSBjeM5DtHvnWF0bot52L7s8I3DM
         374lNTHxrPYBkLiArL9nGcnrwGvRP6VMfe9RV/tdsMdMyl7dFDjeD0oIEENbW/7L/KsP
         FtESuKjuHQZM0EckGFd93etb052xulgwYbCjB0DKfB0XEMrOIzJoq4lltuI3ljfJCuvP
         pm6pO8eUFrpo4KsXBh1duziLw7O5t7UKVz76aa0dOE6ukNA9h7IXlO84yhoRcM0LG/55
         7vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5YmpGPaFncH3493RUUZcCD0yCIoenGXPPXF+I4dlKFc=;
        b=nfDPhkM+qDTJppD8I+wKJ5n6EBXthc/2OEU7NzYUvEruTLQMlaOUshmMvybR/RJbni
         FVMfR4N09pTtJjZeZ2QIXNKu4xYt9q0ikPVt4SjTxQkBhOcVQaYmAo5lqZPqpyauZjNz
         KAXRuG8q0gTqliXpedoiE7i3UODq0pzR1+byFrdKUtYQMmwKmh3wPl8y/TlHOQEnuiNt
         V+Ay2E5r0GA4I0930u5EqRYcdOl9/cxhEJDpO5f4+PJj94wP0AtvcY4S8ubB3CiSfiwS
         zlJb17jitPjhq1Qg8q1Bj0hKcQeoIqW/QTUG1TvMEAMzM++KtpWxJajbGVKrNZ2M9cV0
         +Afg==
X-Gm-Message-State: AOAM530n4FWo/4fkY6Wvwt2ie0hreH0tsP4InWBKT1f3rMP5EvLQl4/2
        om8xpdAfPd03S0Q4REoln+V7Dg==
X-Google-Smtp-Source: ABdhPJxd9dviPWQftlahh3iirinng0EgL/9ok39sxXYLXLAuYlv/WIeTpCHL/8HDoNE2h9V6W737FQ==
X-Received: by 2002:a19:8446:: with SMTP id g67mr9382481lfd.87.1600375157513;
        Thu, 17 Sep 2020 13:39:17 -0700 (PDT)
Received: from eriador.lan ([188.162.64.171])
        by smtp.gmail.com with ESMTPSA id d9sm128192lji.87.2020.09.17.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:39:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: defconfig: qcom: enable GPU clock controller for SM8[12]50
Date:   Thu, 17 Sep 2020 23:39:11 +0300
Message-Id: <20200917203913.3250205-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
References: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable GPU Clock Controller for SM8150 and SM8250 to allow using
Adreon GPU on these SoCs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2e746ebb9245..7c741e73a282 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -889,6 +889,8 @@ CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_SM_GCC_8250=y
+CONFIG_SM_GPUCC_8150=y
+CONFIG_SM_GPUCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
-- 
2.28.0

