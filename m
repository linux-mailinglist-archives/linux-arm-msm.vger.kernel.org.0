Return-Path: <linux-arm-msm+bounces-78788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD7C09806
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A3B1AA641E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432A830CDA9;
	Sat, 25 Oct 2025 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxM6/W5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175372957B6;
	Sat, 25 Oct 2025 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409148; cv=none; b=f5bLrFk9/1jCCIEc69MoIx7df3Q2ijeEdZjrlqN2ScLkzbTuElXx7Sd9piKGv2EWnCCjoEdBACf5Si5AppNrIVwCwnK0/Lu446aUQUIsU5q3rzXnzCrB2TPdAxiKjBfoqtBSCO6/t3+B7iejO/ftKCHmwZfOscEaLiG4GwKRtoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409148; c=relaxed/simple;
	bh=wmGerKsAeTm6+7YACjFiuOBggDesDg3VdDHxNa7Womc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnApY1wSx4qfuk7d8rad627nJlQHqK6w7NNSlZXDu2/k85HG8DzF2rj7p0ORbavJq8QVspwi3jZ6Twd0HCSRQjdXTp5J8RYAl3V1yL2GlQgfka+zs+aQFSbcf8fdUrq/fTBGsPk0TUCNDSVl5/VJndOl8D0PwfmAP1UT1yOmL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxM6/W5P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD66C19421;
	Sat, 25 Oct 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409148;
	bh=wmGerKsAeTm6+7YACjFiuOBggDesDg3VdDHxNa7Womc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dxM6/W5PYXxxwlDaXZa38C+GCEC/PFRzU7NBlupagXnE6Gz+qU2MxyQ0yg7yWGmzu
	 ahw0bRKs2nSyQi4MzwCr1egDM6LaZK+eC75VD1itLW8cOCzF7aJveZafA6uxfcEd+d
	 mr5c8p/UupL4SG4NQL+jZrqOx8hFnEn9becXTp81wZM0K3w1ZoiaHAe57jW7GHYv2a
	 VtCgZBk1W4axHIaFQ0RUtn/DKU3Fdy/F5+8/O633RJLm2QPaG37Gg/5zbN596LINYn
	 GIPlZPDP8zfS2iBy75A7DJhoixqtNFL1Q5FIqf0ATaFpfLpkrKB2nJkjPox7zdZ9eh
	 hW6lJzA1PbRLg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] remoteproc: qcom: q6v5: Avoid handling handover twice
Date: Sat, 25 Oct 2025 11:57:28 -0400
Message-ID: <20251025160905.3857885-217-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stephan Gerhold <stephan.gerhold@linaro.org>

[ Upstream commit 54898664e1eb6b5b3e6cdd9343c6eb15da776153 ]

A remoteproc could theoretically signal handover twice. This is unexpected
and would break the reference counting for the handover resources (power
domains, clocks, regulators, etc), so add a check to prevent that from
happening.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Link: https://lore.kernel.org/r/20250820-rproc-qcom-q6v5-fixes-v2-2-910b1a3aff71@linaro.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `drivers/remoteproc/qcom_q6v5.c:167-177` now refuses to run the
  handover path when the interrupt fires a second time, logging the
  anomaly but otherwise leaving the first-handled state intact; the
  normal single-shot handover flow remains unchanged.
- Without this guard, a duplicate handover IRQ re-enters target-specific
  clean-up hooks that drop regulator/clock/power-domain votes
  (`drivers/remoteproc/qcom_q6v5_pas.c:369-379`,
  `drivers/remoteproc/qcom_q6v5_adsp.c:454-460`,
  `drivers/remoteproc/qcom_q6v5_mss.c:1748-1758`), breaking their
  reference counting and potentially leaving critical resources
  permanently disabled—something a level-triggered or misbehaving remote
  firmware can trigger in the field.
- The fix is self-contained and low risk: `qcom_q6v5_prepare` still
  resets `handover_issued = false` for each boot
  (`drivers/remoteproc/qcom_q6v5.c:64-66`), while the fallback path that
  manually issues the handover when the IRQ never arrives continues to
  work because the flag stays false in that scenario
  (`drivers/remoteproc/qcom_q6v5.c:79-88`).

Next step: consider picking this into all supported stable kernels
carrying the Qualcomm q6v5 remoteproc stack so duplicated handover
signals can’t cascade into power/clock mismanagement.

 drivers/remoteproc/qcom_q6v5.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 769c6d6d6a731..58d5b85e58cda 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -164,6 +164,11 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
 
+	if (q6v5->handover_issued) {
+		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
+		return IRQ_HANDLED;
+	}
+
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
-- 
2.51.0


