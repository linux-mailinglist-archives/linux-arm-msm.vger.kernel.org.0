Return-Path: <linux-arm-msm+bounces-21437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434698D7B95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00C90282082
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 06:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911A32942A;
	Mon,  3 Jun 2024 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUiCXzhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A33612D;
	Mon,  3 Jun 2024 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717396146; cv=none; b=bFB0FdkiGDqsGpIyXfh+o7lS3rRs1f1gMe1Vx8sYyzNKImadlUwZaO4poMPqHSjqf/CtLuiAY5uObW3yDRCJpXK4FHFNygSRtzoBIiMkPPiVhZQFVTxRlk96AaYV1lylJQbz04UM4sWtLTByu2Bf4sg6e24ufePX0/HXJw+z9fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717396146; c=relaxed/simple;
	bh=hB0J0IVOF/UpXjXGqBI7wM1bGQ+L+7aiaCg9Y6YiGMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GA43vceCaQiGvfkwCcMbDLQtVMZn9ydIFzD++F0siyXsN/q5C7DMt6a+NbcOpDLky4+9nJ8gCe6edY7Va+TPxCM6eJgIxgLN9EYSKWPX0LHXAQWvTIonIHbmyeXvf60GjnDqXlqDjURE0bjoryE1KBNrt3uO/pzbroxqvDsIkxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUiCXzhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9572C2BD10;
	Mon,  3 Jun 2024 06:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717396146;
	bh=hB0J0IVOF/UpXjXGqBI7wM1bGQ+L+7aiaCg9Y6YiGMg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gUiCXzhzSsyji02TQNwqgFLXVi1KLFFts4CSbXjsTCUmGjUdZdAHLrKm8c2vMWvSt
	 wkOU+5Ae75+yM5ZSa62dwnEiqrlwm1H/NzKihFxAN5kDqbEKDTPXP2M1coc1iGuE9p
	 oEeVdvtxELz0oVAtbRrF5f1fLrLdzkJZAxxk1gvpm7PPf4ly0r0UpHXOuthT+nipnB
	 s+oXsQn+9oZNcPVbnl46jmXCgiZ8b/AboJC4UfibI/p3Hdvtz2rNQNL2mRviocc2ub
	 E3rwf/nTQfWHdKxlL3eVtEV2ECgXZocfEp6ir0tAuzvOTu1ZemA3h3vTGhWVwfa8Wd
	 MXuu48jBrpu+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4CDC25B75;
	Mon,  3 Jun 2024 06:29:05 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Subject: [PATCH 0/2] Add HTC One (M8) support
Date: Mon, 03 Jun 2024 02:28:55 -0400
Message-Id: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdiXWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNj3VwL3eLSgoL8ohJdSxNTiyRjc4s0QzMLJaCGgqLUtMwKsGHRsbW
 1AA+5+IZcAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717396145; l=682;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=hB0J0IVOF/UpXjXGqBI7wM1bGQ+L+7aiaCg9Y6YiGMg=;
 b=JqOBv5ncABcnRaUXO918/ItOETjjhRbgnF8IqtnfKb5vSHCHgFit3kNfHqV336ernniM1WHRY
 Mgmt/Q3vZn6DFUDVsVlSc7a8J5vGxjk0Ce1iyJ06a4jNzCM1MjR6qYP
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

Add an initial device tree to support the HTC One (M8) smartphone,
aka "htc,m8".

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
Alexandre Messier (2):
      dt-bindings: arm: qcom: add HTC One (M8)
      ARM: dts: qcom: Add initial support for HTC One (M8)

 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 353 ++++++++++++++++++++++
 3 files changed, 355 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240603-m8-support-9458b378f168

Best regards,
-- 
Alexandre Messier <alex@me.ssier.org>



