Return-Path: <linux-arm-msm+bounces-81102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B1C48982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F0903AC50F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9537C33032C;
	Mon, 10 Nov 2025 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gbK26n6j";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KYRnURah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC9732C93C;
	Mon, 10 Nov 2025 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799403; cv=none; b=cj3RWSp3tkctlXhZlpiLRDE3eqw8W1KzPP+MAbmzdwrQnntaSZDhFyxT2nNgf3qLERw5XcvM32C+Z9ZZGxswEQojxKp0geV6IT7Hsiai+SJRzByOPAra3TumUlMos20yoTEtguv2Yl+nQMAFYyY+pRNbm2/LaOceWM5OF0VplK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799403; c=relaxed/simple;
	bh=6fInuB/1LJqGr9jEjfnJRvv1hxhaA0dDoP/Oy8mHJXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3u0+vXyrlmkyQJ3XDJB3S1o4mWrCvwB3I+nckpIm+x9sCN8w4tIAJorPL3GCqbWUGG6mfNS8veV3Kv29h8ziuEAcCdQcT5koC6CYEZ/AtRI0nEvil6cQWu6O64xUiEP218wH2O8QgzOKy/LYogQdkodZ4xYjeqYHfEwiWVNfL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gbK26n6j; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KYRnURah; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762799392; bh=b4/2A9IZo4Q3EDqyqKQz++M
	JL9/nqE/AO5cujHVnDu4=; b=gbK26n6juiU3k877M8g33ljW3mSUZxdRxf0UhzlKBP0UfTNDZm
	WdlupI4yHLCplDllUkp87+tueYd7BobpB90rQ/O99D7SBPgYPiqPq7JyEqceexSzBUzXIT8Tdxn
	P603S1a6/OJ5dmoWt56rkZBHTJXdEYt/tQ7V9oJhcWtj9X4shVJgABcZPdDeL5IzKO4R4w/h/nx
	FWoWtG2MX8xQAZykwn8+6cZYpEgZP758V2iUUOLc82YFlH81lyYfVt1ia8kIzmUEJ5XRZU6VQMo
	ltkmmrT5gH404cH0WoVQfxzwejffKyev47jIMXwrClJ0SqlczVaB4AJcwEaLpZozX2g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762799392; bh=b4/2A9IZo4Q3EDqyqKQz++M
	JL9/nqE/AO5cujHVnDu4=; b=KYRnURahJRxysCEVPIYOz3eUfrCV6lZZ3AWAgylWxgF0rFORTQ
	OUMISHixy8Vf9qMJw8vjYG8rgB/dOtlhibBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 10 Nov 2025 21:29:45 +0300
Subject: [PATCH v3 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-qcom-sdm660-cdsp-v3-3-cc3c37287e72@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
In-Reply-To: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762799388; l=1216;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=6fInuB/1LJqGr9jEjfnJRvv1hxhaA0dDoP/Oy8mHJXo=;
 b=uWuc8bk1akkBd9vVJ8V0pRHXHh0FBFB5JoTwCLNazcn8dbLg9QgxqoJBy2rR94B1Er7nyWB6q
 LdmHBvinsdsAYgEkDrggfK6TPqX39AQw8F/wtH8oTzkrh57M1uLz9VF
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Compute DSP in SDM660 is compatible with generic cdsp_resource_init
descriptor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # ifc6560
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..781eac6aa6bf 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1488,6 +1488,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
+	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},

-- 
2.51.2


