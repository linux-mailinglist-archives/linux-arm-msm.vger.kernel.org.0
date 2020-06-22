Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9113720400D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 21:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgFVTTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 15:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgFVTTf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 15:19:35 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6DCC061796
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 12:19:34 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id a3so16670994oid.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jus7DNDunfIMFweSDWGPXAjkcv1IrAfG0u9GMpZ5ilM=;
        b=sK9YTPQH86hVUZWWh2ZdcBb/PzqD9yI/NEShdhMoHRASS6z2MQFuV6zJtyVmEmyShb
         coR9ZTY2FwG+evLcoI8Xy/beUUMV7wx4p7cx+UhqlCK35HpYDK1SyF92VVmLiRfAXp8B
         2j9XssWJSfYZgGjNy1U2ueJoZrxdEaxhLypxJksE2wmHI06gQ0zbTpvj2lMCI2eI9cDj
         4MzmooZ1MTZ4due3PgoKScdqrTgVxMjuPS2sNa5ZgyO5Hl1206ARWa9Thadj3mEXHe5G
         9R6sGw7oWmxfrvh7aFq0SGY8TlufZwdrpYZVJrmXb7BFnxF9xRLL8c8bL17qYI0/hsts
         WwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jus7DNDunfIMFweSDWGPXAjkcv1IrAfG0u9GMpZ5ilM=;
        b=ZawbQ3fym1rPlRGohlgNPChiuFjYGpdpjBGO+QUW9xdSfwCRMPDjAJA+KG5IwheCDx
         tXVaemvgeQI/OO0PQotkzhqdDEjAq7w0n5PXjFFiNYcW4lXZ2ucQEAX9mtDc3l7Up4N8
         CVb/twwATzhNWllBxQVdM+NqQ0wO46t01hWT3+xBWDIIqyCubr1RKmYQypRpM76jS2qP
         tMwDDn1EdRsGfrU1FS0GRUPlWYTF5sxq420bxmEqqASIrBSTNPtcZjS96BZsl/8j8T2a
         GnidJZnap0oGrA2QlUcwK1/Rut9w7/NK1yD8r/7zxL1mvKL0Ys2Xuh7X4+POlJoA0zed
         nw9g==
X-Gm-Message-State: AOAM531s7nhZDnCEOtn1GMkLD5zYRZhc5BFtHiT8obucnIaAa7p75F0m
        d6yqCZlLe1oSaBFSxM36IEwtpe08lNs=
X-Google-Smtp-Source: ABdhPJyOBaULh6qkKqzgj2z7VWM3cokDJpP59eooGuNB9sW1HfLepA6lCCyygGhAzkFdIUOln482kw==
X-Received: by 2002:a05:6808:487:: with SMTP id z7mr14223890oid.166.1592853572847;
        Mon, 22 Jun 2020 12:19:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m84sm3348294oif.32.2020.06.22.12.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:19:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5]  remoteproc: qcom: PIL info support
Date:   Mon, 22 Jun 2020 12:19:37 -0700
Message-Id: <20200622191942.255460-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce support for filling out the relocation information in IMEM, to aid
post mortem debug tools to locate the various remoteprocs.

Bjorn Andersson (5):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce helper to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 ++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 ++
 drivers/remoteproc/Kconfig                    |   8 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 129 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   9 ++
 drivers/remoteproc/qcom_q6v5_adsp.c           |  16 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  15 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  14 +-
 12 files changed, 271 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.26.2

