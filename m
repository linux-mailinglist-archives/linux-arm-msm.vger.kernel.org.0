Return-Path: <linux-arm-msm+bounces-58144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1A2AB90DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B8D67A44B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8706329B783;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/LYG+JF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2628642D;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341544; cv=none; b=SriUZSR7j6oQQNddvybdx7e2PkMAamSyxwTKGuD/+l648AAypvNwgndOMZfVXijMlhHaG0vB+1bOGgW9nQmgf6+5FRI1KEHImpWITR+5kvJegoyX1YFlHM4FQ9y3zuZR5I7yEYxT6VXVj9t9utJTw07/xyqkULvLTmhQc0+94m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341544; c=relaxed/simple;
	bh=JEAXjyqVjM7avbq/uSoeI1NuN9BM8hJnV9U2bk99kHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WspGPEEWNY8F12iSfyhoUSUyvA8JO5L478zsN1GoEIowsbvJ1xuYiiZEO04U30D1F7zgujpbGprDvHFPj7OECUbp+hFPZ4QqjUQbmbFL/zBfKVrELcbRjxVOjH4r1Mhy3udhgAGFsiYwszhH14OPAHl05XzFJnuyviiKaa7UZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/LYG+JF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1413C4CEF3;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747341544;
	bh=JEAXjyqVjM7avbq/uSoeI1NuN9BM8hJnV9U2bk99kHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k/LYG+JFLo4MhIW87w1Y+JpA3zgfo5SW6YJW6Io66TiFDxb0zXgOAbNFGdO9W9zag
	 wkL1PFBbA4YmEW+zY4Xta/nWKmwz7cayPeOikKZxRAxCisPI7GAC8Df8aQNkQ/2xz0
	 Z87tIfTCoQr5f2CXG5s2VwM6Oq8CjUlYS/hVPrJsrs+lXAUAL3olBgrPeW/ci41sP0
	 XJ41ujHgic7JL4Eoi+mfwIb0lTxTXr2HQkAnmKmAx/ArpWAVWF+Pawn5SqaCaESKqz
	 qdlv6n8nqJjf8Qq2kh9ic1X0RhoXfxMf41eDclUSNmUWFXxZYv0v8A8t6yMqPwjVeb
	 BRC15oLJLO8TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84E2C54755;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 15 May 2025 22:38:57 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: x1p42100: add Lenovo ThinkBook 16 G7
 QOY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-tb16-dt-v1-3-dc5846a25c48@oldschoolsolutions.biz>
References: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
In-Reply-To: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747341542; l=946;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=etQdHXyoLuErHhEhjcOJ713jpC1/4AMxjblfzFJ1r/k=;
 b=hnqBEXEPyG9aeqmAS8/pbW33X5Ksq0cAY3VWsZb/HAIddeUvtOzEnCJwyVnqCTcH7kZ8/mnAm
 Ww9/WEva2dgDitElsx/GJ8kAFBE1igLz6sSeDRV/1AmXGIBUkyLDkjr
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Thinkbook 16 appears to be an X1 / X1 Plus only design.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4300b29397c6a0087e5c5909d756d733f308d373..345b13f50d433c3df1da6b20e4c5c4c415e63dbe 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -323,3 +323,6 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
+x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
+

-- 
2.48.1



