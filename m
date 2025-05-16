Return-Path: <linux-arm-msm+bounces-58174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5070AB961F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 08:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062F84E1BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 06:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38954225A22;
	Fri, 16 May 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkFSvL/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC793224AEB;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377797; cv=none; b=NOMc4sVrxdKwCgx38h9SFihc0d7W/uOfIKLErsBPMv8nRjqFhXPDFArqSBKs0TqFDqQ6Ze3zhgGMotcPVon1uvXWm2Gw3BpBxqVcE7Vn0BBPdre7YyBWtkOvoxED8R6iC/yEhqNFjGJTFldiGloK/w+QeiEG8+dtpJRfgg4Z4fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377797; c=relaxed/simple;
	bh=B+cZu+TUTXQrQNNpRD2/t83ewYuLdZHh1R/RwTUc/dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXjxR0D8ighf0DuAbwJZyqBKkyMtDO3gh/7aLykhIhgDQs+fa67ZTBzosSV55NwsRkVDIBwymCXpHppu1J8pm063fpCTJVSFrHYCwyvZx6O4JdAkFUHCBZb9VR3XH/hDbVh9nEeX8Ob94pUJoltGC1W8Q0TawQOkVbfJo5geok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkFSvL/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67C5EC4CEF3;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747377796;
	bh=B+cZu+TUTXQrQNNpRD2/t83ewYuLdZHh1R/RwTUc/dA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lkFSvL/aPsbXp9JHoIDhj+81C8pAbY9QmtlsTcRDocBpOD8nTKtIF7zDbb7VJZU0t
	 icJgxQTbCDvrNhFrh2jU/hvQtH9av4M5uj0mvL0FvJzGICRHVfaWL9b74eXkWJB98m
	 5U3YO4ZhKTuLpL7iK5AHEuHMdI0u3IaFz4vWQ7Jpc5eg2kNhd9ohEl/ePhUnWlMtPE
	 LcGdLnvmxx/sFgOuORvkX4l+0RBBm5/umPNOyG2RD3jz1yV6JwRa2T9B9wpUaIxZsV
	 9/7N7PoEqtxL1F98OEF+epH5Mo3lcYHe6nL1BXBS3VCK79/P+08hwmC/Z3FNKw4yss
	 tCS6ZizCS4u4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE1DC54756;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 16 May 2025 08:43:01 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook 16
 G7 QOY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-tb16-dt-v2-3-7c4996d58ed6@oldschoolsolutions.biz>
References: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
In-Reply-To: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747377794; l=993;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=iL7H+7E9dNkYXKjNsHdkYJEl/5Eui7TcgzKxZKRPtM4=;
 b=h9goO4q6OFlCc2tgIsbzcS4X/Hbz10dtZTK1ja/9BLVxFNZKpJmzc2fXZojUcI7bqw+XYYVuN
 hTD7YO6muVcDAvNdJaGzNlJALcqN9286S70u+lsRoF/7hiTP+paIYWP
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Thinkbook 16 appears to be an X1 / X1 Plus only design.
Add make targets for normal and -el2 variant.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
+x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
+

-- 
2.48.1



