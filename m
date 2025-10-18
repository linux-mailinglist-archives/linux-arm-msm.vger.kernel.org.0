Return-Path: <linux-arm-msm+bounces-77869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CBCBECDE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 12:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC80584C73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 10:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8192FC02F;
	Sat, 18 Oct 2025 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Z+XOQ5EJ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LtjbC7YD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0994C28369D;
	Sat, 18 Oct 2025 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760785063; cv=none; b=KrdJueXvEj7GAbASZCJ8pJCx6j0gFHs8vdnFZWex84zVLsPLd7uJAx1FWDsubTtf70ZFM1A0hc164SkxW8D+oQTRQr7REAxlJEMTuPmy6BqNqFaLObogpiIUgXHC9T5XFaYT7uVEpCaoRilZgMIy/vt/g9zULE49C4/vjshaIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760785063; c=relaxed/simple;
	bh=iD6vzCEKqD9/blvaX0pltngk9iLZD/71WkAAjntvyNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEeVAYKqCZjPIdYU0A7FYfNaYKO/XOirsSh0TmPtZiJJ4sFILXn91ITANcgWjIEfN41/FxVgyc9h3SReuR1zSON+cED8DNiJvXXm0K4A3Tc3cloxAD1fRVrVwRDqYVwhECGz4lRAqYWUANFmHCu4vQPKrPovhUEmkpY70Ksc9wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Z+XOQ5EJ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LtjbC7YD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760785052; bh=wyy0OTjbsKEFvHHWVmPxVpL
	n6rghtweg89hM4ugVKjM=; b=Z+XOQ5EJPnrPYPITKu8qn+/e7mrEf1zB5BgP+hvaIuYU/FwQKU
	/cIskSQlj1cRbcAkNSfY6HZfjn9xvVlaexX9yw5XQvR7DXRT+wboipknfFIHJvxxE2eUGcUh1qu
	cZf++Tdn6Vr6M/dH3IUPCP9tJyiT3ewnWB0zP4of3AywOBwofSPVPvrMZ/HQPs0T1Q/9DHSqSqM
	CmHK21aTxukoyWzcW+nTksIl5iowJFh+tcQFKDewfl0a+/SiPhEzmC39t9hQqcZwtGdydG9p3sA
	aTUB0qbVRx/n7FFpdNluqQRmQXn/hg5i0qhBH2vxLQmu73Brq+tujD6/xYfsLBc7oeg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760785052; bh=wyy0OTjbsKEFvHHWVmPxVpL
	n6rghtweg89hM4ugVKjM=; b=LtjbC7YDEZWQNY0hBiTRG1Y1kH6A1LLsNcSdnkZaETItnO6LCd
	PMM93slrAH9DcW76svpJegs3p7f4gLmk5fCg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sat, 18 Oct 2025 13:57:29 +0300
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add support for SDM660 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-qcom-sdm660-cdsp-v1-2-042e283db29b@mainlining.org>
References: <20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org>
In-Reply-To: <20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760785049; l=1074;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=iD6vzCEKqD9/blvaX0pltngk9iLZD/71WkAAjntvyNw=;
 b=KLHTuU0xucOIM7Ojnana5f+1leD7bnwOvcsEBAftd/5DPIA4upTjpF4k8i9LnUpHMoMMI3qtF
 fS82O3c3txZA38de6YOLuUoC8DmIOm985qlwChnwwQFw8hly4LBVr69
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


