Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78ED3E10CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbhHEJGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:06:53 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:40592 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238891AbhHEJGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:06:52 -0400
Date:   Thu, 05 Aug 2021 09:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628154394;
        bh=j53Cevesc3Wmn62wus/pwHZWo27XvHlCptqo+u/7Ve4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=c2CQNTG4pWH7qBOmB1vWRF2zrbZtUPNOMMA3TlkniqddsodmLqQL0swRkroiUDhsi
         MHyRKNdtcdLdTpkr83T6lc7b2xJNAXXURM8WrfA9AVkY/SaX8W2Vxw6x8kEGRLApwU
         Ph5m+ym5lvCfd/5n42unX5tb3Ys0o0LAtDuGuG3s=
To:     bjorn.andersson@linaro.org
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        sboyd@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH RESEND 0/2] Add GCC for MSM8953
Message-ID: <KH2Sf97Sip3ObMRsBE9fBPLUML3cSrOXm4zG2qT7Tc@cp7-web-041.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apologies, resending because I tried sending from disroot.org, which is
a banned host on vger. Please ignore the previous patches if they
reached you.

Hi,

This patch adds support for the Global Clock Controller found on the
MSM8953 Platform (SDM450, SDA450, SDM625, SDM632, APQ8053). Since all SoCs
based on the MSM8953 platform are identical with respect to clocks, a
single compatible is used.

Vladimir Lypak (2):
  dt-bindings: clock: add Qualcomm MSM8953 GCC driver bindings
  clk: qcom: Add Global Clock Controller driver for MSM8953

 .../devicetree/bindings/clock/qcom,gcc.yaml   |    2 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8953.c                | 4250 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8953.h  |  234 +
 5 files changed, 4495 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8953.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8953.h

--=20
2.32.0


