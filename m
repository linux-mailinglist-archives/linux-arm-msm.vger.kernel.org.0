Return-Path: <linux-arm-msm+bounces-41793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C72B9EF2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25461189AB3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017022253F1;
	Thu, 12 Dec 2024 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7EtNjJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF6223C49;
	Thu, 12 Dec 2024 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021151; cv=none; b=C2qZsQO/RA9x6NuvJRbL0CeZ7wviGG19sMb/ArYv7djSb7fo1AWJmcNjMZMm8VAXVo8N0DqiUUipxopKKaD3Cs+FabRk6CaHrMoRWhOv8pMX0Bzv3oyDlFlDDRZ3QAlJdGRVoljfUwi8whnQOQr9sABldpe5XSuAIrG5Pd97F5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021151; c=relaxed/simple;
	bh=UnNsjVl9T8pR/QWF88dG0A0jiZl2JqShggpSz3fwk44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BpP0V7ZZOTaykJiTpwQaMJ1XlIbiJ2JI7DHrepfQrzYUD48P9HKcO9NM/rY1fUQxzHJ8hMjxx3z4p6lZB10zJlo+ftF24Bi7oAcqtVbjIiGTePvnbMUArvPJWNxIEDIMqpJNu+ZQhr9dlHmmjheRjNGR6+XJu23NwNBQQfsn0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7EtNjJm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E082C4CED0;
	Thu, 12 Dec 2024 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734021151;
	bh=UnNsjVl9T8pR/QWF88dG0A0jiZl2JqShggpSz3fwk44=;
	h=From:Date:Subject:To:Cc:From;
	b=G7EtNjJmHm7iQXwtQ7mmPU5ny8spzosyhU7ahYPT+sSQQ2HOSuPVhLOfTttb7lKB7
	 dV3FkYIH1aoG4qz1pFykDABCPXpqxbJAJuqvXVOHsJJKspIAYRNSuEWTOVmd57NeY+
	 SrjW7dg9I0b3AihPB+OdgBHu5ka8RWnYUvtzlMMQMe90+DBf2zRcPyu9eJbNGw/ZXT
	 N8gy38GyPMyCL1HOZTfLP59Jf15qELYFWBq9yqLpL92so4WJ8F+/ZbfMK2JJQ1mn4l
	 YJj+AJQDe87tvzg9xmyMezc23Yso+i6nFeTY7qHD6HzrRXuMaVMtvdscIFbVELInXm
	 2Bzdm9NY9h+Nw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 12 Dec 2024 17:32:24 +0100
Subject: [PATCH v2] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-topic-llcc_x1e_wrcache-v2-1-e44d3058d06c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABcQW2cC/4WNUQqDMBBEryL73UiyBqX96j2KSFjXuqCmTay1i
 Hdv6gX6M/AG5s0GkYNwhEu2QeBFovgpAZ4yoN5Nd1bSJgbUaA3qSs3+IaSGgahZDTfvQI56VqW
 tdKUZW1NoSONH4E7WQ3yrE/cSZx8+x89ifu1f5WKUUVggl67r7Jnt1ceYP19uID+OeQqo933/A
 s9lF9LDAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734021148; l=1510;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PPtrvo1XgcJOV3eG8wmUzEJEepR+DXELhYukjcb+8n8=;
 b=QGEDpHbQr2p5cgyEbnyDfAPVMdK0TpQl+oVWDa8q67GG6m6FtaLaCLD9B0nmVohBsi34L7wRY
 pwnTEUu6XoFDnxnrZYujOeL4Ot0azI+UAxgCSSqO4y1cAggXA3a+PXP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Do so in accordance with the internal recommendations.

Fixes: b3cf69a43502 ("soc: qcom: llcc: Add configuration data for X1E80100")
Cc: stable@vger.kernel.org
Reviewed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
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


