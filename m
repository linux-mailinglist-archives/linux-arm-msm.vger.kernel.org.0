Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C02D599D77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 16:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348980AbiHSOXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 10:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349063AbiHSOX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 10:23:28 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DF4F6C
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 07:23:25 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w197so4926340oie.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=GeLnTCDFozOnXarr5bsZrfQIyPlCPObES/tRUVDlMRc=;
        b=IbwerQM0KnuUKiPyH/DPcbFtlKeEJfs0qV5K8pmupSDXM20bKdKC/7T6BZ0OI6q4zD
         +A2SFVIeHsHe54HLk/oLFri82rFSZzybkEN5oRx1vhn26Bwf3Me43ddfkIcoWRz48Acq
         ruxEFs+P/ctwTDRaiCMlCwa3y2gjDYcvz6AYbrpzoKiqdUpV2toNmiqLHSlra3iSdcPw
         PC6a0yOmfdGgjCVc9Kpj0+uN90FFCdaClXunjqOtQHDMugV7QG7DUCjWVT2u+auhtqwC
         d4g6hBzTjKvWXNAJJy0dlH1uplQ01IgKk/zKWvBXCEs9CS+olmJRuB7U3ZWnRAzX6Kzq
         z/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=GeLnTCDFozOnXarr5bsZrfQIyPlCPObES/tRUVDlMRc=;
        b=teOuXX1QE0Q1bJzYTWv9dGZobw63yJkq760gFGhRlAjxdHBzY1Mxc+oMzoGGQM5OsK
         egLp4plAxICKjqUIwhfagGhOC2/PnG/skGij1Aq0G9iv8PNV1OqsGMW72doJwtFkafF+
         A3sKAYRUx9otEUR8i4YGGiFq2fZTNToqfh5yBBMWkZOdRQVb3szHas11czixfm96uHse
         7QmQ2+dUHRrrw9DbGP8zUT+RwgtzgHbqj08iuh30zsXxMUXxnPUeJf80uX7VRkCrqlVq
         1kb7O/RcFIljedcuehGaAkxej5uCrO6xZ9UBgz1tyn55hbMS1NoVDMcn+7//HltEmos2
         s6Dw==
X-Gm-Message-State: ACgBeo3187NjVC7iNA+dMVDBqsL73hnHBwkU+yXG42+4MyAXsM0Ud+G/
        04jr5/xFvX4uED9GVaVaB6pGZA==
X-Google-Smtp-Source: AA6agR7N4ZbVcrXI4TmUZ/vYDXKsf2Lwa4ZiSJrBA5m0Qsfe0WDJTWC8qV+uhj11vk4/fyxaSM0aVw==
X-Received: by 2002:a05:6808:1412:b0:343:345:98ac with SMTP id w18-20020a056808141200b00343034598acmr3320053oiv.288.1660919004509;
        Fri, 19 Aug 2022 07:23:24 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l6-20020a056870f14600b000f2455e26acsm1303283oac.48.2022.08.19.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:23:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update Bjorn's email address
Date:   Fri, 19 Aug 2022 07:25:49 -0700
Message-Id: <20220819142549.1605081-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the email address for Bjorn's maintainer entries and fill in
.mailmap accordingly.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .mailmap    |  3 +++
 MAINTAINERS | 12 ++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/.mailmap b/.mailmap
index 23241db2647f..521ecdb8aa67 100644
--- a/.mailmap
+++ b/.mailmap
@@ -71,6 +71,9 @@ Ben M Cahill <ben.m.cahill@intel.com>
 Ben Widawsky <bwidawsk@kernel.org> <ben@bwidawsk.net>
 Ben Widawsky <bwidawsk@kernel.org> <ben.widawsky@intel.com>
 Ben Widawsky <bwidawsk@kernel.org> <benjamin.widawsky@intel.com>
+Bjorn Andersson <andersson@kernel.org> <bjorn@kryo.se>
+Bjorn Andersson <andersson@kernel.org> <bjorn.andersson@linaro.org>
+Bjorn Andersson <andersson@kernel.org> <bjorn.andersson@sonymobile.com>
 Björn Steinbrink <B.Steinbrink@gmx.de>
 Björn Töpel <bjorn@kernel.org> <bjorn.topel@gmail.com>
 Björn Töpel <bjorn@kernel.org> <bjorn.topel@intel.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index f69a1c5212bd..766037b30806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2579,7 +2579,7 @@ W:	http://www.armlinux.org.uk/
 
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
-M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Bjorn Andersson <andersson@kernel.org>
 R:	Konrad Dybcio <konrad.dybcio@somainline.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -8941,7 +8941,7 @@ F:	include/linux/hw_random.h
 
 HARDWARE SPINLOCK CORE
 M:	Ohad Ben-Cohen <ohad@wizery.com>
-M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Bjorn Andersson <andersson@kernel.org>
 R:	Baolin Wang <baolin.wang7@gmail.com>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
@@ -16134,7 +16134,7 @@ F:	drivers/gpio/gpio-sama5d2-piobu.c
 F:	drivers/pinctrl/pinctrl-at91*
 
 PIN CONTROLLER - QUALCOMM
-M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Bjorn Andersson <andersson@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/qcom,*.txt
@@ -16827,7 +16827,7 @@ F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS
-M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Bjorn Andersson <andersson@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@ -17316,7 +17316,7 @@ S:	Supported
 F:	fs/reiserfs/
 
 REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
-M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Bjorn Andersson <andersson@kernel.org>
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
@@ -17329,7 +17329,7 @@ F:	include/linux/remoteproc.h
 F:	include/linux/remoteproc/
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
-M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Bjorn Andersson <andersson@kernel.org>
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-- 
2.35.1

