Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443776FC1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 11:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfGVJYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 05:24:53 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:24423 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728814AbfGVJYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 05:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563787488;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=QYYZ0kp4KIPxsETdYAqlfcUjcAP+hT1ieksaWpmS/Zg=;
        b=MOXuJwGMtm3h1xjm1oF4Ob9TB+luWIqmWBCGTwb6S6zWHZX/1v/uWkVlX9q05zF/xi
        +9+LpzXvCK+beiU9wqmBm6NU1I63FCQhmZwUe1oYfdMqvhg25jSxdnlA+Nrzq+y8npAx
        AIhXw1fMvhxXgp4oinJp9UjkNVnwlaAJXxu3ZBa5E/d/PV/uYY0XYcmY24tBxSzyby9G
        qp3KJhh4Yj+XTy7umjPYLAuE4hGiqS6xKC6DCiSrbvN/5wwcVvujabyUAdULePG3B/CO
        zSXHD+pjkYLEXYJc70rTo/Sn4mAOudp6vIB/XxPj9YAIZLm3mXtwXL6f/DsnQiFGSKv4
        +/uA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxP4G6N/EiB"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv6M9OlObv
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 22 Jul 2019 11:24:47 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH v2 0/4] Add initial device tree for MSM8916 A3U/A5U/L8150
Date:   Mon, 22 Jul 2019 11:22:07 +0200
Message-Id: <20190722092211.100586-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds initial device trees for the Samsung Galaxy A3/A5 (2015)
and the Wileyfox Swift (a re-branded Longcheer L8150), three smartphones
based on the MSM8916 SoC. The device trees provde basic support for SDHCI,
USB device mode and regulators.

The idea is to leverage the efforts that went into mainline for
the Dragonboard 410c. So far this is going quite well:

In addition to the functionality provided by the initial device trees,
Display/GPU, touchscreen, sound and sensors also seem to work in initial tests.
Those will be added in future patch sets.

Changes in v2:
  - Add initial device tree for Longcheer L8150
  - Document new device tree bindings

v1: https://lore.kernel.org/linux-arm-msm/20190624173341.5826-1-stephan@gerhold.net/

Stephan Gerhold (4):
  dt-bindings: vendor-prefixes: Add Longcheer Technology Co., Ltd.
  dt-bindings: qcom: Document bindings for new MSM8916 devices
  arm64: dts: qcom: Add device tree for Samsung Galaxy A3U/A5U
  arm64: dts: qcom: Add device tree for Longcheer L8150

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 228 +++++++++++++++++
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 236 ++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  10 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  10 +
 7 files changed, 497 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts

-- 
2.22.0

