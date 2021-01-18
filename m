Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D472F996E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732187AbhARFmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732008AbhARFkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:40:40 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9A5C0617A4
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:40 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id i7so10249635pgc.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7d0QJMTDkB6bKO/MOq3WH9j1K0B2fh9R5NIhHxb7PuA=;
        b=KwgI+tUdmVCcvrlZTxSAcz5lBH+2tlX/nRsorjTcerilObn7PBnRp5krI64I0p8HsS
         i8ymgeitLNPrJL5Ze6JsihA1laKCSeNfKr6nA3KvOgXZ5aBZj4Uh7JbpdwdKLh/cWhBw
         RwZ71qkqx97Sdzzq99rKu/AGRWZTtgercX5InMhNK8hIWqBP+GFT0uqns3bcAGwGIidm
         Ln2uUryoMWLhhkgkgDQz0IS1t5OJrPjPUaknrkh7Hn19NNwsXXLdkmQCMGYnjjCanS+6
         IjMmXjB/X48y8b2pk3HXsbtLgFPrpHn9mE40preuZD/FgKMOBvMpGwqHyBTsqCWOBkZQ
         BJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7d0QJMTDkB6bKO/MOq3WH9j1K0B2fh9R5NIhHxb7PuA=;
        b=aH7ou938n/EhrFHLOuS3FFU0OMwgGSNCrw/WIRaoT57gnmlGfj1Dx55tWj3Wz9WPGe
         h2OPkzV2hI8IaV48S7gD8sPmsUmPMwW3cXUSMdU8uPljzAgsFDsXW9TyjEJNdY9zOFUC
         8TCqTq3/U6bQ+IPHjtiLlAsp4qEdpPEdHa/hLyGEK6BG+B06757K0GRLcKligUN73IXu
         2RDzN1sZalp8PCkPv3ZRgmQoF4jicI/2fibYfi/Y9HZX2yHFeOG00Czb+CwSS7DWaEF+
         sqOzT8p9pDTjmzDWzzMtalU5IwmZB0IrVWXsjeaBzX98YWZaF+jkRKFna+ikNbHO7dnY
         9w7A==
X-Gm-Message-State: AOAM532Gi43N8Dc6tVzHbEQ3jOiRc5bXsbiwBG0VhKRz/sNudy12P7Hy
        yglS/Jttvl8IckT3R3bVGwNr
X-Google-Smtp-Source: ABdhPJwr0/vws/1ANGbWbU8/OB7fLHxubDaVGVeiwic+ka5npoVikryAprgK4LmAt5anc0z54ajsWQ==
X-Received: by 2002:a62:9208:0:b029:19e:a15f:169e with SMTP id o8-20020a6292080000b029019ea15f169emr24261442pfd.71.1610948379657;
        Sun, 17 Jan 2021 21:39:39 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:39 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 12/13] ARM: configs: qcom_defconfig: Enable RPMh power domain driver
Date:   Mon, 18 Jan 2021 11:08:52 +0530
Message-Id: <20210118053853.56224-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable RPMh power domain driver to support power-domains on platforms
like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index c9081e5afd43..32f3988631bf 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -247,6 +247,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMHPD=y
 CONFIG_QCOM_WCNSS_CTRL=y
 CONFIG_EXTCON_QCOM_SPMI_MISC=y
 CONFIG_IIO=y
-- 
2.25.1

