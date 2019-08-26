Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7510B9D522
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 19:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731833AbfHZRn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 13:43:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729535AbfHZRn4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 13:43:56 -0400
Received: from localhost.localdomain (unknown [122.178.200.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46F0D2184D;
        Mon, 26 Aug 2019 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566841435;
        bh=AQ2xE2ZYvWQ5MvJY7kmxoAtxVwyytPUTv3B91CHwAi8=;
        h=From:To:Cc:Subject:Date:From;
        b=EHk1U7j3RQ42AnXWQ/mpxVFDUteIue4O/5Rn77Kvx6vTqRTu3xeVz6JN+9TgmNdk9
         LnxuMAK9Qi1iC6Ub1vpyL5c2xD4ZLnS28wibybk4ZNwraY4z6SJVr6kNfu3ZB9N8Bj
         ppVUqKn+5GGsjJVJjvxFHPpOSuoSg4YBQ0TH5eKQ=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: sdm845: Add parent clock for rpmhcc
Date:   Mon, 26 Aug 2019 23:12:33 +0530
Message-Id: <20190826174233.21213-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPM clock controller has parent as xo, so specify that in DT node for
rpmhcc

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9be6acb0650e..f9153b456125 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3028,6 +3028,8 @@
 			rpmhcc: clock-controller {
 				compatible = "qcom,sdm845-rpmh-clk";
 				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
 			};
 
 			rpmhpd: power-controller {
-- 
2.20.1

