Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1E6342F3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 20:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCTT21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Mar 2021 15:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhCTT2O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Mar 2021 15:28:14 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894DFC061574;
        Sat, 20 Mar 2021 12:28:14 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id by2so6741837qvb.11;
        Sat, 20 Mar 2021 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=acrEGTvzSD98+ASlS2uMJi7waK+gVXOJD0BsXcBLrs0=;
        b=UyzkUHpZ/XLDiRsk7RAoZnJwyddY3cPqNRUKFWQ9zSR+h0++euNd9SJvMLPWg8iEsl
         oD1d07C3mdR8jc5L/rjfiTdof4jQGkkZleqESdmL3XJ+Px+9WqIdtlrby4B9VF7N/Ad2
         dGYmuvdDKW+cRnPghfUANIdBqH3QUFfRn2zE/1ymbjusQ/CMY10Rua5AMa81ljwz5Zx6
         NcjFxPqM99yEzCc6i7ONPszGAj/BC9ykbbQ9W8qX1bqoBa0/0uk4XclldByjKwwmCx+F
         tKAjpaAt/7F2DWROcLudTj5M/7yiLNwxTqeKddEZsxrupBE1XJRwiNXA7gaZsmAVeRb+
         GRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=acrEGTvzSD98+ASlS2uMJi7waK+gVXOJD0BsXcBLrs0=;
        b=ST4pHuufp+YoGN48csv4dBAnVNRE0QdAINGoOTdVJR790hefiF4lqWvp4fjQvJy1Lv
         HfWvdCbTsaaNw7T55YW6WDce8uUpGv/XOKtpbWJFjqM8SytZ81kG6mGdCgTH1fsdWUuJ
         t+GvCJ3MUsY2swMA/RgbKfky5LjVUZWsMFLFdUNFxsqm3rm7RWFARarNxpsXjjRCMVgY
         Ei3gn0ZBnVMfoqIQhORf2+23wi3V5wJEyyy8IghhRrIkC2O7Kdib/YHCTxeUXI+BNS1k
         QPplR8S3qqvIlj2DPnZyx1zN7RrtwpuPKxJ8bTgMa4RxagXbLNYITlvTh/oGEmy04veC
         Fo/g==
X-Gm-Message-State: AOAM533F0JxTbvWc13S9lC64y6WkKQv/CklLfGQu7ckDM8GnTSwFwzOP
        nxoob1gWfc/lcPTPBL0XoEQ=
X-Google-Smtp-Source: ABdhPJx1YjYwBBUcUchYxxDprbOY7HkafIbJ8dkq88NDiPrTTQ6xsLVs4yU77GwWLYI8G9aFFkj5HQ==
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr4542698qvo.20.1616268493851;
        Sat, 20 Mar 2021 12:28:13 -0700 (PDT)
Received: from localhost.localdomain ([138.199.13.205])
        by smtp.gmail.com with ESMTPSA id p1sm7333733qkj.73.2021.03.20.12.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 12:28:13 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dt@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] dt-bindings: msm: Couple of spelling fixes
Date:   Sun, 21 Mar 2021 00:55:53 +0530
Message-Id: <20210320192553.29922-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


s/Subsytem/Subsystem/
s/contoller/controller/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..586e6eac5b08 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -2,14 +2,14 @@ Qualcomm Technologies, Inc. DPU KMS

 Description:

-Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
+Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
 sub-blocks like DPU display controller, DSI and DP interfaces etc.
 The DPU display controller is found in SDM845 SoC.

 MDSS:
 Required properties:
 - compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
-- reg: physical base address and length of contoller's registers.
+- reg: physical base address and length of controller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
 - power-domains: a power domain consumer specifier according to
--
2.26.2

