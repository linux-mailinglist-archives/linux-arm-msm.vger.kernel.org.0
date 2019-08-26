Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E612F9D466
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733236AbfHZQsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:48:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33573 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733220AbfHZQsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:48:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id u16so16020050wrr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SRhxgEvWQVs1ea73JEbbvWRCETzD6iEjJpSYclHjhyc=;
        b=X/3Va+4bMjUIzurD6wGQMAOoEEujrfWU7PM6u7RIEiGvFhdjn0OVNT0AbPtGenMdH+
         /i6p/TEo31Krgq+peIUPumD7Rf+13msz02Mt8RIiW/BnWsaEVqdq2vWyCk3RlkEIzE1K
         OH0noWzpBpa9N/ULhXR8pvPgjaRPQJ+sFX4C5aQDxxASww73c6T1aYF1ffJsA09vmEDq
         8HUVNU3BeqIDAw+IjY/OaWIJd+a+ZNKWEiQ4+/NzQSE5p/Uq/QRsXhEA5P7p9Joq8BKT
         Boya1nfoTJRq4isvaIpibtFroNjS41KPMsOXA5vot1Al3wAVLXF+UvNrEVoJC8tIwWlK
         QuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SRhxgEvWQVs1ea73JEbbvWRCETzD6iEjJpSYclHjhyc=;
        b=n3YqOFUARZJojt4Z66eDrgPhkmpAIsQyL/LJLiFCH5SbLebhlqkS3uiurJnOGumyUo
         /TwXLwU5RUhBvldZcfwg4dkE19YofSAUTA+mRDhaO5o5vmrcjf1RTXlbSbx1Fmx5woIE
         f7L4+gsMpvOBUgxd+iW/EWdZHEcbDhY52oJDrG3p/cAvOsaR0VHDko50JiZMaZ2uQAuS
         9gxPyH2DVRfa4G7942Wb7F663GSCc/cDND2tN5Ytz8MY5n3zaSOxJYcUv2yJ1SwU3AAH
         y3pHef1c9g0me9lxOtYV2yBrwFh/szdP8POpyqvnC2gZTqaTgR/V10oKmvd+iMnkw0IS
         2T8g==
X-Gm-Message-State: APjAAAVG428NPquvztw4jTXnp7XF53sTDbud33HvmVRYS0KAuyanqlMb
        4Izg7x2Wj498qeUW+30F1x+pKQ==
X-Google-Smtp-Source: APXvYqzZ3xC4kfENRK961Lw1r8AEKtqPndX79PH8Zl7tkFhGXbf13HhvFBfq/02dXMrt+BqkZbslyg==
X-Received: by 2002:adf:9e09:: with SMTP id u9mr23619223wre.169.1566838095223;
        Mon, 26 Aug 2019 09:48:15 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id o14sm21800076wrg.64.2019.08.26.09.48.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:48:14 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: defconfig: Enable HFPLL
Date:   Mon, 26 Aug 2019 18:48:07 +0200
Message-Id: <20190826164807.7028-6-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The high frequency pll is required on compatible Qualcomm SoCs to
support the CPU frequency scaling feature.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 74f82901aa2d..af13602c3987 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -703,6 +703,7 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SDM_GCC_845=y
 CONFIG_SM_GCC_8150=y
+CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.22.0

