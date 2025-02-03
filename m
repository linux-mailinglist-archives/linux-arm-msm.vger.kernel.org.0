Return-Path: <linux-arm-msm+bounces-46822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8CA2658E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 22:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6080318855C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 21:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3970620F09A;
	Mon,  3 Feb 2025 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yc+Yb6e7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A51D5166;
	Mon,  3 Feb 2025 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618174; cv=none; b=iJCGAyPAK4w30zcS41FavWLsGBPVASYTSQuh4AMmWi95vRUUXrgBk8cRpuwbJJ9r6qynJbMNa3hT1IzpXWGvkvL9X3ReCMQ2uCrr1heZ7wr4y8SkW6KKDJEnC1a6RGMnAGlW1JiYECUinkVKyInTOFjYOvm81bSNmix1W1wuWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618174; c=relaxed/simple;
	bh=k45PuhlI1pyZAkhQxB499IE+3LUgYrC/yYKeKsxVgHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rPpr6wSXhE386k7efFECl0ZmVxBmfD7mhshaXegIwi4wFEebZsm12zH4/QReHZxTCS/vjXm+Bt9BOgtMpxHKkBko2/hD8aEMMUzjozBlQ4nQNd5fsQFQBB4+w+TF/e/gPGwL9qeUplqnPdevk37p7q91EXtknKh+wOh/geIN+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yc+Yb6e7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24882C4CED2;
	Mon,  3 Feb 2025 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618173;
	bh=k45PuhlI1pyZAkhQxB499IE+3LUgYrC/yYKeKsxVgHw=;
	h=From:Subject:Date:To:Cc:From;
	b=Yc+Yb6e79pQq+/g/JjRXN1MbhgANzFxtPQwz50l4cSHFcKGAfWu7o7WUl6YdivPvL
	 Av9v8YrdHfXcmKpeaXIKRDxXchNkQcHwEqTs4j9g5eGzicxCxHMLJqZen94KgVtUQU
	 RyyAoDy9OE3jT8dgb9W/yvAt8mdH2qMZSSSBqrZiRlv58FVG04yGFmwwMx7YG5YAO7
	 fma8sGXqN5CAPPk2AmDK1RYXcp4bEQzIjQ7VCeianii1ujsaP3OqYMgXAVZlrzRAz3
	 wQZTkeKx3NJTaMOn1UZ61/l2DR4+Hx9x/zMi/K7ar2v6qPNfcIerlmh2Q6zDyVPwGE
	 /oShsVseZJdFA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/4] dt-bindings: Ensure all smsc,lan9115 properties are
 evaluated
Date: Mon, 03 Feb 2025 15:29:12 -0600
Message-Id: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACg1oWcC/x2MWwqAIBAArxL73YKPDOwq0YfkWgthoRGBePekz
 xmYKZApMWWYugKJHs58xgay72DdXdwI2TcGJZQRSmj0Nx4uWikNBn6RSAcdRhsG5aFFV6Km/+G
 81PoBiq6kE2AAAAA=
X-Change-ID: 20250203-dt-lan9115-fix-ee3f3f69f42d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev

This series adds qcom,ebi2 and samsung,exynos4210-srom memory 
controllers' child node properties to mc-peripheral-props.yaml in order 
to fix the 'additionalProperties: true' in the smsc,lan9115.yaml 
schema. These 2 memory controllers are used with the lan9115 in several 
.dts's.

I'll take this series thru the DT tree.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
Rob Herring (Arm) (4):
      dt-bindings: memory-controllers: Move qcom,ebi2 from bindings/bus/
      dt-bindings: memory-controllers: qcom,ebi2: Split out child node properties
      dt-bindings: memory-controllers: samsung,exynos4210-srom: Split out child node properties
      dt-bindings: net: smsc,lan9115: Ensure all properties are defined

 .../bindings/memory-controllers/exynos-srom.yaml   | 35 ---------
 .../memory-controllers/mc-peripheral-props.yaml    |  2 +
 .../qcom,ebi2-peripheral-props.yaml                | 91 ++++++++++++++++++++++
 .../{bus => memory-controllers}/qcom,ebi2.yaml     | 86 +-------------------
 .../samsung,exynos4210-srom-peripheral-props.yaml  | 35 +++++++++
 .../devicetree/bindings/net/smsc,lan9115.yaml      |  6 +-
 6 files changed, 131 insertions(+), 124 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-dt-lan9115-fix-ee3f3f69f42d

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


