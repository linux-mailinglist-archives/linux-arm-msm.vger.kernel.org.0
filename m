Return-Path: <linux-arm-msm+bounces-46159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F87A1CD19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68D3D1885B36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4DA193073;
	Sun, 26 Jan 2025 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hu3QXZON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C7175D4F;
	Sun, 26 Jan 2025 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909952; cv=none; b=Im//pfY00s+qt6Q99506UrUYLdOZtKDjtVR9jWIgx68nfGByv3noOAVlpuGOv5qBUccRvZ0AlmXsdhPDBQd+nDeEVTc7BrfJ/AB0ffOCxlyWVwbwKE+8hqlGNwecXpmsOm8TG+CSWUDYWuTlDY0pnOqie8fMQdPn/8PhOu8akMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909952; c=relaxed/simple;
	bh=w1Pkdasfspl0G+PjdpFt2OcCV0OAekVaWgJgQeKcImc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iNfOx1/UZGNN/h/MGY9hWGK+RO1ikFK/OAznPoXhlU0rCHFfN7JPHWh7/9S6Ni8Pc8XZf97sHsq/1z2/37gKShNCIcAgiQisReQtVI8SsRntpLvwmCsJ2P4YsDFdd2E45NVQC5fm0pJhL+vXN3I8YgtQENitSn+jwA2X53xnJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hu3QXZON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD845C4CED3;
	Sun, 26 Jan 2025 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909951;
	bh=w1Pkdasfspl0G+PjdpFt2OcCV0OAekVaWgJgQeKcImc=;
	h=From:To:Cc:Subject:Date:From;
	b=Hu3QXZONcWjLRrw0rXHzT2EaDwb6U6mxV5TI+Z2lIeyxKc43yRyiG7wlp7wjqSnds
	 GgzhUuviWb0ZNo6LIuE0Aj9720f0SzrgieF7FiV3oBhz0djAv6CA0hGX4XpEuTxS9X
	 nO8YwujWTZWKvsiW6p1D02vKOpBVh0AbWN5eWDkcmeLtr5YOzb6ecJhM6fOW7EmA5/
	 7K6yEhb2AgNke6wVFIuKmViZCStPWbM/ypGddazsKTSKN8q07Rh4Q+trZyruoFuLIf
	 4X3e7l0HvOeJQpzUtigvzQvlNAOyrcu+KnPod2dcGdyDNlaRJ4L0t8WBPEKGB8ICOO
	 C+PxHp9VkeGVQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 1/7] soc: qcom: pd-mapper: Add X1P42100
Date: Sun, 26 Jan 2025 11:45:43 -0500
Message-Id: <20250126164549.964058-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[ Upstream commit e7282bf8a0e9bb8a4cb1be406674ff7bb7b264f2 ]

X1P42100 is a cousin of X1E80100, and hence can make use of the
latter's configuration. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241221-topic-x1p4_soc-v1-3-55347831d73c@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 6e30f08761aa4..50aa54996901f 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -561,6 +561,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
 	{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
 	{ .compatible = "qcom,x1e80100", .data = x1e80100_domains, },
+	{ .compatible = "qcom,x1p42100", .data = x1e80100_domains, },
 	{},
 };
 
-- 
2.39.5


