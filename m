Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483054200BA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 10:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhJCIds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 04:33:48 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37914 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229875AbhJCIds (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:48 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 5FA99C90EC;
        Sun,  3 Oct 2021 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249920; bh=zmfazeMicj6zMjUJKJReCRNKJm8RWvDgpzfVzDxY7O8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=rBRihO+oqeAxJC5HfS0CbqS7qaV/Dej4lQKdpixvPFx0i4bOSjCAbaQqDYFFxoVj7
         F50xqCAChRmWMzvx4jl+ypPHAeQeIWjpLq3EORnfkvP93pV4y4t3ZvNQguw/6+yrs8
         5kG/qlEEr7PqJbY2K4waH/m/D+pg7/dL8To3ZB0Q=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] clk: qcom: add select QCOM_GDSC for SM6350
Date:   Sun,  3 Oct 2021 10:31:24 +0200
Message-Id: <20211003083141.613509-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCOM_GDSC is needed for the gcc driver to probe.

Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0a5596797b93..9ef007b3cf9b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -564,6 +564,7 @@ config SM_GCC_6125
 
 config SM_GCC_6350
 	tristate "SM6350 Global Clock Controller"
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM6350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
-- 
2.33.0

