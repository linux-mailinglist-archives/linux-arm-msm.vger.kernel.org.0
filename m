Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F4D5D336
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 17:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfGBPo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 11:44:29 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45028 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGBPo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 11:44:29 -0400
Received: by mail-qt1-f194.google.com with SMTP id x47so18933381qtk.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2019 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfWPWLek+Gy43+eezXfh8eVjBj+6pFJ2g4xROl/XX14=;
        b=m8sHp+PesxAz+xrB+8tq6DQqXluhdgjCtQ9rw6c+GGyf2EHzLqGzXBPZullZNv25iR
         rJN72x1FYIR5JfAt20csjgoJReIUsyZnHI+k8Juc+WZqQOhAEAyLy6FCYAc3EvkVhDe/
         z+KxNVhA0ADLOk6+r/CoL4Ruql9+LRxIXTBr1AtFkU1QMCIM8j0VgS4SY88Gvz8ha+Iz
         ppuFTtyidQHZJlEnK8EFT/xQfJab4b99W6Oy6XdvhcLoiQDgGAixtJ4oUl5A4bZ7grHP
         rBMADZirN1Fj7/IdDv2RVJiDQGnxoNHubC/Pxn5GPiK2x5Kef4T/58KFd4kBPgTV4tpn
         jq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfWPWLek+Gy43+eezXfh8eVjBj+6pFJ2g4xROl/XX14=;
        b=BnT/aC7lMzyqeRLwfI+5hrtmUrMmMuSDYSUbmfUHMfewQ/FtHNIfUdcnYIXlMAitzK
         CzcsfIG95KFMoXzsti4tXGC2YnBfJlLKuMKxj/D9je/ffad1g1Ml+0icMmZKkKbbruXr
         CXRgctrGGc4PzzNbYRezuG6Ovf7zpn4Pu0bV7MqrCBSspYsTOVSPIBg2CZqzfeeYB+d0
         AoZECIa+9cSsjIMC5tFeYi9KRq205pceZAnsPI4cv4F+kLpGVKn+PDy7yJXT6zPG3EYY
         6+zv3zywcyBbPINnOOH+VKoPNzHyDJckTasX48dCbRCAz3Wd3TBApNYoOjBkeX1/c4xX
         riSQ==
X-Gm-Message-State: APjAAAWpiQCpawSHuTaNY72NpGpkktfgfFWxMXPUBKhSmYObS+ZAXOj/
        +XMg8svvPfAY4F0QP7lievQ=
X-Google-Smtp-Source: APXvYqxf14HBJmxdCsYRgJfYZHCwqdsOiHgJT0V1QUIyldFt4FZFC7ZkBJlaa591ZIzt78Xi/9TbVQ==
X-Received: by 2002:ac8:2d17:: with SMTP id n23mr25779712qta.132.1562082268324;
        Tue, 02 Jul 2019 08:44:28 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id c127sm6362897qkg.121.2019.07.02.08.44.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 08:44:27 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 0/3] drm/bridge: ti-sn65dsi86: debugfs and mode_flags fix
Date:   Tue,  2 Jul 2019 08:44:15 -0700
Message-Id: <20190702154419.20812-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In process of debugging panel on my lenovo yoga c630, I noticed some
errors in the dsi->mode_flags, which I guess were just cargo-cult'd?

Since dumping the status regs was useful to notice this problem, I
cleaned it up and turned it into debugfs.  The last patch corrects the
mode_flags.

Tested on cheza and c630.

Rob Clark (3):
  drm/bridge: ti-sn65dsi86: add link to datasheet
  drm/bridge: ti-sn65dsi86: add debugfs
  drm/bridge: ti-sn65dsi86: correct dsi mode_flags

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

-- 
2.20.1

