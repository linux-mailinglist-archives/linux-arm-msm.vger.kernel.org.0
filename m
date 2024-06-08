Return-Path: <linux-arm-msm+bounces-22128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5F901289
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8427B282D77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D334917BB27;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RknpwIy9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A7A17B4E9;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=IZxQwa5iF5REz7CaD/r8dk7gLvlX2jagWo48onyzcb9uIibYflcsfbQOLOKCSlY6uFo6+UoOKJti1CMKLwc2OMkeYz8mZBn+R1UXkpq+vKbMGeHHemd86Lsxl/i5cslRKnp7/Tn43nnDu2rN/Evu17mpHGXhZnWPiwG+S/71q/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=xvGDdXmPugW8gDTyzx+vdea6PEvo7eNqJuG1wNKxm9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8JomugPqJ3ldyXIFKVhbcdPhf00cs62BxwUH0RARJJd6qcAvOlX55+FM4jtLQIhQmKDAzkmP7zTFyxCg0J54jT/nYqYpVCLukRTATmTJCIY7cYmteKR8dbbZlJ0LN0/k+2VBU1r1VcCEQf4TkwDj7DUHF8tLMC/kzggpJocC9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RknpwIy9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A875C4AF0B;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=xvGDdXmPugW8gDTyzx+vdea6PEvo7eNqJuG1wNKxm9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RknpwIy9ywVh90i88yY6pRVCslHbAesaWxPMnrgDzPLtlgW0R1fn+mZemOpQeeQyY
	 ZGJuMOlRpPjbI1SlH53KxEhjEPUtns8Ot2aWJ8A2JrPT8slHverQH9mmael1hP1YDQ
	 xHsJpL6LPCsKBapD+6ZzIIcrCslWznX5XFgF2T65F45i/jWG1wTjDfzDeKF6s/YKmH
	 LYXkqhjEznA7lYn/FTSrrp5kvHur62r7iTCEoL9qZeegR66OhCFmGfj+XaB6PYAT47
	 UeV4amShsexMNg2h/Q+s6tr3+QhaF2XeM6wFPW2tdc78ncHUQi6uaSA36K3yw3lRGB
	 0u5bRkq207aUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRT-000000003Pz-3Rt2;
	Sat, 08 Jun 2024 17:57:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 04/12] mfd: pm8008: Mark regmap structures as const
Date: Sat,  8 Jun 2024 17:55:18 +0200
Message-ID: <20240608155526.12996-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap irq chip structures can be const so mark them as such.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 5a77155a63d7..ab55d524c27b 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -51,7 +51,7 @@ enum {
 	POLARITY_LO_INDEX,
 };
 
-static unsigned int pm8008_config_regs[] = {
+static const unsigned int pm8008_config_regs[] = {
 	INT_SET_TYPE_OFFSET,
 	INT_POL_HIGH_OFFSET,
 	INT_POL_LOW_OFFSET,
@@ -129,7 +129,7 @@ static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
 	return 0;
 }
 
-static struct regmap_irq_chip pm8008_irq_chip = {
+static const struct regmap_irq_chip pm8008_irq_chip = {
 	.name			= "pm8008_irq",
 	.main_status		= I2C_INTR_STATUS_BASE,
 	.num_main_regs		= 1,
-- 
2.44.1


