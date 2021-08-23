Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0D23F53CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 01:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233440AbhHWXwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 19:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhHWXwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 19:52:06 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4215C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso1089198pjq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qP9Pyq6spTLX2ZdL8bYbTvq8hc7AHiozjvavSsllrAo=;
        b=F3tqRJJHZnRMhQgjkRoOgfFLcjx3oIDMv1a1W++h1Yoh2cfrWpCsucfcmjlbVamBT8
         hjtmOYEMet7dHIvlPdxa7vrtyJhyTnwk8j0y6DkPINWRDoHuTzlPJUdZkrrzdqAS4Z1N
         wj3cC2Ph1Fr4TM1YKEIepU/foKCshexlcRRF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qP9Pyq6spTLX2ZdL8bYbTvq8hc7AHiozjvavSsllrAo=;
        b=Tgsfxxcl5WpYWKDlmzX5RRurt89q/3OBhwNFcNpjS+R+CKlQTuab9wDjVJGycxCoTD
         4/+8MBdYic0Md8zz1NBhebKypn4zWPNtqlT51jhgSVMK3CvsRZ/ESEqfYskafwOaSVvz
         lzZf8u+M00/EAuTuDgTxMKuOj3dde/Jyt/VSRq4KQjCL8BgUW/Rjo/n78MNDpxIIhAEm
         KP2PwuAHGtVEjGjXBgZomb1NLzkQmztUC+WwmzS6p+jAH1HtaXns/DsE0WwpM5NH+4oD
         f96dbfZaP1hb0zU4V98IAyxyettNsL65Clli7vHM/yPUBkJ+j0+WtU1U/p/p0v+tLswf
         oGCw==
X-Gm-Message-State: AOAM53057kncKwz9jj7UEnNbzxJCPydj0Pw1XwaLFgk+puUheaVNdE6y
        qcSoLTDajdFNM1FxmMBTXoH0Iw==
X-Google-Smtp-Source: ABdhPJzIG/7d35YPbe2fIJVHKCJ6NuWUFE4zsXPv3awoTTePAiL+yylLYE3st+O7LQHJSaif0gADKw==
X-Received: by 2002:a17:902:d2c3:b0:136:3916:c936 with SMTP id n3-20020a170902d2c300b001363916c936mr566998plc.85.1629762682512;
        Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d459:dfd5:c7a0:283c])
        by smtp.gmail.com with ESMTPSA id t14sm20074660pga.62.2021.08.23.16.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom: wcnss: Drop unused smd include
Date:   Mon, 23 Aug 2021 16:51:19 -0700
Message-Id: <20210823235120.1203512-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This include isn't used anymore because the smd functions have been
moved to the qcom_common.c file.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/remoteproc/qcom_wcnss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f1cbc6b2edbb..33d786b93775 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -25,7 +25,6 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
-#include <linux/rpmsg/qcom_smd.h>
 
 #include "qcom_common.h"
 #include "remoteproc_internal.h"

base-commit: 36a21d51725af2ce0700c6ebcb6b9594aac658a6
-- 
https://chromeos.dev

