Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939C73307D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbhCHGJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:44600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234698AbhCHGI6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB94365142;
        Mon,  8 Mar 2021 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183738;
        bh=DIhmHlHyEtYD7oea1qWZaJwbXHwn0f2D2daNxxOtan0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KiPPyqssIzpCLSNGYatIceia6uJfrUxycavdFvhPlbQmjxJH47aeZMTrklIkrCjet
         yjs5UrtUCkA1xcBjROHBnYhhHWurNJNsMab8pno9jAHOtc/FuZLKOLCzCHQRcSZ6f0
         K8FmyGskfdCVGVkmmWL2ljx7GDLoAiAD29vvISswgVpYAKSjFMujUZNXJy+PNCjkSO
         +iu+pMA/saf3BUxiYCifwT8Z8PA/+OXjt5P3nR9l0xWEKHbUkTJmFmcAZIimcJYerm
         DZl9Wo2Q6frAvb5eyORyd0oiNvO1Tmu3mIOqdFGqUGQZjpiNpdfrgi69got0+HV3Pi
         MkkNRMZMxkpCg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/18] dt-bindings: arm: qcom: Drop qcom,mtp
Date:   Mon,  8 Mar 2021 11:38:15 +0530
Message-Id: <20210308060826.3074234-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom,mtp is used msm8916-mtp.dts but not documented, it is a generic mtp
compatible and we have specfifc ones for each mtp so drop this

arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
        ['qcom,msm8916-mtp', 'qcom,msm8916-mtp/1', 'qcom,msm8916', 'qcom,mtp'] is too long
        Additional items are not allowed ('qcom,msm8916', 'qcom,mtp' were unexpected)
        Additional items are not allowed ('qcom,mtp' was unexpected)

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
index c3f885923127..d66c15538785 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
@@ -9,6 +9,5 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM 8916 MTP";
-	compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1",
-			"qcom,msm8916", "qcom,mtp";
+	compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1", "qcom,msm8916";
 };
-- 
2.26.2

