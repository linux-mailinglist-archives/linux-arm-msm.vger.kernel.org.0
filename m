Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1E6520468
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 20:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240146AbiEISWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 14:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240143AbiEISWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 14:22:39 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95AF42CC135
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 11:18:44 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id y14-20020a9d460e000000b00605ee347da1so10657591ote.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9O1o3qMLMMSVlGaMQwp8pzkZwsf1OvAD73QPO75L7vI=;
        b=KpQBbBopsuLCTH/bLT5UGAr2AvgWH+mcQTpkA+b11kaQUV6iNCPz5ElKSwPaQY7njE
         z61p6AfYO8XeF4TfhfgsYRnVgzcse6u1VjCDtLAXeVyOlRMiosqymgeDQqSTl/I/86Pe
         bKggKmUFS9dSzUNR4MnNmk4IgsInHwgrATde3m/nC5RDKCLuZHqa4UiilgaJpNGaImyB
         XQ4et1x3M9MO1+cbVuQ8cmPwUXwUoj9rIQULkVqbeDHv2hvyypQxlBuIlfeEdkuX8HPI
         O6PQAfR+ELpsA70tcJdEIA9OCO4IpB1EVir6Z1VF8IKH20cr1hopXFJjCcvVY88q/RIH
         uFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9O1o3qMLMMSVlGaMQwp8pzkZwsf1OvAD73QPO75L7vI=;
        b=fiJjrDlPtuRY2wZ9qdVx1HSBFJkJd0+puaV19vM242tsSvns/Aj754+ncvThYjodlX
         0zgkWbRWaCDNWVduDxIZxB//5E6wXcSFZt94X70FPCn0U5OUR3kIaiLPYdjACs9Q5SZr
         e7biIoIAxZdm7K2KN+b6vuXYmWrA+AIA5Pkeg7IvASIZ7CZfTdBu7SgoHtAQXBoWSR5V
         0UbWccCIUaGcVWFNHK7wmPHBowTsGJIft4fW/DBX+5jZTdXOetc80ZvUz8hH0/OCKtr4
         E7kFF9HebfhxaeUn/Ue4WPh55jlOZ25ej7iwtex9laFCszUTspyYn57r0A5VY9efQcff
         hKKg==
X-Gm-Message-State: AOAM533NgIrvrH0h7Z65Cn4CZ6R8JlMX4B/+Ft1Avr15bcA1Izr/7EEI
        P0hEZImWUrRk0624JVWq1PV8jw==
X-Google-Smtp-Source: ABdhPJyMWjUHFCtaHAyi4lOENMbqmUkiw5gx3h3lJPEwf6G1/JKPtZK4yK4+lcisRngcyfrnmWzdcQ==
X-Received: by 2002:a9d:34b:0:b0:605:f0f1:e28e with SMTP id 69-20020a9d034b000000b00605f0f1e28emr6337180otv.304.1652120323874;
        Mon, 09 May 2022 11:18:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id em22-20020a0568705b9600b000e686d13890sm2156991oab.42.2022.05.09.11.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 11:18:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Tom Rix <trix@redhat.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.19
Date:   Mon,  9 May 2022 13:18:39 -0500
Message-Id: <20220509181839.316655-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.19

for you to fetch changes up to 28e3dc8f8cd37eedc14e97e80a7a2e33359491df:

  soc: qcom: pdr: use static for servreg_* variables (2022-05-05 22:08:15 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.19

This converts a wide range of Qualcomm-related DeviceTree bindings to
YAML, in order to improve our ability to validate the DeviceTree source.

The RPMh power-domain driver gains support for the modem platform SDX65,
the compute platform SC8280XP and the automotive platform SA8540p. While
LLCC gains support for SC8180X and SC8280XP and gains a
MODULE_DEVICE_TABLE() to make it functional as a module.

It adds a driver for configuring the SSC bus, providing Linux access to
the hardware blocks in the sensor subsystem.

The socinfo driver gets confusion related to MSM8974 Pro sorted out and
adds new ids for SM8540 and SC7280.

The SCM driver gains support for MSM8974.

Add missing of_node_put() in smp2p and smsm drivers.
Stop using iterator after list_for_each_entry() and define static
definitions as such, in the PDR driver.

----------------------------------------------------------------
Adam Skladowski (2):
      dt-bindings: firmware: qcom-scm: Document msm8976 bindings
      firmware: qcom_scm: Add compatible for MSM8976 SoC

Bjorn Andersson (7):
      dt-bindings: arm: qcom: Document sa8540p, sc8180x and sc8280xp
      soc: qcom: llcc: Add MODULE_DEVICE_TABLE()
      dt-bindings: power: rpmpd: Add sc8280xp RPMh power-domains
      soc: qcom: rpmhpd: Don't warn about sparse rpmhpd arrays
      soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains
      dt-bindings: arm: msm: Add sc8180x and sc8280xp LLCC compatibles
      soc: qcom: llcc: Add sc8180x and sc8280xp configurations

Deepak Kumar Singh (2):
      soc: qcom: smem: map only partitions used by local HOST
      soc: qcom: smem: validate fields of shared structures

Dmitry Baryshkov (1):
      soc: qcom: socinfo: Add another ID for SM8450

Douglas Anderson (1):
      soc: qcom: socinfo: add SC7280 entry to soc_id array

Jakob Koschel (1):
      soc: qcom: pdr: replace usage of found with dedicated list iterator variable

Krzysztof Kozlowski (9):
      dt-bindings: soc: qcom,smsm: convert to dtschema
      dt-bindings: soc: qcom,wcnss: convert to dtschema
      dt-bindings: qcom: qcom,gsbi: convert to dtschema
      dt-bindings: qcom,smd-rpm: update maintainers (drop Kathiravan)
      dt-bindings: soc: qcom,smd: convert to dtschema
      dt-bindings: qcom: qcom,geni-se: refer to dtschema for SPI
      dt-bindings: soc: qcom,rpmh-rsc: convert to dtschema
      dt-bindings: soc: qcom,smp2p: convert to dtschema
      spi: dt-bindings: qcom,spi-geni-qcom: convert to dtschema

Kuldeep Singh (2):
      dt-bindings: qcom: geni-se: Update I2C schema reference
      dt-bindings: qcom: geni-se: Update UART schema reference

Luca Weiss (1):
      soc: qcom: socinfo: Sort out 8974PRO names

Miaoqian Lin (2):
      soc: qcom: smp2p: Fix missing of_node_put() in smp2p_parse_ipc
      soc: qcom: smsm: Fix missing of_node_put() in smsm_parse_ipc

Michael Srba (2):
      dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
      bus: add driver for initializing the SSC bus on (some) qcom SoCs

Rohit Agarwal (2):
      dt-bindings: power: Add rpm power domain bindings for SDX65
      soc: qcom: rpmhpd: Add SDX65 power domains

Tom Rix (1):
      soc: qcom: pdr: use static for servreg_* variables

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   2 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |  20 ++
 .../bindings/bus/qcom,ssc-block-bus.yaml           | 147 ++++++++
 .../devicetree/bindings/firmware/qcom,scm.txt      |   3 +-
 .../bindings/interconnect/qcom,bcm-voter.yaml      |   8 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   3 +
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml |   5 +-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   2 +-
 .../bindings/remoteproc/qcom,wcnss-pil.txt         |   2 +-
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |  99 +-----
 .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |  87 -----
 .../devicetree/bindings/soc/qcom/qcom,gsbi.yaml    | 132 +++++++
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 272 ++++++++++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   7 +-
 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |  98 ------
 .../devicetree/bindings/soc/qcom/qcom,smd.yaml     | 137 ++++++++
 .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    | 110 ------
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml   | 145 ++++++++
 .../devicetree/bindings/soc/qcom/qcom,smsm.txt     | 104 ------
 .../devicetree/bindings/soc/qcom/qcom,smsm.yaml    | 138 ++++++++
 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    | 131 -------
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   | 137 ++++++++
 .../devicetree/bindings/soc/qcom/rpmh-rsc.txt      | 137 --------
 .../devicetree/bindings/spi/qcom,spi-geni-qcom.txt |  39 ---
 .../bindings/spi/qcom,spi-geni-qcom.yaml           | 116 ++++++
 drivers/bus/Kconfig                                |  11 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/qcom-ssc-block-bus.c                   | 389 +++++++++++++++++++++
 drivers/firmware/qcom_scm.c                        |   4 +
 drivers/soc/qcom/llcc-qcom.c                       |  61 ++++
 drivers/soc/qcom/pdr_interface.c                   |  11 +-
 drivers/soc/qcom/pdr_internal.h                    |  20 +-
 drivers/soc/qcom/rpmhpd.c                          |  73 +++-
 drivers/soc/qcom/smem.c                            | 305 ++++++++++++----
 drivers/soc/qcom/smp2p.c                           |   1 +
 drivers/soc/qcom/smsm.c                            |   1 +
 drivers/soc/qcom/socinfo.c                         |  26 +-
 include/dt-bindings/power/qcom-rpmpd.h             |  26 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   2 +
 39 files changed, 2095 insertions(+), 917 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
 create mode 100644 drivers/bus/qcom-ssc-block-bus.c
