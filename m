Return-Path: <linux-arm-msm+bounces-22130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF8190128C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 476FB1C213C5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73AF17BB2D;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA/5X68/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3917B500;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=inefgA0rBw9kk/cyg6SJHB8/ZOpWa9EM/DmrzxZx/N5keEK3bYOPv4k1ozdGg5HzZ7eNbC/v1HS8fqB2laoY1QDpTgaznCluzgcrVoR8Hw3u+rpa5h8I217Q9iD0iidRkMTFW6w7u4GczFSi+Qkrbr5na25PdiyAqjhIIlmiCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=9D6ySfgbWhQOFK6PfMLujLLbbQCJ9ljTc4OjiKugm44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6JFGLpL9T5BG71NUnlzJ1lRDG9/Qx0HibPUP9gFpOxYneSbYpvBPGCT43Kr83U8+Trm1M1GOG7mA7rbXDMHOkmuP7Ok4692sFxhxuAhlRDxSGEXyNqHZETtkaB4OPgBzxW1ZFkj/HYeJUY1HaA3TOTamse+CRb+z4Gj87ZLsY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA/5X68/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDE9C4AF0D;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=9D6ySfgbWhQOFK6PfMLujLLbbQCJ9ljTc4OjiKugm44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vA/5X68/2Z7CaJ03EsbxXgLsnwaatwI5YtaEvxnw4Lo1Oj5ubpSO8UVv1c3wWyPbr
	 Tm2uvO78vdLtpdubiWBaPT0oeTUlXqbV/Vv0Lg++htj1i/Ck1aLIZm7D7OY+UJiA7E
	 MiJV1JntjhX0FbrQ8EznjFo4pwX8jgtj6b3OAMoficBKmiCmVg3rviguRmISHhC9FM
	 NGbBHDvxNL+TdKGWDBNenS05wSvnoK/0SEbSAAWvDSUMlME7jGktvlecXwgo8XpPCM
	 7L2WF0UlpCGGSkEoDd5UISbRhqwIBlpqXhAhp8OHcy2P9P3Wzi15mogWTFeifQePIU
	 l8MyIeTWSMCBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRU-000000003Q5-0KoV;
	Sat, 08 Jun 2024 17:57:20 +0200
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
Subject: [PATCH v3 07/12] mfd: pm8008: Drop unused driver data
Date: Sat,  8 Jun 2024 17:55:21 +0200
Message-ID: <20240608155526.12996-8-johan+linaro@kernel.org>
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

The i2c client driver data pointer has never been used so drop the
unnecessary assignment.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index bab17417aeec..72199840231e 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -167,8 +167,6 @@ static int pm8008_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	i2c_set_clientdata(client, regmap);
-
 	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
-- 
2.44.1


