Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A29611A4EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 08:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLKHNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 02:13:11 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:58514
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbfLKHNL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 02:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576048390;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=e4VFfWEMUXIjMa+iwXkArSXrLtzbwfCJw62x90LK0WQ=;
        b=gULcBt1fRiW56Mf4gmLA/gtpJqgGEmdjvUtzo0tH36ngeWmYu8AV+5xFLe0I91gP
        KT4rdU92bGR66wxVQeY7hcZrX90OR13j6U1+Y1bsSZ2bTWge8S36hLqWKcScuoeFJQK
        XM/t6blRUKZF3XjKC5ZE+oEgkdepOIgZFma4buTA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576048390;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=e4VFfWEMUXIjMa+iwXkArSXrLtzbwfCJw62x90LK0WQ=;
        b=Hv7nCKaW3k8fzh8uhQU/7gwPu2ZjuPDTMEr6CFX5fY3PoZFEIgDoSkKPKoaittVP
        ZRwLWqsS3LBjYs410bKgJNeMaOJEhK6q93UQOtcZA+y/JOFt8qPgVjkWa4V9EqkUpuv
        rzHf6M02sXw/69pjXjo9ZZiO28qwFrb1ZhKSGKuE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52939C447BB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] arm64: dts: sc7180: Add aliases for all i2c and spi devices
Date:   Wed, 11 Dec 2019 07:13:10 +0000
Message-ID: <0101016ef3cdf035-81663ddb-2978-4369-a621-d4a80c768911-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576048353-21154-1-git-send-email-rnayak@codeaurora.org>
References: <1576048353-21154-1-git-send-email-rnayak@codeaurora.org>
X-SES-Outgoing: 2019.12.11-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add aliases for all i2c and spi nodes

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 88db1f5..eb02cd1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -18,6 +18,29 @@
 
 	chosen { };
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi3 = &spi3;
+		spi5 = &spi5;
+		spi6 = &spi6;
+		spi8 = &spi8;
+		spi10 = &spi10;
+		spi11 = &spi11;
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

