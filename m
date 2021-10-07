Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035EE425F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242670AbhJGVgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:36:17 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:50827 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242227AbhJGVgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:36:08 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 28B1D3EEF5;
        Thu,  7 Oct 2021 23:34:11 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] arm64: dts: qcom: pmi8994: Remove hardcoded linear WLED enabled-strings
Date:   Thu,  7 Oct 2021 23:33:58 +0200
Message-Id: <20211007213400.258371-12-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007213400.258371-1-marijn.suijten@somainline.org>
References: <20211007213400.258371-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver now sets an appropriate default for WLED4 (and WLED5) just
like WLED3 making this linear array from 0-3 redundant.  In addition the
driver is now able to parse arrays of variable length solving the "all
four strings *have to* be defined" comment.

Besides the driver will now warn when both properties are specified to
prevent ambiguity: the length of the array is enough to imply a set
number of strings.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index a06ea9adae81..89ba4146e747 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -39,8 +39,6 @@ pmi8994_wled: wled@d800 {
 			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "short";
 			qcom,num-strings = <3>;
-			/* Yes, all four strings *have to* be defined or things won't work. */
-			qcom,enabled-strings = <0 1 2 3>;
 			qcom,cabc;
 			qcom,external-pfet;
 			status = "disabled";
-- 
2.33.0

