Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B5B133884
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 02:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgAHBjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 20:39:04 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39402 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgAHBjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 20:39:03 -0500
Received: by mail-pg1-f193.google.com with SMTP id b137so737300pga.6;
        Tue, 07 Jan 2020 17:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qrBHJRFSRA4AlmSOTlxgOJ04a73uvSIbhRd+GAk2pRE=;
        b=ejeetgrcvv9LsANDxK4s91NGCUtBlKd9sKWqIIK30ge81Kr3B8uhtVoCvfC+V8RuZo
         k3tsAtYkYe+3Kj9IzIcdhnuZpq6JQKfNqfS+pPtEXTjMDRTixQSCX1D/GUUY/qg23W2N
         YzM9zAOOlCEBSqx4grMnk0Z24bb7ilMh17h4wjC4MqvnSpejwCKLFk2XvVbFcbVB35tp
         41feryqS09briYf4eGcDGNuUU4XLmSVnU+X9EMbw1C2Gi0MUp7iCiq39bRvvhzBEC1we
         WNT8TtlhktCHnPYfsp+GAIdGW2wHPu8p/3DVaAlxLAoasAomod10GTlOiuqQdCtG6UPU
         9YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qrBHJRFSRA4AlmSOTlxgOJ04a73uvSIbhRd+GAk2pRE=;
        b=kmFSzJQ37amdYKdF9SbDM5rxtsxWfI1RljkfaQA1y0YMgTh6fDv0l9tZe8dvuPe1aH
         +P6GODQgET8GQ2AoQ4utY/2ndy3Mp3iBocF9QgebKLUVfd7LaVzhQDYTatyBNn2fX3h+
         N9MIUuezzVRGXfsljMUlFQmdQ1xoX8zxvFuFdzZnTKHrbBM9Wu85kX3OIPLfcHSQjHAO
         UevLfYkOTY4KRlNHSElSMdkYo0HTTD+6r1VNTqOPBzuYwrCtI67KVGpbdMoQWTB/Yj/y
         /QSid1ZSManAPJ/X9sWqFhJds4QZrnu22cBD8pDteFV1xkoCr8mj02vUwsGjDE6hCJTm
         +hgA==
X-Gm-Message-State: APjAAAWTINOpOP/niqS1pT4SOUrXZJDgM5je/sQ2p9A4sQUItv9GOIhp
        e0Y78ry7/QzofVZXvV9Ha2s=
X-Google-Smtp-Source: APXvYqx/RXCffdkJxN9926F2ZtBJ7RCAjEZ+yRHzVoEMHDlC2SG4j9p18uaRcrabtEj3ZNUIWgSNsQ==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr2431615pfi.71.1578447542963;
        Tue, 07 Jan 2020 17:39:02 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id 73sm1032858pgc.13.2020.01.07.17.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 17:39:02 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/3] drm/msm: use firmware-name to find zap fw
Date:   Tue,  7 Jan 2020 17:38:41 -0800
Message-Id: <20200108013847.899170-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For devices which use zap fw to take the GPU out of secure mode on
reset, the firmware is likely to be signed with a device specific key.
Meaning that we can't have a single filesystem (or /lib/firmware) that
works on multiple devices.

So allow a firmware-name to be specified in the zap-shader node in dt.
This moves the zap-shader node out of the core sdm845.dtsi and into per-
device dts files.  Which also removes the need for /delete-node/ in
sdm845-cheza.dtsi (as cheza devices do not use zap).

This aligns with how Bjorn has been handling the similar situation with
adsp/cdsp/mpss fw:

   https://patchwork.kernel.org/patch/11160089/

Rob Clark (3):
  drm/msm: support firmware-name for zap fw
  dt-bindings: drm/msm/gpu: Document firmware-name
  arm64: dts: sdm845: move gpu zap nodes to per-device dts

 .../devicetree/bindings/display/msm/gpu.txt   |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  7 ++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  8 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  6 +---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  7 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 32 +++++++++++++++++--
 7 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.24.1

