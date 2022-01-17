Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137AF490BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jan 2022 16:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240700AbiAQP4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jan 2022 10:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240687AbiAQP43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jan 2022 10:56:29 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A84BC061746
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jan 2022 07:56:27 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id g81-20020a1c9d54000000b0034cd1acd9b5so2689496wme.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jan 2022 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsqyxsAVSlOxkHs/ktXlOIw0yzzlQm8nxft+ufPq6ZE=;
        b=Be35HJXMEKMEDeYomL0vE4JSstxzgh5Pw2+y6BLt5xqr0tVHCBQFkkRvcdoCQqw5P4
         G7uvxNF3mp3szyL3Mi+c6BcbUa37AR9OGg4+Qa7PS1NfWmg3LQGttAfgDkeFc594M3M0
         EdikTcg36rkSP0F1f1tm0IPUXyZiAC4RaB5Y2SW621B8M/3o+AT0+dRmEE4GPYa3EyRd
         GZS3V7skrUj+cf6DY0jiDSrDsj0FmMu/IlkKQ8Yk6dfO/axKpgAWNMtJI3KtQZ2nxu2B
         s1Tjg1IP8mbOChCX/usmY9i6c5bNTzQ72nqPt2AFQd9MZbvIvmVDBb2JZ+fF4At0VKI6
         jwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsqyxsAVSlOxkHs/ktXlOIw0yzzlQm8nxft+ufPq6ZE=;
        b=LEGU+6rFsx0sju/6eb7tuby/Qqmdn2PAb1EnMhqK9x6jM//bSrbX91DedGmsZ6Sr63
         Al45MIHTLsY7BKIVDLMOa+25zGprlqyqQN6mIZyL8+3y20J/QERR1xESrN3Uwb0dMLcG
         LCuCedCDYoi0io9eLWc0Mn4XuZTzBJLrEJbzWwL5P5yvw2qwecTST4+fVqPJy5RuiBSp
         Z8CYutw8RNvBQUu/Xc9hcRXPwlQGD+rU362jkHOF2e5Z/IR9cgAxhcFcgUf9cYI66tqm
         wg4LZ5owmVoHO/HsZ6W3JPtpXJNKZ6TnVo1dlLBHlj5T1rHbedMPfZrob3ev87NyewAA
         80ew==
X-Gm-Message-State: AOAM530eH9bAAYLrPHXw8AkAYldtypN4/l3gvCp++bco55p5wFJW1aXV
        6dBA0IrTIrb3S+GNIGNUn8KZpg==
X-Google-Smtp-Source: ABdhPJzahs8bcHSsKhULSprSsbqUAigoWScg0qPNCMMBkhA12fU/iySVFVyEzZ9GkhQKC/nO+JwuRQ==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr21161718wrz.520.1642434986037;
        Mon, 17 Jan 2022 07:56:26 -0800 (PST)
Received: from localhost.localdomain (hst-221-60.medicom.bg. [84.238.221.60])
        by smtp.gmail.com with ESMTPSA id i82sm15542900wma.23.2022.01.17.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 07:56:25 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/6] Qualcomm custom compressed pixfmt
Date:   Mon, 17 Jan 2022 17:55:53 +0200
Message-Id: <20220117155559.234026-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v2:

- 1/6, Added a phrase that the format is opaque (Hans).
- 6/6, new patch to address an issue with reconfigure.

regards,
Stan

Stanimir Varbanov (6):
  v4l: Add Qualcomm custom compressed pixel formats
  venus: helpers: Add helper to check supported pixel formats
  venus: Add a handling of QC08C compressed format
  venus: hfi_platform: Correct supported compressed format
  venus: Add a handling of QC10C compressed format
  venus: vdec: Use output resolution on reconfigure

 .../media/v4l/pixfmt-reserved.rst             | 19 +++++++
 drivers/media/platform/qcom/venus/helpers.c   | 51 +++++++++++--------
 drivers/media/platform/qcom/venus/helpers.h   |  1 +
 .../platform/qcom/venus/hfi_platform_v4.c     |  4 +-
 .../platform/qcom/venus/hfi_platform_v6.c     |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      | 35 +++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  2 +
 8 files changed, 87 insertions(+), 31 deletions(-)

-- 
2.25.1

