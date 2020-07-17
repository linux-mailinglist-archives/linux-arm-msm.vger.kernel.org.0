Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0CBE2240F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 18:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgGQQ43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 12:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgGQQ42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 12:56:28 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C745C0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 09:56:28 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o2so18258266wmh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TkOYSGltdOXnfd+0tERuVE54MScMlmkqbTAm2yNvNuQ=;
        b=DTRhBaRQRjcS7sPkr9Rcnr/ZtOhPRL+7IF+l/wRBS2gE9kpSsDvBNkY1IN5u5fqxqB
         o5GtUs99QqTzB+GPfDYrOO/z73yzT80INXtnSU7PmyKIFScL028ddBUUfEcTsKIho0tB
         d9ZDQnCAz0Y79xLwcfKFME9mVwP+k3/Jpvt3I5obTkR0VZJWPtkreuwFZWKrig3QYEof
         cYw432EsBY3NSGuvktvzvG1iM4ODBUnX667Lwi5H/+NtBEON8qqnvJEqV1b4l6eOz/4D
         kcid0oyZblGB0+CHV+G8Tjwau5JZO1Iaz7fA2wYm00DWcdxEzJt5TXiHOMpFAokVG397
         tHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkOYSGltdOXnfd+0tERuVE54MScMlmkqbTAm2yNvNuQ=;
        b=kQcSIcxku+AZGZ/qTiBhcwUzJRsZ2yu/1m9QpTqFB30RCvf/KdDT8xUNBp6DZvVX5G
         Zu8NVIYnkSne15NdD4BCVmzu8GzUD2yah+b1HRyqiBAtPdeak3N6RHJcu1nXw1CP+Lpx
         60T13jdPZaO31Qy4qLhV/tG2tEnE+xxZufx43QQqDwfZvlP477dWBTSQ1Ti5w/ybb/5W
         9aZV+PVZux+/gZRpduF9LH0/eH997l/eNY3ix463wv6sqjvdvvz/gC8fCNKidwXLbaK8
         h5NeMAQJuwAewrFLZU2X2m2Vup3rXvcYQF3SlIjEJ0ORa4U6taqlD2qrh6cI7/euBQ23
         YgWA==
X-Gm-Message-State: AOAM532s0HE6r1uvvXAAi36CSxn+IeowD4yIeClaSr/9p5/kXRsADMyz
        Uaj+Ls/BlqYJP5xM/VuMX4I+oQ==
X-Google-Smtp-Source: ABdhPJxDjfQUnVh6/KkbozE7NYDq+1TjlinAums8GsbsNOoTvRInXHpBx5zHQFNjp3F29RMu3UBUOw==
X-Received: by 2002:a1c:2602:: with SMTP id m2mr10750323wmm.50.1595004987141;
        Fri, 17 Jul 2020 09:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id k4sm14941516wrp.86.2020.07.17.09.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:56:26 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 26/30] iio: adc: qcom-pm8xxx-xoadc: Demote standard comment block and supply missing description
Date:   Fri, 17 Jul 2020 17:55:34 +0100
Message-Id: <20200717165538.3275050-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717165538.3275050-1-lee.jones@linaro.org>
References: <20200717165538.3275050-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kerneldoc is only suitable for documenting functions and struct/enums.

Fixes the following W=1 kernel build warning(s):

 drivers/iio/adc/qcom-pm8xxx-xoadc.c:133: warning: Excess function parameter 'PM8XXX_CHANNEL_INTERNAL' description in 'PM8XXX_CHANNEL_INTERNAL'
 drivers/iio/adc/qcom-pm8xxx-xoadc.c:133: warning: Excess function parameter 'PM8XXX_CHANNEL_125V' description in 'PM8XXX_CHANNEL_INTERNAL'
 drivers/iio/adc/qcom-pm8xxx-xoadc.c:133: warning: Excess function parameter 'PM8XXX_CHANNEL_INTERNAL_2' description in 'PM8XXX_CHANNEL_INTERNAL'
 drivers/iio/adc/qcom-pm8xxx-xoadc.c:133: warning: Excess function parameter 'PM8XXX_CHANNEL_MUXOFF' description in 'PM8XXX_CHANNEL_INTERNAL'
 drivers/iio/adc/qcom-pm8xxx-xoadc.c:412: warning: Function parameter or member 'variant' not described in 'pm8xxx_xoadc'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index c599ffa45a04c..cd5fa30e77df4 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -120,7 +120,7 @@
 #define ADC_ARB_USRP_DATA0			0x19D
 #define ADC_ARB_USRP_DATA1			0x19C
 
-/**
+/*
  * Physical channels which MUST exist on all PM variants in order to provide
  * proper reference points for calibration.
  *
@@ -388,6 +388,7 @@ struct pm8xxx_chan_info {
  * struct pm8xxx_xoadc - state container for the XOADC
  * @dev: pointer to device
  * @map: regmap to access registers
+ * @variant: XOADC variant characteristics
  * @vref: reference voltage regulator
  * characteristics of the channels, and sensible default settings
  * @nchans: number of channels, configured by the device tree
-- 
2.25.1

