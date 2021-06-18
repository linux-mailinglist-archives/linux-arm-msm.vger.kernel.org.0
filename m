Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C153AD174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhFRRxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:53:12 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:34322 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbhFRRxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:53:12 -0400
Date:   Fri, 18 Jun 2021 17:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1624038659;
        bh=UGyUdkeV2ZHA7c+AHmzTxfljcoGITYoqrqsoltTY2xw=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=SfANi4dhYsckrkxi2uMGWxZVxRve41girazFvxqIWQlcLeCJOsaf5P1gZd7oSCXuf
         fibYVshIDgxo2DkTEDRU4xmhP9SzKjHhCd9auWBT01/juj5gMzPKCOf/GPMed+TKHe
         e0YoO9t9A/qSl8dppbxkyqTrG50Gx2AMrOXUbKrI=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [RESEND PATCH v2 0/6] input: Introduce support for SPMI haptics found on Qcom PMICs
Message-ID: <20210618175041.323495-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series introduces a driver for the SPMI haptics hardware block
found in Qualcomm PMICs. SPMI haptics support LRA (Linear Resonant
Actuator) style haptics, as well as ERM (Eccentric Rotating Mass).
It also supports several modes of driving the haptics, e.g. by loading
the pattern to play into an internal buffer, or using PWM.

More information about the hardware can be found here:
        https://gitlab.com/sdm845-mainline/linux/-/wikis/PMI8998-QPNP-Hapti=
cs

This driver has been written based on downstream sources as no public
documentation is available. It includes initial support for LRA haptics
in buffer mode, this combination seems to be the most common and will
enable haptics on the OnePlus 6 and 6T, PocoPhone F1, OnePlus 5 and
several other Qualcomm devices with mainline kernel support.

The driver is implemented using the ff-memless (forcefeedback) input
framework and makes an attempt to control the strength of vibration relativ=
e
to the magnitude set from userspace.

 ~ Caleb

Changes since v1:
 - Replace old QPNP naming with SPMI
 - Address Bjorn's comments on the driver, various style and code cleanups
 - Address Bjorn's comments on the DT bindings and DTS
 - Pickup patches from Joel and Jami to enable haptics on the OnePlus 5
   and Poco F1.

Caleb Connolly (4):
      dt-bindings: input: add Qualcomm SPMI haptics driver
      input: add Qualcomm SPMI haptics driver
      arm64: dts: qcom: pmi8998: introduce spmi haptics
      arm64: dts: qcom: sdm845-oneplus-common: add haptics

Jami Kettunen (1):
      arm64: dts: qcom: msm8998-oneplus-common: Enable PMI8998 haptics

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: add haptics

 .../bindings/input/qcom,spmi-haptics.yaml          | 128 +++
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |   6 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |  16 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   6 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |   5 +
 drivers/input/misc/Kconfig                         |  12 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 980 +++++++++++++++++=
++++
 include/dt-bindings/input/qcom,spmi-haptics.h      |  32 +
 9 files changed, 1186 insertions(+)



