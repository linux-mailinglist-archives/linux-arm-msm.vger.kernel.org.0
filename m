Return-Path: <linux-arm-msm+bounces-61012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104DAAD5C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 18:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEAC83A84AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3553202988;
	Wed, 11 Jun 2025 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZhNMOlCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF5817597;
	Wed, 11 Jun 2025 16:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659642; cv=none; b=cTnOAqZXQjaPa2rLIhJNahEzbGkN3iU/w8Q1kyLAnJAfCmoHzQA7xRZ+HyP5zOBQgcJYTJ4fMcGxflkNluCnvPF+0hGktJ0/0hx5rMIyf6Fp2Bq7DwQEDp9dl4RYHVrI6pFDKVBVl5O33Ctn2UHhuLpCF3y4KdZQbRm0XZHg/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659642; c=relaxed/simple;
	bh=MTf/rXDUfXQ+M0fFpjuXZS6A1tPRdx76oitjXzouatU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A77W1VsFPEY1N3ar4bsuz+ICjCJf+tBZqpvLHC50mdNEiJaT2w2hEth9Cazj5p/iYMOekjw/E94J5/iwyHOVWx+pwfemoVe0pWy31+9KoicIK5wDTjWXH71AmtS3GVyrRc+cHKxRHyExHEKfQKB1PyITEZ+LTgYlnEx7Ts0Y4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ZhNMOlCS; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749659638; bh=MTf/rXDUfXQ+M0fFpjuXZS6A1tPRdx76oitjXzouatU=;
	h=From:Subject:Date:To:Cc;
	b=ZhNMOlCS/TNaV5B6wJtvWtG6fguZt8tPfHYXXLoBB/L412OULYuHQystdTLX3C79a
	 ycJD7N36yQnUi2JFsYFd5hKrybwCBDXpphNTNDUlJaTOu8BBMnKtSmV7beOzhhqVDm
	 DTnlolGoh2o1GLZuPTxR8XegFoesG/Q2+Ld2Fx3w=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v4 0/4] Add display support for Fairphone 3 smartphone
Date: Wed, 11 Jun 2025 18:33:14 +0200
Message-Id: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqvSWgC/23OQQ6CMBCF4auQrq3pTG0RV97DuChlkCYESCsoI
 dzdwkYxLN8k35+ZWCDvKLBLMjFPgwuubeI4HRJmK9M8iLsiboYClUBEXnaSFy50tRl5nmY2lzI
 jrXIWReepdO+1drvHXbnwbP24xgdYrvudAbjg1hZnQAKdKbzWvTUvciEcqWdLasBfrrYcIxc5l
 EJloEpDO1x+uQax5TJySilVGtYP/vg8zx+7qSVcJwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=MTf/rXDUfXQ+M0fFpjuXZS6A1tPRdx76oitjXzouatU=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/OnS9o2peAoDaQ0ANIrY318cgpqfn0RiiNi
 JE34aiFcb+JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmvzgAKCRBy2EO4nU3X
 VtD3D/9+GYx+hEjt37D/F8AUy7ISdiUfhSeAOK79GT4mAqKSnuHnpsQpk7OozqNhxMTbo2qemAl
 MTu5AwyW9dWhSJ7aFhCvKn2Nw54rezkiAF3GXetOlq/qKTmUC4lzMd3DCSYKX2WcPIlqpujgdWc
 8Xc+p1eUkl4w3DmZUulCaAYdnC/mfbTlyLPfN4k8Uzj1fiipVoEf+OBmBgE5DhFOMgWnyJBzqUf
 RQbdQWTZxkxjygaSYld0CAKWw+OhkW1gBX/I7tHranxi7cJU8dVLJ40eaN4rbm9J1RB6GJ8d7FO
 QsrWBM7pCABzaGXXaM3jsPCTQnYcJpyLqDv28D/EuSjwm/TPGFS+kzjB+ENJzrcNBZ/ywTmPrVC
 TBUtXYs5/9lTv9HJguxoL2jk75utW4+end+9BC/UYCQwNbeNJzW9LKAH8HzQw5nDDnuWp3SSoum
 S+e090293NItavuB74d4KH7Y8qlHzGptQULpfO6PqiWJsgjnxkXWWVvUiK52XwxeynFesNpgVM4
 jJ7KM+K62J/XbWZo6Ri0ILL1f8FNaEvQTqppGqIonal+6E8qEVWq1gtZ2YxW2hJzQOTwpudR0wP
 SaspRmRoCWVUEF8YlEKles+soqr6fx04/gkcwn+l6amZwla/dT/hCzTvKoJ/iNVLalAsI9YrDhA
 1U+jHXAoFtfeD/g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
to enable display output, and enable GPU as well.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v4:
- Drop "port: true" from bindings (Krzysztof)
- Use devm_drm_panel_alloc (Dmitry)
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu

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

 .../bindings/display/panel/himax,hx83112b.yaml     |  73 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  62 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       | 430 +++++++++++++++++++++
 7 files changed, 579 insertions(+), 1 deletion(-)
---
base-commit: c8a9a1ae369c60953b27c01162eb72b0422b9532
change-id: 20250222-fp3-display-b79cb339e65b

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


