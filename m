Return-Path: <linux-arm-msm+bounces-23750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085D91395B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 11:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0836E1F21A91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CA574420;
	Sun, 23 Jun 2024 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="AGt6TMDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE79D51C;
	Sun, 23 Jun 2024 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719136353; cv=none; b=WuZwYmYiLS+JaCcynKnQ/TInXXruspNZ/FHcqGA6qd7Kj/LHm9sIa9/eCd2w91XZeT+8HkUg2MwBtv08UjeT7WOxmy3+hyQTvOKqYS+W+wVP7Ts8I2mKLk5nrZ0KzBR4LLUqQ2ClmqLIHLdKIZhNSQbJ2r8p5gF9YtvADP4Gu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719136353; c=relaxed/simple;
	bh=DCMeJ2S7gcjR7PgTdzlp7X1hl7o4f2v+hOnmgo6w5qI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gd3/b2aGIRA2XwQM529OejwY36TQm2atLsrwQExVAPzFHVC0eCuKlKUbjyCTG3sJq5cgFvjnSycbH4tisu33RNj8F1rzQHEtThT4xLs/eqaHqCNvgTi4QY9ZViP6XovNmICmtMEZBEUE7NOq1XcyhGHVj7zVGitSey62xEoOnEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=AGt6TMDf; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 4880540138;
	Sun, 23 Jun 2024 14:27:06 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1719134828; bh=DCMeJ2S7gcjR7PgTdzlp7X1hl7o4f2v+hOnmgo6w5qI=;
	h=From:Subject:Date:To:Cc:From;
	b=AGt6TMDfF/jaDkqxxIebL3DVjxhZrLiDX8ayYzj7U5pu0vAo/tT67RfqAjQr5zvcB
	 lrQjQOpXP/4aA2Qh6DCWiZDYWXOOyGcOL342zYeHihAAFS6jd20UP9d72XmBN8jblR
	 8m2i57Baxvrvito254Pp/khhIvxs6RXlzAxyE6NlrE0FVCuH1CDUj9x1mHh/7rx9Ir
	 gyhqUnmbFltta8fxI3vrUM0idrVyzjIhsDBY3p/Ikgbomp5CdZxcx3hb3kRckQrFb9
	 esAwsszjC+XySzUPr07mAiXZIBVgCHOk4T/C4xAy5w5ctl77HOgQZiFAb6eTfr/fu3
	 LwFBlih5TvABQ==
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 0/3] Introduce msm8916 based LG devices
Date: Sun, 23 Jun 2024 14:26:29 +0500
Message-Id: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXqd2YC/x3MQQqAIBBA0avErBtIE9GuEi3EJhsoC40IpLsnL
 d/i/wKZElOGoSmQ6ObMR6wQbQN+dTEQ8lwNspOq01LgnndjhcYtIEe+2G1oZuV6a8n3XkINz0Q
 LP/90nN73A6k0c6xkAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikita@trvn.ru>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Anton Bambura <jenneron@postmarketos.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=DCMeJ2S7gcjR7PgTdzlp7X1hl7o4f2v+hOnmgo6w5qI=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmd+pmhKxQAyePLX7ovF1MZ/AE/5LDr7FCkg5tO
 8uoxXfuSJuJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZnfqZgAKCRBDHOzuKBm/
 dc9yD/0f3LMmlRKCfOZhLeYCm/ffaeVG/VDot6nZ2xL16sekVwacoQpmQM8dRHMnHcRqg2z5kKF
 u229seKdNAsTL4yr760650QR57tvE9h0904VA2M+e2sxVE9+zkB6vUkMJ+ESSyMiZtjKMFjRlVy
 zNEg7JpY9S1Owz+Ug/4FChMRpbTxBOkophqDGOFm5nliDMLafcdbBjY4ASGZMje3Bqn/jjV7MIX
 n8VLI5bCI/7Nzceog1NYJk47FTU+CN7WyJ6XEfn9+ameMnVxK4uy8gLCVr8Lcp8mACSKBWG+a+d
 tynhr1XQSYjai5qQS+Dvvurc+msjTYvTZXdcZ5O9htMWzgNGFElHPGhtLcnWzDXZxKxQTrSxEPd
 BZKfy3IxBTEh+nmUjof1jMAny9Qk1Lh1Zs3gsHovOm6QwKDIu+Sg3aWCS2hpRcFl6PV5/pfYllJ
 O2DKnYBeoxh1rF4it6bNRWBufhsYqAORFebgwbbHDphfXk8hAO3dLsNM/hOpze9x3SbVsklJHQs
 glt9d/xVC8xhTN/7jeoaMkWn+y4Z1XV+JSYYgMAwDJ1+7MR+KSlwx35XFB0rP0bN8+MXcSQ7uMc
 uPaDITZ7bPks/nKJCYrq809WNNiMtOAysGWnOwK9eM71hydyFmBDTsO9a1US5LD/llQak5VTx6E
 o1WMRWQHcsJ/t7A==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

This series introduces two msm8916-based LG devices:

- LG Leon LTE (c50)
- LG LG K10 (m216)

The devices only have basic support for now.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Anton Bambura (1):
      arm64: dts: qcom: msm8916-lg-c50: add initial dts for LG Leon LTE

Cristian Cozzolino (1):
      arm64: dts: qcom: msm8916-lg-m216: Add initial device tree

Nikita Travkin (1):
      dt-bindings: arm: qcom: Add msm8916 based LG devices

 Documentation/devicetree/bindings/arm/qcom.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile               |   2 +
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts     | 140 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts    | 251 ++++++++++++++++++++++++
 4 files changed, 395 insertions(+)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240621-msm8916-lg-initial-8d4a399ec3c2

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


