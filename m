Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47904227A0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 10:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgGUIBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 04:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgGUIBD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 04:01:03 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864E2C0619D8;
        Tue, 21 Jul 2020 01:01:03 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 207so10363311pfu.3;
        Tue, 21 Jul 2020 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FKztgh8Zky/8/rtOQRmpObjZaYTW88VeKPdEo6E56Zs=;
        b=NVJa/eVdnXncXoZ/3vDBSMzZJvOHbsuk+Sj56FDAS5xrQoD08c5yVOuKNaylUAdI2D
         6iu2gn0/Um54HkxD8aMFvcUNKvmzBqT4cjNx+gKlpVEK8twYFLtaGeBCxxK9dHkCGPZq
         XJ6sNfmD3xGnPzVaj0DuOv4KpCUqUPGdKnhREI9CsTGJmWKr2tNgVdckZe3ZoRIvC0KF
         mDr9iN4N9t21vAgSvmdpIBsalhT12FCFCMMtCx7rNRYh4YvoI5C5olGAkYP9M+g18dOp
         Cx17859vzfonmY4ZWm1hI4LyUQzlQ+r7R8HaUMgM9yKWa//bcfESPP3xZnE57eHWxu14
         ghKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FKztgh8Zky/8/rtOQRmpObjZaYTW88VeKPdEo6E56Zs=;
        b=Ll1rCkdPd9XLxDJv43eknrOS3kiCYXIh/rUPUAnvksfDD0ZTeS5KjBZq0ZYwamdVd2
         y1IedXLRZ359b5sBFz8cz+P5Gxu9EkNNhdVHEXikmC2Hrc7jkIJ9Fl+XpPVHTXLQh39u
         MyQ67YIlzdp/fUkx9yi2CpNR2LvIRk/2wQVXzgMPqC84h66nJ/0vUsgVLaIaeDNj5iIZ
         60UBHZuEjfD7JdO/jNRKNwxwBpxlzAz2iuYhZxs1h6qIxM1C5R+pGp/+uS2B3mHXWxT4
         6+ha9EN/RYsa6ogHST51Gu1saRTHbzf9yE8j5kbXCLtP63D2W+WgLKmNCpRWReKJUAtm
         Ei6A==
X-Gm-Message-State: AOAM53093pUxuoDr/Q0FLipe+DDTDakt8t96XPMfmkZGy3DaEqWkGvBQ
        t0TjLRO7g62+m67ZsTEIHoI=
X-Google-Smtp-Source: ABdhPJw6K7r/HonYmgqw9HnF4JWA+2Yrlp3PlFPTCgT3A0Rf8Dj0K6UnTTAfMcQKwDNRW9g5N4ZcPQ==
X-Received: by 2002:a62:7c97:: with SMTP id x145mr24122060pfc.80.1595318462971;
        Tue, 21 Jul 2020 01:01:02 -0700 (PDT)
Received: from localhost ([2601:647:5800:8d47:9eef:d5ff:fefc:64ae])
        by smtp.gmail.com with ESMTPSA id a2sm19500731pfg.120.2020.07.21.01.01.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 01:01:02 -0700 (PDT)
From:   Brian Norris <computersforpeace@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, <linux-kernel@vger.kernel.org>,
        Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH] firmware: qcom_scm: disable SDI at boot
Date:   Tue, 21 Jul 2020 01:00:54 -0700
Message-Id: <20200721080054.2803881-1-computersforpeace@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

*** Disclaimer: I know extremely little about Qualcomm's undocumented
SMC API. ***

I'm trying to get upstream support for an IPQ4019 device I have, and by
default, warm boot does not work properly -- it appears to trap into
TrustZone. I find that the downstream/vendor kernel makes this call at
boot, with notes about the watchdog and SDI configuration. It appears
some of this is leftover from when they had download-mode enabled, as
well as some other debug features, and they didn't get completely turned
off in the production bootloader. But I reall can't tell that well; I'm
just going off the minimal source code and git logs.

Because this is so undocumented, I can't tell what the right thing to do
is -- should this go behind a DT property? Should I apply it only for
ipq4019? Is there a better way to describe and document the bits used in
this command?

If it helps, I can try to shop around for some testing on other systems.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/firmware/qcom_scm.c | 20 ++++++++++++++++++++
 drivers/firmware/qcom_scm.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0e7233a20f34..70c46f1668d1 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -394,6 +394,20 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 
+static int __qcom_scm_disable_sdi(struct device *dev)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_CONFIG_SDI,
+		.arginfo = QCOM_SCM_ARGS(2),
+		.args[0] = 1  /* 1: disable watchdog debug */,
+		.args[1] = 0  /* 0: disable SDI */,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+
 static void qcom_scm_set_download_mode(bool enable)
 {
 	bool avail;
@@ -1122,6 +1136,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (download_mode)
 		qcom_scm_set_download_mode(true);
 
+	/*
+	 * Some bootloaders leave this enabled by default, which prevents
+	 * normal warm reboot.
+	 */
+	__qcom_scm_disable_sdi(__scm->dev);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index d9ed670da222..39c3dc0dfc50 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -74,6 +74,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
 #define QCOM_SCM_BOOT_TERMINATE_PC	0x02
+#define QCOM_SCM_BOOT_CONFIG_SDI	0x09
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE	0x10
 #define QCOM_SCM_BOOT_SET_REMOTE_STATE	0x0a
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
-- 
2.27.0

