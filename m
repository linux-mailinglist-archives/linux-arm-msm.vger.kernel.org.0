Return-Path: <linux-arm-msm+bounces-60851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EEAD40D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FDF91886ED3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FE52472B5;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQUugPIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752962459E1;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576341; cv=none; b=NYc+Dz78mfTrtYYFK4bIEkH27RsS7Yu3h23VD83RRADMLE2HaLf/cG6LPDdSxPY4xpEx0u1LzkzX75WQTlk9MCUHmgWVmxMcy3BGAS3oln+fRsSDVbRkSfb8LWx6FxJiARCL8wKFs5msukusSsgwvVZqMJM83Qzgn3HubTq5Dpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576341; c=relaxed/simple;
	bh=tF8XhYd/zphv9FFb9CjA8PI63MvoFCSonZ/lwafrBzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GQv53RurRdsyJyE9ct4EIjBFuURctrWYIZj/HSr0adCRxib+e9VX2NazfB12FrNZw/7+sFpMlAJMd/4MUUlnUVyTpTfNxIkr7rbXKLHPbkLnTUC7m0ipr/FuU94cPW0JfO/O6WfyiIaIocch/ei+yYtmVEYN4WlHSwYV1sMzJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQUugPIn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FA56C4CEED;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749576341;
	bh=tF8XhYd/zphv9FFb9CjA8PI63MvoFCSonZ/lwafrBzk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LQUugPInPYkAsxrXMhmMg7x39yEEH4/UzlXSM7i+pmCNHFB0FGxCK9A+NrcFr+nJT
	 fiID5uC/p5CETYV/e1lsa6yelDtBtx43l+vfSA3tKH6nVSd9dr2Oqp0iRVrGfVXi2I
	 Wigka4kKNHbw6zRMqJXrKvxl1lam10s3UrDWJP8lo98X2DtQNh3KucvSKiDoI9+W2a
	 r8+5H4JhpGidMslaY8QtRGjpIm+qo9H0wssJxXBpVSCSE+9dn9v2W4vDB68Z6l4RoE
	 r9jPOZxEv+2dT+ndflxs0YDu63ftSbniNqd0AXYKW2UXL/2pHKDAGnGWNrj4SVWXHF
	 3Lf/B64zAfe5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C51C677C4;
	Tue, 10 Jun 2025 17:25:40 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Date: Tue, 10 Jun 2025 19:25:38 +0200
Message-Id: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJqSGgC/3XOTQ7CIBCG4asY1mIGSqu48h7GBX+VSZrSQCXVp
 neXNrrT5ftl8mRmklxEl8h5N5PoMiYMfYlqvyPGq/7uKNrShAOvQYCkfqATExRaZk+NNrqRkpT
 jIboWpw263kp7TGOIz83NbF0/BIMvkRkFqoWrjeJ15Yy8hM4m40PoUugeY/kkHTS+yOpl/tvgx
 bBVI5g4glCg/hrLsrwBkQJkce0AAAA=
X-Change-ID: 20250409-hp-x14-0f1d86bcb699
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749576339; l=1600;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tF8XhYd/zphv9FFb9CjA8PI63MvoFCSonZ/lwafrBzk=;
 b=cGo+fNh3F4SqVGlTj+EZCHgyUM2pP7V+Zi0yY/OdweAwkTCKuoS2CafOqCLXfFr3arZ4pX9pP
 GM4ykBwAzupC5jaZxMiV+jE9uXnARhoAIaKqrJBokZag8NSbyyJ4nbA
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

The usb_1_1 port doesn't have the PS8830 repeater, but apparently some
MUX for DP altmode control. After a suggestion from sgerhold on
'#aarch64-laptops' I added gpio-sbu-mux nodes from the x1e80100-QCP
tree, and this appears to work well. It is still guesswork, but
working guesswork.

Added and rewired for usb_1_1

Also, did some more changes as tested here:

- remove unused i2c buses
- amend order of nodes.

The series is based on [1] from Johan.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v3:
- rebased to next-20250610 in preparation for X1P42100 variant support
- Link to v2: https://lore.kernel.org/r/20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz

Changes in v2:
- removed overlapping patches with [1] and [2] - thanks Johan
- Link to v1: https://lore.kernel.org/r/20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz

[1] https://lore.kernel.org/lkml/20250328084154.16759-1-johan+linaro@kernel.org/
[2] https://lore.kernel.org/r/20250319160509.1812805-1-juerg.haefliger@canonical.com

---
Jens Glathe (3):
      arm64: dts: qcom: x1e80100-hp-x14: add usb-1-ss1-sbu-mux
      arm64: dts: qcom: x1e80100-hp-x14: remove unused i2c buses
      arm64: dts: qcom: x1e80100-hp-x14: amend order of nodes

 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 98 ++++++++++++++--------
 1 file changed, 62 insertions(+), 36 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250409-hp-x14-0f1d86bcb699

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



