Return-Path: <linux-arm-msm+bounces-2746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E86E97FF887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 18:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34F7281789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAA75812F;
	Thu, 30 Nov 2023 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cusBl+xA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192BC51002;
	Thu, 30 Nov 2023 17:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA3DC433C9;
	Thu, 30 Nov 2023 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701366047;
	bh=zWMt5IhznV4y9Tk0tbO7xpSyPtkYWHHVPfOad0SC0aE=;
	h=From:To:Cc:Subject:Date:From;
	b=cusBl+xAfmeQGQ8xZrO/Nsx3tct0XtjelzpH3X+fk3W4r9Zh8/JpXLSd+IR2Vecmh
	 +oGvLbOzKDDhwn4X+82NNE2Ai/aKgcEmBdMNNrpd+rXkQuCMOo+badO2YRh0G0rQwr
	 MdJ9N2+C6Rc1Pk2WHFdEyL4gi4w8/ZP5s0oUtMMO4cBVwN4CuedvrsoTXsPI3rsRlQ
	 K+sGgXQPNkZBtDwMk0WtUo8oAgEjGQp+53qHG5JSr5jnbcMoiED5OM61iaRVdEPQP2
	 FFZ77xkUIceFMw/xpQNdWgwtg14oLuEYowInWoeCtM9HKmCtis5SZZCadUlKRS8Bit
	 FL2SGbgKSGHvg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8l2P-0003Pu-01;
	Thu, 30 Nov 2023 18:41:21 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] dt-bindings: thermal: qcom-spmi-adc-tm5/hc: fix up examples
Date: Thu, 30 Nov 2023 18:41:12 +0100
Message-ID: <20231130174114.13122-1-johan+linaro@kernel.org>
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

This series addresses the thermal ones.

Johan


Johan Hovold (2):
  dt-bindings: thermal: qcom-spmi-adc-tm5/hc: fix example node names
  dt-bindings: thermal: qcom-spmi-adc-tm5/hc: clean up examples

 .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml    |  8 +++++---
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml      | 16 ++++++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.41.0


