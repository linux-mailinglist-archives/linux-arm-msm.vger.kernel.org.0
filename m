Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4840B5B5710
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 11:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiILJR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 05:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiILJRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 05:17:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86AD32D93
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 02:17:14 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q62-20020a17090a17c400b00202a3497516so5219845pja.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7tR7K5oR413iRjDuxm5Mq93G56uZhpKUlH9Co9h51jc=;
        b=X5ibPOspaJ15hBjw2+eylce5MM8U08TGDvy10Zi3IB8s6dQbzcZGr+VA0X0F4JPQmz
         omq/dhft+a/57sllmLN/5nn+rc6t99ezuFyDd7vHfz07qeD77vyEb4JhopY++ZgC9OuF
         diEanfMEC15V2TM5mK7Yv6OHTcA0yh23HZaghD/wA5DOgwxC2IwJUsAQNdfARmMCAoEP
         79ImB6YEK5S3oCfmmZupvfHZVYQgt8z6XBrcm2lsNpyQWwzaj3mzFS1AwravzOfkCB0z
         vAL+76QYh6JYatxMwax87X5d4SZh83rVuNPZKvkaW8XG+NDHt3TjfCesNYqDuG5YJZ17
         QYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7tR7K5oR413iRjDuxm5Mq93G56uZhpKUlH9Co9h51jc=;
        b=E28AOd1tE7NF/d5om8MlrMbWFNKr8IdRQxPsIoi4tqiFOYcIFI6fJx0ORY/d+QDSmC
         dExoRkh3nio6HYBmbDu9eJS/8uxaIaVTW/kgHKJOc/McMeIKT18e2Sn0nAyrEDdHQ3/n
         tWlhjKyBMqb/2acvfN/7i2RL15/cdfGfqTwqEo5g4ApO0pKzetWGbr0E99NKEXo+vDQG
         CRtViQpzxvSkkXWBnhgedSbfUTHj9c6GhbCyl/rcyq52xZrP53pGNl/+QufgCvFw/lIi
         OXkAbuLfQXwcqxLtrNKZedgY6rL+urzp5ZO4GDR5OZtAjdzx8uI7Z27NyuBsZe7BokOt
         E4fQ==
X-Gm-Message-State: ACgBeo09znmw3rjhT9V5YGoHSHR68OAXasPQ8NJxlpqW/hws5mAR/o86
        MxfOQWXpVK7v4R3oclHPu+bP2SP6HDLelg==
X-Google-Smtp-Source: AA6agR6Z2/AyB8yAZcEb3ICpz4dIYClZXzn1ntIP/0gB329XLwnlzA25vi/KVebW9x+v3xmiFqameQ==
X-Received: by 2002:a17:90b:1b4d:b0:202:c05f:6ea0 with SMTP id nv13-20020a17090b1b4d00b00202c05f6ea0mr7237093pjb.7.1662974234169;
        Mon, 12 Sep 2022 02:17:14 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id o65-20020a62cd44000000b0052dbad1ea2esm4857026pfg.6.2022.09.12.02.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 02:17:13 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, daniel.lezcano@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org, andersson@kernel.org,
        rafael@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-arm-kernel@lists.infradead.org,
        catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] arm64: defconfig: Enable Qualcomm QMI cooling device driver
Date:   Mon, 12 Sep 2022 14:46:43 +0530
Message-Id: <20220912091643.3537857-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220912091643.3537857-1-bhupesh.sharma@linaro.org>
References: <20220912091643.3537857-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Qualcomm QMI cooling device driver which is
available on several Qualcomm SoCs.

Cc: andersson@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ea692ef4c841..24eed7db90bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -602,6 +602,7 @@ CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
+CONFIG_QCOM_QMI_COOLING=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
-- 
2.37.1

