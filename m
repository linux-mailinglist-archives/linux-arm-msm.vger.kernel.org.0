Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A602F3307C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbhCHGIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:08:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:44494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234569AbhCHGIj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1157C651F7;
        Mon,  8 Mar 2021 06:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183719;
        bh=hwawITlf+y8Ft89wFeibnauK2U6yJh/T7AwT0AU72do=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qi6us3Y1qCa1vqnZeQ/hIdFZ0mlNe/NjcXJSmzYKKB95eF6ASghGffDCedKEYdwjG
         yxjYmdqZEUjov7uaS9T0nuptAYt8A+feVQWVIpDK5czgrkJ5DnPrHBLM+yuu3Ey7Yf
         LzIQKqJteO2f4d40vtc52ZYvWs9UQSIHP4fWksKOVmldWL2jfSpVdJHrmEzUTUmdzz
         Is9TtmTDNUeAq/6GtvedlXB5wthDp7gxugKmQY0z+b0aI5R9J9RxDO9G3jkxghytVI
         NYG0lqWZAWCFvEWVL60DVlg8EmT2zrDWjsRFZU8lWxTLV/uHAKqtALrsJzy2dPpsQ+
         kS0CCbFY3b3sg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] arm64: qcom: apq8016-sbc: drop qcom,sbc
Date:   Mon,  8 Mar 2021 11:38:09 +0530
Message-Id: <20210308060826.3074234-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

apq8016-sbc is one of the compaitibles for this board, but is not
documented, so drop it. This fixes these two warns:

arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: /: compatible: ['qcom,apq8016-sbc', 'qcom,apq8016', 'qcom,sbc']
is not valid under any of the given schemas (Possible causes of the failure):

arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: /: compatible: ['qcom,apq8016-sbc', 'qcom,apq8016', 'qcom,sbc'] is too long
arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: /: compatible:0: 'qcom,apq8016-sbc'
is not one of ['qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: /: compatible:0: 'qcom,apq8016-sbc'
is not one of ['qcom,apq8074-dragonboard']

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 48bd1c2874de..f3c0dbfd0a23 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -9,5 +9,5 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. APQ 8016 SBC";
-	compatible = "qcom,apq8016-sbc", "qcom,apq8016", "qcom,sbc";
+	compatible = "qcom,apq8016-sbc", "qcom,apq8016";
 };
-- 
2.26.2

