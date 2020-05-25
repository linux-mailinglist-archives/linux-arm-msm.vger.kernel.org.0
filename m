Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735331E1306
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388326AbgEYQtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388279AbgEYQtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:49:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F59C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:49:32 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w15so10784149lfe.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w5U2FLzkWm4epQZ7APdhTDEg6hl2eryLmaqNclu/9VA=;
        b=VvGxEVRnO7/Sd+V2BtP5TqcCD95ShriCh6IhBUFvExRy1FcY/fV0wCdW+zQEXrMZ2E
         JFvmtpHO+sTVZmfoQuPqKZQcnzN/CXXFznCSjcH5yjur+iuQzqwjbsWP1+ohrNdZctpr
         3iD539/NUbeQOfjE/56QYytQif6DBzBUDsa3c9yfETKcZ+rP1AHqCkqYS7z7CMXI/VUL
         OL9j3shyt8mOyGclg27BeSeJoIGXiGb2140ozNh6Swmc/xqMUvfI+tNJ1ECovYfX1PwW
         NqjBeLlFMUkOY72VH2yuJRz1vMzFqepg8+2SKFwRVULrLrk0QNJpxOnzmvPCizzBQaHI
         36TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w5U2FLzkWm4epQZ7APdhTDEg6hl2eryLmaqNclu/9VA=;
        b=fKMnTKXSpG1GosUA9EdZmEqmaRtDOAquKNjAW1KRkhd2A4kDe5OvchaRjQM+ih9IIm
         wRvWOa9eY37LaAsYyXVdPjjS8V5/2deT3teysOcBzBjAXvLI7Hw2iHx488Qw3E/V+BxY
         4Y6XzQR6ivhdGUlv5M8VarUlP4XMSWLYURQnP+zDXkIRvdnCJc50YsDa3Dw5JR937FNV
         FdQ3RlfJ9qWjjxHtG5GbB6u5bJq25QyY4UZLbpQ8F2wCOl5aAfVUb28W72GoYtpGO7OL
         evGEkfLqchpBXQ9ONgCWVTBOdvFpoIh37om3AhiKPIb19Zart8AJAdy9w0x9/CJyUr6W
         hXyg==
X-Gm-Message-State: AOAM532ex8OL9piG4xMi3QQvIUb1FGJzqlHvSvQe08UPnqg3zidADCv6
        WitsEDa/c5VaTaxmYv37Un/0kCXtCoU=
X-Google-Smtp-Source: ABdhPJxXO2S4C6caHMA3bAHx9NgL01IIQvKOqVsB2EKULMbSiDSsARAii0GjA1daOKf6Akj7Rfy+UA==
X-Received: by 2002:a19:8b06:: with SMTP id n6mr14726398lfd.66.1590425370390;
        Mon, 25 May 2020 09:49:30 -0700 (PDT)
Received: from lothlann.lan ([188.162.64.24])
        by smtp.gmail.com with ESMTPSA id 5sm4754825lju.87.2020.05.25.09.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 09:49:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH] defconfig: enable Global Clock Controller for SM8250
Date:   Mon, 25 May 2020 19:49:28 +0300
Message-Id: <20200525164928.2938829-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable GCC by default.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24e534d85045..72da59bbecad 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -806,6 +806,7 @@ CONFIG_SDM_GCC_845=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_GCC_8150=y
+CONFIG_SM_GCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
-- 
2.26.2

