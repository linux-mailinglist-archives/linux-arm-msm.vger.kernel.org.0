Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A161649F156
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345566AbiA1Cyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345512AbiA1Cyt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:49 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1AAC061747
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:48 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id s9so9754237oib.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZ09zZh43E7tXHG2E2Vwc7ofHsJ1Ii8TO5MAW1mVCYs=;
        b=iB9OiZ4cinZKQh/bcru3DdlB/I71TE1CqGYnR/p7p/v2yZ6MUXp/nyKnPB1+pPr5qi
         +PJPUzpysmF7dPC9BSRuaof/HUBGhQUbvQ0pihtQenwL05yStj+j4+WTaf3BeclOPMvg
         u36N+8puui43wjUPsZTyLHPbOEF1xHw3CTuBunE7xjZdSYNTO/ylCmiM3qE2VubF6Dzi
         ftDsP08UM24H7J5XGN8HUtp3Md41o8PC3CWaui8OJZniTVBIjPvfCWUiFfdOm68XXiaa
         GcqQn+OL9KhFOhoa/lTRpqt4ty8nETnC0SCS5eO4sKcdJJ1CzWFwu5A3FGXh+cmued+2
         rbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZ09zZh43E7tXHG2E2Vwc7ofHsJ1Ii8TO5MAW1mVCYs=;
        b=3TwJPnv1gblKke2ZvP2fiMl3eVfIsA2/6AYy7EUmgwYehltA7l2qIApGZiUhbNEJei
         MfuDX6uoIb51UxFzFfMSKyA9rglQLaaCK37n4KuiOYVG7d6IGCUsVYyHy1/Jfv3fuHi5
         qwV6dmMe5YzO1pCtfoSLGyn9lCWyGZg94I/TDtW3t8sF2o6RSm7EBDgOQKwcBvRK9avP
         It+yp0z8IAY0Ge4z9ypfOh4God0G+ZgMa7j3LmmGg3VRtqLm/LL1Ln5WkDc/BzbY95Eu
         mEcKjfzXOzb67HhXYe0TddPCt9mwRYK6rUV+X0OFXElngc99/3b9CG2X0iIKPgXtiRnB
         ebjg==
X-Gm-Message-State: AOAM532vJd+rYTuOHR/gIj4KHn0M616W+XBbWZOE8B1harUnA4zXacpe
        +uVe4ixgxWNP837VArnzy1BMOQ==
X-Google-Smtp-Source: ABdhPJybAvO6DTbzDHaecPZUsiIVi2CiXN2nWgFYKmsusfyc7bgjUp+NUJLXjUsWUhlSrluUTR8gPA==
X-Received: by 2002:a54:4785:: with SMTP id o5mr4093778oic.96.1643338487825;
        Thu, 27 Jan 2022 18:54:47 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] soc: qcom: mdt_loader: Support Qualcomm SM8450
Date:   Thu, 27 Jan 2022 18:55:00 -0800
Message-Id: <20220128025513.97188-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM8450 platform comes with both some smaller changes in the
firmware packaging and a new requirement to hold onto the metadata buffer until
PAS auth_and_reset has been completed.

Extend the PAS api and rework the mdt_loader to meet these new requirements,
then wire this up with the PAS remoteproc driver and finally add the SM8450
remoteproc instances.

Bjorn Andersson (13):
  firmware: qcom: scm: Introduce pas_metadata context
  soc: qcom: mdt_loader: Split out split-file-loader
  soc: qcom: mdt_loader: Allow hash segment to be split out
  soc: qcom: mdt_loader: Allow hash to reside in any segment
  soc: qcom: mdt_loader: Extend check for split firmware
  soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
  soc: qcom: mdt_loader: Always invoke PAS mem_setup
  soc: qcom: mdt_loader: Extract PAS operations
  remoteproc: qcom: pas: Carry PAS metadata context
  dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
  remoteproc: qcom: pas: Add SM8450 remoteproc support
  arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
  arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances

 .../bindings/remoteproc/qcom,adsp.yaml        |  16 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  20 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 297 ++++++++++++++++++
 drivers/firmware/qcom_scm.c                   |  39 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   7 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |  36 ++-
 drivers/soc/qcom/mdt_loader.c                 | 232 +++++++++-----
 include/linux/qcom_scm.h                      |  10 +-
 include/linux/soc/qcom/mdt_loader.h           |  17 +-
 9 files changed, 579 insertions(+), 95 deletions(-)

-- 
2.33.1

