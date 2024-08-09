Return-Path: <linux-arm-msm+bounces-28207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB494C820
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 03:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4D971F22B87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 01:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B42012B8B;
	Fri,  9 Aug 2024 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJBsHUzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14411758B;
	Fri,  9 Aug 2024 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167814; cv=none; b=dbZNaW2snFAFQ5V9t7yCT7ssDTbmnToP4e+KigJzO0Cl/xHUMHwHdhSS0U/DiakaQnwWO44SH7J1EtE6bbysjjmbYsSWqJkQhJ0QhzT3XnGsgfZWdw1deULZLkAOnlWWLJrw1BNdUYCtd5t2+PO0fvUNIYpoeYofR7dG5nxeBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167814; c=relaxed/simple;
	bh=BGpI6mrN4nWUH2mZgtXQGmvjjBcn4uVAJMLgs282P3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbOFw5KWAEKkqwWeI8/IYBQ06FliIzf5FG01Ssj9/UTubiC6cM6HTz/RDkyh4+dnRAkUNFLzPoW2pL00a53rGRK2L9pdf6vYLF83EYyOzlPIV8O/gNvNNPNz5Ju7+hEUIF9WjGfx6LXspY8fPOHtwEvPrYhhE75C7nHpO08Bhrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJBsHUzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE25C4AF0C;
	Fri,  9 Aug 2024 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167813;
	bh=BGpI6mrN4nWUH2mZgtXQGmvjjBcn4uVAJMLgs282P3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cJBsHUzC9+bvH9nmAvzO6fhEWdxvY79JEDndmpfJ1jMSv+6LlRcsBXfE42j5jmzLx
	 OWyriUok2jgW5WagLgIdrAz1agQH8VgEPapr1Miuk6EGHZ2aYekKnEmhV6Eja83UHz
	 FyxuEYqQ/S7OS30Ui4FDsVQXC3vKrtlBVAfykJwXYdnLkoq6BAtdPP7q4z8U6JyS8q
	 DOrvm4WalFGWHL5agEdpTYMloCEPJiepR6oy0Q6lDx+M6N8lmnqanUMIW8CVR7W5Gd
	 gIdhUlibIGOgVbA4Z+qyvjJQ1yzR4IZO+5T2O6Nda2WX7RAXM5eW9ta0NH9jEgpTGv
	 I/CJfOTFFTbMA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 09 Aug 2024 03:43:21 +0200
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 7
 models
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-topic-sl7-v1-2-2090433d8dfc@quicinc.com>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
In-Reply-To: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723167803; l=881;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=QTuCe0w979xmjsC+otOB2nZN78BS1mhROGqBw8utXM8=;
 b=ylue1E6DSOYP00rkPJ+CdtXaRblM3FBRSPr9CuVfy7kMifrh46Zp7I7+0Esz24Oc1xlRWy+CT
 6W57swK56tcD6Toq9cq5mxxb00hyz0e7HrXBXkGzGfJBMq0SR3tJKLR
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Add the aforementioned machines to the list to get e.g. efivars up.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e60bef68401c..2c39ae1e840d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1726,6 +1726,8 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "microsoft,romulus13", },
+	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },

-- 
2.46.0


