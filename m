Return-Path: <linux-arm-msm+bounces-48137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B0AA37AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 06:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5733AF01C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 05:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7223187346;
	Mon, 17 Feb 2025 05:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="l30PjRpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C341624D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739768629; cv=none; b=e+K/UE+EPd0WS0PoO8dOVE7iXw7SLYqddagIyZMbsT7XcXxSnLN9vLGUUAF2pGFaHFiplY1WZxT+PDxDcikYhIe9/EQruDC2bIUxkTwQOsi0QZYMPRCoRJ8AOOjPFqKNMtb3r5mV9SsQ6YNmiqRgWLvWsbgfGm7C9dQlvYSgQmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739768629; c=relaxed/simple;
	bh=xHpDXYQREl0WgTsQ48GioN0js1oGv+Tpb1hnzArk3ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PefsRD0z5JMibMNRx/YMYy6P8zqaIbNF/AQywdRBByj41ak7fP4CG0XUXTRB8j9dU+20XmVyTzFNIgEo2FSigylDqkerH0Yox+ukEG2XZrol+qee9pnnBEIFdZyzWzrg12wRw2dUCSqCBK0BivQnyOET0zcZG2foYVPDuxF89cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=l30PjRpG; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1739768615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QspUST0m5WAGD4rthvQCx5lZ1z64coX3Ge/sBUZs8fo=;
	b=l30PjRpGSErErfWKMDteyURst5uuhNUP8Eh8zqiKdWW712Be0jscoQlGycZN6pvWOO0y37
	Lp8hZssI+ST+Mv/8FKrDFr4psa/pephTLHZY9Mf5T0nBaNNHtGCSI7RUyXFcY+Uu/9ncA2
	lxyrkVVRfiruxNp3hG4T12efE9xitlroVYnIyROSfMHpJzfoN8EsKn/yLiKi09FRblyJp8
	tw1GXp7SjoWRE23wiflDfL+WigbrEVvyYgTZtVwH5llpqZfWjn97P/hOWRKlzozpZaimrp
	1B5eeoZPtP3cVrSyr9gaRNwgevXw+ZPkzU8HbxAai+/UEqIOZmiArB2NOjG+eQ==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH] soc: qcom: pd-mapper: Add support for SDM630/636
Date: Mon, 17 Feb 2025 08:02:50 +0300
Message-ID: <20250217050251.298163-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add missing compatibles and pdm_domain_data for SDM630 and SDM636.

Unlike their older brother (SDM660) these two cut down SoCs lack CDSP.
Other protection domains are the same as the ones for SDM660.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 154ca5beb471..1d1c438be3e7 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -429,6 +429,16 @@ static const struct qcom_pdm_domain_data *sc8280xp_domains[] = {
 	NULL,
 };
 
+/* Unlike SDM660, SDM630/636 lack CDSP */
+static const struct qcom_pdm_domain_data *sdm630_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sdm660_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -546,6 +556,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
 	{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
+	{ .compatible = "qcom,sdm630", .data = sdm630_domains, },
+	{ .compatible = "qcom,sdm636", .data = sdm630_domains, },
 	{ .compatible = "qcom,sda660", .data = sdm660_domains, },
 	{ .compatible = "qcom,sdm660", .data = sdm660_domains, },
 	{ .compatible = "qcom,sdm670", .data = sdm670_domains, },
-- 
2.45.3


