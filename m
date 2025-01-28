Return-Path: <linux-arm-msm+bounces-46418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6771A213C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 22:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930B97A36AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 21:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FC11C3BF7;
	Tue, 28 Jan 2025 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="h70f7HiU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C613AA2D;
	Tue, 28 Jan 2025 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101261; cv=none; b=WRcra/IogjSDvnPf09NqUMNWCN4jrIePYuZ02EtGRUezcAOtPw1Hoyv9AOO8F2qElsFuVR09k2Bq3b50DCHaUj7joT+KoBywhsBTUA3roM5EgVfKF7sE9DoJC4l6zEFm3rVqm26WG8peSrHRViIbT7oC9Ijv3YZhLQOJoXcquB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101261; c=relaxed/simple;
	bh=4bJvsjwytAK2GBLweuI0nmIFLTPE8KYQ9nXcFZudi1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YlnR/9mAk30kolImLEwMMRaSUebzNgJzq4VmLkYduotftWRnZOzm9cyQncPbn4HQivX5GUX6RBR9GYAgkhKV73CuUr4vvi6IGqo+2GJ0wufaNx36oKWvsInRNYe30uopMlI/ZXEQJvpVsTk4VsMCJLXmym98PZRv9eEnWcDoSIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=h70f7HiU; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738101257; bh=4bJvsjwytAK2GBLweuI0nmIFLTPE8KYQ9nXcFZudi1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h70f7HiUIpSLNu1yGTlBAhVLMPQxAa47OkeKLfQlsYI1eQxJGJyB6DAPIZ/ZgvZsz
	 9+Yuv5Lk8EKGl0QzzDgoJURrpw4demSA5+jDofOhJ4s9vnZIgPpuAsIcScqEIJuakR
	 FbwapeNY3fStmhSLWcopb7j2PyPVfAb5Q3AGfegA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Jan 2025 22:53:59 +0100
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Use resource with CX PD for
 MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-pas-singlepd-v1-1-85d9ae4b0093@lucaweiss.eu>
References: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
In-Reply-To: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=4bJvsjwytAK2GBLweuI0nmIFLTPE8KYQ9nXcFZudi1E=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmVIGK4fBIDVrbkhDyY6fGO7PPGt4vGAIBIGNc
 wa56G1fTRCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lSBgAKCRBy2EO4nU3X
 VpdsEADGyhGIWMch5RSdnpf5+8t/Rb25lRz6LMHo/UYg/S/8pi3pZNk6dJ6v5xfFrIIrynVQdQh
 iP8ZsiTsk1m/V9zD5Rbv3x6Y50TjqgkCGPMyNdcBHu9uSlEHtmmicbblartXe8YftJBm0rcqcvV
 S6PdxrJ8AvpQOf0qhIV7tVcIUDnDgAexDQwae85ELlc06JH1cclvazHZWX+FYqmITUxmzKLdcQr
 NjPqKEspk4PGmQwkq8VtlYF0EpaP/57EZLqo+wjUzxxk04eWOSRFbKzC5rJFe1L5Sq+0vgilns7
 0U5x+G3fpUkw12gbXeDn2tcqWFAyxymWb0FdENBaCPfnapZ0CQ1zf2t9MyT52Pw6ZgTiLGGyOEk
 5jtDTnJH+7rLT+1umlJ32OAjDPU+RNcf90+CCZdbuwrvYGttjg6U0Foph+xsq4Fl5TRHIDqitvD
 +cTSwQHhngr9JkgndRHN/CecWP3O+bi8FsIsDI00RiEpzt9q5rvvLK8vm/9vWpE5ZVip1nQ5nJf
 +K6mkSbt+C+hna/Gx5yQMzt0gNJkhRnsNkNlfxf7FO87yKphQ1Bc9rUngzzbrLSuG41AhbqLQ5X
 e9Z68H2cLgF+zqxJYy5nWnlirIgiezV8nIH3Ms2wEU5jGVX0Q4LLyqdtIMwt1OKQp1q+wDHW42M
 T/Yzex5T/glXiIQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

MSM8226 requires the CX power domain, so use the msm8996_adsp_resource
which has cx under proxy_pd_names and is otherwise equivalent.

Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Fixes: fb4f07cc9399 ("remoteproc: qcom: pas: Add MSM8226 ADSP support")
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 88e7b84f223c0222a01e2a246a848f2889ac00b3..aca44bb6522f00cb525c4b816040445287444434 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1319,7 +1319,7 @@ static const struct adsp_data sm8650_mpss_resource = {
 };
 
 static const struct of_device_id adsp_of_match[] = {
-	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},

-- 
2.48.1


