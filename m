Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C862427D0C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 21:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhJITNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 15:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhJITNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 15:13:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA45C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 12:11:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t9so52704089lfd.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YHzV+YpP+BYjr0TZ1VjoF5fEGQZXlwNqfD/o1zzTFIE=;
        b=E+m4bBy6bZpj9fmAwtCryXLrW01nTSb/mEIuv+KVdwV+5nKJekxgEvPo9begWp16Qu
         cgLY2qg7Rad9OQ2tL78AEMxm04X85A4CuHDcBavK7ZDk84flxLal2xyHzuauvmpWw9aD
         YCI96g5C8+lsPQtFSc3HnxW14rVNUTsZNvZ6G1nWK7YFIFWXXpy4SBKJO9Ua5dt78npG
         88YTmaUcvwFgYsstbKiAAb0ztcWg7SKT06u6VFGjanEm5lrNUYgzNumPjByqTaioxTDh
         nRQkMP010Q32kKGMILupHVEOyK5Nxh3j8c+xOyNSmOcKsPsW7DAoaViUl9OoFyJ20D39
         01VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YHzV+YpP+BYjr0TZ1VjoF5fEGQZXlwNqfD/o1zzTFIE=;
        b=LUC8Imoi32N81fQLFaNnMnqVF3yAqVqMBHB7oJ+URD2PeHnYVT2/w4gZgEUKpLAb6b
         fDoNVP+kR6Iuxa00tNHYg3yXX8jyYlfLn1NgoPXHkEDxSXInQI6ZkxP9Mn/mvUojDiKh
         Ggq3O3YamwXHJRdQAcZ3c8glTEIcjCJJBqLsrZ2cXj3U4VTZ5EZgsYpNSdihGRHtDzpf
         MNBL+QS24fN54Fm2VMCrVFyKOkCU0njmTw+s/y99RJKDBKc1cLxOflH3ye+Ooh6x/o0v
         8rNFV6Q6brWbglVK1wdVj9KvkQg8YFKpzeeI0En46RyBJZw82zCStxbiuVYtvGbEW/0S
         Bckg==
X-Gm-Message-State: AOAM530LIApGLpv0JekVALFApo3pZybpkifl2yhuipzPEsheKtaU7XeE
        bdav8ygLh3g7dg7uwOh84eMXRg==
X-Google-Smtp-Source: ABdhPJzrt6nic+Xq3OUoi8vcr5PyPvYs27zUrEVJnKzAO7UGjhd9XtlyB2G3GmYJ6sEG0c5+Py6jBA==
X-Received: by 2002:a05:6512:5c2:: with SMTP id o2mr16727718lfo.207.1633806676559;
        Sat, 09 Oct 2021 12:11:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r3sm272311lfc.114.2021.10.09.12.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 12:11:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] Add support for Sharp LS060T1SX01 panel
Date:   Sat,  9 Oct 2021 22:11:12 +0300
Message-Id: <20211009191114.45900-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add driver to support Sharp LS06T1SX01 6.0" FullHD panel found e.g. in
the kwaek.ca Dragonboard Display Adapter Bundle.

Changes since v3:
 - Replaced small msleeps with usleep_range

Changes since v2:
 - Add missing power supplies used by the panel according to the
   datasheet

Changes since v1:
 - Fix the id in the schema file

----------------------------------------------------------------
Dmitry Baryshkov (2):
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel

 .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  56 ++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 333 +++++++++++++++++++++
 4 files changed, 400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c


