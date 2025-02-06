Return-Path: <linux-arm-msm+bounces-47052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1DA2B2EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 21:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D93C7A4043
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665381D61A1;
	Thu,  6 Feb 2025 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="kFyUiykl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D1A1D5ACF;
	Thu,  6 Feb 2025 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872365; cv=none; b=YM3rRYt/4JAEeKq2/v6NeBzdhvlmoEjZAyQLaflLIh46TpPYCdJPUK83m7SF39l3KmHvtopX4h8NOuxsRMzQMyM34KJ9n4eOMx8PTnVhSz+TLIAUGtJLXWx52P/KwYK5E5i4ULBxH8XJl27rvRgvIN/SYxo0A1EMV/7Ymz+0P6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872365; c=relaxed/simple;
	bh=vSTIuybZy5DJn49mPWMLVQD4HMxFkEzZ34vFkrDQIXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QMS80Y+6oC6pmD3Kp+qrD3k6wcHQneExhT3qHP5FCPf9iCZ+ugQMGeJIMLVZe7d2ZSs1CT0iDbx+AJbUC/UXc9MYJTOSQ1FAL1PkKRUIa5CGVr8hk/ckLezDlXJbYmlEHtuzEgRjpBJY/0ADLDc7e4u4RBRhNh1lXpbATJVbUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=kFyUiykl; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738871841; bh=vSTIuybZy5DJn49mPWMLVQD4HMxFkEzZ34vFkrDQIXI=;
	h=From:Subject:Date:To:Cc;
	b=kFyUiykl/7z3qQfnICIR0kDom0+Q9kTaQi42YaE2toan6uWvysE1ydkel30a19bOL
	 I/TQbO6ZDcUkKhlewtqJ/57nAIw0sJ8oASVgdtPDCbiSseXsG2F9/Ln5/icpK06Hmn
	 RF/OB5rakVo3qjXChmjhG3SDkz9pqvxbceCuirYk=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/2] Support single-PD in wcnss driver
Date: Thu, 06 Feb 2025 20:56:46 +0100
Message-Id: <20250206-wcnss-singlepd-v2-0-9a53ee953dee@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP4TpWcC/3XMyw6CMBCF4Vchs7ambSyKK9/DsOhlgElIIR0BD
 em7W9m7/E9yvh0YEyHDvdoh4UpMUyyhTxX4wcYeBYXSoKU2UulGbD4yC6bYjzgH0TVY38xFmys
 GKKc5YUfvA3y2pQfi15Q+h7+q3/qXWpWQwklla2elUy48xsXbDYn5jAu0OecvY2Kr9K8AAAA=
X-Change-ID: 20250129-wcnss-singlepd-f9e6854257ed
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=vSTIuybZy5DJn49mPWMLVQD4HMxFkEzZ34vFkrDQIXI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnpRQC3xLAYr6wHYazamtoiaGwWG7Flfqhtv/DI
 V4SI2C8NSSJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ6UUAgAKCRBy2EO4nU3X
 Vk9eEACT936C0NBzS0pMXn60Jg14OnSDFFJOCb0lG2zwS/j7JDzbTkxoo0aZtNqxypFjy3X36yo
 scC57Qyq23tmT9+9XZWyVeBSe9nOvFLeSicq5FZHK7qTHG5D+nPvpTwD4OGt658TfOE+2tBsMji
 Rk0f1Z36yyW67FCN1SzeaG0t1gTRVMcEaz/E0bwpaFeWAl39ShjtYvJrKl9UodGwQsLkRDq5B5g
 ADZQ5As5JJwmC5epkuOuWtpMBFiBZUXPjYaczzxoCd5JZ7JfsNYYBjd07jRiQ4Mf3POFi+Ila5Q
 KjUtxr5JcOwQaQgGatKzboe6HFYBq/X2DRKUaKiwGrYk8AH/0PA50s9+6PyUyCtGZYWEooeU+ET
 tp27kTFBXhgZxebpwZM0kW/F7qr5ITk3vMrhRhwm4Y7gBBcn2vBlFPvj5MKFKA3U5Kl2jOE21x9
 NMx/umvKjoy1j5S+ck0h0RYOy6N7EUi/omWpq9vXeLYSxGZgw2nevMkSAgiBeSpEmBsd7sL2V42
 EcFrUS4haYA0oocu6cEQil8ZZFR+opZ+TNkDfxE2NGd8WYYnEdNQkYB3vstGcoMzD312EPhJDpV
 JGkChCb7bFKyIdf5ZDzOMP+qTW3q2KUiavsLVk3EKyj3z4oLmxvH1RYeuCpGq82pv0sTjziwFh7
 1rvJRkytTZ7iVeg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Both MSM8974 and MSM8226 only model CX as power domain, leaving MX & PX
as regulators. Add some patches to support this use case.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Narrow down dt-schema to only allow one of these three options:
    - cx regulator + mx regulator (still deprecated)
    - cx pd + mx regulator
    - cx pd + mx pd
- Link to v1: https://lore.kernel.org/r/20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu

---
Matti Lehtimäki (2):
      dt-bindings: remoteproc: qcom,wcnss-pil: Add support for single power-domain platforms
      remoteproc: qcom_wcnss: Handle platforms with only single power domain

 .../bindings/remoteproc/qcom,wcnss-pil.yaml        | 45 +++++++++++++++++-----
 drivers/remoteproc/qcom_wcnss.c                    | 32 +++++++++++----
 2 files changed, 61 insertions(+), 16 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250129-wcnss-singlepd-f9e6854257ed

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


