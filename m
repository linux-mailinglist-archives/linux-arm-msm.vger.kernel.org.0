Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3E5307D09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 18:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhA1RxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 12:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhA1RxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 12:53:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF0EC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:52:31 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p21so8742221lfu.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbK71zkHFE6KyfVBTn33eAqZ7sZK9c/eEF1/aOohtXs=;
        b=z6XGXtbj5Lik//wIcDpxAkabUgKmtO1PJApFI7TuIgR5skxYw+lQm89sFiNwCfWdki
         gmtife6i9YrmTYdtxmQJJ3qvTQ9jtDeHpZny1gxvDwfTO423Nc5Yvhjh3n+Ss6H86HO0
         0XXoTnOShJX0cJBtffL12BYegVE05kxRjW/zsE1kUSEBjIG4brnAxKvA69jdKpC/U2+f
         EEtGVVykeJuPeLMZlfcAPaDr07XCZI3ApPjiCVGA9jE9NOOrEvk0BmpkdvN50Ziei55i
         p8OuwvKrjAEvcRd2WcJM+8EqYPIG+eECmeKFxOODgqBqF43zcF5uPiZ2wNV06AgfQO5i
         TF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbK71zkHFE6KyfVBTn33eAqZ7sZK9c/eEF1/aOohtXs=;
        b=Rr+Y0xgwIhotKKvXGdOd14QooGb1k9xCfLfbyGrixJ7JBL+qCFP/uYLCUNk8Q+GWWE
         H2E67SWks0ZzpodUHpFvYh0L6fo53Lfe0Be06atDJlXlU3l4ch9Z8z5bX1cT6pCZ1OBD
         bNW4tCHwtyjvyOuYImVjydof46YiItvjwkElARhPQrkrrhnlarEYaWrpJdQx8e5OvEO+
         +FDoC206J9sNENqBs467oqxBamd85PmrVeK+dspc/vje7DiEYSFIWQiJC/JyquuPKETl
         9ZkXFqGU8aAiQFS6HBf4AzFtbaVq9zSco5nhQ4t5kKQ5v9lMcqmPP0E6EfG3cAJxBIsm
         V4iQ==
X-Gm-Message-State: AOAM531ncs27UMUK87I3ri7qaDPuTzlzWYgv0esVleHbEvBLjWBy8T6t
        URGJaRozBPgDKDG1G6UXR1Eh1w==
X-Google-Smtp-Source: ABdhPJw0TxpNgpcAn0O3X8/1z1fRsQfD1q21HK7RY7dPssNYpcPsyivXvE5Naui+R5qtmI6PWESz2A==
X-Received: by 2002:a19:7ed2:: with SMTP id z201mr126736lfc.310.1611856350370;
        Thu, 28 Jan 2021 09:52:30 -0800 (PST)
Received: from eriador.lan ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id w10sm2216119ljj.37.2021.01.28.09.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:52:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 0/5] Add support for Qualcomm QCA639x chips family
Date:   Thu, 28 Jan 2021 20:52:20 +0300
Message-Id: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm QCA639x is a family of WiFi + Bluetooth chips, with BT part
being controlled through the UART and WiFi being present on PCIe
bus. Both blocks share common power sources wich should be turned on
before either of devices can be probed. Declare common 'qca639x' driver
providing a power domain to be used by both BT and WiFi parts.

Changes since v1:
 - Stopped using wildcard in the dts binding, stick to qcom,qca6390.
 - Stopped using pcie0_phy for qca639x power domain.
 - Describe root PCIe bridge in the dts and bind power domain to the
   bridge.
 - Add pci quirk to power up power domains connected to this bridge.

----------------------------------------------------------------
Dmitry Baryshkov (4):
      misc: qca639x: add support for QCA639x powerup sequence
      arm64: qcom: dts: qrb5165-rb5: add qca6391 power device
      pcie-qcom: provide a way to power up qca6390 chip on RB5 platform
      arm64: dtb: qcom: qrb5165-rb5: add bridge@0,0 to power up qca6391 chip

Manivannan Sadhasivam (1):
      arm64: dts: qcom: Add Bluetooth support on RB5

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/misc/Kconfig                     |  12 ++++++++++++
 drivers/misc/Makefile                    |   1 +
 drivers/misc/qcom-qca639x.c              | 164 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c   |  21 ++++++++++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 drivers/misc/qcom-qca639x.c






