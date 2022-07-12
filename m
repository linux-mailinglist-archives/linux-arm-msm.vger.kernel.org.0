Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBEEE571015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 04:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiGLCSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 22:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbiGLCSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 22:18:37 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5880EC2A
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 19:18:33 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l9-20020a056830268900b006054381dd35so5248177otu.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 19:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emByWjbQoqud23XK8P6B7AoXGAPFJzuBuFTm+2tiWB4=;
        b=cWl/t1aOV1TQ05HVXLQoXEGM25sY6G/zgfTfA8Y4iM/XeS8mkYsq1ZU2JKLf5MahkK
         eqAA/m2cNtXBbubAPhMJfeyI7oHWMGlVBeoQDGE1n8XJYYtTvG9q9gpqOeQczOUq5LBz
         L0Qu3PcJ30zfYUm+c07PuYLZxpEwRO2XtGTdwcG7yUrvYdoC6nUVrgAoQDOxlEuCsJk4
         Yb+t39CUaXzlmJK7WuXBnc5gVxM20qlRtOpP0oeKL5gKfn0t2G1R6CvNRrAzA/Kztppa
         CaQMv655wbIPOhVhEk/ibaofBVsHrAteLl3GqBHfWjKEgV/yIzlrz319zSAyr5ROAcNK
         UmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emByWjbQoqud23XK8P6B7AoXGAPFJzuBuFTm+2tiWB4=;
        b=GWjZdNsPuPP815XETt6Za6P5YeVppoY2Eg+ctvy3cgdk6rwt3XVgCEajfzMyIB95yL
         /v8dFmiBePO6CwCyxZ0bsuOKslNez8mJ4nY1AX/kzAdt/fyyqgngXLQ42/9cFHkBiJmD
         HPuip3EqEQ6Xr/H+HkjtVQ+bIXjQjYCgZUwENjydyxKS2+1wjri2g+xPOOKW3KU5gyHh
         O4f4JWxIHEKILt9nB7PitQE4Gb3Go2Vzn6ldbiLKfT1YGMCL7Y406wS/9NMEBqSKcPy8
         vq+ZnSau3kQeCMa6uPbjFHukE4vO8ZJK7uuoxO9IfbCknmbRtchy3s62xXx6NzwbNZlG
         m4Iw==
X-Gm-Message-State: AJIora/VsqBq2g2IIyGtFVoi7HTxVvtGi4PlI4dq6OBnEGeoNU6IVjs2
        9cS420Tk4IW1xFAXmTOtpNoIZw==
X-Google-Smtp-Source: AGRyM1vtKEPOJdQqpPB0C3TxwcCYMGXA+6ldK99qt54xFY7Xz5WoR1dYBM1Yh0stZUXqSP84yliR/Q==
X-Received: by 2002:a05:6830:6004:b0:616:ecd9:129b with SMTP id bx4-20020a056830600400b00616ecd9129bmr8187582otb.232.1657592312452;
        Mon, 11 Jul 2022 19:18:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s3-20020acadb03000000b0032e442f6a72sm3469573oig.40.2022.07.11.19.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 19:18:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Jiang Jian <jiangjian@cdjrlc.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Xiang wangx <wangxiang@cdjrlc.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.20
Date:   Mon, 11 Jul 2022 21:18:30 -0500
Message-Id: <20220712021830.1271398-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.20

for you to fetch changes up to b9c2ae6cac403dee3195fda9eb28d8ee733b225b:

  soc: qcom: icc-bwmon: Add bandwidth monitoring driver (2022-07-06 15:57:51 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.20

This introduces a new driver that requests interconnect bandwidth based
on throughput measurements of the bwmon hardware blocks found associated
with, among other things, the CPU subsystem on many Qualcomm platforms.

It introduces support for the SCM wrapper driver to vote for
interconnect bandwidth for operations that needs bandwidth to the crypto
engine. This ensures both performance and guards against issues caused
by lacking votes for this path.

The socinfo driver gains knowledge about the SC7180P SoC.

It contains a range of fixes for spelling mistakes, refcount leaks in
various drivers and removes some redundant code from the apr remove
path.

The SCM DT bindings are updated to declare support for QCS404, SM6125
and SDX65.

The command db driver has a strncpy() converted to strscpy_pad() and
then back again with proper documentation to why this was the right API.

----------------------------------------------------------------
Douglas Anderson (2):
      soc: qcom: socinfo: Add an ID for sc7180P
      soc: qcom: cmd-db: replace strscpy_pad() with strncpy()

Jiang Jian (1):
      firmware: qcom_scm: drop unexpected word "the"

Julia Lawall (1):
      soc: qcom: rpmhpd: fix typos in comment

Konrad Dybcio (1):
      soc/qcom: Make QCOM_RPMPD select PM_GENERIC_DOMAINS/_OF

Krzysztof Kozlowski (8):
      dt-bindings: firmware: document Qualcomm QCS404 and SM6125 SCM
      firmware: qcom_scm-legacy: correct kerneldoc
      soc: qcom: cmd-db: replace strncpy() with strscpy_pad()
      soc: qcom: correct kerneldoc
      dt-bindings: arm: qcom: switch maintainer to Bjorn
      dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
      dt-bindings: interconnect: qcom,msm8998-cpu-bwmon: add BWMON device
      soc: qcom: icc-bwmon: Add bandwidth monitoring driver

Miaoqian Lin (2):
      soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
      soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register

Rohit Agarwal (1):
      dt-bindings: firmware: scm: Add compatible for SDX65

Sibi Sankar (2):
      dt-bindings: firmware: qcom-scm: Add interconnects property
      firmware: qcom_scm: Add bw voting support to the SCM interface

Uwe Kleine-König (1):
      soc: qcom: apr: Drop redundant check in .remove()

Xiang wangx (1):
      soc: qcom: llcc: Fix syntax errors in comments

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +-
 .../devicetree/bindings/firmware/qcom,scm.txt      |   4 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |  86 +++++
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |   1 -
 MAINTAINERS                                        |   7 +
 drivers/firmware/qcom_scm-legacy.c                 |   4 +
 drivers/firmware/qcom_scm.c                        |  71 +++-
 drivers/soc/qcom/Kconfig                           |  17 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             |  15 +-
 drivers/soc/qcom/cmd-db.c                          |   8 +-
 drivers/soc/qcom/icc-bwmon.c                       | 421 +++++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |   2 +-
 drivers/soc/qcom/mdt_loader.c                      |   4 +-
 drivers/soc/qcom/ocmem.c                           |   3 +
 drivers/soc/qcom/qcom_aoss.c                       |   4 +-
 drivers/soc/qcom/rpmhpd.c                          |   4 +-
 drivers/soc/qcom/smp2p.c                           |   3 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 19 files changed, 639 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
 create mode 100644 drivers/soc/qcom/icc-bwmon.c
