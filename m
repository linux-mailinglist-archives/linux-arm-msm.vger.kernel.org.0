Return-Path: <linux-arm-msm+bounces-3530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA96806DB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C6151C209FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9298031759;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY0HV7/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B031725;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5383C433C8;
	Wed,  6 Dec 2023 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701861462;
	bh=7eln7pxVEETenxeXywIjzoP1QmPs7ZhmHa7giWC3B/U=;
	h=From:To:Cc:Subject:Date:From;
	b=LY0HV7/sC/KjLK8Cnp653pOgtidr/XJBquqaMW8yCQw0Dyz/Yyqgw9Dunh0JLHNFp
	 IWfE9LkVpBMOZJ+ub4e6F08Mqm+ARrb5D72WIuSlLKdh2zNUfNPZel7hGIBew2NXQg
	 40ZN40UOVnPwxlsmabo9ci3qz9o1vcczK7uIRDtFWO8097ivzPrQw5s1KXH7u+ot4P
	 uTKSEX8yfOIrSm43HBXQEQCSpUObj4b2gt/OSdxog7UwJtMv2pj2hokkBQHFuw7FAi
	 aFCHAsX31d1mzCAGyvFg0i8J27bX4MJ6vXwOeaU6hNaqbSEA/ydcJ4iJ/HWYuT1k+q
	 vquv1ZFZksoUQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rApvA-0001wC-14;
	Wed, 06 Dec 2023 12:18:28 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 0/4] dt-bindings: mfd: fix up PMIC examples
Date: Wed,  6 Dec 2023 12:17:50 +0100
Message-ID: <20231206111754.7410-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reviewing the various SPMI PMIC bindings, I noticed that several
examples were incorrect and misleading and could also use some cleanup.

This series addresses the mfd ones along with some related issues.

[ The PM8008 actually sits on an i2c bus but it is related to the other
  Qualcomm SPMI PMICs. ]

Johan


Changes in v3
 - rebase pm8008 update on linux-next to avoid a trivial conflict due to
   a local change in my tree

Changes in v2
 - drop the incorrect #address-cells and #size-cells properties also
   from the hi6421 regulator binding (Rob)
 - drop Fixes tag from pm8008 cleanup


Johan Hovold (4):
  dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix up binding reference
  dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix regulator binding
  dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: clean up example
  dt-bindings: mfd: pm8008: clean up example node names

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 140 +++++++++---------
 .../devicetree/bindings/mfd/qcom,pm8008.yaml  |   6 +-
 2 files changed, 72 insertions(+), 74 deletions(-)

-- 
2.41.0


