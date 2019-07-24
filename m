Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F5B726E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfGXEud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:50:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:58032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfGXEud (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:50:33 -0400
Received: from localhost.localdomain (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F713218D4;
        Wed, 24 Jul 2019 04:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563943832;
        bh=F91DtO4JNX4AcUcw4pU3IX/5Sm5fLNZ7x3U1rYZaif0=;
        h=From:To:Cc:Subject:Date:From;
        b=K9V7JTZhr6wSkl8rninl630e53iZ8SPt7FoikLHeiZ4qDobrvT0A3YgCg21QaWaag
         Bb2QBkCQQZFuXBH9IpfRzQ+ptZXpSLTVNYsf4g7Q+bfTfNb9Xw9OyzXWyNPtQhUJSE
         w1j4quSXREiOnaN+PDXEiXXCyhdzDgSQ/cMc15Zw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v2 0/5] arm64: dts: qcom: sdm845: Fix DTS warnings
Date:   Wed, 24 Jul 2019 10:19:01 +0530
Message-Id: <20190724044906.12007-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So this is an attempt to fix some warns on sdm845 dts. We still have bunch
of warnings to fix after this series (duplicate address and node names
having underscores etc).

Lets get long hanging ones fixed, we can see the warns with W=1 or W=2

Changes since v1:
	- Fix space after adc node unit address
	- Fix typo in commit log
	- Add review tags by Stephen

Vinod Koul (5):
  arm64: dts: qcom: sdm845: Add unit name to soc node
  arm64: dts: qcom: sdm845: remove unnecessary properties for dsi nodes
  arm64: dts: qcom: sdm845: remove unit name for thermal trip points
  arm64: dts: qcom: sdm845: remove macro from unit name
  arm64: dts: qcom: sdm845-cheza: remove macro from unit name

 arch/arm64/boot/dts/qcom/pm8998.dtsi       |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 66 ++++++++++------------
 3 files changed, 36 insertions(+), 42 deletions(-)

-- 
2.20.1

