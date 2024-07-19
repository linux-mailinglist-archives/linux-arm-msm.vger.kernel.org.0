Return-Path: <linux-arm-msm+bounces-26622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7952937684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C241C21A48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F16757CBC;
	Fri, 19 Jul 2024 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hP5FojcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654D44C81;
	Fri, 19 Jul 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383964; cv=none; b=JfebZZBeGRJqSeweoKctM6MRwgzLTq93QrRg557j1hCy60aNnMA49FdhXSleKOkfzLg4BWDJxJtug7lQaURbVPhX7SzSPE54R6WgVYF1im03Nf2pB166clusIzRmq+bn1hY5308A7shQrr4G4w8r4UUjz1YJ13xlClkg2/AaxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383964; c=relaxed/simple;
	bh=m0vXYSx3WBn7saTs9sh7dpzysHqDFAJBj2XsqYqk+/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eomjGuSn74thJxglcsnu5KUEYXEECQojY1OujYL8CyCeZOUZHvGZYeFM4dOGT6WQLFnc/ED5l/WHBJm1vsi5Ay5GvyrPt8pE4CaL+QEriB97v8hGgFQh/x0D8JoXUoFLAQWVFA5hsQuATCGm2AcAQNdvKxEvFYTQ+v6WotYUKTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hP5FojcI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8FDC32782;
	Fri, 19 Jul 2024 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721383963;
	bh=m0vXYSx3WBn7saTs9sh7dpzysHqDFAJBj2XsqYqk+/0=;
	h=From:To:Cc:Subject:Date:From;
	b=hP5FojcIGuL2hI/PEa7EFPArV1HuvI5mA2AoQCVdBMukDJ0c6846H9E70lsBb5H25
	 ZXKDvtj/qdsUbof8O0wAF+TstUaEhXOfj+cBrDLUxvAkUJMicvfvIfdSFkk0h2Zi2E
	 NUJPcAz6fKu8G7L4jUG3tgFguQaCAMEuehyqTdlRkJwaOTTyOraGAn8I0t4SMJt/uR
	 8jiK9MS4P48Xud4DB9Tm0835EyUoEvckNAo5TEz+fHlI6GzMuE/PafpMHNuxibirV8
	 W2+zyUycCM+QzX0MsvGGTbK+vIMBKky5zL5CdIBDoiOl8smmnh06+ke6Oo6O6HIJ3V
	 CuSgq2YdBUlsA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: pd-mapper: mark qcom_pdm_domains as __maybe_unused
Date: Fri, 19 Jul 2024 12:12:31 +0200
Message-Id: <20240719101238.199850-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The qcom_pdm_domains[] array is used only when passing it into of_match_node()
but is not also referenced by MODULE_DEVICE_TABLE() or the platform driver
as a table. When CONFIG_OF is disabled, this causes a harmless build warning:

drivers/soc/qcom/qcom_pd_mapper.c:520:34: error: 'qcom_pdm_domains' defined but not used [-Werror=unused-const-variable=]

Avoid this by marking the variable as __maybe_unused. This also makes it
clear that anything referenced by it will be dropped by the compiler when
it is unused.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index a4c007080665..9afa09c3920e 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -517,7 +517,7 @@ static const struct qcom_pdm_domain_data *sm8550_domains[] = {
 	NULL,
 };
 
-static const struct of_device_id qcom_pdm_domains[] = {
+static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8064", .data = NULL, },
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
-- 
2.39.2


