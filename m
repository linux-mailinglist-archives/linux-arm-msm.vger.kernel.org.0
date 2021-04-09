Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE13435A38B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 18:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhDIQkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 12:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDIQkF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 12:40:05 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0553C061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 09:39:51 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id t140-20020a4a3e920000b02901e5c1add773so229028oot.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2I7vz5xvNaGcHWWThHF1IEDKnVReToEcusVQ2zMISA=;
        b=xETKEtGItsm/JmQqTLBVMoGDGLl19hQrTN/Dfm0DMLD3wMYWkv3tRExvjFFLjPCQP1
         1XLul0HkC1L1NrUEYsvavEqYaANvmUw4JAtg5kjfNp8cNprhb5P6cXmpzRXTkCUd+MUf
         AHpCv8qCpMJrJ7C2wfRQcEshG4pQp1KyP0IUAtaenJ7z8bmtFZgkt5oREVYQvcNJQ0bA
         giT7+BMNgK6LF2429vGSoAZWRm59fx9/yRmPC0Xpvlnn/lYHJmVlQwzemfaXSNnrAzw9
         EObzKZMpRUjwZfZJV47BOPQkNbKGuP/m4fn8jOfpxKaobaiNAfQwehIFAJksXYx7Yju+
         c0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2I7vz5xvNaGcHWWThHF1IEDKnVReToEcusVQ2zMISA=;
        b=ZPiuZEAW9qTedFGjAEh/NNKJlOD2VdwMoncxDIcbEjteu4cLwqMXif94nMm+B9nC9X
         ImgrperTTcQSAJrSLioWecvhUVoRh9i+ONKLe1+iAWF88L7F6ptf96SD8maCU0rVneij
         SMv3cZ33H6Q2aAsJsf+GRCraZAEDT7jZVqJs9iFQp2Lf71aLktScpgKmcPMX4r//pfsZ
         /a608wWv6YJKZZxpnavNV3oNLwZBWWNcvrk29C9KfjhKmgHtS9um5CLKEndLP6OEj6Y4
         WsHKfQGS3GlUNPXOKcqC+5M6PO6yFhK58JrfpLfJHjKcp/KfhS2NbF6x48fe+3EKFVGy
         eSeA==
X-Gm-Message-State: AOAM531/TTs8c0YVr4+GQf2xiw054Qw7+XMc1lL8VVbnE2Q6Bp12Lp0C
        9iocH6v4lqDlOTxpi8pX8jcDuw==
X-Google-Smtp-Source: ABdhPJwH2uVxpLp9og2voqCtDqUvyt9JU3NklXdAiwRoO2+CRgGLOQC7Oz/xUUXxDRmLGh4js5eNXQ==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr12582747oop.18.1617986391161;
        Fri, 09 Apr 2021 09:39:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n104sm43979ota.27.2021.04.09.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:39:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Robert Foss <robert.foss@linaro.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sujit Kautkar <sujitka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        satya priya <skakit@codeaurora.org>
Subject: [GIT PULL] More Qualcomm ARM64 DT updates for 5.13
Date:   Fri,  9 Apr 2021 11:39:49 -0500
Message-Id: <20210409163949.776530-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e9269650db2f5b4aeeafced1a42b2e51d10bcdf5:

  arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS (2021-03-18 09:35:42 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-2

for you to fetch changes up to 7178d4cc0702bfe6a7e0f21e37d6e3dfe8e40f11:

  arm64: dts: qcom: update usb qmp phy clock-cells property (2021-04-08 10:23:25 -0500)

----------------------------------------------------------------
More Qualcomm ARM64 DT updates for 5.13

This adds RPMh regulators, coresight, AOSS qmp, ipcc, llcc for the
SC7280. It adds interconnect, PRNG and thermal pieces to SM8350. It
specifies the now required clocks for the SDM845 gcc, corrects the
firmware-name for adsp and cdsp on the db845c and defines DSI and panel
bits for Xiaomi Pocophone F1.

SM8150 gains iommu settings and the remaining I2C controllers and SM8250
gains Venus and the QMP PHY is updated to include the DP portion.

It adds the MSM8998 based OnePlus 5/5T device and enables sound support
on the Trogdor device family.

Lastly it adds the GIC hypervisor registers & interrupt for when Linux
is booted in EL2 on MSM8916.

----------------------------------------------------------------
Ajit Pandey (1):
      arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver

Bryan O'Donoghue (1):
      arm64: dts: qcom: sm8250: Add venus DT node

Caleb Connolly (2):
      arm64: dts: qcom: sm8150: add other QUP nodes and iommus
      arm64: dts: qcom: sm8150: add i2c nodes

Dmitry Baryshkov (4):
      arm64: dts: qcom: sdm845: add required clocks on the gcc
      arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
      arm64: dts: qcom: use dp_phy to provide clocks to dispcc
      arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmware

Jami Kettunen (2):
      arm64: dts: qcom: msm8998: Disable MSS remoteproc by default
      arm64: dts: qcom: Add support for OnePlus 5/5T

Jonathan Marek (2):
      arm64: dts: qcom: sm8250: fix display nodes
      arm64: dts: qcom: update usb qmp phy clock-cells property

Robert Foss (2):
      arm64: dts: qcom: sm8350: Add thermal zones and throttling support
      arm64: dts: qcom: sm8350: Add support for PRNG EE

Sai Prakash Ranjan (4):
      arm64: dts: qcom: sc7280: Add device tree node for LLCC
      arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
      arm64: dts: qcom: sc7280: Add AOSS QMP node
      arm64: dts: qcom: sc7280: Add Coresight support

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz

Stephan Gerhold (1):
      arm64: dts: qcom: msm8916: Add GICv2 hypervisor registers/interrupt

Sujit Kautkar (1):
      arm64: dts: qcom: Move rmtfs memory region

Sumit Semwal (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits

Vinod Koul (1):
      arm64: dts: qcom: sm8350: Add interconnects

jonathan@marek.ca (1):
      arm64: dts: qcom: sm8250: Add videocc DT node

satya priya (1):
      arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |   4 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |   4 +
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |  42 +
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      | 514 ++++++++++++
 .../boot/dts/qcom/msm8998-oneplus-dumpling.dts     |  25 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   2 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |  10 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  60 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 212 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 520 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |  71 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 553 ++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 128 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 911 +++++++++++++++++++++
 19 files changed, 3048 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
