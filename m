Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85392AF3E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 15:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgKKOkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 09:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgKKOiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:21 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79127C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 06:38:20 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h62so2538173wme.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HCKQOzFPpo+2K5yUahYtUtI8k6qp0+z3GG+IuN0ZApo=;
        b=Gke4ieISLM/XI8kVcqy+0mz4yf0ilnZLu5L14Ham+FjQ7rwpzqo52LbuyxGEB+6d5B
         UDpnhBJ0KU/otCehHd8K7SCm6O/Ehnx9Hkk40ZKbouSOo4fle/NTsagkA8DlNP+01pd0
         DnnJeE2a6YL9Jqu4qUhdAsMV06K3YYxn62/6V1uj6cQhRTBMy4s4Nrp9ms/W0j3wtPoK
         r1rvv/ufdxrricb97N372OISa6T7tESS73k60FsZ/gfyGYLabadPIscSnwADP2leufuT
         fDhlTwPBMSlUzbMYLrc84v1CgetJfn7FUqRzDfloDuPeEyxlirDHoY7dPoS8TfX8Zail
         FEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HCKQOzFPpo+2K5yUahYtUtI8k6qp0+z3GG+IuN0ZApo=;
        b=PAJoEjYwARPRD8I+KQzY0hBE7OBeHi3G9cpUo2ku0a/8s4d19PJ5jSJ0qFI529YnTO
         sR4odqucM+P3TONkzhpKtzc7Q8/O4tMNpUstlpv40/Y6W1yZv3FFMXutircxOwVDBU+G
         DedhN9k+/yM9oAI7zrBVii8ro0Nia7xSqHrou9qO2HqKVwjuxsBaUlTBV36D34Smbur6
         L29HDUSnNtTz0B+y12JjSIN/057VaSexj17GweN6iaYKkfhS5y7tPzQ12QQy5dtZqlLI
         a7MOVw7vhs+Y2a3sr0aAyX6btAP4wrJxjTSkPH2HKiAVGnCtv//Dp9OAT+3taNYWnSXX
         nwvg==
X-Gm-Message-State: AOAM531ygDfR0DGwvGUC82DCFcbA33r2Ow9jiP69EKhV6SGxmrQWH0jk
        YCmhAJzPPiR68yAKkpbg5Uocj6dJt+UiZ0nG
X-Google-Smtp-Source: ABdhPJzvkbMLLwR+nG6rjNxa+zEvikOX1rvi36jAIKrhuJYZt9qibdSW2YAQkwYi11nK78hOMR2Fvw==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr4429807wme.22.1605105499188;
        Wed, 11 Nov 2020 06:38:19 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/8] Venus stateful encoder compliance
Date:   Wed, 11 Nov 2020 16:37:47 +0200
Message-Id: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here is v2 of the subject patchset. 

The patchset starts with few small preparation and fix patches, 1/8 to 5/8.
6/8 is redesigned Dikshita's patch and 7/8 add Reset encoder state handling.
The last 8/8 just delete not needed helper function.

The major changes are:
 * An attempt to reuse m2m helpers for drain and reset state in 6/8 and 7/8.
 * Use null encoder buffer to signal end-of-stream in 6/8.

Comments are welcome!

regards,
Stan

Dikshita Agarwal (1):
  venus: venc: add handling for VIDIOC_ENCODER_CMD

Stanimir Varbanov (7):
  venus: hfi: Use correct state in unload resources
  venus: helpers: Add a new helper for buffer processing
  venus: hfi_cmds: Allow null buffer address on encoder input
  venus: helpers: Calculate properly compressed buffer size
  venus: pm_helpers: Check instance state when calculate instance
    frequency
  venus: venc: Handle reset encoder state
  venus: helpers: Delete unused stop streaming helper

 drivers/media/platform/qcom/venus/helpers.c   |  65 ++---
 drivers/media/platform/qcom/venus/helpers.h   |   2 +-
 drivers/media/platform/qcom/venus/hfi.c       |   2 +-
 drivers/media/platform/qcom/venus/hfi.h       |   1 -
 drivers/media/platform/qcom/venus/hfi_cmds.c  |   2 +-
 .../media/platform/qcom/venus/pm_helpers.c    |   3 +
 drivers/media/platform/qcom/venus/venc.c      | 232 +++++++++++++++---
 7 files changed, 226 insertions(+), 81 deletions(-)

-- 
2.17.1

