Return-Path: <linux-arm-msm+bounces-34599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D509A0D4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE6E1F231CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB68B20E003;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyGXtRR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6A208D95;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090362; cv=none; b=Eu0A7RnDe481qeGRylvqUX/qqPNU6cdTZdzRfklwY3aNbE710hPA4IyDywMYBuFi2mzPwyq4YXBHNMb9zGGOKJ6S5gfYXlHTNsrtS68z6ywRHnHBweBLMASBFKz3vmOalxZ9H81sXtURO0IdI7fWbKRLi2O1INDO1Y0FoEiwJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090362; c=relaxed/simple;
	bh=v103hbZX+LZolw2kD4hSjZ3f8P/BTbFXIqM97aLiLHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXPVuUHkW877LcVAKb707sjXVa0T5ieJgjO5dMtCsmN0/4oQK983MCsWT6Q3fwz3S2/34104f//j4rI+1k2rcXCwcgn5yVliMe0kCCj5PfFyR14YRV2kRZeyCwtx+0kmlTgHVW8SOY0oz8mavQmKJozz6FG2tonLxFFsp41HHJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyGXtRR3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133DBC4CEC7;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729090362;
	bh=v103hbZX+LZolw2kD4hSjZ3f8P/BTbFXIqM97aLiLHc=;
	h=From:To:Cc:Subject:Date:From;
	b=HyGXtRR3E6+Ats5x51UiGjhsbcrEpR8bMviJhznypKbD7XvU+ij8JHI83BKWebZIT
	 OonZKrO59GuXMlKJGpZNKyNX84NyVlbRkJ/bvHQaMEgkYSPPEnoDIPo9ro/uT2Y6m1
	 StNkJsVtjr/R9pQfN5oDGvgmvlgqk8sFlo4cscW7A5AlDJSX5pZTb+4eHCAc3SOA/X
	 orB8g5YTaG29iQ91RuendWoOOnrmBSYjHkWrgosVRvo39i5birIKoalu554Mm6XUIL
	 YViIWl3YjUUqCa8wIjcb8ZR8X5YCBO+nxpjKroyvM8JWfeMTK7gLLgTn/BPBEUTpfj
	 iImX2WxNiW8Kw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t15OK-000000006UF-3kYl;
	Wed, 16 Oct 2024 16:52:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/6] arm64: dts: qcom: x1e80100: fix nvme regulator boot glitch
Date: Wed, 16 Oct 2024 16:51:06 +0200
Message-ID: <20241016145112.24785-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMe regulator has been left enabled by the boot firmware. Mark it
as such to avoid disabling the regulator temporarily during boot.

Johan


Johan Hovold (6):
  arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
  arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
  arm64: dts: qcom: x1e80100-vivobook-s15: fix nvme regulator boot
    glitch
  arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
  arm64: dts: qcom: x1e80100-microsoft-romulus: fix nvme regulator boot
    glitch
  arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch

 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  | 2 ++
 6 files changed, 12 insertions(+)

-- 
2.45.2


