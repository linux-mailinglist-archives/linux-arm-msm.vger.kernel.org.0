Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D562927495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 04:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729826AbfEWCv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 22:51:26 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:35984 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729797AbfEWCv0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 22:51:26 -0400
Received: by mail-pf1-f178.google.com with SMTP id v80so2386598pfa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2019 19:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=eelYOl+auCZwPeaiF2iZqxUedYahMzn49UDx8OOb2N8=;
        b=BrT/LmvVnhqjaKLk/W1wvw0WfcNXPvWG0i0rFsiMvmJpNRkOSM5XIMzQrTEyryQqNg
         RS8iiVSCimgKdPtY9di7vvJXbDUGY8aW4/uDwh9dw6FgZaxXDgrOXbV2BJW4Pv52ZS0A
         eRK1jYeKKSnZhbMeqtbVAPScLf/iDf23GCJdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eelYOl+auCZwPeaiF2iZqxUedYahMzn49UDx8OOb2N8=;
        b=K4ytijd7oCjKQQLl7HqDjdZ0dbRua45Yl9cVkqXeAFumDofk1+hwuRDGsylCVhVH+g
         zSBq5wwiZl8czfVRiHiMR9hkEQnN7VZHBgiRPtV8eawV0XeZc5CrlfK/FPOEB2YLPLk3
         bro9IDHLFz2c2XLc/5DM6IEXucn60bh7HZsuTs1L/A6Rwsh343KSjqdJN5RFST1K0AS5
         b6dIJx8uHIie1Nlldb4MbPXahzajWREZt08y/8j2/PC3tINfxcZaE8SYSCvSOQ5Qt6t3
         /j9x0Fp7NEGPULq1/hL8e78ameWSIkQ+IMk9tYW76/KQvTtlceao2QvKTDKWRvM2T0dq
         EdmA==
X-Gm-Message-State: APjAAAVvGPYX9th8xBnd2hUdoB8Cu34zut6bls83r0sz+ZSZMMqZVeug
        abfLKMLiQYIb9mhFYeQu0Oy4Dg==
X-Google-Smtp-Source: APXvYqyryGsGQdDT/y24ZM5GRt90QMDl4IIoLoKgwlwT7BtX21xYS/KWrf+aebtyaSorYCB4oWXgrQ==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr41505682pgp.56.1558579885890;
        Wed, 22 May 2019 19:51:25 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id q19sm42812174pff.96.2019.05.22.19.51.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 19:51:24 -0700 (PDT)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 0/3] fs: add partial file read support
Date:   Wed, 22 May 2019 19:51:10 -0700
Message-Id: <20190523025113.4605-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds partial file read support to the kernel via
kernel_pread_file functions.  request_firmware_into_buf function
enhanced to allow partial file read support and single qcom driver
using existing function updated.
Change to core kernel file support allows new drivers to read partial
file to memory as necessary in memory constrained systems.

Scott Branden (3):
  fs: introduce kernel_pread_file* support
  firmware: add offset to request_firmware_into_buf
  soc: qcom: mdt_loader: add offset to request_firmware_into_buf

 drivers/base/firmware_loader/firmware.h |  5 ++
 drivers/base/firmware_loader/main.c     | 49 +++++++++++-----
 drivers/soc/qcom/mdt_loader.c           |  7 ++-
 fs/exec.c                               | 77 +++++++++++++++++++------
 include/linux/firmware.h                |  8 ++-
 include/linux/fs.h                      | 15 +++++
 6 files changed, 125 insertions(+), 36 deletions(-)

-- 
2.17.1

