Return-Path: <linux-arm-msm+bounces-40340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA39E41FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7A4287D75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378D023099B;
	Wed,  4 Dec 2024 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEKAezYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2009230995;
	Wed,  4 Dec 2024 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332310; cv=none; b=HMzBDsTmE7okLiFqpbWwbhcvzAgw6G40ioxc40SyPOwrlF/6dCEKrNcaRNBtAasQ18q1HtPzaue6KmjAfiTnHnD1QslvrRedp/imnVAtCeV8NDNuhiDfBUkBXbHM/1GMAkMOejtHcdL3LkOwzDjSCnY5i8cXQtP42NMqQK6IIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332310; c=relaxed/simple;
	bh=k1jOQVgSF2aXA8uiylaUo68g12VS2FuU1O43wOhZ6cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGj6u18xPbyze+rrEGZjTFNEBrrgpnOAxpvFkUhLIzWErkwYl9+GF4OMLUvDnED1NrIl7g/TSpw9uoX7E4xlzumqNGcOsuA+tLsysvGXxp4YEea8zSuaJq3/R8vA5RQGsZrbfjfEwzckoLhjgGHmCOeEX5SjQqrU+WrSMJmxOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEKAezYZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C608CC4CEDF;
	Wed,  4 Dec 2024 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733332309;
	bh=k1jOQVgSF2aXA8uiylaUo68g12VS2FuU1O43wOhZ6cU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEKAezYZgBOTWO7+H8Y1DAlDeJhhO1+i0Y0gspGdtWMFWB0wdcjzi9z4nRufdDcTo
	 pk96gDYFB/eBa4vKCqXxb/B78DKOxIW0rjpCxIgk5jiaCazb0IhZNd6erAM0C6f7XB
	 w36txTowlGc3S7kmME8waHBYN/BE8aqo4D89T7mQR/F1M0Y4ejZrMQLc6MSoTPk7dr
	 ooqGXvF2hbLaKzie3odW9xSgNGF3VaHqR8Vh2HPsTHGY4E/Bp0VFcp73O58ynaPz16
	 m9Sd/XVRdgElSofOu8jBBtfKAG9Dc9HZRQLaHBhKwRbfF5Rrr7DHp05h8f59dIXjL/
	 TrDbZ4oAiBGSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 11/15] remoteproc: qcom: pas: enable SAR2130P audio DSP support
Date: Wed,  4 Dec 2024 10:59:59 -0500
Message-ID: <20241204160010.2216008-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160010.2216008-1-sashal@kernel.org>
References: <20241204160010.2216008-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 009e288c989b3fe548a45c82da407d7bd00418a9 ]

Enable support for the Audio DSP on the Qualcomm SAR2130P platform,
reusing the SM8350 resources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/r/20241027-sar2130p-adsp-v1-3-bd204e39d24e@linaro.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4e..0a7477ea832ed 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1421,6 +1421,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
 	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
 	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
+	{ .compatible = "qcom,sar2130p-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
-- 
2.43.0


