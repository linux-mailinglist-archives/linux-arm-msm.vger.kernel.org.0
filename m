Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528C23B54E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhF0TBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhF0TBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:01:02 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83033C061574;
        Sun, 27 Jun 2021 11:58:36 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id u20so4581515wmq.4;
        Sun, 27 Jun 2021 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CwIHkLM4EfnFb+WO8xv/vPEzna7r2j1Eo9muCppwlGA=;
        b=NdO2suAI1A5xebijNREcrGOvi4OVkF2nEGhVKBAXd/8ht7aLAc0o7qX1XEfsOwVCFs
         vAVfC4MHSBwBJZ3TLZ2CFx845Dzb1ky0MkMbCioCVJJUdMnJd8rCs2qe+Ic+w1vrYWRm
         oazNLYBoUrUYNBBhxrGb+PFAOxXuxWDlwMwn+ZgV6HJxNDwdhSmNis2dCiAGmgLUuC7X
         Bd5TLwCcBbkYwPBbc4t+c7syu72n1kedRfh2QwgsYLHbyosFaKf/MzR3xTIq1I65BRw6
         20O9gUq4uAznurMOi099ZS9xa79d/38naPcYlEbDd4xJlx+ivXJUx32UVzUBMUzJR5ul
         x8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CwIHkLM4EfnFb+WO8xv/vPEzna7r2j1Eo9muCppwlGA=;
        b=GiQtGzypMzYLNspz1a16PxTAZO0fRtimbZbRWvI3eAP3C1Sb6C2JNkbEoQZSJKdq9B
         sfOV6TWTGR+VCqwefYbVFV6ogiHjwONMuYIxWAmtunuw0ExnYwPxubn88rq1qJQ+cfCs
         crp4EpPyq0es9S30hd3d37xFdpftHIavH+ZIsWoJ2iLkyLWV+XUB0lHE/sKhPupRs75g
         WIeYNDT9uyE0YEdwPeDJiDJy+Kr7dw5/pu58ikrfL4qFArHrhNo7FVglO0XZYLf7tk9G
         hb4CLWyKk5RdWkkLWPyNI802lVcQabhd/f+qR5xg0xzcKC6CzQ9Ywtj0ETO+Qo+8w0mt
         Omng==
X-Gm-Message-State: AOAM533yZIfc7xpXHUeGGDcDdtyx5UDhlaOi6ZUJ07eElCuZjFuicNGc
        CL2ncJGcOWUKHT1g5Zc7ViqQ3H6NX+A/1A==
X-Google-Smtp-Source: ABdhPJw+TQUtbJTizoRNuyqGoyilpBadnTID2Ba7oVhydP2lbUmKGFUQJq+f26iB1gGpZi4Xc8Y6SQ==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr22493522wmb.60.1624820315243;
        Sun, 27 Jun 2021 11:58:35 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id o2sm12343758wrp.53.2021.06.27.11.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:58:34 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 2/2] mailbox: qcom: Add support for SM6115 APCS IPC
Date:   Sun, 27 Jun 2021 21:58:28 +0300
Message-Id: <20210627185829.694136-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185829.694136-1-iskren.chernev@gmail.com>
References: <20210627185829.694136-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qcom SM4250/6115, have APCS mailbox setup similar to msm8998 and
msm8916.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
v1: https://lkml.org/lkml/2021/6/22/1189

Changes from v1:
- leave only 6115 compatible, there will be only one dtsi for both platforms

 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index f25324d03842..13442427adee 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -166,6 +166,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
--
2.32.0

