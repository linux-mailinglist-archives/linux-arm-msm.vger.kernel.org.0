Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D132F9973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbhARFnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731093AbhARFkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:40:23 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCF5C06179E
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:30 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id w14so509083pfi.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VFVV4OQ39J28+u510atjrUGOLbq7/7laqoU6VJHCvbM=;
        b=MZ+pkpXVUfVHbSHveajmjtCcKUxP/FXRclnOCc3lX0nYV79p4L99Bbu4XpZ8zm4E73
         Y0K26EZjYxv96uxsEEXT4AjJlR360Zb5a7pp3f1pdrJK4hugkOud3ZmpJCxs19vIEX2t
         +r9aNUGNgPD/5ERYTSFVCEUydZddhAE4d9cZLSfghSVvNF20Yol0WX0pSZBj2dlSLP4e
         G77oltHY0AKY5TVcBomufcporoksEU7Ce17CEW+jeVI3XLMMKOF5iAGGPz6xR2BnIP2+
         arUCAsGKthEXeSvP/283OuWA/LrJGczemZ8Q0tGHEPhvxKO62H2cD6W2Js+8l1IeFjqm
         swyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VFVV4OQ39J28+u510atjrUGOLbq7/7laqoU6VJHCvbM=;
        b=aFgxGXsqQyAtNd6i5zXFSuC7NBE/Q1RkpaQeQmsIzrP5/CExohg3MmupPGWIIDr24f
         1M2M3um/lK4QWShu+mQcKfao+qzKLBUyFdLICgF/opXKrbbi+swubtSDY0vRVw1z/0rr
         M8RAuCw4Y3KR3K/scYPa+j+UPBAeEZ8UNAs1zaM5/BMNHMtCygHe3bNBnJuSCOnglesa
         13OY84XIcdoftbIRdZpZIH1vOaeT7XnxiBbhSRxmh/000Y8O9LCbtjp+uIMqK9r4FQ/e
         LWCIY8NLUzzge1+rtzROW9eQ+LYnomGZUpTf9PfhgXFlvhmqXNJvVAHwOJC5++jk6WeC
         lmXw==
X-Gm-Message-State: AOAM5301capwqdygvtP9gXvCUUKvvRQryetiyi6S5Hmv36y9WEGl/HJS
        qZuk8dAJRZ4d8ROLuHY1GLHj
X-Google-Smtp-Source: ABdhPJwdjzafNkdtZEKeeD17jXg5vMxMNe5gO6lyYKrJrSLsKbT9IVPcwbes+YnN9jZULSICuGQT8g==
X-Received: by 2002:aa7:82cc:0:b029:19e:1328:d039 with SMTP id f12-20020aa782cc0000b029019e1328d039mr25117426pfn.70.1610948370256;
        Sun, 17 Jan 2021 21:39:30 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/13] ARM: configs: qcom_defconfig: Enable RPMh regulator
Date:   Mon, 18 Jan 2021 11:08:49 +0530
Message-Id: <20210118053853.56224-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable RPMh regulator for using with platforms like SDX55.
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 70dd57b110ab..5627b142d5fb 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -154,6 +154,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_QCOM_RPM=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
+CONFIG_REGULATOR_QCOM_RPMH=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_DRM_MSM=m
-- 
2.25.1

