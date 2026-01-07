Return-Path: <linux-arm-msm+bounces-87853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851DCFD6C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC9B305BC32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3AF3128CB;
	Wed,  7 Jan 2026 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WmYNaI9Z";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sa7EjSVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4E309DDB;
	Wed,  7 Jan 2026 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785659; cv=none; b=tODXVPrQEQLTRH84UANPGRpQqQ+XuRLLZJwO/G7b/+mlw3iibiM/EmNEiP2297vIM0k3zcIkJAibVzAAo3NV0uc86WJvrkvKaw1TRZEzN/q0nio+pVin7HZudkCvcEKav7jw2aquXNDIsV2WOtQOQBQaRobd590AYVOUHbVnFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785659; c=relaxed/simple;
	bh=AywzLFanW8aarZA6K/Sv1ofyVvLk7zDrQ0dQ1Wor6II=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vf6/SwUvesVKyE1lPinwX+60WNACyYMbqeZcBEjl0n7Cbj+mFWWxAHbtpv1nDlU6gcycGMKwTlNd+VB6L7mOtQenwF2dJKp9mGvc7oiF6BJ+RCUQjhEQB5nMlM4tX2Of9+zWll+UqhFu1t5U9c/uy8Dke2xDv/d8Tu4r+elKwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WmYNaI9Z; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sa7EjSVB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767785645; bh=wbkYg6htC6b/LAktteWWJ2E
	4Kz4YOEUvinhLAWt4KhE=; b=WmYNaI9ZINMPF8u6NI6bGSBrrKWbzW6VjtkxYKS6BVMydw332r
	Bl9oJ7/hzYBppT/5iARc4xitbHkdGQ/Zlf66MNlcTU0LGHHSeoVPbWKM2xP+1zUF2JfxiW2/+RP
	2GxDqREYBUiWTSGXKwysaaWmvlV+OkXeaalnu/1t2yqj+9u8dubAZxTuFWlXxggWPGmWgE1flE7
	MRVBAnOWf3UY9rLWqo9EyT6f9u1UnH9srkrxJ11po9Mywekbr3nH+rXmGHoMCaEtfNG0aV5JO1z
	4AlWKUvIU/lpt16u07qWr6V4whHCAd4qPtR/BqSrdBxeALU7uzMhxlGLVRqX1fnk4iA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767785645; bh=wbkYg6htC6b/LAktteWWJ2E
	4Kz4YOEUvinhLAWt4KhE=; b=sa7EjSVBmpHqj+NMCAd4EhWwxgKqbtgPdWDGl1wCW/O2QzG2Vs
	56xP5bGVZ9CrkFrfvr26FepfdDAGCk4ZhRAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v4 0/9] MDM9607/MSM8917/MSM8937/MSM8940 MSS
Date: Wed, 07 Jan 2026 12:34:00 +0100
Message-Id: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKhEXmkC/23MTQ6CMBCG4auQrq3pD4XiynsYFy1MYRIppjWNh
 nB3C240svwm87wziRAQIjkVMwmQMOLk8ygPBWkH43ug2OVNBBOKC6HpGCPlzlTc1qwRVpH8eQ/
 g8LlVLte8B4yPKby2aOLr9dcnThk1YGVluauNdOfRoL+hR98fp9CTNZLEF5T8A8UGFRjXaanac
 hfKHSgzdJqBdqaDBto/uCzLG3OfUNQNAQAA
X-Change-ID: 20251228-mss-1fa61b7092b5
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=1779;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=AywzLFanW8aarZA6K/Sv1ofyVvLk7zDrQ0dQ1Wor6II=;
 b=jvTFXBHB2tvQsRXL5J6SYEvWX0mOXCIC4qYelqe+4KrxvhfHpNQ1lneGSmRpc7ucjkTVQblzl
 loH1UEtEFQsCDgrFEvRnTpEJiK9AHbD/pk24sv0W+y1wI3hCitqlL6u
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add support for MDM9607/MSM8917/MSM8937/MSM8940 mss.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v4:
- qcom_q6v5_mss:
  - Rework inrush current mitigation
  - Adjust value read back, use = instead of |=
- Link to v3: https://lore.kernel.org/r/20251231-mss-v3-0-f80e8fade9ec@mainlining.org

Changes in v3:
- qcom_q6v5_mss: Rework inrush current mitigation
- Link to v2: https://lore.kernel.org/r/20251231-mss-v2-0-ae5eafd835c4@mainlining.org

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
 drivers/remoteproc/qcom_q6v5_mss.c                 | 237 ++++++++++++++++++++-
 2 files changed, 241 insertions(+), 9 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251228-mss-1fa61b7092b5

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


