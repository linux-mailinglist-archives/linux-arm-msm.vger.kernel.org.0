Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8741526E6D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 22:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgIQUjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 16:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIQUjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 16:39:17 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF00C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:17 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r24so3198360ljm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJSU1XklSOCCEzt526a4V84EIfnx49B3RT9mwJDqv3Q=;
        b=Y4BEXR7nRPvvNIfklLjOcdii1+iz+9IcVxNCuxqraWtMEFuzLXHY1En87ty1yCVc8R
         dPO7vQ2Z+I3bTdQMVA0KC2AdKHR7xuVvzJEEKf/nd9uj1o7pAPMANpAlWQ/YfFQNkFya
         x3TesurBzqopXcEH0XQg/3uCNiyiaRbTw/6nkcrBT0uftSuFtnr8OLScMxFy70nEIOD1
         0udqb9O5LxGmzsQcPTDcImUAZjXK3g4hc8FcxpBzAV1wONtYmD0HtSp3UYOqsQwo+Zt9
         Y44w9z8iQSrAKVbie3ISLJAiqq9+zD4LxPx9uJPRKgfHuojR9sUFFABnJmnU94lI2aWx
         Yw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJSU1XklSOCCEzt526a4V84EIfnx49B3RT9mwJDqv3Q=;
        b=f3mc1Q/ne23GWy+7uEag1vgqlAwLcNHTz01lj9pQ+wrZcyZ/pA8yzGVchc8gRbYQMG
         m9YpAhzzXMP+FLR/JHF9GrK4qhsPo2ODMqfRaIqWh9SwPgp0llpnKszDNBK0RSIwRAli
         WFOa7I1aFUAoyQyJBg/CSQALAxhZw2TZwIlYskXuSCqTGOZzemPW3F7KbJcEIdnbJ19b
         J9PpZiJiWdgz36lLYD9jKKCFTtvORxagUXlEaHKhfSGLlSTm81GrNOynIUOA+0wrH660
         YkNkNn1JTvWhyEQL9QvOIs5mm9htiayW/KIEi3ru8zSL2LFBEWUzeCF/IYrBBXFhtjcU
         ejSQ==
X-Gm-Message-State: AOAM530wqeAm4B1n1DmUn7cPklslxbtNSKYWASwto/FEv5U9WumOO3px
        5yNxGaEbrimZ9R1ecAba+czIsPLKjDpliw==
X-Google-Smtp-Source: ABdhPJzXrQQaahkCOAcZ/G3ZTJwXeKe7NJ3q2oVBv+i+67m6bER9qlK0wdwfhrzjBHzXQ3tzrXGd8w==
X-Received: by 2002:a2e:a163:: with SMTP id u3mr11562261ljl.414.1600375155914;
        Thu, 17 Sep 2020 13:39:15 -0700 (PDT)
Received: from eriador.lan ([188.162.64.171])
        by smtp.gmail.com with ESMTPSA id d9sm128192lji.87.2020.09.17.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:39:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] arm64: defconfig: enable INTERCONNECT for Qualcomm chipsets
Date:   Thu, 17 Sep 2020 23:39:10 +0300
Message-Id: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_INTERCONNECT and interconnect drivers for several Qualcomm
chipsets to enable bus bandwidth control on these SoCs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 63003ec116ee..2e746ebb9245 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,12 @@ CONFIG_SLIMBUS=m
 CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_MUX_MMIO=y
+CONFIG_INTERCONNECT=y
+CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_MSM8916=m
+CONFIG_INTERCONNECT_QCOM_SDM845=m
+CONFIG_INTERCONNECT_QCOM_SM8150=m
+CONFIG_INTERCONNECT_QCOM_SM8250=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.28.0

