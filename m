Return-Path: <linux-arm-msm+bounces-38965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAF9D6F4A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C97CC161C8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DFB1D4354;
	Sun, 24 Nov 2024 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3kdxDBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB961D434F;
	Sun, 24 Nov 2024 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452570; cv=none; b=rUoXSjxrdcOp8+pleUtLIlYaj9k2wGesitXXBqYZSKVOYPBJDQUJYozNpu4IqDT3XRZIcAQE0h1wDRzP1yAEZiGVHAeQWSZLBq3uGUQSIZGSAHtENmDfa56UlNyzGHCLCSNaOqHN2wwLXFjuhmI2YhaGO3lvip2+h1nHCVmG4mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452570; c=relaxed/simple;
	bh=9diJ/ITeaYIWwfiN0s5YPQvzOreJhVtOQ+MVAmtmw5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lsdt335OUG/6Tu1rTNIc/Tx8b6XnGj3mRRAgHJwWZsH+6WlHD+Ed9XWZWcknABoL61vmQf0YpyyMpOrc5PmN41RPu76bRgVwVrPbHFbbKXHjSecrID4gAqUrehAYqU2V01/3hFP7GmpX8AR0ce04fwz5NgPRvD5WP0q6mQnBUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3kdxDBo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845F3C4CED1;
	Sun, 24 Nov 2024 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452569;
	bh=9diJ/ITeaYIWwfiN0s5YPQvzOreJhVtOQ+MVAmtmw5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3kdxDBoHcm/XP1tuz2STAq42JD1EYjKCBiDAVhv5pwhijKW5+m/HhOyza03AId+P
	 8yfdbJZQENUtHG6DOfJER1svERgiNb3WPvBJmJ7nDr0y2xgamQ72aBPJ1kvd2OtuzC
	 xrXu7qEFyECYy9dHveudEE3ltVq2ckmgmBTuy1N1b/JEiJwuZfpKnHFCvx2j33+XMO
	 o6bbWQhN9UtWmklD/y+SUUlW8Euh6RdTpJg25pBrPkQVBZJ8g0xuF353DEDW8SqIGF
	 1T3wQMROQkqYQOKayoWioHG6oYVCz1DxaWeHoe+OvpFRKbFRsAAnmH7csm+oiJ1a3F
	 NU13H2bPNlHfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 06/23] soc: qcom: pd-mapper: Add QCM6490 PD maps
Date: Sun, 24 Nov 2024 07:48:17 -0500
Message-ID: <20241124124919.3338752-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
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

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

[ Upstream commit 31a95fe0851afbbc697b6be96c8a81a01d65aa5f ]

The QCM6490 is a variant of SC7280, with the usual set of protection
domains, and hence the need for a PD-mapper. In particular USB Type-C
port management and battery management is pmic_glink based.

Add an entry to the kernel, to avoid the need for userspace to provide
this service.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241004-qcm6490-pd-mapper-v1-1-d6f4bc3bffa3@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index c940f4da28ed5..6e30f08761aa4 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -540,6 +540,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
+	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
-- 
2.43.0


