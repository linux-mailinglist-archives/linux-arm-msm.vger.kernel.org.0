Return-Path: <linux-arm-msm+bounces-27139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35B93E236
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 03:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2C11C20912
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 01:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B24818C34A;
	Sun, 28 Jul 2024 00:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfXf5GnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D0818C347;
	Sun, 28 Jul 2024 00:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722127783; cv=none; b=enRyTuk8DMOLir+U6u5+LSmk+9yNTdJdwzw/Azdn7TrQn7Fkxy7/PTnADRs1rDJqYz037WZhJ54wteP6gsbRJEs4U7I3eHQzexRgaIaRK5KXe5vAfApBkQUMJxsXOVCYsYbsXHKwtrOheI4e7QzhWktUKxn7JA7UyYAq7m7Mu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722127783; c=relaxed/simple;
	bh=RuHSkVzhSk+XMgIda+c8t08zULhs9kC6nOlengVVwcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvrRHlVKnggZGkOAQDznjzBVf99pzbOLyt6xIjo1XoIA5EMLFPw/DIkONRVetiqRMrq+bwkc4RaPfBX/n0OfDUnFuTe+2CDWu2SxG6R2dXzgQ7ojPwkEPuq2N1RwTSk/AG9qKxksrJuzZwXWnHBvHlNKUvOQ63duhpPrOVTZDZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfXf5GnK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F71C4AF09;
	Sun, 28 Jul 2024 00:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722127783;
	bh=RuHSkVzhSk+XMgIda+c8t08zULhs9kC6nOlengVVwcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfXf5GnK9mpQimhOZwsC3x5bzaV1rMsZnOkwRowBk+o4QvIv7SQ54dv2wMBqi6Fkp
	 usNNPiO0OnrM5PjjQi6eC13TjkxG9R/STkLsC6bUJT2EF2oQO2wDXqRliG4FGWMujT
	 Y/5oSOhD8yAVvYnlWNQ8/x7IGzG84ZlHRbq3OtnBV/OxE9u+uIwZlJi0lUvNG9CllA
	 sEiLyIgfcfgWhwMIVAco28lzNTrRcUw/mGzoz0m6Gq2bvZP1guq+pZxAFuUgpLI5ZE
	 XW6PbWPyrpmew6zUGzRYsnZZyndmbgilyVYT7TNJOfJ/i0hmVaW697Zzk1tP/XwaX7
	 upKnZ7Emew/cA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	krzysztof.kozlowski@linaro.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 5/9] soc: qcom: icc-bwmon: Allow for interrupts to be shared across instances
Date: Sat, 27 Jul 2024 20:49:25 -0400
Message-ID: <20240728004934.1706375-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728004934.1706375-1-sashal@kernel.org>
References: <20240728004934.1706375-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Sibi Sankar <quic_sibis@quicinc.com>

[ Upstream commit dc18836435e7f8dda019db2c618c69194933157f ]

The multiple BWMONv4 instances available on the X1E80100 SoC use the
same interrupt number. Mark them are shared to allow for re-use across
instances.

Using IRQF_SHARED coupled with devm_request_threaded_irq implies that
the irq can still trigger during/after bwmon_remove due to other active
bwmon instances. Handle this race by relying on bwmon_disable to disable
the interrupt and coupled with explicit request/free irqs.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20240624092214.146935-4-quic_sibis@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/icc-bwmon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index fb323b3364db4..e1ffd453ecdf0 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -781,9 +781,14 @@ static int bwmon_probe(struct platform_device *pdev)
 	bwmon->dev = dev;
 
 	bwmon_disable(bwmon);
-	ret = devm_request_threaded_irq(dev, bwmon->irq, bwmon_intr,
-					bwmon_intr_thread,
-					IRQF_ONESHOT, dev_name(dev), bwmon);
+
+	/*
+	 * SoCs with multiple cpu-bwmon instances can end up using a shared interrupt
+	 * line. Using the devm_ variant might result in the IRQ handler being executed
+	 * after bwmon_disable in bwmon_remove()
+	 */
+	ret = request_threaded_irq(bwmon->irq, bwmon_intr, bwmon_intr_thread,
+				   IRQF_ONESHOT | IRQF_SHARED, dev_name(dev), bwmon);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request IRQ\n");
 
@@ -798,6 +803,7 @@ static void bwmon_remove(struct platform_device *pdev)
 	struct icc_bwmon *bwmon = platform_get_drvdata(pdev);
 
 	bwmon_disable(bwmon);
+	free_irq(bwmon->irq, bwmon);
 }
 
 static const struct icc_bwmon_data msm8998_bwmon_data = {
-- 
2.43.0


