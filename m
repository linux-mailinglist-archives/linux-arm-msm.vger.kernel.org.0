Return-Path: <linux-arm-msm+bounces-46417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7FCA213BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 22:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A0A53A52F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 21:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E175019994F;
	Tue, 28 Jan 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Sf75N78A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC9194A7C;
	Tue, 28 Jan 2025 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101260; cv=none; b=MVEeb5BK0xlDfhKN5MlyWy5FV9THKDiv+Z1xQ3BbfqOgAJteK/57lX2K7ZMoLcoij615H2m+ANBWhACZLGU68/wmYrucJxyYxObSFAgpC5dZ6wJQ6YilnkMkx9JY1MVt+q1o6FCY4xx7Asb2YZA92HWiMe0hW9JHCnluabUjCDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101260; c=relaxed/simple;
	bh=bZ42tvTP9Bx+u9Ux/s1Yd/gsjV33gCyGJ+X4RE0wcy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YghnEAb6l+bCTzxp66XqXSGPLd1HH5FyHpwtpDgCO+A4z2ccYGolnBKqwzjzomi4FQChs+2p7PLPc3HKDnOm08zYRQmciZtKAT2gNCSEYRUbMqDkdkTC3ImcB3SzwQqD2313n3A2CDbeidIJtPLCiCeo3jLz9kbE7VqChxHvvOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Sf75N78A; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738101257; bh=bZ42tvTP9Bx+u9Ux/s1Yd/gsjV33gCyGJ+X4RE0wcy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Sf75N78AJUABJDZ1S/bNGUoPNXYz6jOhGtg/kAXgfwuLJIdxcqYh1/UEZA8ChfPp6
	 VmCgjBxIgdC9HZo/6w8iuUkADWcUJj+JS50B4RJJ23Rcx0l/H/LWhigXJqKQAMgu3x
	 boSn8p03d+dCE4zUiyh06Da2okI/lV1EBV1QAr5s=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Jan 2025 22:54:00 +0100
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Make single-PD handling
 more robust
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-pas-singlepd-v1-2-85d9ae4b0093@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=bZ42tvTP9Bx+u9Ux/s1Yd/gsjV33gCyGJ+X4RE0wcy0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmVIHeiKS5ucRV4kUElMGaawyg1Is0kTdHKbDj
 A3Gr/NoURCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lSBwAKCRBy2EO4nU3X
 VtxPEACr1hzrfHV8kanNNP/4LXUpLc+DiWQpZP/gPuTjMCjgE5hqNpVbDHgOAPPIGEpExS+d9se
 nfaJo8u/S0BZ/Ko5Vfx1O2wshh2otcQo4RP3I09tPV01k5Z8FxwQXKvKO5nOpJSnDQkqld0RYsQ
 xa6x4g5c28+/n58Gck+E0wL/vezwbrskoMaeaWp6Cl+Ax+daEFZExJ0qsZnv9WVRJiN03lYGhtI
 JJsZLKV0WmOmIrCgz2x3tKV8RUDaSSAuwk8HR5z78H0E3iwp0IxyLMXJRqBuLLIK7ElEpXtdf3J
 HVwcyYiqyc4X9L5RUJbgot1ugS6h9ocW5J8MTY0yVuj/OunDDrboUIHuvsPTVgBHhyw4k8eB1Zw
 a2tunRuWwC2DSAT11JtOPrQjzabP/6cp439MWJUaJoU5tzhlpAVYfYFeFpnOAFlMFVUftiGiCNI
 rxg3jqfWhsRBWCtm05IH53rJXn72c6x/eYYMKwdkeHYNl01zIe3ZVkM21+9OKEQ4S1kfdJD7ZrA
 39wh0mx8T7jvnoRXNZd6xPvZqH9wjnbo+FstzCS0VEDN5m0uw5YBUJvztp+KIq1OjOHYVMmAkZc
 QhLXZjhvxJxwHUtIzQShENhglpzkoHzrk1O4UmAkh5fFNxiKgrHRn/0fLIzbnj04NoxUcq5m2yk
 jZOWXTVYbjlQw6A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Only go into the if condition for single-PD handling when there's
actually just one power domain specified there. Otherwise it'll be an
issue in the dts and we should fail in the regular code path.

This also mirrors the latest changes in the qcom_q6v5_mss driver.

Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Fixes: 17ee2fb4e856 ("remoteproc: qcom: pas: Vote for active/proxy power domains")
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index aca44bb6522f00cb525c4b816040445287444434..c1e9bbae61770ccad3e22d132a411bc6ced7180f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -509,16 +509,16 @@ static int adsp_pds_attach(struct device *dev, struct device **devs,
 	if (!pd_names)
 		return 0;
 
+	while (pd_names[num_pds])
+		num_pds++;
+
 	/* Handle single power domain */
-	if (dev->pm_domain) {
+	if (num_pds == 1 && dev->pm_domain) {
 		devs[0] = dev;
 		pm_runtime_enable(dev);
 		return 1;
 	}
 
-	while (pd_names[num_pds])
-		num_pds++;
-
 	for (i = 0; i < num_pds; i++) {
 		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
 		if (IS_ERR_OR_NULL(devs[i])) {
@@ -543,7 +543,7 @@ static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
 	int i;
 
 	/* Handle single power domain */
-	if (dev->pm_domain && pd_count) {
+	if (pd_count == 1 && dev->pm_domain) {
 		pm_runtime_disable(dev);
 		return;
 	}

-- 
2.48.1


