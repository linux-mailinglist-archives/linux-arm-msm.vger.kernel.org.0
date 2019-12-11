Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B7011A4EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 08:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLKHMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 02:12:54 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:34712
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbfLKHMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 02:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576048373;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=hX8x6EjHb+NecSMGwS+gu2CSj1IZR6id38NDAhBLM9g=;
        b=X3MnZasiYDw3Da8uiCHCFV+69DagXGrRc7hj83d2bNzSA2GeI8eIywIoDO2TSb8b
        d/NpkAOeoD1+yYRF3OrY8R04T59ZYqXM17lUTiC8Z7KXTHuz34aViXmaVBcweNd10rD
        BO8ma/uxxAqKylGKCniFULf6UFsay7GBwVQKn5Fc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576048373;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=hX8x6EjHb+NecSMGwS+gu2CSj1IZR6id38NDAhBLM9g=;
        b=Pqis+HSjDcrUd0ftLZhtfmHjD9jXaVovO5GnnCNXXBAl0kFmKoKYwiiioyVKJnLY
        Y7ko1SRaFx5DT3HAXxjGOb5F5FMD0GaJ7uZ6vdVLUnLMWUtZ+1K483sdPd/wN+pXAl7
        Q+gENOeIo49aSzEtTODKdBUVbCra9BohW0jlA7sg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D71D6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] arm64: dts: sc7180: Remove additional spi chip select muxes
Date:   Wed, 11 Dec 2019 07:12:53 +0000
Message-ID: <0101016ef3cdad4a-cbfbc482-1f74-4cb7-88fc-b4b6ed7e7543-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.12.11-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

remove the additional CS muxes that were added by default for
spi so every board using sc7180 does not have to override it.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 666e9b9..88db1f5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -751,8 +751,7 @@
 			qup_spi1_default: qup-spi1-default {
 				pinmux {
 					pins = "gpio0", "gpio1",
-					       "gpio2", "gpio3",
-					       "gpio12", "gpio94";
+					       "gpio2", "gpio3";
 					function = "qup01";
 				};
 			};
@@ -776,8 +775,7 @@
 			qup_spi6_default: qup-spi6-default {
 				pinmux {
 					pins = "gpio59", "gpio60",
-					       "gpio61", "gpio62",
-					       "gpio68", "gpio72";
+					       "gpio61", "gpio62";
 					function = "qup10";
 				};
 			};
@@ -793,8 +791,7 @@
 			qup_spi10_default: qup-spi10-default {
 				pinmux {
 					pins = "gpio86", "gpio87",
-					       "gpio88", "gpio89",
-					       "gpio90", "gpio91";
+					       "gpio88", "gpio89";
 					function = "qup14";
 				};
 			};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

