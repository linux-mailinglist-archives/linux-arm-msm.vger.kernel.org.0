Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9908F7E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2019 02:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfHPAJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 20:09:54 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42908 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfHPAJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 20:09:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id y1so1683136plp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 17:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Bmhf8PVD5dJtgK9AddO0xa1upUkZ6UmEqObX9gGUygw=;
        b=g/cwtFRUJnie4vfNE+kfKj1lR1TiRyNEuVwdAY1iDM2oMDkvNQRPopBFt2AACv1B8z
         983Gy7jmtLNUtCEhVXCX0aUFR0m7mYkc9iO4WydqOtvtn8OwfPTSoRaPcIBcLsbbjpTY
         nzPx9Gqd7qjNWuN/dFaJhHqps9pmNKWOvWrxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Bmhf8PVD5dJtgK9AddO0xa1upUkZ6UmEqObX9gGUygw=;
        b=QAJ+3U1nXlZ+PAX7GVIJcW1RPFwO0g9y5rmdrJohAdWmh6RiS2PBo1ky2ohz5jgRb+
         NxB9F/J6qDZujSKkzAaV7R47LxByEn9bU8XgAU6PLAA9aefuMuyy4zQW/hatKB/cz3tQ
         BLODZE6EVOiQYelRh7w4+63MKq7peK7Sfqy2B0OHxqn2o7A3bildrWL6znkevPYfiZ4p
         a1IAa/JGbX3dI1LuVlQ2Qak0+RphccI2lJaL/SMvgn29umDSr4nQvgWKivZazTL7C+mR
         b8ykCaX9evA+RpNNKfk3vq+Fwe6H48Shjuhtz9dZpBeICOYliQqrocJHxJaTBIsaOKiM
         fCAA==
X-Gm-Message-State: APjAAAUM2jH6wWm8gvsT9I6DpHBl/KUhIIjXZUf28rdDiKuCN4X1hVkl
        RoChfnShrUznXJ3ln6r8HWfJJQ==
X-Google-Smtp-Source: APXvYqybBoOAvisp8F+JZ3q5jUty2R8V65DI77Sn3u4nQ2zi0kHjcTpl9h1Y3GptDlHG/aiHG0TmbA==
X-Received: by 2002:a17:902:1101:: with SMTP id d1mr6747611pla.212.1565914193322;
        Thu, 15 Aug 2019 17:09:53 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id g2sm4056916pfi.26.2019.08.15.17.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 17:09:52 -0700 (PDT)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 0/3] firmware: selftest for request_firmware_into_buf
Date:   Thu, 15 Aug 2019 17:09:42 -0700
Message-Id: <20190816000945.29810-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds kernel selftest of request_firmware_into_buf.
The API was added to the kernel previously untested.

Also included in this patch series is a fix for a race condition
discovered while testing request_firmware_into_buf.  Mutex may
not be correct final solution but demonstrates a fix to a race
condition new test exposes.

Scott Branden (3):
  test_firmware: add support for request_firmware_into_buf
  selftest: firmware: Add request_firmware_into_buf tests
  firmware: add mutex fw_lock_fallback for race condition

 drivers/base/firmware_loader/main.c           | 15 +++++
 lib/test_firmware.c                           | 50 +++++++++++++++-
 .../selftests/firmware/fw_filesystem.sh       | 57 ++++++++++++++++++-
 tools/testing/selftests/firmware/fw_lib.sh    | 11 ++++
 4 files changed, 129 insertions(+), 4 deletions(-)

-- 
2.17.1

