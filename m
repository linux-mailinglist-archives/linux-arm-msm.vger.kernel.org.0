Return-Path: <linux-arm-msm+bounces-67280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6AB1779C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 23:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8142B7AD99A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 21:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0448E26560C;
	Thu, 31 Jul 2025 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUXZMFZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA260258CD9;
	Thu, 31 Jul 2025 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995765; cv=none; b=I0Sz8Q+WXIpuPXRW93cOZ2DECOMCu0K8k4PEfsBRTSjdh1CpG3jl4OUYmIqn4Z17nqLKWSbK4xRwWOsTnTR1TxK3FyMZ0BjAWVpCYzVUvU1A9+p7IxI3NRKsAQ3IQg+oiB6v5lSqxE2pfhINvOLyoeH8rDzOmI66+VvPZLnRZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995765; c=relaxed/simple;
	bh=fbQDmYKLPvl6sslhUGqA6kC7+83TEDi0PeX9KJSShBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l5vHdvhQwWi8+O+vmgc5sRFFGGvJ3Big0E6gerYo9/+khXFv2YQGFV40hV81tjHttWwIP8tA+TJSpGw3F3jPpP25xjRZNetgcVniO+KIfBlTdPWTb0dxIvv0KCK60FvYTZvBcRwGjX3NiNEyMj1XjuVYdZLA9cgUn/qreghGFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUXZMFZx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48FAFC4CEEF;
	Thu, 31 Jul 2025 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753995765;
	bh=fbQDmYKLPvl6sslhUGqA6kC7+83TEDi0PeX9KJSShBo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hUXZMFZxmUYQ0jXdtzTcGD7qXvaAiDSsj9jU17FfR47d4RTOlFjInEn0884D3JLLe
	 8AiXZbjVJ4GC8YjTSU48GudCD8gaZCivJuQwpdZpSCMec0cl92G+b1LDw7EacGJahU
	 KY1ou7g/k7xlUgUwAkG9inDxqYGCaR6wnPowDfgbzekAPcD71k5bC1+H9mNCkBoMyv
	 Cn8YHAVTWyj4j3V4oYfKUfH+Nb/Xk6NsqK5Z5Pt7SMjKDg0W/G/qBN8Q5HCWSpTesX
	 8JEBRICmp0XSuIuGzxs++mFjJY5nrOlIuWu6SPi9r2Z0UttHuIAGMSLx8BGWqrm0ob
	 hen6gR0iLAlrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A5AC83F17;
	Thu, 31 Jul 2025 21:02:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] sdm845: Use definitions and deduplicate
Date: Thu, 31 Jul 2025 23:02:42 +0200
Message-Id: <20250731-sdm845-msmid-v1-0-98489ece786e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLZi2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2ND3eKUXAsTU93c4tzMFF2TJAMLC3NDcyOLlGQloJaCotS0zAqwcdG
 xtbUACLOyUl4AAAA=
X-Change-ID: 20250731-sdm845-msmid-4b08871728dc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fbQDmYKLPvl6sslhUGqA6kC7+83TEDi0PeX9KJSShBo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9nzXl11gx7oYPrvGzQcQ8kKVM8PnZr6gJMqA
 VEl1iLFoHqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIvZ8wAKCRBgAj/E00kg
 cibED/9Ib1BhZ+rTZS8HWHGqGuYx1V/SGkJpv71VUqIg5vFMEtSZ9D0YxucCiDP6lm39V4JT7QL
 LfqA0lcuMM2RnPKPue3w1waTDYY/oiAPLOxyJ5+djGKr5ncD8LUEaEmm2yJ/1iWNvD7Ut1eQaSA
 X7s5ub+Qe9lQEjkXSNgcurS7skPNiNzvPUBOJwiwwm4dXrpQ5cOJO8stI11X7JvGbtRu3wmS6Em
 V6gkDj1XO54Tfz4Mwjb2nJzMnfnrj+LZt/2SD9BwG2c4tmiNOBoKuKOnLJJmVKfeOyU6jVPCsfY
 DTJxDl7rJegKRXuwrc39Uu9dnF0Rxs1tkZCVrWzw4prVRH6D4n+w3TlXkheBDkVoxzyuhg5azjt
 vAOPjs0Mk/7xqW7Sv+58gdy8Z5hpD1ncH0R0MMdmACRvNNmXV7w/7c1sjLzFM1pz1K9b+BV0K0O
 bFpsiRRfWuRdXRI70sYvIDjzaKH76mmvr9Bj3MIT29GcwM8AgS46PlA8a2eKw4hBtlMOHrp7kle
 TeRguR+g8zxM05OUWcA/ypYI/fodCUkkiaRmDFmuHz/J/6HOn2gCmpekxFNdYZxpGpeCubMAh1x
 +pMcXKxWi04pfzQo7e/J6wBplGCEjfF1XKRbbsycZe8jfM4+M8l4P17jSuA+T3fjXm2jxCzNG16
 wdT/L9/bXtoR59A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Small cleanup.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      arm64: dts: qcom: sdm845*: Use definition for msm-id
      arm64: dts: qcom: sdm845-oneplus: Deduplicate shared entries

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 3 +++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts        | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts           | 2 --
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 2 +-
 8 files changed, 8 insertions(+), 9 deletions(-)
---
base-commit: 84b92a499e7eca54ba1df6f6c6e01766025943f1
change-id: 20250731-sdm845-msmid-4b08871728dc

Best regards,
-- 
David Heidelberg <david@ixit.cz>



