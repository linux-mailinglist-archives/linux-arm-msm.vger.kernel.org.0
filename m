Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC09E2F02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 12:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392354AbfJXKbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 06:31:45 -0400
Received: from onstation.org ([52.200.56.107]:37214 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389949AbfJXKbp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 06:31:45 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 2F2243E951;
        Thu, 24 Oct 2019 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1571913104;
        bh=uiwwS5b2IphvBHKc+YmPSSJR2+batggLeJo4PNUTWsY=;
        h=From:To:Cc:Subject:Date:From;
        b=cdAuO8oWyjlmWMukRC/NePYDvVUGNozIkpuaPbKYgQ7LKo5WFfoyVH9SftAY55rye
         iHckatKd1mQ7Hlq6OStIDxpYWoOfYffm1FekXcPB4M16yOC0kGqRduEj2v8c+ziOz+
         fch16IavG7qW9DpuNZjW3XNVDb9ZMug3DnTNyagM=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        georgi.djakov@linaro.org
Subject: [PATCH v2 0/4] ARM: qcom: add defconfig items and dts nodes
Date:   Thu, 24 Oct 2019 06:31:36 -0400
Message-Id: <20191024103140.10077-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a small patch series that adds some additional functionality
to qcom_defconfig and to qcom-msm8974.dtsi: interconnect, ocmem,
and HDMI bridge (defconfig only).

Some high-level changes since v1:
- Updated interconnect support. See patch #4 in this series for details.
- Dropped ocmem defconfig since that got merged.

Brian Masney (4):
  ARM: qcom_defconfig: add msm8974 interconnect support
  ARM: qcom_defconfig: add anx78xx HDMI bridge support
  ARM: dts: qcom: msm8974: add ocmem node
  ARM: dts: qcom: msm8974: add interconnect nodes

 arch/arm/boot/dts/qcom-msm8974.dtsi | 77 +++++++++++++++++++++++++++++
 arch/arm/configs/qcom_defconfig     |  4 ++
 2 files changed, 81 insertions(+)

-- 
2.21.0

