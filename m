Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6EC1F0029
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 21:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgFETCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 15:02:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:21137 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgFETCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 15:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383772;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/vn4eqDTi/rVF1gu/sKId/2kJYvXVp/FVC/To5tTVX4=;
        b=dhpKOwuz0y9VjZEtfHX6ZDdOkArnerUgM1NPD3dd+3npTY1yafg16vB3Bn/uU/uxEI
        IErQ+YUXqIq3wXPq5euW+bAqZrJwvQODIJk94akzJCQS3l+PedEreLhteZ+c45jkW39V
        FukDKnWOHMAc4ljxNgJrfUDLpCcYxIUhm8XOnn+0JiOtYdD+HjiZPkoCC7D5T+mrFkr8
        AkZIhGJr6h3gscjzp3I2yaJVI91iI/ianXlFFpempcUeUXd+sqnXnSLURxuni7EjDMlx
        uKH1OiC23ARhPbLYab8+ISdf4wqv5oV0dHYYO90xyoJ7vAIgMdgN57xddS+O2SYWrD+7
        iAJQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxqKmF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/4] arm64: dts: qcom: msm8916: Replace invalid bias-pull-none property
Date:   Fri,  5 Jun 2020 20:59:14 +0200
Message-Id: <20200605185916.318494-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605185916.318494-1-stephan@gerhold.net>
References: <20200605185916.318494-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8916-pins.dtsi specifies "bias-pull-none" for most of the audio
pin configurations. This was likely copied from the qcom kernel fork
where the same property was used for these audio pins.

However, "bias-pull-none" actually does not exist at all - not in
mainline and not in downstream. I can only guess that the original
intention was to configure "no pull", i.e. bias-disable.

Change it to that instead.

Fixes: 143bb9ad85b7 ("arm64: dts: qcom: add audio pinctrls")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
The reason why the qcom kernel fork used "bias-pull-none" instead
of "bias-disable" there is still very unclear to me. That property
is used only for some audio pins, and seemingly only on MSM8916/MSM8939.

Very confusing :)
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index e9c00367f7fd..5785bf0a807c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -556,7 +556,7 @@ pinconf {
 				pins = "gpio63", "gpio64", "gpio65", "gpio66",
 				       "gpio67", "gpio68";
 				drive-strength = <8>;
-				bias-pull-none;
+				bias-disable;
 			};
 		};
 		cdc_pdm_lines_sus: pdm-lines-off {
@@ -585,7 +585,7 @@ pinconf {
 				pins = "gpio113", "gpio114", "gpio115",
 				       "gpio116";
 				drive-strength = <8>;
-				bias-pull-none;
+				bias-disable;
 			};
 		};
 
@@ -613,7 +613,7 @@ pinmux {
 			pinconf {
 				pins = "gpio110";
 				drive-strength = <8>;
-				bias-pull-none;
+				bias-disable;
 			};
 		};
 
@@ -639,7 +639,7 @@ pinmux {
 			pinconf {
 				pins = "gpio116";
 				drive-strength = <8>;
-				bias-pull-none;
+				bias-disable;
 			};
 		};
 		ext_mclk_tlmm_lines_sus: mclk-lines-off {
@@ -667,7 +667,7 @@ pinconf {
 				pins = "gpio112", "gpio117", "gpio118",
 					"gpio119";
 				drive-strength = <8>;
-				bias-pull-none;
+				bias-disable;
 			};
 		};
 		ext_sec_tlmm_lines_sus: tlmm-lines-off {
-- 
2.26.2

