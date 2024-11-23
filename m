Return-Path: <linux-arm-msm+bounces-38916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5C9D691E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 13:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33C88B21983
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BAB198E81;
	Sat, 23 Nov 2024 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqI4h5g7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA21836D9;
	Sat, 23 Nov 2024 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732366739; cv=none; b=gr58F/FkS401PRBn8Uv5PnkR0+Ko577oBdw86DaHcqVP8pLK5ZZ7ziF9/xeodXmWvCwEzNwVZHhamjC9rjQ0tQS9nq1xM68al5vyMvXVgt2/b+Ho0GHtR8b7qNwX3KRZ0pTxs6V78SDD4jXb1/issDsD4OwiLEeFiS/8AT7YTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732366739; c=relaxed/simple;
	bh=gRTpoiz71rEZ3HEhPa5QBWzaIeCM3QF+8GY8L2ThZMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kUo265dDGY1NlxKMRHjMzOnMbxLReYWyExMKNH9pkF3huoSoGP9WTblxFUSAB+pa5lDqbZHbCdUXer1dd17frozd1t5EObMnbTYL87aZ9wB6pk0hE6wmxLIyFmeh5lKbCQfsiLMxUkPxQeavikWLX7vwcozXXOE5wvMh0rZu/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqI4h5g7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB411C4CECD;
	Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732366739;
	bh=gRTpoiz71rEZ3HEhPa5QBWzaIeCM3QF+8GY8L2ThZMU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TqI4h5g7r7iu7STjYURGiYnIM5o3GxJC5v7RDOM7KQbTZR9nD5gc+jVy4pBpsF2yp
	 nuDvzFpMx5/vs2Rq345JTG43P93axb0Ewt7xtF5fRKaGDH6Bkgx8jWXj1VNioI2U98
	 TMQWr1IKAycA4+z51Yd5rQ9XM8bU94WakvmsKVS5JpBn9YCrpgFHHz7PzRWKANziIr
	 +NzxW2CZMQYxouZpA0Lc/qLkXAWPyj7dOvsVU/KE8KK6O7ZYfVzAfS9h0Byhyq/PAD
	 2+Jpiuedo7q4fXrd1kLn8hNWsIHOU0fULxMxCTt0EzZKzXjygh0kpxDxXv/iagDHRX
	 egW403TGFihVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44A8E6ADF9;
	Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v2 0/4] Asus vivobook s15 improvements
Date: Sat, 23 Nov 2024 13:58:52 +0100
Message-Id: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzRQWcC/22NwQ6CMBBEf4Xs2Zq2gIon/8MQsimt3QQodpFIC
 P9uJR49vsnMmxXYRrIM12yFaGdiCkMCfcjAeBweVlCbGLTUhVLqJJBf3DxN6JuWeOxwEcaWzp1
 1leeFhLQbo3X03p33OrEnnkJc9otZfdOfTed/bLMSUlxKrJyrdCERbz5MPVJ3TC2ot237AB1Kf
 q20AAAA
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732366736; l=1132;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=gRTpoiz71rEZ3HEhPa5QBWzaIeCM3QF+8GY8L2ThZMU=;
 b=MODatZrh/bk+k0WvKk5jsrWTZsQpXoa/lqa9kKOJxymK6Qyl0TGqe7vy0/wuKcbNZJs7+mAWj
 LqMReLG/gtYBYkRFPII2dBPjLg6Se6DsoDUJ7gRNEix7oZGpSZmEqn/
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Adds a lid switch
3. Adds bluetooth (depends on [1])

[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

---
Changes in v2:
- Add missing gpiokeys include in the lid switch patch
- Add depends on for the bluetooth patch
- Link to v1: https://lore.kernel.org/r/20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com

---
Maud Spierings (4):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../bindings/display/panel/samsung,atna33xc20.yaml |  2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 61 +++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)
---
base-commit: 80e87ab38380e4ddf238ba3d8436357c3e0b52d1
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



