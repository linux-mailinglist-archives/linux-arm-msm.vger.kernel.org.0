Return-Path: <linux-arm-msm+bounces-2739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F17FF81C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 18:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7B50281741
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A5856755;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXqezqqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA1C56747;
	Thu, 30 Nov 2023 17:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B656AC433C8;
	Thu, 30 Nov 2023 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365125;
	bh=lrJZDSmPE6sJggjsC2wQcjtU9RHwzSAEI63jRK7gA5E=;
	h=From:To:Cc:Subject:Date:From;
	b=hXqezqqAWgqa+SAGfd+k3U5sSfEuSFTpO7wBs/cDK+vzPy8EegEV4rLyIOn/+QrTm
	 hhuw9Fz4Zya+VsmbwtHK0i6U6r5UDCiP+UJhmHPvqUb6KfjRWw7Zel9oprNYvQG+JA
	 C84REje0b6WrPPHI+DiN5XKPNijVaSr1Mojz7adROq4Y6zdJSgG1BX3Hab3AfNso+6
	 BHvbPbvZ0kZRzrwiiX0OGNljJOWk7nyRBkyUlN3nLMJC7BCQrfa6UkaRhziekZM3n4
	 4p6dzY36iSIj7W6FCyUhz6UZoyy1OPKwQ/fphvzytDOjPULIVZWKIj2tRfDGZJJgAB
	 t8bEeXbbunHwA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8knX-0003Gt-0Y;
	Thu, 30 Nov 2023 18:25:59 +0100
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
Subject: [PATCH 0/4] dt-bindings: mfd: fix up PMIC examples
Date: Thu, 30 Nov 2023 18:25:43 +0100
Message-ID: <20231130172547.12555-1-johan+linaro@kernel.org>
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

This series addresses the mfd ones.

[ The PM8008 actually sits on an i2c bus but it is related to the other
  Qualcomm SPMI PMICs. ]

Johan


Johan Hovold (4):
  dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix up binding reference
  dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix example regulator
    node
  dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: clean up example
  dt-bindings: mfd: pm8008: fix example node names

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 133 +++++++++---------
 .../devicetree/bindings/mfd/qcom,pm8008.yaml  |   5 +-
 2 files changed, 71 insertions(+), 67 deletions(-)

-- 
2.41.0


