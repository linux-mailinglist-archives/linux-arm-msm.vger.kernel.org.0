Return-Path: <linux-arm-msm+bounces-86046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4BCD349D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C32753010CDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD0B2FCBE5;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS3MUjem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA4121D3C5;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252836; cv=none; b=RIpi0Nt7VpmoLs1h7lX6i/Fpk8IIuFuch1YTnuBomGoGkhJbERKuCiGzaddMcDD5zTsljUlWzScEMLh2VTvWr70V0H+7UHtagwXeqVb4XtP7/JJHBn9MVDLmTtXK31vF42wti2S2oJ2k7P5tApBvlgkj13B1fcjg1nhpKVXPvOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252836; c=relaxed/simple;
	bh=Ff6jht1U9mxQ/WboaC+zNf0mm6lryMuMDMOQWfHF+V8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zjrd3UmGlbrBH7gNb3umJjh3gfJomrITdQeA4MpbTN76GNhOLWjXbyGAZq9TOP7RCGuEs3GWm32Jvh2YCya3VmZwrW9x8yy146qvQ3dI9W+LnEExh+ZLokAx1dtKH7rxpONUosQQ/ZsO1ztlXo4a0EbQ7l4JeX4NZuSYckDZxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BS3MUjem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B1DFC4CEF5;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766252836;
	bh=Ff6jht1U9mxQ/WboaC+zNf0mm6lryMuMDMOQWfHF+V8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BS3MUjemKVB0to0n6s5PODGbmRNVK6/12/2HWqJQkIZOYI7Ml8cOUZ+JQtnRKaNJ6
	 44ExLUVvMU5dFjkZmaTeRQDa8xPj8NAqEDYb1O15V95GigkMgTCRojJ8YbE9akJT0N
	 3srqI76JmsB+dLEljSJWVNjWIlp4WYkEMZQI1SGrcuUwdlPw5DNF/YZjq+4NrGD0Un
	 OZygFLNl/sSQlhM2SCV5bb/QiyKIqRbOmOzQHJSCkyGGSQMkpkz/pHm5ShqzRDVZk+
	 ERYTm0jAG3ZwMqOKr2tVlwXc5njUmgdjkpSg9TAY9sedMTIHD2Tu5l/6gpFPTh8Shb
	 akKHTfDwID/nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C50E67480;
	Sat, 20 Dec 2025 17:47:15 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: enable
 HDMI out
Date: Sat, 20 Dec 2025 18:47:08 +0100
Message-Id: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzhRmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMD3ZIkQzPdjJTcTF1jc0MzE4tkCwNjS3MloPqCotS0zAqwWdGxtbU
 AACzBbVsAAAA=
X-Change-ID: 20251220-tb16-hdmi-371648c80397
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766252834; l=1743;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Ff6jht1U9mxQ/WboaC+zNf0mm6lryMuMDMOQWfHF+V8=;
 b=BQLU+RpGtPJrTxMyBag9Am0lSQCkY6flGuZYTq8MBr/3yfh5H9cME1pIUdWyve9AaYDGGv2cL
 iCGp3ZuYa87AvbtkI6lnGDLya7a6uJEg+vhhbI57gT3/aEL79xGqn5W
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
driver. 

Since the qmpphy involved is usb_1_ss2_qmpphy, and that usb_1_ss2 block 
is also used to operate the fingerprint reader, there's some possible
interference. The explicit port configuration on usb_1_ss2_dwc3 minimizes
this, however it works more reliable with the pipe_clk patch [1] that 
is discussed. Booting with HDMI cable cold-plugged results in the 
fingerprint reader not enumerating. Hot-plug and suspend doesn't kill it,
though.

[1]: https://lore.kernel.org/all/2564cdec-9726-4efa-ba07-a2f2646168c6@packett.cool/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Val Packett <val@packett.cool>

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (2):
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force usb2-only mode on usb_1_ss2_dwc3
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add hdmi bridge with enable pin

 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251220-tb16-hdmi-371648c80397

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



