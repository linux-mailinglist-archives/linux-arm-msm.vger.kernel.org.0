Return-Path: <linux-arm-msm+bounces-53793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C634A83E13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD27A7A73B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE1920E708;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4XGeJiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A320E002;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276410; cv=none; b=XLqEhmG1h/NwBK/WQ9tExmS+pYDngsay4Y2HXDRAxL3qEVn/LxlJcJemjd12LxgBc9/Qz1mKszoWiQplU8rap3NrOEBLKGDwSWX9gTZFhAtXyPvEKWYAVeUCRuCkBEVzNoIj2p0bO3ja7L6/CDoCo+XYrSakENXFsOMtAvv+bgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276410; c=relaxed/simple;
	bh=z14bFgffIMF84MH2SbzPe5mYlhRgz6DlUsTYSQpfWNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M44HFujd/4jliepwI96l5/cY1DNJzQ+LPUHejp/yC3n+XS24LSgYI6/yqbDkfoWv2cHor0HVcr5dey5Pgn2FXXlVTqdgLPRlcsxZLTYADfuk0LVG7KqBKx8hmo5TmI8fltaL/rhmZON8/k252AI9ZZs7ByK7l5Fa6z2ciISrolk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4XGeJiF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAA71C4CEDD;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276409;
	bh=z14bFgffIMF84MH2SbzPe5mYlhRgz6DlUsTYSQpfWNg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=H4XGeJiFIWCluB/st1j9N2M+GZfU8DkNgCZkcncWaHaP7fep3w7Mgg2sua9ApySct
	 gRUdNNV/czKJf57HjLC7/RugjDmOaI9kGEkF4c5/kCd0OPUU7eHwRPISKqqsn1Pg/N
	 XIzZvk5anGrfaXwIWaebNYQfrKPYXsoM7NL5mjALCScS4Jtb/tRuM//DuzFtLEz1dr
	 jtf/eTmUoRcQtKyJgoLgJHgTvbsYPamgOB0ICMYhqKj3LKAE2rNgW7N/SJxXg1XM/j
	 pQQSYhgluLDZHEYWDmZ0k1BST9m1PVzzZbzjxSUlFTsRaz0UHXt0bxoSA3nZQ+SXKc
	 Xoyud5GR6+ULQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B41C3601E;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/5] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Date: Thu, 10 Apr 2025 11:13:21 +0200
Message-Id: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGL92cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNL3YwC3QpDE12DNMMUC7Ok5CQzS0sloOKCotS0zAqwQdGxtbUAw4u
 B9lgAAAA=
X-Change-ID: 20250409-hp-x14-0f1d86bcb699
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744276408; l=1300;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=z14bFgffIMF84MH2SbzPe5mYlhRgz6DlUsTYSQpfWNg=;
 b=4rsuzTGzDm1t027Nmwxw+rLz+DcUAZnFM6lXltDJdWndm0SdmwiP3z9Px5k18w1p7oGOo5Ely
 lj+aBylgQP0CCgDN6W1Pd2I9mh7HW5wUGPacKsWsnP1lju4IZAWv3hq
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

- remove unused retimer, regulators, pinctrls 
- remove unused i2c buses
- amend order of nodes
- explicitly activate smb2360 eUSB2 repeaters for the type-c connectors.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (5):
      arm64: dts: qcom: x1e80100-hp-x14: add usb-1-ss1-sbu-mux
      arm64: dts: qcom: x1e80100-hp-x14: remove PS8830 retimer 1 definitions
      arm64: dts: qcom: x1e80100-hp-x14: remove unused i2c buses
      arm64: dts: qcom: x1e80100-hp-x14: amend order of nodes
      arm64: dts: qcom: x1e80100-hp-x14: explicitly enable smb2360 eUSB2 repeaters

 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 236 ++++++---------------
 1 file changed, 66 insertions(+), 170 deletions(-)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250409-hp-x14-0f1d86bcb699

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



