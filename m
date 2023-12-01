Return-Path: <linux-arm-msm+bounces-2926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0343801082
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D5CB2124C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7071E4CDFB;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHzu3ti0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6B495E4;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF94C433CC;
	Fri,  1 Dec 2023 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449206;
	bh=MgB7h5ARqJ3S531R4IVFVRZAv2YOBJSha5OgKGiN/ak=;
	h=From:To:Cc:Subject:Date:From;
	b=cHzu3ti0064GDwTi3GVsBX+GrioJJujpwV4tt1D7gPVZtbWCduFlicw7ntM8T4qx0
	 WqFSgm/ODZvs6GuucpVdNETkvW/vnaqqc0MZaLRdXHWGs+ri7xLZbKmTGy3mhtRnyv
	 3FSjSCJai/D+jwEgrXrvlBsB9rY87evZMtGDZMsdFOiylqBy8xgg/+Id8mHehWe4Pt
	 ASKNBFFwL51YU0YTB38dNi/g6LHYDQsiJFsYbcSvnH4SfnAqCUw16+5xwWwRbEGFrw
	 Ukb0tEQkZOiBBSsLo45LAixPqej4iYzSotXqvIZcmBdyAcee72mrPf9N61uemASW9X
	 lutkpT6DGtFHA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r96fi-0003IQ-2u;
	Fri, 01 Dec 2023 17:47:22 +0100
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
Subject: [PATCH v2 0/4] dt-bindings: mfd: fix up PMIC examples
Date: Fri,  1 Dec 2023 17:45:42 +0100
Message-ID: <20231201164546.12606-1-johan+linaro@kernel.org>
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
 .../devicetree/bindings/mfd/qcom,pm8008.yaml  |   5 +-
 2 files changed, 71 insertions(+), 74 deletions(-)

-- 
2.41.0


