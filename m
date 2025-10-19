Return-Path: <linux-arm-msm+bounces-77919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C278BEE6D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D987E4211FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D58B2EAB85;
	Sun, 19 Oct 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TnhIk4iv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hMFs0KCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4702BE02D;
	Sun, 19 Oct 2025 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883671; cv=none; b=IFI66KInahHL8GsNMyVRZW75f7xSuERbXHg9M2iC+l/jo6qMdv1ZmUbi4HLErHS8RSprnfZt6GMS0fxaeNNmYSWhiZlMhk5voDwaFyoPCEjubPz4dq1Y0MSODnUjV2kyH0zdIgcwNaoA4YNaiQ9VGpEHxoKgrpVrfnIUNL8Q/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883671; c=relaxed/simple;
	bh=TXZjPR2nG0VXh63BNbpiV+4trWhkS300oJoIHKR4dk8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V1AxdssSQF283N5GYIjJYDpjxNtX0AyBxAVA889y5adkoWKor1CZ1J9xTzAFCNG5rZCu2ewWugC6a7v9vPVGMMMTkJWD+zQsnjxRzT9VlfwkN8x5g2ky6TVvFGBXi8qZNgadhv11pr8fBTIM3ry03BIPVHycQvr8Vy0n665bSsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TnhIk4iv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hMFs0KCo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1760883622; bh=TzVXbZrfU5FM46nHJEOuScu
	p2UzNVkvriPgsmxhD51I=; b=TnhIk4iv8bMcDOAZ2qyy780ZHo8NMr+62KT2OBE5lRlZD5vgGe
	VdVHP1zxYtl1y3JhilJll40bulpOfqdHJFWn+r8H7x6wnX4UN5fjckOLl9FdI0A0GN6gobf6zYj
	MBNjJQ32hD5waCa+z1c889vBrmQJSIGsd2xKvZiSdTHWESTZpWk2fOPEPClpfqv9iFVjDZ4gWJ3
	QuDa4OiCfSvBH25jg9TDKba98pJGCJMs9BjPivezz78nb94+H1iFfkIst4zEPRvi0KkaZ7XWbGt
	Ev6wZ0TF2z2Bha+L48gQzl2+yFfR+MmjtJwwUKIcdvO6of3WVfGCEm7WyXN3P4V6wPg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1760883622; bh=TzVXbZrfU5FM46nHJEOuScu
	p2UzNVkvriPgsmxhD51I=; b=hMFs0KCo0EGPL5JFDiCvNYWaMIqOYEKZOrnDsb6H5QNUzZvLOI
	+MSzj7v1sWISDbYh9Ha5zOQyssWKokZG1DBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v2 0/3] Add SDM660 cDSP support
Date: Sun, 19 Oct 2025 17:20:18 +0300
Message-Id: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLz9GgC/32NQQ7CIBBFr9LM2jGAFmlX3sN0QQHbSSxUMETTc
 HexB3D5XvLf3yC5SC5B32wQXaZEwVcQhwbMrP3kkGxlEEy0nHGFTxMWTHaRkqGxacW207aVSl4
 0V1Bna3R3eu/J21B5pvQK8bM/ZP6zf2KZI0N2Fk6okx1FN14XTf5Bnvx0DHGCoZTyBTHioya1A
 AAA
X-Change-ID: 20251018-qcom-sdm660-cdsp-59ad56867a18
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760883621; l=920;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=TXZjPR2nG0VXh63BNbpiV+4trWhkS300oJoIHKR4dk8=;
 b=3DAQjXKt6K4Zfdjef2jVnhBd8Pl6fGYUGJcaYVfWThG+a+9e9Yr4m+biWx3qJObiw69bZnC4Q
 zpLuLu/0OGKD10VMqTwfSXTWYHsmLfAZso3aU0D2+h1gTseIct5B5Xl
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds an ability to load and boot the cDSP remoteproc
found in the SDM660 SoC.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v2:
- Added missing constrains for both aDSP and cDSP.
- Link to v1: https://lore.kernel.org/r/20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org

---
Nickolay Goppen (3):
      dt-bindings: remoteproc: qcom: adsp: Add missing constrains for SDM660 ADSP
      dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP compatible
      remoteproc: qcom: pas: Add support for SDM660 CDSP

 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                          | 1 +
 2 files changed, 9 insertions(+)
---
base-commit: 93f3bab4310d4ff73027cc4f87174284d4977acf
change-id: 20251018-qcom-sdm660-cdsp-59ad56867a18

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


