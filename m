Return-Path: <linux-arm-msm+bounces-87294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4FCEFD16
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 10:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72F563025A71
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 09:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397B91E1DEC;
	Sat,  3 Jan 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeqoxTTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D3E55A;
	Sat,  3 Jan 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430838; cv=none; b=l5HFwqAgtH+8W0TLxm3+KwXmlJFOK6+qsolcbVYwdXbhr0u1L1FbZZkJ3x8BstNYHDV0jkw5WBz40nU2WL4hCkzio2Pa9EexBNkcyg1Q677Lt4h6wpiTu6uuIE2I0MqbkMDtTeQdTxQpU1gIYP0Bwulv2QMymDLpyWnXU6EKyVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430838; c=relaxed/simple;
	bh=N2OSZfc5uZLO/gIUqkPklt/LFJmMqkpMheBcHTaPCcQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q7evIPZ9goprl/a4Tv9TQRxx0CyVJSZtPDIs4+9bFT4cUV6OHxAYEA8TPU93gIB/RE0GpsfqbJwCVXA8nE6GL/6DV+SkxWkMVSwPgLOePO7/MssuYcuU6lfeJJdmXSgqlPfKVY4ZkUHAyPGFYTnVRNl19dJ6zeVwQiX9UzW0BUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeqoxTTE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9C9FC113D0;
	Sat,  3 Jan 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767430837;
	bh=N2OSZfc5uZLO/gIUqkPklt/LFJmMqkpMheBcHTaPCcQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NeqoxTTE5/Kjlo9TuJEYOj0OvgKcOIfGYibEXlPSLOUf6NPGM9+coAw+0OanNPvsh
	 LuCiElbI53py/ITgm3y0gcjQtqIBQDAm6hlY5z6U/d8w0S5sLWRa24fgh3BoOG3ZWl
	 JE0fymcYT/d8A6yvtdVxeiK+mG/TM1EEevabpPWuhT99yYkRZRV7xZLuWoEFuFp7Y8
	 paMkEmaZmuxrirYZWI65+gdUiWVu5CLt6fTF6behGXuO7Xn5xy191a4Q/J76W8d604
	 uMkSfsa3QFf289LcLT29x42Fhbyo0P7sLogXvFSx77kJyVpM7aH6ZibUAL/PTj9Ptr
	 aGJyJCP02dILQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8401FA374F;
	Sat,  3 Jan 2026 09:00:37 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16:
 enable HDMI out
Date: Sat, 03 Jan 2026 10:00:22 +0100
Message-Id: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfaWGkC/22Oyw6CMBBFf4XM2ppOUR6u/A/DwtLRToKUdCpRC
 f9uZe3ynNyc3AWEIpPAqVgg0szCYcxgdgX0/jreSbHLDEabIxqjVbJYKe8erMoaq0PTN7psa8j
 7KdKNX1vr0mX2LCnE95ae8Wf/VWZUWmFjkYy2ZVvROQxOeh/CIGF4pvxH9pY/0K3r+gU67aPFr
 wAAAA==
X-Change-ID: 20251220-tb16-hdmi-371648c80397
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767430836; l=1759;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=N2OSZfc5uZLO/gIUqkPklt/LFJmMqkpMheBcHTaPCcQ=;
 b=GxvpZXagkg+xw3vJhP/lGMgzegRQDT2TwWeurIUKIcSkak/ker15k3EUzDWfKtsqJZpztC3Dw
 lQu8BTQTcUfCAQZWmnLAXa0Qe+pxtOHaDE2cqHv9u4MOWWhdyJpav79
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

This patch set enables the HDMI port on the Lenovo ThinkBook 16 G7 QOY. 
The definitions have been derived from the T14s device tree, with some
necessary changes. The HDMI bridge seems to utilize the enable pin. 
The required GPIO was derived from the AeoB dump of the Windows GPU 
driver, and then actually guessed with comparision to pinctrl-x1e80100.c.

Since the qmpphy involved is usb_1_ss2_qmpphy, and that usb_1_ss2 block 
is also used to operate the fingerprint reader, there's some possible
interference. The explicit port configuration on usb_1_ss2_dwc3 minimizes
this, however it works more reliable with the pipe_clk patch [1] that 
is discussed. Booting with HDMI cable cold-plugged results in the 
fingerprint reader not enumerating. Hot-plug and suspend doesn't kill it,
though.

[1]: https://lore.kernel.org/all/2564cdec-9726-4efa-ba07-a2f2646168c6@packett.cool/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- reviewed and discovered / verified hdmi bridge enable is gpio120, 
  resolving the previous clash. Also, configured the gpio120 with 
  pull-down to avoid a floating pin.
- Link to v1: https://lore.kernel.org/r/20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz

---
Jens Glathe (2):
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force usb2-only mode on usb_1_ss2_dwc3
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add hdmi bridge with enable pin

 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251220-tb16-hdmi-371648c80397

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



