Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC9D25E984
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 19:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgIERk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 13:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbgIERkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 13:40:08 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E05C061245
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2020 10:40:07 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id w186so9460812qkd.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2020 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQro0KvCecashCGNg/PcVjIspfzorn2YBuMdQvvHTl8=;
        b=srHQREj2hm0W+uI7LdTFJ9F0DKd0AlV6pwGNbUXc3rUIVL9GDEUrBmquCnRQyChgwF
         3MRZZ3A/sFDT28zANbCD5IT2BxHZKj0ZQjq7Xyy/mW+Zw/PITa0mTGo0oP8Xe0G/t5Qk
         Ne+RK35wEDCSnndnUkKNJM+zFe/FO7ucF6x/C5OgzSlolGLvvi4Gg4Bec3eO6jnG/Hn1
         ZzL2Xxmmm/0ghLM4wRRYA1pD1Xu+GkfX27BtMSNhMbu7zPamJYehmYXIYfFuXcVOyC9w
         Jim1mFqNRzrHwdbb5V4KYdm7gTEeF8SeQE86PCJupPPjIGmssG+2rg6Oliwa9O1cnEEm
         pwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQro0KvCecashCGNg/PcVjIspfzorn2YBuMdQvvHTl8=;
        b=by3xRZnFxyZfVFaSBegNL8O9QdYI3Ja8ZKBW49Zi4tu7FH9HW6BH18dFSx2iPRVSxB
         bJM719n3ZJSsrSL0426tn5z1YHT5QkGtfPdR6OuQIhmwd6nQ7KZuVciYUhjr1OyN90Oh
         h6GXu/ObHgyR3o3sXfkbOkrbEjD1qHmLJC86Rh2Y1YI30+JSkBox+pE4+DlekZswZnKh
         NQiV+GI7oowMACxgRJa4+K3EvBKMZMSZMcwW61XxuYHN/jEzgayNHAorhbMwlO2u7oOG
         esCdCod02Smhst/9WUSe4CwMcgN/pi45pQ67eNdZlcaOGUQwS8wFHD0AI8LK/OiHTHSJ
         Ew5g==
X-Gm-Message-State: AOAM532AavoMdsjVgQ4uw0viYlrm4gdcIBR+9DFbLVbb2zoCH2ADZYOV
        PRy4kpmTclb8XE9I0zVYkX2RiQesYOzq2n7B+LA=
X-Google-Smtp-Source: ABdhPJz+AoKdk7U3xzEnEhwLVI+mA45wdHjbSYoaWKhRvxjshzsYjE8/yNT4RO4odN3yDb0/RtiSwQ==
X-Received: by 2002:a05:620a:1381:: with SMTP id k1mr13315111qki.140.1599327604804;
        Sat, 05 Sep 2020 10:40:04 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 10:40:04 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     alsa-devel@alsa-project.org (moderated list:SOUNDWIRE SUBSYSTEM),
        Andy Gross <agross@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire master
Date:   Sat,  5 Sep 2020 13:39:01 -0400
Message-Id: <20200905173905.16541-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds initial support for soundwire device on sm8250.

Tested with the "wsa" sdw device, which is simpler than the others.

v2 addresses some feedback, but I kept this series as simple as possible.
In particular, I didn't implement CMD_NACKED from FIFO_STATUS, because
the downstream driver doesn't define this bit, so I can't implement it.
Soundwire works without it and It shouldn't be difficult to implement later.

Jonathan Marek (4):
  soundwire: qcom: fix abh/ahb typo
  soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
  soundwire: qcom: add support for mmio soundwire master devices
  soundwire: qcom: add v1.5.1 compatible

 .../bindings/soundwire/qcom,sdw.txt           |  1 +
 drivers/soundwire/Kconfig                     |  2 +-
 drivers/soundwire/qcom.c                      | 38 +++++++++++++++++--
 3 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.26.1

