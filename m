Return-Path: <linux-arm-msm+bounces-87033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB59CEB0F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AB1E301F7CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5A92E8B8D;
	Wed, 31 Dec 2025 02:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="llgjh9Yh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dZc4qwW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CBC2E62A4;
	Wed, 31 Dec 2025 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148180; cv=none; b=qvoJvHdZrNI9PojZ1WLgsGc2KayZ8SSxEpJ37Z11ivbYhBzOn9/hsFAcY2jIHq2S9Zt5BStQnLvWDEDi9vefJVTr7riqjNPMFrNGXntXhPunmHae1OlwoNpQE4xf1TrAPIpWeD3ZZAw3pDetTcnIN9YGu4wqrpNkFMNrYCTHrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148180; c=relaxed/simple;
	bh=QKUOQJYy1OAZREu8NLmLFyIYEva//zI3YXSE64exfM4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T/8K6VQpSR8GXUO6P6E4tNxRDfUSt21O7LED4rrX6pblArOn26D6BxvtUgYxP24I4Ab8zaW+BA9fX1++bpF4cBFLFgWhyBlEbztYqRkhTJoGmEKXOqdNG9G7L9RPJ2SdiUDZQVJRSRGB86PwqgnFwvV5iWkeEhcfLe1kclyvYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=llgjh9Yh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dZc4qwW2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767148170; bh=yM2tikOk3cL7e+3L6VDUhPR
	7gbUp2upxGsu2yqp3bwU=; b=llgjh9Yh0+3wksVL4rx+WRENFcyVu80S0zv98WHmw57dOH6PWa
	HkS2eLl6p8Dt2Oqs8dZY2ZQ3fqy2chHVkLz/nhNYJcRj4Vx2YdbC598v5HZOgZ8tvIgIEA/ne5M
	gZY7n2VYgFar2mIkE5eJ4uJvaH4brKzwb0TLjUh2TEtpAaA52EV7h4jssCdSN3UZ2H1JhXXE6+Z
	VbiKyXpLXZkspc6DnvlL+1dA9dYBQnq4clDfB3PZ1W5JhyswFcHL7XdhMDoMSFisChAYTj6D9W4
	JBd369r43SXltBBEBfg3FcN0hChTkinq81dpgcfgz5UkBQxvG228pSjAhFrM6/eMA4A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767148170; bh=yM2tikOk3cL7e+3L6VDUhPR
	7gbUp2upxGsu2yqp3bwU=; b=dZc4qwW2KeN9uADYLYj0+kU/UaxvMMAq0D8evhcs3bEJ+4WyES
	eeBZXbQ2uOXtcdVfMnrcBwWlVtTUbme76vCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/9] MDM9607/MSM8917/MSM8937/MSM8940 MSS
Date: Wed, 31 Dec 2025 03:29:27 +0100
Message-Id: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIeKVGkC/1WMQQ6CMBBFr0JmbU2nBFBX3sOwaHVaJpFCOqbRk
 N7dys7l+/nvbSCUmAQuzQaJMgsvsYI5NHCfbAyk+FEZjDYdGnNSs4hCb3t0gz4b10F9rok8v/f
 Kbaw8sbyW9NmjGX/rv59RaWXJtb1DP9jWX2fL8cmRYzguKcBYSvkCmJh1Y5sAAAA=
X-Change-ID: 20251228-mss-1fa61b7092b5
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=1413;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=QKUOQJYy1OAZREu8NLmLFyIYEva//zI3YXSE64exfM4=;
 b=NXekz9asLkIOs52oYekxPc7A8E07IiH6RdLq6R7iwoCP6kgVTow/5JT+wYMaHsbqU/YJ2fbKV
 8ybvkmvxXogCQv/+sBDL9S1q0NKU6cPHVPf1BivP9WSduyFZSQRLQgF
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add support for MDM9607/MSM8917/MSM8937/MSM8940 mss.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- qcom_q6v5_mss:
  - Intorduce need_pas_mem_setup flag
  - Use mss-supply as a regulator for MSM8917, MSM8937 and MSM8940.
- qcom,msm8916-mss-pil:
  - Add compatibles where they needed
  - Adjust mss-supply description
- Link to v1: https://lore.kernel.org/r/20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org

---
Barnabás Czémán (8):
      remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MDM9607
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8917
      remoteproc: qcom_q6v5_mss: Add MSM8917
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8937
      remoteproc: qcom_q6v5_mss: Add MSM8937
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8940
      remoteproc: qcom_q6v5_mss: Add MSM8940

Stephan Gerhold (1):
      remoteproc: qcom_q6v5_mss: Add MDM9607

 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  13 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 | 235 ++++++++++++++++++++-
 2 files changed, 239 insertions(+), 9 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251228-mss-1fa61b7092b5

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


