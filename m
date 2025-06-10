Return-Path: <linux-arm-msm+bounces-60872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3629AD428B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 21:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECC43A52E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223DD261398;
	Tue, 10 Jun 2025 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="rf0vE9fN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB192609DC;
	Tue, 10 Jun 2025 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582624; cv=none; b=ffjLV+BpltdiNZ7Yjyb1/wkN4Zk+svT7T+sLeu7T98g1dPXaVfQhqc4wdIrdxwr7G6TpPTz0Zl8N6rF+mBg9awWKvjsYvGMeZZv9OroC37nSaKAN7cy2mDB9q6HmbehIeoSMN4qtcpwvNjyQ52CI1wswxUG3mw8NsJpJM3Exh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582624; c=relaxed/simple;
	bh=bt8hlLHTrwKMFKhnLmxmc1bUTURzOKO+OeNYuOUXZ0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KvVOW4AgLirLNmjQJZi1QwUrm00d6dNmfWpEdFQoqNcPR0AqAI0nOVEWVkS161vPD7Ts0xdPFMyU04YPou14OK3hcp/cyZPJ4QQzekgfB4Evrx0sYNKqO04mFcUgF6wREyQS5h4WoNdiXLBt8Hag7noRTxChGzSBwicjc3jDQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=rf0vE9fN; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749582620; bh=bt8hlLHTrwKMFKhnLmxmc1bUTURzOKO+OeNYuOUXZ0Y=;
	h=From:Subject:Date:To:Cc;
	b=rf0vE9fNFn3L/XpdmKMOZwQmrxRBIOqZ+5WYCTw7rXyvarB+PFQTgCOtEDLrj7GXu
	 R++Z6AiYBtytsLunNQxxHUTmLkbw08s1b+HpEpS8Em+9GLQLcObjLdZMXiZHWRt+YQ
	 E7GKjGbK6p1v8i8t4OzXYuibVJ3I5C9vM//bCeFk=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v3 0/4] Add display support for Fairphone 3 smartphone
Date: Tue, 10 Jun 2025 21:09:18 +0200
Message-Id: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN6CSGgC/23MQQ7CIBCF4asY1mJgCFVceQ/jAuhgJ2naBizaN
 L27tCs1Lt9Lvn9mCSNhYufdzCJmStR3Zaj9jvnGdnfkVJfNQIAWAMDDoHhNaWjtxN3ReKeUwUo
 7VsQQMdBrq11vZTeUHn2ctniW6/u/kyUX3Pv6JAFlZTRc2tHbJ1JKBxzZmsrwyfU3h8KFk0FoI
 3Ww+MOXZXkD7lfNDugAAAA=
X-Change-ID: 20250222-fp3-display-b79cb339e65b
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=bt8hlLHTrwKMFKhnLmxmc1bUTURzOKO+OeNYuOUXZ0Y=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSIMXwUIyLIFHIOZM+WFtISTOmnJTRnaZY/GkV
 FOlfgOKsF+JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEiDFwAKCRBy2EO4nU3X
 Vj1UEAC8+Bxrl53cu/BlSJjlK18DdTiJMb5dYVXRbFL1B+ykuTzV1fHgl9oiMaMixebRdVlTWOE
 9TottO8Qt7JyAdsUEidO8uvKIDTVfmhrfsiy9HB2FjedK9d6MakAtRQFIuRRA3th0KpEYbRQaDN
 b8XWa+MvHH4YQ+oiBWWieigacpLIt1BgW0h+qIf1RT5l3u45wvRvRCzZ6uQYrOXabtB7fTTduvt
 9qOIjuCg/C1K5BN+PqFYeYHbA8TIwddd62jRT3cJapoCI0dDabK6/TdorM5gJnUWPhWEcZGJkp6
 KXagq3dybLfTMlNPU9Io+4JTrM1GcD+kaqA3WB6eFB5YuSGannxLfNMxxQW+qNNbBZkF3Jjxzcs
 98FNC34mXsax4HizNt9DAjVOh128MD/+htuyySAs4/gbDRiD8fX4deQbpYSGzAOwdX31Et51q6h
 845qsnbtngoaEEipML6Px0rUQ4PTOZ6MIWFH5Fo9+FVDFUGN+8NTjL5tsPnAirverWkV7c8QsOr
 oI1VRwIug/BYz7zFVCbzdxi2YFgXKIZMpThV58fGTO9ravuPTudFlN2mtnpFkYsPQ+EeOkXAPeL
 IP0MDU+4jen/Oe6bKzZw8KHRlWMSMFzfOyDOMbVv5WotgE0wW06ThRtDw+JJtUZdSLDUu/2Z9V1
 h082reK6QwIuUAA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
to enable display output, and enable GPU as well.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v3:
- Pick up tags
- Rebase on v6.16-rc1
- Link to v2: https://lore.kernel.org/r/20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu

Changes in v2:
- Change compatible to "djn,98-03057-6598b-i" based on other docs I
  found
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu

---
Luca Weiss (4):
      dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technology
      dt-bindings: display: panel: Add Himax HX83112B
      drm/panel: Add driver for DJN HX83112B LCD panel
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable display and GPU

 .../bindings/display/panel/himax,hx83112b.yaml     |  75 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  62 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       | 430 +++++++++++++++++++++
 7 files changed, 581 insertions(+), 1 deletion(-)
---
base-commit: c8a9a1ae369c60953b27c01162eb72b0422b9532
change-id: 20250222-fp3-display-b79cb339e65b

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


