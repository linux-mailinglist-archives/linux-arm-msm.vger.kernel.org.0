Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EF52F9963
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731988AbhARFkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731928AbhARFkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:40:25 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6748DC061796
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:18 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id m6so9542129pfm.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJkYs8K/CcGOZXRMgml0Y6phbsMH40df4LaUQ6gPLWg=;
        b=TgCv+HmVUd5+6izP1EkVwYRK6QN8vqHU0pG3wZIwcx70vh21v0hLhIVVY5eqAuY2BK
         U1e/99MLLcv6IP/p6ak5OIVI+lty/AbB697Vr8UdnrRmGLZOnZ08imw+TpTzu2Dq5IPu
         cwfJ2YbDwNQclunGg//sykJmqDC4IDcL5sxZzwyX7R8fbn0R4VdmzzzPXbC69X9CB7ZN
         uLEmmYq1d2Mfqe27McbA3OgwCSSSqoDIsCIcY3W4pERwX+UMV7+5YXD3p2Ul7bnG3ZW4
         hcY+ghx8uM6+rF8YR9wnfbZIWe/1SfFqg6S7c6MyC9Mem2L7MRzKGuYw4d71jS5FRuCG
         CtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJkYs8K/CcGOZXRMgml0Y6phbsMH40df4LaUQ6gPLWg=;
        b=NSt5KoIODKU4VnfGyWMU+CInJGE8cgdcgEV74ay0q+Yo8mx0KdZFBs8FAJpsIomUpw
         PMdnvrg67afh/WaSjEvOd+xjcAHL9JwGzzty+HTq0gng1X3Djqld/D9JlP6yCdgwnl7s
         dNY+TUGCnAepVQ6+/lVwqK8D8YFlbyGmsw4UhjuTqxJRigsSitr/zIaFF08nJ6Ibl3VZ
         OaBdtmlifojlDGd8wfXRzlh2a+/Ltaanajg+6aDbWxo2OQkID6Hw0HPf8Pf57vrF+IhZ
         /r/u+xun6FbZFY3WwvQavtugSS7AaADvRsCK3TzSOD+yUZIlJsETRmf1mt1p52+zfE+P
         1NZg==
X-Gm-Message-State: AOAM530lO4GD/Cl2aD39h9KuhiVy1VKYzOAddOvRqPCSxOxsswYfS0qk
        L1OgPKsEQqUBDlnd/V/XRDZG7TT75BEI
X-Google-Smtp-Source: ABdhPJx3W0EmxRn3xsMCA5RvbhoJwax5pSoGskGsDw/tyUBynkEPAPztS/id/ppKfi+8j2sw3e1GBw==
X-Received: by 2002:aa7:9af1:0:b029:19e:568e:c452 with SMTP id y17-20020aa79af10000b029019e568ec452mr24684221pfp.28.1610948357960;
        Sun, 17 Jan 2021 21:39:17 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:17 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/13] ARM: configs: qcom_defconfig: Enable MTD UBI driver
Date:   Mon, 18 Jan 2021 11:08:45 +0530
Message-Id: <20210118053853.56224-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable MTD UBI driver for using partitions on top of NAND flash in
platforms like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 6f96a6ec6502..07737cbe557f 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -67,6 +67,7 @@ CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_QCOMSMEM_PARTS=y
+CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_QCOM_COINCELL=y
-- 
2.25.1

