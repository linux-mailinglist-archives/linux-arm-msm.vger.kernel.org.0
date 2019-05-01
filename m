Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F320E104D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 06:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfEAE3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 00:29:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40852 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfEAE27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 00:28:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id u17so4146862pfn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2019 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JMEFW1F3ogTlltrf3f78tL/57sOx/RhTr3cC7ONZO+Y=;
        b=fCMrq09JeU0QbEQI3w26o2kfMeGloArCA6SqLokB68xGha3JYf6cb1gN8NfmxTR8UD
         X6f4S0XwG5Mc60wVDe3I9TEvcNSfMoJmDBFBfwuvWf4RHXOEfFfL2TeF09Aq6bD5BDNJ
         eld9q9G6zqUmGlAEPNNtAcvV4qQhm4tWXjMxyD4bPIail2qxJcp8+MPpsaxQMTCQQ8pC
         8+AFzpDqUNlnOYcG96odtdhA04aHAOfrFEM09/Qc3qB7lJkp1dklCGiSHJ4kZeKweGNB
         Ff5TDnJKhCQMCF0dukfX/VIEcKq8KLpYKQabbvEEBrQnMv/IMVn+RbwxNGMLuS3cYOHO
         SpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JMEFW1F3ogTlltrf3f78tL/57sOx/RhTr3cC7ONZO+Y=;
        b=a2y3kcAN1uEA5Sv5QdU1layD29prDClvNEAZSNAwGBxipDDRPJ3qOLazih90Cy5VqU
         ZqlnnpR/W8V2UIxJA+rsebzDU6dwamPdmMOFU6863M+7QHz9LBdFy/Fv6opRZzhJXNko
         acy6dovXK5jHn/UpmV854hEDioW34D6/cpWm1fyehVTSmGu4d1q8Im5gLyRMJjDARy2Y
         FZHsGoDogMR2tGNrb46i5mqZ7bExQwVC9Y+gUW/1UvVZ+hDijMM1IX9vmiJtRHHaD8xv
         vcD4aQ9sO4I9EzYcieSM1ksyDBde1Oxz0o2Sen0bDXrP3o3nZMoiKijpbEJ+MStgFsdR
         fEVw==
X-Gm-Message-State: APjAAAUvVnpy+tzx8yhtXHg2GLV+zb1CHSNb0J10mvzdIHNYumXFW5q9
        1dFmpYwLHpgbe6Tn7LfEycZhGA==
X-Google-Smtp-Source: APXvYqyqyz/6Isc8re162rFSusDzCRTwdsQFO8pdCwso2T+0+g6anOcYl/OYy9FP9uHM7nbuXttcFA==
X-Received: by 2002:a65:63cb:: with SMTP id n11mr39781315pgv.236.1556684939156;
        Tue, 30 Apr 2019 21:28:59 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm50371341pga.56.2019.04.30.21.28.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 21:28:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] Qualcomm AOSS QMP driver
Date:   Tue, 30 Apr 2019 21:28:51 -0700
Message-Id: <20190501042855.26570-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a driver implementing Qualcomm Messaging Protocol (QMP) to
communicate with the Always On Subsystem (AOSS) and expose the low-power states
for the remoteprocs as a set of power-domains and the QDSS clock as a clock.

Bjorn Andersson (3):
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP driver
  arm64: dts: qcom: Add AOSS QMP node

Sibi Sankar (1):
  arm64: dts: qcom: sdm845: Add Q6V5 MSS node

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  81 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  68 +++
 drivers/soc/qcom/Kconfig                      |  11 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qcom_aoss.c                  | 473 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  14 +
 6 files changed, 648 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/qcom_aoss.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
2.18.0

