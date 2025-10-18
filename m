Return-Path: <linux-arm-msm+bounces-77868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22353BECDD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 12:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B708634E673
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175562FAC18;
	Sat, 18 Oct 2025 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="g/YdRelm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qyi1rngX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A66EAF9;
	Sat, 18 Oct 2025 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760785062; cv=none; b=XNQQIWl4++Uhlrz6FH0FTY1uP8dvopa8jOkeEG+XD3erHwVZPn8JZwkIU81Igq41lbU1FRovpIJY7cOgZK5uSMuIVhvtKzdUMdLG+/XVT2v9NQeNUUoXsOO7tc4SPbOLdU+fLGW+JLnvTKUpZ1RLmEGrVG5xMboPaBOOFgbMMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760785062; c=relaxed/simple;
	bh=mp1/UlfPV1/zwC2F31LGeOOAVwViAmoRlk67fQeAB7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9vB5jFGzWKD5eDVFjX2J+O7vxGX4ua6dsiswY4gLcxEFgEF3ReYMdfg/P1chj10IrWajHLOFAB0DkL75/Uo1yL3L+cW3Eu7VXo2hOXIO3wg/1Lj1FhZWhXY/idxBUElaCLCEN8TbaySMBQHRjRxgAKEeeDXTufUEJWwfc9qv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=g/YdRelm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qyi1rngX; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760785051; bh=bM26UvN34C7J7onYrpyyzhf
	HN3N+aaEETmES15fNfGY=; b=g/YdRelmXvIUyYozGPdFuma+cyatIRcqI8B+IWF/1Dk3Mi8+54
	ZaFBfGLQGbW5A/yWHkpcZR7908OmjTzw1I9ciIA1PXY1jmPDUaDFtrJ2s/uOZDn4t2nul8Zyy/w
	mCqx27AG+hicezo4wilhWEOEagG1KkNzehmhUlcFhBozhgA+kdSAQtSX+S9DRzS9Rvxk3rtTk2s
	Ip1l3MkUvbK3wPE+axCa1A+mfD4tZJEJfEwJkyuYiUQuwMK4WZnZ839htWLL1q3uoYP6w/i4FYw
	FW/gCOkfj5VQ6sMACrv531xEsN83+bf6L+di7aoP3CzC72AY0TofaHFv8/MX8+2u+zQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760785051; bh=bM26UvN34C7J7onYrpyyzhf
	HN3N+aaEETmES15fNfGY=; b=qyi1rngX2ZMwU71+/xMreDiA0SU79KnCwkpyfNNWQaR5l/mYEs
	/ttZRKAJ+lTOowySuLuzkdEhaxY9GGL0XcDg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sat, 18 Oct 2025 13:57:28 +0300
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-qcom-sdm660-cdsp-v1-1-042e283db29b@mainlining.org>
References: <20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org>
In-Reply-To: <20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760785049; l=1053;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mp1/UlfPV1/zwC2F31LGeOOAVwViAmoRlk67fQeAB7Q=;
 b=5g7v7XYjfr1rBP11S1CDzsKYdB35k9seuoA5cOW4vsjetLCBCaHI9m5LOFa+S2800FCOPOcpx
 uoY7Z7HJzvkDG79fpF1i2kSQ6Gqr+JhYtNO8lE9ZAWxqvYFA/uf1Jwq
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add compatible for the compute DSP remoteproc found in SDM660.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 661c2b425da3..19d16c97d8a4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,msm8998-adsp-pas
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
+      - qcom,sdm660-cdsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
@@ -178,6 +179,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
     then:
       properties:
         qcom,qmp: false

-- 
2.51.1


