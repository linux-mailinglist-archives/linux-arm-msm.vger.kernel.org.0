Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E764479AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 06:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhKHFIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 00:08:48 -0500
Received: from mx1.riseup.net ([198.252.153.129]:60440 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230391AbhKHFIr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 00:08:47 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnfG21TVxzDyXD;
        Sun,  7 Nov 2021 21:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636347962; bh=EtzwkXcORaEEhKlASVmtnfEQQJs0zEumIQ7UDuqh/Gc=;
        h=From:To:Cc:Subject:Date:From;
        b=sBaUgPRSyW2ddHbn6dzSwOXaWk0inwyat31mgaK4nS/TldVRIL49NRZwOBOyGdXfS
         XAoUzB+K4HEb8wLUqgDLIKVkhbHhn4F7AuIOtkN3VW9jlIqNirwCYGGAXwFY2gfrZ+
         vSVoJBirfiH8HLf6DFL4MiennrI1VNwwCUNae7Vc=
X-Riseup-User-ID: 6D2394A1F81701C609B546602645AE87B9C8FE48D6E9E92E71D04AAA70979E0D
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnfFy4byYz5vj2;
        Sun,  7 Nov 2021 21:05:58 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org,
        Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 0/7] Improve support for Xiaomi Redmi Note 7 
Date:   Mon,  8 Nov 2021 12:03:29 +0700
Message-Id: <20211108050336.3404559-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series expand the Redmi Note 7 device port to support:
 + Regulators
 + Volume keys
 + eMMC and SD card slot
 + Framebuffer display
 + USB

Changes in v2:
 - Dropped linux,input-type from volume up as 1 is set by default.
 - Dropped gpio-key,wakeup as it's a legacy property name and is
not relevant for a volume button.
 - Rename label cont_splash_mem to framebuffer_mem and change node
name to memory. 

Dang Huynh (7):
  arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume down button
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
  arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB

 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   5 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 385 ++++++++++++++++++
 2 files changed, 390 insertions(+)

-- 
2.33.1

