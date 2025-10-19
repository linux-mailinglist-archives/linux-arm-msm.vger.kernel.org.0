Return-Path: <linux-arm-msm+bounces-77918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B762DBEE6C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9700420E57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF86A2EB5A2;
	Sun, 19 Oct 2025 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JuRLif0V";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fvQLU1nQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030F267B92;
	Sun, 19 Oct 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883641; cv=none; b=uWP2ggIQV/QZ8SSjEhwcdTzBX4VL+cS8CrfXduicarWGTqeyddZTKoHWssWxzLNR1N/5jSzYD7KgRDF4fMPbk/W4ulErKEuua5leheb3QDzThmqYNts/ONt0dNVl0YKxQiLAFw0qP49gF0tP21Wl62Zkj1l7d+MoRuaBFeNGzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883641; c=relaxed/simple;
	bh=iD6vzCEKqD9/blvaX0pltngk9iLZD/71WkAAjntvyNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJL8CRNQ3Zc83ejCy03ezCZag8MiYWzUfP9YQbeqiN0Q3tKX0BYaDSMhe68l8VcbweeHiW/JXgZjm08qhw+fq//8L7QAbKd2VH9PCOKq/nuIy8okdFD6CifAc4awxAjaxCQsLUpOxQEUE07wsWnkyGjVe3vuv8MfIYp4ahz1BTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JuRLif0V; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fvQLU1nQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760883624; bh=wyy0OTjbsKEFvHHWVmPxVpL
	n6rghtweg89hM4ugVKjM=; b=JuRLif0VVyCZksnB8YkfvzejcIN/BCoVSIzPIoEcqqZAN5mRHu
	wNZW1+VYZ+Y0cdQYayiFs2pVmjRqSdjyc5B0fWbez02wRf0TefMtmdfNH3yy3xbeHj7BwohNTCa
	NAVKdJKyHtC30fGC8fSjt1MrIRDfMHI2X+8pEX44WKA1HJ0bPSVWeVgyD4btC5CQ/Y9ZtmPuZ45
	rGQiDkZaCskvhkP358gxRTfxj7m61hM1KosfuCvCZ1cUKm2voGUdOjT9FetQqPVWyN2sAbS5AyC
	6u8K3CxO88TB4Wish3HHnMbfO/RRrXhp3YujIlLppdUP3UzCUnn8sP/7uLqZs2QYRcA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760883624; bh=wyy0OTjbsKEFvHHWVmPxVpL
	n6rghtweg89hM4ugVKjM=; b=fvQLU1nQBgCWXb4t99uxf4ccXsbrvxVj3nCDbPNKNfPjzaT6rQ
	WqSpSSs2v1Kw4lS2QEnufp6nBt1NvkT618BA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 19 Oct 2025 17:20:21 +0300
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
In-Reply-To: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760883621; l=1074;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=iD6vzCEKqD9/blvaX0pltngk9iLZD/71WkAAjntvyNw=;
 b=iYFjKZ4ijHDA1IL94IFqk0b3ZAJR9VHPDBennopFQ1IBRPCMbp7upM+NwMQz5bwOD4POWDdb/
 AGNF9NFWiSWDisjYARZZEjuatjFfsZhqiR+4mW6WMp3tWjlqd2+Ci9d
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Compute DSP in SDM660 is compatible with generic cdsp_resource_init
descriptor.

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
2.51.1


