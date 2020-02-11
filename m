Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEC5158710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 01:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbgBKAwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 19:52:09 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37442 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbgBKAwJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:09 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so499319pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 16:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qshz8xwSd4T4FUHpWJz/DB4ZEip4P7ef+7ElzXa5GA=;
        b=mIaz93TXepkqADCr5HGIgvgmepWNBxiGh2cT3pj61KSGgQW4osPx7h0OabLbTDSe7K
         YmMV2F50gE0XtqHWjzv4pvWu3Xmd9MiRMTe99E/KoJB2UIz+EQ77PUpC3IbBtTW4ccPA
         a5k/IDorLbzGz0sOyTBsk2HscLeGnFzH3TRo0433XtLuKvH2jvQm1VpkY37+yltgOlnc
         2YCwaa6g3XY+aVkDZKfP0Twz1duHOnMYfIfVZkYeiZaJSD4gUwsOO2bzZHKcu3FpjV9B
         fXLhju52XtNPzmk7xQZxc57v5N71m+CN6/AZB+QogB4SiZHLY5VA1Ko06nfX5QOPbGqR
         oCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qshz8xwSd4T4FUHpWJz/DB4ZEip4P7ef+7ElzXa5GA=;
        b=rTdeXZdyB33YqiDRNCVXeclX+4RcoViPbFXzvFXvKAiFRxXohiUsP/mZj8kqFelyOv
         4Y+ykG2GqSbOxLQIQZvnoCAp61v8g/95AXayHlQ9oIBoJnraJI04PN7n6Bn7pcYhoJ2x
         ijLgOBUlpG9+0JP/HWE9Q+/PgqV1Lt1AqB5N6hTMBX3yj1uk9EUwgh5s9Txcv/zoeuhA
         pXNYiLv0oO1uRqTw6iyvuslPhWqlRSe8iXqajCCBBuw+SCb3716j3qoH+iv/NqCnpYyE
         tEqkxYhFs0x5nwI4T/r5F7ZHtrHlcch+oAHjuBQwSytYYN0qh8zStJCLRpkUOni/z+JU
         zLtg==
X-Gm-Message-State: APjAAAUsHH33JhwlvA31kluP0iU0Z+sEjCsFN3fJgRmfFfJa3/Hs3stR
        xlpi86T2xVtZZWEEaqBTFhMbiw==
X-Google-Smtp-Source: APXvYqxRJngePboQPpSuuFdNF1/zNebVt2MFq5knTCNVk1TYpTs72imk/T9Sgld8ACAq3hmBxXEBOw==
X-Received: by 2002:a17:902:9b93:: with SMTP id y19mr15434992plp.89.1581382328743;
        Mon, 10 Feb 2020 16:52:08 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 0/8] remoteproc: qcom: post mortem debug support
Date:   Mon, 10 Feb 2020 16:50:51 -0800
Message-Id: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following series introduces two components that aids in post mortem
debugging of Qualcomm systems. The first part is used to store information
about loaded images in IMEM, for post mortem tools to know where the kernel
loaded the remoteproc firmware. The second part invokes a stop operation on the
remoteprocs during a kernel panic, in order to trigger them to flush caches
etc.

Bjorn Andersson (8):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce driver to store pil info in IMEM
  remoteproc: qcom: Update IMEM PIL info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region
  remoteproc: Introduce "panic" callback in ops
  remoteproc: qcom: q6v5: Add common panic handler
  remoteproc: qcom: Introduce panic handler for PAS and ADSP

 .../bindings/remoteproc/qcom,pil-info.yaml    |  42 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  13 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  13 ++
 drivers/remoteproc/Kconfig                    |   6 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 168 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   8 +
 drivers/remoteproc/qcom_q6v5.c                |  20 +++
 drivers/remoteproc/qcom_q6v5.h                |   1 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  27 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   6 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  26 ++-
 drivers/remoteproc/qcom_wcnss.c               |  17 +-
 drivers/remoteproc/remoteproc_core.c          |  46 +++++
 include/linux/remoteproc.h                    |   3 +
 15 files changed, 388 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.24.0

