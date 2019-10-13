Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80538D5523
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2019 10:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbfJMIIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Oct 2019 04:08:12 -0400
Received: from onstation.org ([52.200.56.107]:42484 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728789AbfJMIIM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Oct 2019 04:08:12 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id EF29B3E993;
        Sun, 13 Oct 2019 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570954091;
        bh=Q1QTREatWmcWuGTDA0ElcXg0wWej7VbC08GBo5YXAHQ=;
        h=From:To:Cc:Subject:Date:From;
        b=ZaGF8T4vpKrrGUrNyeA8jhpMrE8Jac/Mznd1mgq/5iu9E93q4+or9qbCUNg56fQTH
         LRsBjEtggJ8LKP6wF9jx/lcfICTAs2vtlxecgO/pEC+YJhv7uqqWKraVITbUxduWVU
         1aG3MQBpcKIWHJlxMLOAgoXlcTDN4L1v71+Pn24s=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] ARM: qcom: add defconfig items and dts nodes
Date:   Sun, 13 Oct 2019 04:07:59 -0400
Message-Id: <20191013080804.10231-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a small patch series that adds support for the On Chip MEMory
(OCMEM) and msm8974 interconnect support to qcom_defconfig and to
qcom-msm8974.dtsi. The OCMEM driver is already in linux-next and it
looks like the interconnect support should be merged soon:
https://lore.kernel.org/lkml/20191005114605.5279-1-masneyb@onstation.org/

I have some work in progress patches for the HDMI bridge that's found
on the Nexus 5 and this series adds the necessary driver to
qcom_defconfig.

Brian Masney (5):
  ARM: qcom_defconfig: add ocmem support
  ARM: qcom_defconfig: add msm8974 interconnect support
  ARM: qcom_defconfig: add anx78xx HDMI bridge support
  ARM: dts: qcom: msm8974: add ocmem node
  ARM: dts: qcom: msm8974: add interconnect nodes

 arch/arm/boot/dts/qcom-msm8974.dtsi | 79 +++++++++++++++++++++++++++++
 arch/arm/configs/qcom_defconfig     |  5 ++
 2 files changed, 84 insertions(+)

-- 
2.21.0

