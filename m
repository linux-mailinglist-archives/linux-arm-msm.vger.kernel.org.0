Return-Path: <linux-arm-msm+bounces-46153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE55A1CC3B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A211D1883F9F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24D3237A4D;
	Sun, 26 Jan 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cc3RtTQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77521237A45;
	Sun, 26 Jan 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904124; cv=none; b=uC6Y5FlmEqGpXUrqP8fUo/PWDV/psqArTAcsl7P3ONHmO/uKD9QyHEk7rhLHHHWhxug2nQgVKHq6BWJpbYmnpOLeVsuNuei3hzb/iTuiEsH8W3afx9ZyDn0fIzbKgvHQ+6MRkNmb8WIZqGtdTFXRQvtwMnP3xYMFlLi1KaRwCno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904124; c=relaxed/simple;
	bh=1ztisbHwpmkKSTOlDKaozWadrVEdSWR7WX4DbSoZdkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BdLh+o8OaZyLYosL0Ye0PQiVXhP2hliyNrjIgenhCaluEXxdX1nj2FKZk8vPu2pRF5W4jREsCEoPjy4B+KoeHH1eZGYUoYRhy7rSTRe/v/qjeatuFkysx5ej7N3Asd+uyZq3xbqbf6f7H4EtIEs17IUINVRuRWNA6c2cWq+3huk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cc3RtTQK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FE9C4CEE3;
	Sun, 26 Jan 2025 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904124;
	bh=1ztisbHwpmkKSTOlDKaozWadrVEdSWR7WX4DbSoZdkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cc3RtTQKNGtdhOov1AZn0BjhNrJ6K1qUt+HT+HZJNAfzzLd6kJhGt5ymxzjCjIdFN
	 Ila0jc/J3jEizQROAaiqBcjUdUClBc8RuwfX0bIiqQpNg5c2Pv/BsMLbYX4I+B4LW/
	 vTyW4+3CNgTeaALXmsAj3ez5U0iojmVEMiOUUOJzQdi0bWASeIZQG4AqP7d5YpKGvA
	 B9PvLR/YCa9aVESIq03Va9AVRG06OMjfU+1b+ZGFxQtdEQndqc2VnPTlVdgWdMpxHo
	 65Nqq0ma/s30dd7Z0qMcJRsqqfnBJeacjVe3qMwer0LA9IUsCT1vkmlsUvilDZbXJ9
	 5fBrPiJfRNFOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 2/9] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
Date: Sun, 26 Jan 2025 10:08:30 -0500
Message-Id: <20250126150839.962669-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150839.962669-1-sashal@kernel.org>
References: <20250126150839.962669-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
Content-Transfer-Encoding: 8bit

From: Richard Acayan <mailingradian@gmail.com>

[ Upstream commit 42314738906380cbd3b6e9caf3ad34e1b2d66035 ]

Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.

This IOMMU has the compatible strings:

	"qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"

While the SMMU 500 doesn't need an entry for this specific SoC, the
SMMU v2 compatible should have its own entry, as the fallback entry in
arm-smmu.c handles "qcom,smmu-v2" without per-process page table support
unless there is an entry here. This entry can't be the
"qcom,adreno-smmu" compatible because dedicated GPU IOMMUs can also be
SMMU 500 with different handling.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241114004713.42404-6-mailingradian@gmail.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d491589360197..e6b4bab0dde2e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -554,6 +554,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
-- 
2.39.5


