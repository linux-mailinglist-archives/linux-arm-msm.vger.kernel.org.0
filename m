Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B4B2BBD86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 07:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgKUGdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 01:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgKUGdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 01:33:07 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E890BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 22:33:05 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id j19so9299632pgg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 22:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/QcxfXErWWujy+nFNlFKMWzF0EXFpsGg4+Dh63UDNx4=;
        b=EdA2h3p87/J7Q4xNVksxAGFt1xTbDRs12kJw3waq/qrqWlgrQ+yK4fwbXqdE3I8EeY
         EejVAGVllbDov3IjWVlfSVCTz4orFfzGoXH+uxCMX8m5ezEyYJW08bKLp4rnbrNIrWvz
         slbygK3FIpgNQn/1Y2X8euXNLtlMi/eid7WpIpa1UEQy19sldi+I9K0bPZTG1yZwDkia
         nNy2mU3tZ2UsRZagnC7s4b1BMpRtF52GrV8HLNHVUyCXqJMZRl8WH1E+cR2J4yHy6iJK
         SivyHKufvTZNt8/s3107RWlRYSiKxYDRMT/Ol/HY3i0VVyvGjAu9/EAZQxslq+a1FWV9
         JvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/QcxfXErWWujy+nFNlFKMWzF0EXFpsGg4+Dh63UDNx4=;
        b=O9c2m8FcF91ulFTsfjfBuFbL4T0C0N0DTz3vO63sqNXi6Qui1w6d0fjRXuqTC741mz
         IbOnIF4yo+OIOqnZDiMOYgXZPmwKutp9Q5kz2/jlsHWZQkEpNLyJs5hxHBTdpxhdvYTJ
         DPp8GpQ1aiFGcnPKoqEL3IEvQaegwflv1A4GmC1bezQaFkZiJVrCKC0tIyG3en4kQIlP
         ze5uaBAmzDJrh5cX3WDKQIgJWPUJLwjq3edU0yajFoMS2wofAmpD9FQesaV8pLDbnVwU
         Gj9B+AbvJsRGzu6F5VYl8Mzhfm6MfrH/2OPAUC348qQZmPGipMAu8a5P03AdILWW+k+m
         anfw==
X-Gm-Message-State: AOAM533RhvwYMptRtyqfDoQ+CBs5fcGNsOpkHgRZFKMhVJUMZ+6zykFk
        lLaCeE2L10bMK4MFJRasVx1NyQ==
X-Google-Smtp-Source: ABdhPJwzT1WHUftegVeHBEHmL1+Lb0AS44SxEhcpfzWQqyrxoXeSsAtm5eLrRamw0mIW+nUj6+H3dA==
X-Received: by 2002:a63:c749:: with SMTP id v9mr20013228pgg.451.1605940385315;
        Fri, 20 Nov 2020 22:33:05 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l7sm6471460pjg.29.2020.11.20.22.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 22:33:04 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies to avoid build error
Date:   Sat, 21 Nov 2020 06:33:02 +0000
Message-Id: <20201121063302.84090-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The kernel test robot reported the following build error:

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
   qcom-rpmh-regulator.c:(.text+0x270): undefined reference to `rpmh_write'
   xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
   qcom-rpmh-regulator.c:(.text+0x2f2): undefined reference to `rpmh_write'
   xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
>> qcom-rpmh-regulator.c:(.text+0x274): undefined reference to `rpmh_write_async'
   xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
   qcom-rpmh-regulator.c:(.text+0x2fc): undefined reference to `rpmh_write_async'

Which is due to REGULATOR_QCOM_RPMH depending on
QCOM_RPMH || COMPILE_TEST. The problem is that QOM_RPMH can now
be a module, which in that case requires REGULATOR_QCOM_RPMH=m
to build.

However, if COMPILE_TEST is enabled, REGULATOR_QCOM_RPMH can be
set to =y while REGULATOR_QCOM_RPMH=m which will cause build
failures.

The easy fix here is to remove COMPILE_TEST.

Feedback would be appreciated!

Cc: Todd Kjos <tkjos@google.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/regulator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 020a00d6696b..9e4fc73ed5a1 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -843,7 +843,7 @@ config REGULATOR_QCOM_RPM
 
 config REGULATOR_QCOM_RPMH
 	tristate "Qualcomm Technologies, Inc. RPMh regulator driver"
-	depends on QCOM_RPMH || COMPILE_TEST
+	depends on QCOM_RPMH
 	help
 	  This driver supports control of PMIC regulators via the RPMh hardware
 	  block found on Qualcomm Technologies Inc. SoCs.  RPMh regulator
-- 
2.17.1

