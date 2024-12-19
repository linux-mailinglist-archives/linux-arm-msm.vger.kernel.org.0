Return-Path: <linux-arm-msm+bounces-42824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5099F838C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51CE2164513
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AEA198A31;
	Thu, 19 Dec 2024 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmWC3LoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34902194C96;
	Thu, 19 Dec 2024 18:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634417; cv=none; b=NPXkhHJ4FX28ioNaQEB8X3accklqk6Q4QVRxaFwRsZ9Gqh0NpDpsCvgykKdW8MMZk6Tq0hFqGFqg5oVDcl0eqzkXQwkd+ISJDlONrBZaBF7SWiL4vvAkVTAhXjS6m78w+tMeKpeiWeunu5tTXPiaINSfUH+4PLr3AH42NyWYt78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634417; c=relaxed/simple;
	bh=DjG41GoFQiE98jZxov8TvqSLToOUVD4GOSLwF6cCfMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fZ7v/0vU3aPf6/hxbfRoWPfcwtElKTkiqAhcH9mj3dN3loWCgIiwCmX9LP82VR+sSCFLPJYVndU5Or1msvxqjJbL272kol+vMD3V1r4X6S3GEG7UAqlvUgsck+WONXkjXhFqzLMYwcSAPsIuuytUD6GpcFn5C8QyB4ukbIe2NG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmWC3LoU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1D0C4CECE;
	Thu, 19 Dec 2024 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634416;
	bh=DjG41GoFQiE98jZxov8TvqSLToOUVD4GOSLwF6cCfMQ=;
	h=From:Date:Subject:To:Cc:From;
	b=qmWC3LoUPoFkd6r0npXn2QbH7SQxahZ1xEf16I9Nsw/UlCiWbIRADCS87z6n55S2p
	 WuXEJ/5OLvWWbBp1glOGc0QAEt1DLlffw/rF6JKrRa4VHR5Oe9nhEmQQqcRfbyhy3L
	 IezJvfLJIru0KVYtl8tmWn5zrjw8AY7BXzo0SBpfXJQ6FbWnzlG9F47fWBCRyzQ1Rj
	 ELir05GuPFI9NOkt9mSSMeCVZn4gNPrwTv2kXuy6kfsq6ng7+E5Fy/apdvfqCGCYuA
	 1XeE39iQ/T6ogcQQBDDOl06L/+ZR3kR8RmWYiS6B++JRfxhGhfMff+Ocp4WlupV5WM
	 A/WlZlYu8UR+w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Dec 2024 19:53:29 +0100
Subject: [PATCH v3] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-llcc_x1e_wrcache-v3-1-b9848d9c3d63@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKhrZGcC/4XNwQ6CMAyA4VchOzuydRPUk+9hDFm2IkuA4YYTQ
 3h3BycPGi9N/ib9OpOA3mIgp2wmHqMN1vUpxC4julH9Dak1qQkwkBxYSUc3WE3bVutq4lg9vVa
 6QVrIkpUMwXDBSDoePNZ22uDLNXVjw+j8a/sT+br9S0ZOOQUBWKi6lkeUZxdCfn+oVruuy9Mgq
 xzhQ+PwU4OkoZRGsP3BsEJ/0ZZleQN5TUWgEQEAAA==
X-Change-ID: 20241207-topic-llcc_x1e_wrcache-647070e2d130
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734634413; l=1970;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=AL5j6+neJMnFGK6IDP9nt4n9ObEDTOuheHfRASMyHOI=;
 b=CTeq8EAYNB6nksl0ydRU1MXbofboZerecF28k/XxidyZcRYtOGXihQMMt69GbCi7HsJkiIne+
 MExl/0bxVmQAhNESh/TYL1JvR6FCwEtvYTRPfr/GA29tkpNPWWubYtR
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Last Level Cache is split into many slices, each one of which can
be toggled on or off.

Only certain slices are recommended to be turned on unconditionally,
in order to reach optimal performance/latency/power levels.

Enable WRCACHE on X1 at boot, in accordance with internal
recommendations.

No significant performance difference is expected.

Fixes: b3cf69a43502 ("soc: qcom: llcc: Add configuration data for X1E80100")
Cc: stable@vger.kernel.org
Reviewed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Improve the commit message
- Link to v2: https://lore.kernel.org/r/20241212-topic-llcc_x1e_wrcache-v2-1-e44d3058d06c@oss.qualcomm.com

Changes in v2:
- Cc stable
- Add more context lines
- Pick up r-b
- Link to v1: https://lore.kernel.org/r/20241207-topic-llcc_x1e_wrcache-v1-1-232e6aff49e4@oss.qualcomm.com
---
 drivers/soc/qcom/llcc-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 32c3bc887cefb87c296e3ba67a730c87fa2fa346..1560db00a01248197e5c2936e785a5ea77f74ad8 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2997,20 +2997,21 @@ static const struct llcc_slice_config x1e80100_data[] = {
 		.bonus_ways = 0xfff,
 		.cache_mode = 0,
 	}, {
 		.usecase_id = LLCC_WRCACHE,
 		.slice_id = 31,
 		.max_cap = 1024,
 		.priority = 1,
 		.fixed_size = true,
 		.bonus_ways = 0xfff,
 		.cache_mode = 0,
+		.activate_on_init = true,
 	}, {
 		.usecase_id = LLCC_CAMEXP0,
 		.slice_id = 4,
 		.max_cap = 256,
 		.priority = 4,
 		.fixed_size = true,
 		.bonus_ways = 0x3,
 		.cache_mode = 0,
 	}, {
 		.usecase_id = LLCC_CAMEXP1,

---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241207-topic-llcc_x1e_wrcache-647070e2d130

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


