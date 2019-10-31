Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A61AEB796
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfJaSzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:55:44 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36383 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfJaSzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:55:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id j22so4644771pgh.3;
        Thu, 31 Oct 2019 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=V4zHkz97KorGmF5oNhQ1X/YNEyDV1blf18i25yJIMSc=;
        b=QKUvn9aryQXg9mC1+JzlNx9O0XTKZ0saRgUgv18RXeufnupDvOVoceVRHRxHlp/cxd
         +yzgdl+GYGgW/4xK1+YYQ9sgb6dnhyIMdTFDXIs2PNjDI2EGLAmsqY/+PmElXaA4aAdG
         /HR0RZKSYwX3D1/FrogRT6/sDdf3CU8t+wLH687kxgNykN424HqPmBiGvHeA5foOBzvr
         H3wNd6/p+FTkg3BLsT8iNRSqmjoVnRD82BNv92c2p7zqUVj5YiaeH/S6dA3uNJwQZO/i
         FcH2Gk71huUJmE5rK10/g0fRtBoNe6cAd29MrwEGTd0tptm0F2eoGAqCBnWo3EiAN/hH
         iaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=V4zHkz97KorGmF5oNhQ1X/YNEyDV1blf18i25yJIMSc=;
        b=sWp5t1JkL3zIOG0gSaD9ZdBY0aQZ24NEZ4YEVVYjJmDQ5e9iEIACAiDxkuUV+w0SMo
         hgonEVB3BBrUr8CB3W5MXvssFqP7VPrxhIxd6NuVMewSDe/2Mniq9OtpSgVVWRWZvrQT
         jWMwiZVLQfcGplmkCLvJzG9uTMSTK0V29dpoLzR9gFEHFVo64lRbx8dv2AorY7UqOPKb
         CfJtDkyUR4WPGRQiA6qgu8oykUsqvqriUT1ZA5hWQfasH+g8M5bn7HYcfFJ4+A6Fvpz1
         wow8FweTy60oZOz4fC1YLIIgy7/HxTZ/GYJ4kXYSreM+SwZBeDKky1KOE1Y3oM0vni9q
         a6zQ==
X-Gm-Message-State: APjAAAWEOB/ig2i7A0/yy/RJcoiaj0yS/1Ps82D+lsn5h1OxpwoJq4AR
        lsM/5eqdU8OSKpkqjhGqXxGRNab/
X-Google-Smtp-Source: APXvYqzMY0miZHmTefMxF8haeXaq2pUxAMaIIMYFZbsseaQNDBT0MBr9YLBl1nPaa11OKloN6ayu4Q==
X-Received: by 2002:a17:90b:46cf:: with SMTP id jx15mr461336pjb.19.1572548143385;
        Thu, 31 Oct 2019 11:55:43 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b18sm4026025pfi.157.2019.10.31.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 11:55:42 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 0/3] MSM8998 GPUCC Support
Date:   Thu, 31 Oct 2019 11:55:38 -0700
Message-Id: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Adreno GPU on MSM8998 has its own clock controller, which is a
dependency for bringing up the GPU.  This series gets the gpucc all in
place as another step on the road to getting the GPU enabled.

v5:
-drop clk.h
-add missing clk_set_rate_parent flag on gfx3d
-fix compatible
-allow const ratio freq tables

v4:
-rebase onto mmcc series
-remove clk_get from the clock provider

v3:
-drop accepted DT patch
-correct "avoid" typo
-expand comment on why XO is required

v2:
-drop dead code

Jeffrey Hugo (3):
  clk: qcom: Allow constant ratio freq tables for rcg
  clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
  arm64: dts: qcom: msm8998: Add gpucc node

 arch/arm64/boot/dts/qcom/msm8998.dtsi |  14 ++
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/clk-rcg2.c           |   2 +
 drivers/clk/qcom/common.c             |   3 +
 drivers/clk/qcom/gpucc-msm8998.c      | 338 ++++++++++++++++++++++++++
 6 files changed, 367 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-msm8998.c

-- 
2.17.1

