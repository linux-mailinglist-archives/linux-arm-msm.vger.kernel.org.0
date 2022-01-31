Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C26E4A4C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 17:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349408AbiAaQvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 11:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380616AbiAaQvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 11:51:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4D0C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:51:01 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id n8so28115613lfq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qjbwBrhukqzvixOA51dxcstYLK5c5Uhnxa45EJcVrcU=;
        b=N4QFU6Tl3JFkdRcWcEwBv4cLa7CdRACmUrVJo4YS1acNwsSIo5E5j5pe/tREGAr+I9
         QOU8yrtN57mT8p3ozpEfIWV02Pwxb9M0SjrXmNZMLOqWqR7Fwws3A0U+uuNfNdAkawo7
         zO5+hbkZVKBRzi0NcXUi3W8KELb2jDpbRyazedaLSq1J4PE5kAxGynhvjZdVsReVh07C
         TTcn8xdVu2cia7jQCl3a5sWAjGo25Cxksr+3zZQcXIqMBLfDpjegS7oCYisf3ZVuZWB+
         rbo+ogrqm05k+iCDfAM99r2Iuhmde3hkAiBBhEVWayNlhHlZYEd798lQ+LXTmavf2v4z
         xhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qjbwBrhukqzvixOA51dxcstYLK5c5Uhnxa45EJcVrcU=;
        b=QHKVQjJdyXFx2d/wsts3Oj/9oIPO2X5OgrpB/GY7wsHUdltdvvOBzA4KOTXyrVtH+j
         MlrvIVj73WSsGvc5eg1IY2don7hEk1PD891U2OsqiJlZpfMuwhpwEKJAbuBhyFxPA7eu
         Rb86IffYHS+pjG5ryYrhNXG3C1iw+LrxwaBmhyVCmW3LeiXl8/CcB5Xln02DItD2mhCM
         HawCElpeZL6/q8i5lwq5+dCrSTYetnWRVm0KNUbPzrQvXyTzDGsfNLPQNBfi9cXo69Jn
         j+ofzQTYQZl0tKN8SUR87SNwOcRWn6tNg3j81CRgI76NKi1MhI7hhsuIEJBt8yqR7n0Q
         PIrA==
X-Gm-Message-State: AOAM531LnXF+paxRw5GrEEhFUTv3sKTBz9/rC+H0X4xCJOlw6WKd1kBw
        fWWb2B2v88PoocFK7ytnGuTCew==
X-Google-Smtp-Source: ABdhPJwtowrYAR+EY3oS8o8lHwbXIfgnQzgBoHcCiqsEM7Pz+jjp8JGuUT267ygZg1qnP0dPIqkZQA==
X-Received: by 2002:a05:6512:3a96:: with SMTP id q22mr16221842lfu.521.1643647859875;
        Mon, 31 Jan 2022 08:50:59 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i19sm2749853ljm.51.2022.01.31.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 08:50:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 4/5] arm64: defconfig: Enable PM8916 watchdog driver
Date:   Mon, 31 Jan 2022 19:50:55 +0300
Message-Id: <20220131165056.2117434-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
References: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Aníbal Limón <anibal.limon@linaro.org>

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bb30afa95a73..8a68dadbcc7d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -596,6 +596,7 @@ CONFIG_QCOM_SPMI_ADC_TM5=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SL28CPLD_WATCHDOG=m
+CONFIG_PM8916_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
 CONFIG_ARM_SBSA_WATCHDOG=y
 CONFIG_ARM_SMC_WATCHDOG=y
-- 
2.34.1

