Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C06447580
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 21:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbhKGUII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 15:08:08 -0500
Received: from mx1.riseup.net ([198.252.153.129]:35088 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236384AbhKGUIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 15:08:05 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnQ2z1tgjzDv49;
        Sun,  7 Nov 2021 11:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636314939; bh=HmO8tJFd0iJQW9I6UBGWQJ54leIZblFWMgJAXMQV+Lk=;
        h=From:To:Cc:Subject:Date:From;
        b=pEENghjxNPA14cqhpDdbRjNAvReDgZzh7S5h/Bri+LMQjSNZ3Og0LJxhpgpJk0Dok
         92IzElx5kdnRD7Mh1mmK/v23tkdtah4aiKxu75U4bxLzFqyhlnfafDapi3HC74zSVi
         CSt56R/gu03aJI4dmVNBNwJH4O1HozW8nodLyp3c=
X-Riseup-User-ID: 15FB1F52F8D20451429F3D035D33E2AFE38CBD75547D60A8DB6A52CF6D1E006E
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnQ2v4dg5z5vj2;
        Sun,  7 Nov 2021 11:55:35 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH 0/7] Improve support for Xiaomi Redmi Note 7
Date:   Mon,  8 Nov 2021 02:55:04 +0700
Message-Id: <20211107195511.3346734-1-danct12@riseup.net>
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

Dang Huynh (7):
  arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume down button
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
  arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB

 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   5 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 387 ++++++++++++++++++
 2 files changed, 392 insertions(+)

-- 
2.33.1

