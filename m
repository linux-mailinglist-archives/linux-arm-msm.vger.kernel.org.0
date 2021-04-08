Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FFE358AEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhDHRJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbhDHRJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:09:58 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1621CC061761
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:09:47 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id h20so1387192plr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CyQZLkYaIubLPqvnDxoGwD+fHjf6/A+5M7VAz+4frjU=;
        b=OnE0bfzwaVHYUHjN0+aC4Ppl2vhIfQJ8ehwxIubOzGsLqCX03vrRIQfNMLyPMqGupa
         EfX2O9JhdF3fQ7gaTfbuG5DN4PkaP/ZvTvs6S+NFcPXS0bDx5Axfr49R4ujATSkNkcVC
         5ttjmnem1pqbcjafnKZDJfvumgjq4M8Bjel/VNcf9CrSGf4ktZivW7Rxx48I0kZMQkfi
         K7OpxoFRrgrnolsVXOdzoGdffGPYKC3JuzhkgJggI7smVZLDLBYQl7twEG0LX4Y3aMAF
         uNB1yR1LHYnU7Lf4PoEVsBD4i8lL+03qgMhIzg1cQxtsMUf/MqeSeWv4JO1RNKbIBv9G
         NO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CyQZLkYaIubLPqvnDxoGwD+fHjf6/A+5M7VAz+4frjU=;
        b=LggiycTnwdvq/slDGw6FY0ENYtLmz0uHXXm4yjpeTJsai6EFE+HwRNkWIcydiwnYQH
         1AulKWiVAehH6OyDcoPb86JlYLSNOJFwLDp0wxGeZzboPug0+ILCEIKmAD4X0gIdkV7R
         W/zEe2N7YR1z4BQ0vTOZuZ4NBh2bP6PUhbJent5HOLtVAeedbs1Bx/w17KUOgi+K6eDk
         RnoACw8FPp92avzhXhwmo5OzuI8Qjbb2CEiFVf4aDLg9HSxvN5GWZvODvOu0GjQ1JF6l
         +Da/KzcwzdSJL/PvjxNEjl3LQ0eovHzgUK6iVqrHLraCY+Zkh18VK9Z+hvjJq97BvavO
         lfeg==
X-Gm-Message-State: AOAM533pyBrqRKgLT2eZZVOEs2e6SZKNlPX1lJukMDc6i7Wx8VpJlDp0
        +vU+EDHzMGOd5wSB9r0WSs9j
X-Google-Smtp-Source: ABdhPJzmFpGkL2EF+ENlIVZSUrRktimyyz0VoHvmi/3LU4PQDz+mGo55kppbqcLglO/M0Rly53djpg==
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr9447415pjb.87.1617901786558;
        Thu, 08 Apr 2021 10:09:46 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id a191sm57921pfa.115.2021.04.08.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:09:46 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/7] ARM: configs: qcom_defconfig: Enable APCS IPC mailbox driver
Date:   Thu,  8 Apr 2021 22:39:24 +0530
Message-Id: <20210408170930.91834-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170930.91834-1-manivannan.sadhasivam@linaro.org>
References: <20210408170930.91834-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Qualcomm APCS IPC mailbox driver for IPC communication between
application processor and other masters in platforms like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 3f36887e8333..0b9da27f923a 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -232,6 +232,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_MAILBOX=y
+CONFIG_QCOM_APCS_IPC=y
 CONFIG_REMOTEPROC=y
 CONFIG_QCOM_ADSP_PIL=y
 CONFIG_QCOM_Q6V5_PIL=y
-- 
2.25.1

